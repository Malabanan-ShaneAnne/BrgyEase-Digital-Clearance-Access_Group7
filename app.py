import os
from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from werkzeug.utils import secure_filename
from flask_mysqldb import MySQL
from flask_bcrypt import Bcrypt
import json
from datetime import datetime

app = Flask(__name__)
bcrypt = Bcrypt(app)

app.secret_key = 's0m3_th1ng_r@nd0m_4nd_s3cur3'
# MySQL config
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'brgyease_db'

# File upload config
app.config['UPLOAD_FOLDER'] = 'static/uploads'
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # 16 MB limit
os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)

mysql = MySQL(app)
#RENDERING TEMPLATES OR TO SHOW THE PAGE ON THE SITE#
#####################################################
@app.route('/')
def home():
    user_info = None
    if 'user' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT first_name, last_name FROM users WHERE email = %s", (session['user'],))
        user = cur.fetchone()
        cur.close()
        if user:
            user_info = {'first_name': user[0], 'last_name': user[1]}
    return render_template('index.html', user_info=user_info)

@app.route('/apply_page')
def apply_page():
    user_info = None
    if 'user' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT first_name, last_name FROM users WHERE email = %s", (session['user'],))
        user = cur.fetchone()
        cur.close()
        if user:
            user_info = {'first_name': user[0], 'last_name': user[1]}
    if not session.get('user'):
        flash('Please login to apply for clearance.', 'warning')
        return redirect(url_for('home', login=1))
    return render_template('apply.html', user_info=user_info)

@app.route('/organization_page')
def organization_page():
    user_info = None
    if 'user' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT first_name, last_name FROM users WHERE email = %s", (session['user'],))
        user = cur.fetchone()
        cur.close()
        if user:
            user_info = {'first_name': user[0], 'last_name': user[1]}
    return render_template('organization.html', user_info=user_info)

@app.route('/transactions')
def transactions():
    if 'user' not in session:
        flash('Please login to view your transactions.', 'warning')
        return redirect(url_for('home'))
    user_info = None
    transactions = []
    cur = mysql.connection.cursor()
    cur.execute("SELECT first_name, last_name FROM users WHERE email = %s", (session['user'],))
    user = cur.fetchone()
    if user:
        user_info = {'first_name': user[0], 'last_name': user[1]}
    cur.execute("""
        SELECT id, date_submitted, status, amount
        FROM applications
        WHERE email = %s
        ORDER BY date_submitted DESC
    """, (session['user'],))
    transactions = cur.fetchall()
    cur.close()
    return render_template('transactions.html', user_info=user_info, transactions=transactions)

@app.route('/process_payment', methods=['POST'])
def process_payment():
    if 'user' not in session:
        flash('Please login to proceed.', 'warning')
        return redirect(url_for('home'))

    selected_ids = request.form.getlist('selected_requests')
    if not selected_ids:
        flash('No requests selected.', 'warning')
        return redirect(url_for('transactions'))

    cur = mysql.connection.cursor()

    for req_id in selected_ids:
        # Get the payment method from the form for this request
        payment_method = request.form.get(f'payment_method_{req_id}')

        # Optional: Fetch current amount to confirm it exists
        cur.execute("SELECT amount FROM applications WHERE id = %s AND email = %s", (req_id, session['user']))
        result = cur.fetchone()
        if result:
            amount = result[0]

            # Insert into payments table
            cur.execute("""INSERT INTO payments (application_id, email, amount, payment_method) VALUES (%s, %s, %s, %s)""", (req_id, session['user'], amount, payment_method))

            # Update applications table with amount and payment_method
            cur.execute("""UPDATE applications SET amount = %s, payment_method = %s WHERE id = %s AND email = %s""", (amount, payment_method, req_id, session['user']))

            # If payment method is gcash, update status to 'Paid'
            if payment_method and payment_method.lower() == 'gcash':
                cur.execute("""UPDATE applications SET status = 'Paid' WHERE id = %s AND email = %s""", (req_id, session['user']))
            if payment_method and payment_method.lower() == 'cash':
                cur.execute("""UPDATE applications SET status = 'Punta ka Office' WHERE id = %s AND email = %s""", (req_id, session['user']))    

    mysql.connection.commit()
    cur.close()

    flash('Payment processed successfully!', 'success')
    return redirect(url_for('transactions'))

######################################################


#ADMIN FUNCTIONALITY
######################################################
#In CRUD THIS IS THE READ SHOWING ALL OF THE TRANSACTIONS
@app.route('/admin')
def admin_dashboard():
    cur = mysql.connection.cursor()
    
    # Get all application entries
    cur.execute("SELECT * FROM applications ORDER BY date_submitted DESC")
    applications = cur.fetchall()

    # Get counts by status
    #this just get the quantity of how many is in the database data them make an equivalent to if then AS assign it as variable
    cur.execute("""
        SELECT 
            COUNT(*) AS total,
            SUM(status = 'Pending') AS Pending,
            SUM(status = 'Approved') AS Approved,
            SUM(status = 'Rejected') AS Rejected
        FROM applications
    """)
    counts = cur.fetchone()

    cur.close()

    stats = {
        'total': counts[0],
        'Pending': counts[1],
        'Approved': counts[2],
        'Rejected': counts[3]
    }

    return render_template('admin.html', applications=applications, stats=stats)
###############################################
#CRUD THIS IS THE UPDATE it update the status whether it is approved or rejected
@app.route("/approve/<int:applicant_id>", methods=["POST"])
def approve_applicant(applicant_id):
    cur = mysql.connection.cursor()
    cur.execute("UPDATE applications SET status = 'Approved' WHERE id = %s", (applicant_id,))
    mysql.connection.commit()
    cur.close()
    flash('Applicant Approved successfully!', 'success')
    return redirect(url_for('admin_dashboard'))

@app.route("/reject/<int:applicant_id>", methods=["POST"])
def reject_applicant(applicant_id):
    cur = mysql.connection.cursor()
    cur.execute("UPDATE applications SET status = 'Rejected' WHERE id = %s", (applicant_id,))
    mysql.connection.commit()
    cur.close()
    flash('Applicant Rejected successfully!', 'danger')
    return redirect(url_for('admin_dashboard'))
#################################################
@app.route('/delete/<int:applicant_id>', methods=['POST'])
def temporary_delete(applicant_id):
    cur = mysql.connection.cursor()
    cur.execute("UPDATE applications SET status = 'Delete' WHERE id = %s", (applicant_id,))
    mysql.connection.commit()
    cur.close()
    flash('Applicant Deleted successfully!', 'danger')
    return redirect(url_for('admin_dashboard'))

@app.route('/restore/<int:applicant_id>', methods=['POST'])
def restore_applicant(applicant_id):
    cur = mysql.connection.cursor()
    cur.execute("UPDATE applications SET status = 'Pending' WHERE id = %s", (applicant_id,))
    mysql.connection.commit()
    cur.close()
    flash('Applicant Restored successfully!', 'success')
    return redirect(url_for('delete_history'))


#CRUD THIS IS THE DELETE
@app.route('/delete_applicant/<int:applicant_id>', methods=['DELETE'])
def delete_applicant(applicant_id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM applications WHERE id = %s", (applicant_id,))
    mysql.connection.commit()
    cur.close()
    flash('Applicant Deleted successfully!', 'danger')
    return redirect(url_for('delete_history'))

@app.route('/deleted_history')
def delete_history():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM applications ORDER BY date_submitted DESC")
    applications = cur.fetchall()
    cur.close()
    return render_template('deleted_history.html', applications=applications)

#CRUD THIS IS THE UPDATE ALSO CAUSE CAN EDIT THE ALREADY CREATED DATA 
#ALTER IS A DIFFERENT SCENARIO This modified the Table Variable like adding more columns the UPDATE is just changing the DATA inside the COLUMNS  

@app.route('/edit_applicant/<int:applicant_id>', methods=['POST'])
def edit_applicant(applicant_id):
    last_name = request.form['lastName']
    first_name = request.form['firstName']
    age = request.form['age']
    email = request.form['email']
    phone_number = request.form['phone']
    birthdate = request.form['birthdate']
    sex = request.form['sex']
    civil_status = request.form['Status']
    status = request.form['status']
    amount = request.form['amount']
    payment_method = request.form['payment_method']
    file = request.files['idPhoto']

    cursor = mysql.connection.cursor()

    # ✅ Fetch old data for history logging
    cursor.execute("SELECT * FROM applications WHERE id = %s", (applicant_id,))
    old_data = cursor.fetchone()

    # ✅ Convert old data to a JSON string and insert into application_history
    cursor.execute("""
        INSERT INTO application_history (application_id, old_data, edited_by)
        VALUES (%s, %s, %s)
    """, (
        applicant_id,
        json.dumps(old_data, default=str),  # Convert to JSON safely
        session.get('admin_email', 'admin')  # fallback if session email not set
    ))

    # ✅ Now proceed with your existing update logic
    if file and file.filename != '':
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        query = """UPDATE applications SET last_name=%s, first_name=%s, age=%s, email=%s,
                   phone_number=%s, birthdate=%s, sex=%s, civil_status=%s, valid_id=%s,
                   status=%s, amount=%s, payment_method=%s
                   WHERE id=%s"""
        values = (last_name, first_name, age, email, phone_number, birthdate, sex, civil_status, filename, status, amount, payment_method, applicant_id)
    else:
        query = """UPDATE applications SET last_name=%s, first_name=%s, age=%s, email=%s,
                   phone_number=%s, birthdate=%s, sex=%s, civil_status=%s,
                   status=%s, amount=%s, payment_method=%s
                   WHERE id=%s"""
        values = (last_name, first_name, age, email, phone_number, birthdate, sex, civil_status, status, amount, payment_method, applicant_id)

    cursor.execute(query, values)
    mysql.connection.commit()
    cursor.close()

    flash('Applicant updated successfully!', 'success')
    return redirect(url_for('admin_dashboard'))
#########################################################################################################
@app.route('/edit_history/<int:applicant_id>')
def edit_history(applicant_id):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM application_history WHERE application_id = %s ORDER BY edited_at DESC", (applicant_id,))
    history = cursor.fetchall()
    cursor.close()
    return render_template('edit_history.html', history=history, applicant_id=applicant_id)

#CREATE IN CRUD this function just get the input on the site and then INSERT INTO the DATABASE
###################################################################################
@app.route('/apply', methods=['POST'])
def apply():
    if request.method == 'POST':
        # Get form fields
        last_name = request.form['lastName']
        first_name = request.form['firstName']
        age = request.form['age']
        email = request.form['email']
        phone_number = request.form['phone']
        birthdate = request.form['birthdate']
        sex = request.form['sex']
        civil_status = request.form['Status']

        # Handle file upload
        file = request.files['idPhoto']
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)

        # Hardcoded application amount
        amount = 50.00

        # Save to DB
        cur = mysql.connection.cursor()
        cur.execute("""
            INSERT INTO applications (
                last_name, first_name, age, email, phone_number,
                birthdate, sex, civil_status, valid_id, amount
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            last_name, first_name, age, email, phone_number,
            birthdate, sex, civil_status, filename, amount
        ))
        mysql.connection.commit()
        cur.close()

    flash('Applicant submitted successfully!', 'success')
    return render_template('apply.html')

###########################################################################

###########################################################################
@app.route('/signup', methods=['POST'])
def signup():
    first_name = request.form['first_name']
    last_name = request.form['last_name']
    email = request.form['email']
    password = request.form['password']
    hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')

    cur = mysql.connection.cursor()
    try:
        cur.execute(
            "INSERT INTO users (first_name, last_name, email, password) VALUES (%s, %s, %s, %s)",
            (first_name, last_name, email, hashed_password)
        )
        mysql.connection.commit()
        flash('Account created successfully!', 'success')
    except Exception as e:
        flash('Account creation failed. Email may already be in use.', 'danger')
    finally:
        cur.close()

    return redirect(url_for('home'))



@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    password = request.form['password']

    if email == 'admin@admin.com' and password == 'admin':
        flash('Admin Login', 'success')
        return redirect(url_for('admin_dashboard'))

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users WHERE email = %s", (email,))
    user = cur.fetchone()
    cur.close()

    if user and bcrypt.check_password_hash(user[2], password):
        session['user'] = email
        flash('Login successful!', 'success')
    else:
        flash('Invalid credentials', 'danger')
    return redirect(url_for('home'))


@app.route('/logout')
def logout():
    session.pop('user', None)
    flash('Logged out successfully!', 'success')
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)
