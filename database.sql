-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 06:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art_gallery`
--
CREATE DATABASE IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `art_gallery`;

-- --------------------------------------------------------

--
-- Table structure for table `artworks`
--

CREATE TABLE `artworks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artworks`
--

INSERT INTO `artworks` (`id`, `title`, `artist`, `filename`) VALUES
(1, 'red', 'denn', '474953840_959904112762902_4467697474904697267_n.png'),
(2, 'denn', 'red', '474059142_1697507454520438_6917043688449506261_n.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artworks`
--
ALTER TABLE `artworks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artworks`
--
ALTER TABLE `artworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `brgyease_db`
--
CREATE DATABASE IF NOT EXISTS `brgyease_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `brgyease_db`;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `sex` enum('Male','Female','Other') DEFAULT NULL,
  `civil_status` varchar(50) DEFAULT NULL,
  `valid_id` varchar(255) DEFAULT NULL,
  `date_submitted` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Pending',
  `amount` decimal(10,2) DEFAULT 50.00,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `educational_cash_portal`
--
CREATE DATABASE IF NOT EXISTS `educational_cash_portal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `educational_cash_portal`;

-- --------------------------------------------------------

--
-- Table structure for table `distribution`
--

CREATE TABLE `distribution` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place` varchar(255) NOT NULL,
  `total_budget` decimal(15,2) NOT NULL,
  `budget_source` varchar(255) NOT NULL,
  `amount_per_head` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distribution`
--

INSERT INTO `distribution` (`id`, `date`, `time`, `place`, `total_budget`, `budget_source`, `amount_per_head`) VALUES
(1, '2024-07-20', '10:00:00', 'Sa ewan', 1000000.00, 'basta', 1000.00),
(2, '2024-07-20', '22:50:00', 'saamin', 1000000.00, 'kay bossing', 1000.00),
(3, '2024-07-20', '22:50:00', 'saamin', 1000000.00, 'kay bossing', 1000.00),
(4, '2024-07-20', '22:51:00', 'saamin', 1000000.00, 'saakin', 1000.00),
(5, '2024-07-20', '22:51:00', 'saamin', 1000000.00, 'saakin', 1000.00),
(6, '2024-07-12', '08:00:00', '', 0.00, '', 0.00),
(7, '2024-07-12', '08:00:00', '', 0.00, '', 0.00),
(8, '2024-07-20', '23:00:00', 'dito', 10000000.00, 'sa tatay ko', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `educational_background`
--

CREATE TABLE `educational_background` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_address` text NOT NULL,
  `course` varchar(255) NOT NULL,
  `year_level` enum('1','2','3','4') NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `educational_background`
--

INSERT INTO `educational_background` (`id`, `user_id`, `school_name`, `school_address`, `course`, `year_level`, `student_id`, `created_at`) VALUES
(1, 1, 'Laguna State Polytechnic University', 'Siniloan, Laguna', 'IT', '3', '0222-5848', '2024-11-19 08:54:59'),
(2, 2, 'Laguna State Polytechnic University', 'asd', 'BSIT NETAD', '3', '0921-5555', '2024-11-19 14:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `family_background`
--

CREATE TABLE `family_background` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `father_name` varchar(255) NOT NULL,
  `father_occupation` varchar(255) NOT NULL,
  `father_contact` varchar(15) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `mother_occupation` varchar(255) NOT NULL,
  `mother_contact` varchar(15) NOT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_contact` varchar(15) DEFAULT NULL,
  `monthly_income` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `family_background`
--

INSERT INTO `family_background` (`id`, `user_id`, `father_name`, `father_occupation`, `father_contact`, `mother_name`, `mother_occupation`, `mother_contact`, `guardian_name`, `guardian_relation`, `guardian_contact`, `monthly_income`, `created_at`) VALUES
(1, 1, 'user tatay', 'tatay trabaho', '09123456789', 'user nanay', 'nanay trabaho', '09876543211', '', '', '', 10000.00, '2024-11-19 09:02:24'),
(2, 2, 'user1 fat', 'user1 fac', 'user1 foc', 'user1 mat', 'user1 mac', 'user1 foc', 'user1 guad', 'father', 'g324', 10000.00, '2024-11-19 14:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `status`, `created_at`) VALUES
(1, 1, 'Your application has been approved.', 'read', '2024-11-20 15:06:02'),
(2, 1, 'Your application has been rejected.', 'read', '2024-11-20 15:06:09'),
(3, 1, 'Your application has been approved.', 'read', '2024-11-20 15:06:19'),
(4, 1, 'Your application has been approved.', 'read', '2024-11-20 15:06:43'),
(5, 1, 'Your application has been rejected.', 'read', '2024-11-20 15:06:47'),
(6, 1, 'Your application has been approved.', 'read', '2024-11-20 15:06:50'),
(7, 1, 'Your application has been approved.', 'read', '2024-11-20 15:07:29'),
(8, 2, 'Your application has been approved.', 'unread', '2024-11-20 15:09:57'),
(9, 1, 'Your application has been approved.', 'read', '2024-11-20 15:22:01'),
(10, 1, 'Your application has been approved.', 'unread', '2024-11-20 15:23:33'),
(13, 1, 'Thanks for trusting Enjoy Your Financial Assistance.', 'unread', '2024-11-20 16:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `personal_information`
--

CREATE TABLE `personal_information` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('male','female') NOT NULL,
  `civil_status` enum('single','married','widowed','divorced') NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_information`
--

INSERT INTO `personal_information` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `suffix`, `date_of_birth`, `place_of_birth`, `age`, `sex`, `civil_status`, `nationality`, `religion`, `email`, `phone`, `address`, `created_at`) VALUES
(1, 1, 'user', 'user', 'user', '', '2003-09-05', 'Siniloan', 21, 'female', 'divorced', 'Filipino', 'Catholic', 'user@user.com', '09123456789', 'Brgy d matagpuan', '2024-11-19 05:44:57'),
(2, 2, 'user1f', 'user1m', 'user1l', 'user1s', '2024-12-31', 'user1pof', 121, 'male', 'married', 'Filipino', 'Catholic', 'user1@user.com', '09505646654', 'user1 address', '2024-11-19 14:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_files`
--

CREATE TABLE `uploaded_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `school_id_file` varchar(255) DEFAULT NULL,
  `registration_file` varchar(255) DEFAULT NULL,
  `grades_file` varchar(255) DEFAULT NULL,
  `indigency_file` varchar(255) DEFAULT NULL,
  `birth_cert_file` varchar(255) DEFAULT NULL,
  `accept_term` tinyint(4) DEFAULT 0,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_files`
--

INSERT INTO `uploaded_files` (`id`, `user_id`, `school_id_file`, `registration_file`, `grades_file`, `indigency_file`, `birth_cert_file`, `accept_term`, `uploaded_at`) VALUES
(1, 1, '462551569_1565345487413951_7667951729639459488_n.jpg', '2017-CHI-VRwalls-2.pdf', 'OSPF-Configuration-A-Comprehensive-Guide_1.pdf', 'Veranda-Cafe-Transparent.png', '462618248_563432026026529_1077071774285569556_n.jpg', 1, '2024-11-19 09:29:50'),
(2, 2, '2017-CHI-VRwalls-2.pdf', 'Veranda-Cafe-Transparent.png', 'OSPF-Configuration-A-Comprehensive-Guide_1.pdf', '462618248_563432026026529_1077071774285569556_n.jpg', '2017-CHI-VRwalls-2.pdf', 1, '2024-11-19 15:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `approve` tinyint(1) DEFAULT 0,
  `claimed` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `username`, `password`, `approve`, `claimed`, `created_at`) VALUES
(1, 'user', 'user@user.com', 'user', 'scrypt:32768:8:1$E3n0kAoa2g2wJ6Y8$4e703c23e7e047aaceb78357fe976b8195205742ca8eddc4effc341a7f9ecb7f5e430191dae69144322a912e68d914892230bef234bb2afead3fd228839729a0', 1, 1, '2024-11-15 14:57:19'),
(2, 'user1', 'user1@user.com', 'user1', 'scrypt:32768:8:1$PdT3RenX6dEv2Lnw$12cd475b17681a5c80d5876ac594a4a5a6f4ac6bf361fc33e6fb1d879b7b8ed0358ab1a9022c385614df3130dcb4022bf53bb4049cd483817469c891c287fff7', 1, 1, '2024-11-15 15:02:51'),
(3, 'user3', 'user3@user.com', 'user3', 'scrypt:32768:8:1$SzWXgnG1BQD7NacY$5d1401716610060bbda59457d9dbf833393249d56c0faee357400167a300135f3cc41cdfc7999cc655a1378ea91e2dfbce3b787f50dbeb8670e4248f03557863', 0, 0, '2024-11-19 02:17:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distribution`
--
ALTER TABLE `distribution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educational_background`
--
ALTER TABLE `educational_background`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `family_background`
--
ALTER TABLE `family_background`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `personal_information`
--
ALTER TABLE `personal_information`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distribution`
--
ALTER TABLE `distribution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `educational_background`
--
ALTER TABLE `educational_background`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `family_background`
--
ALTER TABLE `family_background`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_information`
--
ALTER TABLE `personal_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `educational_background`
--
ALTER TABLE `educational_background`
  ADD CONSTRAINT `educational_background_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `family_background`
--
ALTER TABLE `family_background`
  ADD CONSTRAINT `family_background_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `personal_information`
--
ALTER TABLE `personal_information`
  ADD CONSTRAINT `personal_information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD CONSTRAINT `uploaded_files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `emergency_response`
--
CREATE DATABASE IF NOT EXISTS `emergency_response` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `emergency_response`;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `details` text NOT NULL,
  `municipality` varchar(100) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `details`, `municipality`, `barangay`, `street`, `user_id`, `created_at`, `category`) VALUES
(3, 'Sunog', 'Famy', 'Bulihan', 'Tahires', 1, '2024-10-21 11:28:47', 'BFP'),
(10, 'aron testing', 'taga ewan ako', 'basta doon', 'ayt nandito AKO!', 4, '2024-10-21 12:32:03', 'Police'),
(11, 'Nalunod pong bata', 'Siniloan', 'Wawa', 'JP. Rizal', 1, '2024-10-22 08:03:47', 'Hospital'),
(12, 'Sunog', 'Paete', 'Wawa', '.', 1, '2024-10-22 08:04:10', 'BFP'),
(14, 'Nasusunog bahay ng kapitbahay namin.', 'Pangil', 'Dambo', 'Daang Hari', 9, '2024-10-26 05:58:48', NULL),
(15, 'car accident 3 person is critical', 'mabitac', 'nangoma', 'n\\a', 9, '2024-10-26 08:32:48', NULL),
(16, 'Car accident.', 'Famy', 'Bulihan', 'Street', 9, '2024-10-26 08:34:49', 'Police');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'denn', 'scrypt:32768:8:1$f4ckMnOtnyCpQMIJ$6882012a4f751073eb765e398b788c8aa34288bce11107e04d3708d5b3875f78b40345671f2257ad5e6f34df72fb567e993b1d97a2a8a27b09ca378b20a412bc'),
(3, 'admin', 'admin'),
(4, 'aron', 'scrypt:32768:8:1$w9oelM8aKJtcF8yo$4034781a32d83fe11ee699be2b93743b6f1c9177f402c7bd4b881b7caf400353690ec89c65e0b37866d1ee9e39232eda6ca68b0aa0b5bb0947ce495d929ba77f'),
(9, 'Harvey', 'scrypt:32768:8:1$dbTFbCeKgniUm02h$3df8af9e5709e0700d873b46cc58d42ef1ce528c28caf08568d6690138938d715f4fcb9d203d3da221b5445b8c5ef089dca2f96fb1b21d912b1ccc14196e86f5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_ibfk_1` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `emergens`
--
CREATE DATABASE IF NOT EXISTS `emergens` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `emergens`;

-- --------------------------------------------------------

--
-- Table structure for table `barangay_contacts`
--

CREATE TABLE `barangay_contacts` (
  `id` int(11) NOT NULL,
  `barangay_name` varchar(255) NOT NULL,
  `captain_name` varchar(255) NOT NULL,
  `captain_contact` varchar(25) DEFAULT NULL,
  `secretary_name` varchar(255) NOT NULL,
  `secretary_contact` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_contacts`
--

INSERT INTO `barangay_contacts` (`id`, `barangay_name`, `captain_name`, `captain_contact`, `secretary_name`, `secretary_contact`) VALUES
(1, 'Acevida', 'Amante A. Perez', '+639386180628', 'Meliza A. Binay', '+639384593421'),
(2, 'BAGONG PAG ASA', 'Richard Tom Galido Advento', '+639081102415', 'Karisiah Maree S. Advento', '+639073995642'),
(3, 'BAGUMBARANGAY', 'Jenneth Gimena Jaen', '+639959105890', 'Charliena A. Nolial', '+639489837609'),
(4, 'BUHAY', 'Roldan Montas Castano', '+639776033905', 'Kimberly D. De Guzman', '+639306546012'),
(5, 'GENERAL LUNA', 'Arell Adaya Rellosa', '+639550860115', 'Reneejane R. Realeza', '+639550860115'),
(6, 'GREDOR', 'Oding Ambor Sombrano', '+639851606005', 'Maricel S. Diaz', '+639656713888'),
(7, 'HALAYHAYIN', 'Florencio San Antonio Lagarile', '+639673904022', 'Rosalia C. Reyes', '+639980510888'),
(8, 'J.RIZAL', 'Roden Advento', '+639338237958', 'Erica A. Adopina', '+639361149552'),
(9, 'KAPATALAN', 'Victor Duller Alvarez', '+639082123412', 'Miraflor Prieto', '+639357047290'),
(10, 'LAGUIO', 'Eduardo Baron Besmonte', '+639751441489', 'Annie Fe L. Rabe', '+639654267775'),
(11, 'LIYANG', 'Jovito Remitter Filipino', '+639458620899', 'Mary Jane L. Gonzales', '+639811004585'),
(12, 'LLAVAC', 'Ronnie Montiel Tubice', '+639557726156', 'Ariel U. Casuga', '+639656784336'),
(13, 'MACATAD', 'Suzema M. Ritual', '+639282192543', 'Jerome A. Plantilla', '+639676921136'),
(14, 'MAGSAYSAY', 'Jose Susondoncillo Beruela', '+639067240473', 'Rueben B. Empalmado', '+639354511393'),
(15, 'MAYATBA', 'Felipe Jr. Hebio Gacer', '+639972957514', 'Mabel Gacer', '+639754049837'),
(16, 'MENDIOLA', 'Jerome Canlas Villanueva', '+639776821605', 'Ervin A. Castro', '+639361538097'),
(17, 'PANDENIO', 'Abel Cadiente Ramos', '+639270793346', 'Jessa L. Argote', '+639534259203'),
(18, 'P.BURGOS', 'Alren Prestado Watson', '+639511268566', 'Jennifer S. Ramallosa', '+639550775462'),
(19, 'SALUBUNGAN', 'Holgien Adrias Acoba', '+639270187334', 'Alein Ellice E. Pantaleon', '+639952671045'),
(20, 'WAWA', 'Elisa Perez Oliveros', '+639386180628', 'Vivian M. Dela Pacion', '+639554369923');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact_numbers`
--

CREATE TABLE `emergency_contact_numbers` (
  `id` int(11) NOT NULL,
  `hotline_id` int(11) NOT NULL,
  `contact_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_contact_numbers`
--

INSERT INTO `emergency_contact_numbers` (`id`, `hotline_id`, `contact_number`) VALUES
(21, 2, 'Smart: 0929 630 3715'),
(22, 2, 'Smart: 0929 630 3715');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_hotlines`
--

CREATE TABLE `emergency_hotlines` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_hotlines`
--

INSERT INTO `emergency_hotlines` (`id`, `service_name`, `url`) VALUES
(2, 'MDRRMO', 'https://web.facebook.com/siniloan.bfp/?_rdc=1&_rdr');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_reports`
--

CREATE TABLE `emergency_reports` (
  `report_id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `emergency_type` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `report_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `barangay` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `is_viewed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_reports`
--

INSERT INTO `emergency_reports` (`report_id`, `user_id`, `emergency_type`, `description`, `report_timestamp`, `barangay`, `street`, `is_viewed`) VALUES
(2, '1', 'Landslides', '', '2024-10-26 14:43:15', 'Acevida', 'Daang Hari', 1),
(3, '1', 'Car Accident', '', '2024-10-26 14:43:30', 'Wawa', '123', 1),
(4, '2', 'Power Supply Interruptions', '', '2024-10-26 15:05:47', 'Mendiola', 'Daang Hari', 1),
(5, '2', 'Landslides', '', '2024-10-26 15:06:16', 'Liyang', 'J.Rizal', 1),
(6, '2', 'Car Accident', '', '2024-10-26 15:06:51', 'Acevida', 'Daang Hari', 1),
(7, '2', 'Car Accident', '', '2024-10-26 15:08:52', 'Salubungan', 'Daang Hari', 1),
(8, '2', 'Car Accident', '', '2024-10-26 15:09:02', 'Salubungan', 'Daang Hari', 1),
(9, '2', 'Floods Caused by Typhoons', '', '2024-10-26 15:09:13', 'Acevida', 'Daang Hari', 1),
(10, '2', 'Landslides', '', '2024-10-26 15:09:32', 'Halayhayin', 'J.Rizal', 1),
(11, '2', 'Disease Outbreaks', '', '2024-10-26 15:09:49', 'Acevida', 'J.Rizal', 1),
(12, '2', 'Fire', '', '2024-10-26 15:09:59', 'Salubungan', 'Daang Hari', 1),
(13, '2', 'Power Outage', '', '2024-10-26 15:10:11', 'P.Burgos', 'J.Rizal', 1),
(14, '2', 'Other', '', '2024-10-26 15:10:15', 'Acevida', 'Daang Hari', 1),
(15, '1', 'Car Accident', 'dqweqwe', '2024-10-26 16:17:37', 'Acevida', 'Daang Hari', 1),
(16, '1', 'Car Accident', '', '2024-10-27 04:14:42', 'Acevida', 'Daang Hari', 1),
(17, '1', 'Landslides', '', '2024-10-27 04:17:03', 'P.Burgos', 'J.Rizal', 1),
(18, '1', 'Car Accident', '', '2024-10-27 04:17:53', 'Acevida', 'Daang Hari', 1),
(19, '1', 'Floods Caused by Typhoons', '', '2024-10-27 04:29:00', 'Pandenio', 'Daang Hari', 1),
(20, '1', 'Car Accident', '', '2024-10-27 04:31:16', 'Acevida', 'J.Rizal', 1),
(21, '1', 'Landslides', '', '2024-10-27 04:31:29', 'General Luna', 'Daang Hari', 1),
(22, '1', 'Car Accident', '', '2024-10-27 04:37:46', 'P.Burgos', 'Daang Hari', 1),
(23, '1', 'Car Accident', '', '2024-10-27 04:49:05', 'Acevida', 'Daang Hari', 1),
(24, '1', 'Car Accident', '', '2024-10-27 04:51:45', 'Pandenio', 'Daang Hari', 1),
(25, '2', 'Car Accident', '', '2024-10-27 04:54:59', 'Acevida', 'Daang Hari', 1),
(26, '1', 'Car Accident', '', '2024-10-27 04:59:27', 'Acevida', 'Daang Hari', 1),
(29, 'Lea Belleza', 'Car Accident', '', '2024-10-27 05:13:59', 'Mayatba', 'Daang Hari', 1),
(30, 'Lea Belleza', 'Landslides', '', '2024-10-27 05:14:22', 'Acevida', 'J.Rizal', 1),
(31, 'Lea Belleza', 'Landslides', '', '2024-10-27 05:14:51', 'Pandenio', 'Daang Hari', 1),
(32, 'Lea Belleza', 'Car Accident', '', '2024-10-27 05:17:39', 'Salubungan', 'J.Rizal', 1),
(33, 'Dennrick P. Agustin', 'Car Accident', '', '2024-10-27 12:30:56', 'Buhay', 'Daang Hari', 1),
(34, 'Dennrick P. Agustin', 'Car Accident', 'testing sa mailtrap', '2024-11-03 02:09:25', 'Acevida', 'Daang Hari', 1),
(35, 'Dennrick P. Agustin', 'Fire', 'testing sa google may apoy sa bundok', '2024-11-03 02:50:52', 'Laguio', 'sais', 0),
(36, 'Dennrick P. Agustin', 'Fire', 'testing sa google may apoy sa bundok', '2024-11-03 02:51:17', 'Laguio', 'sais', 1),
(37, 'Dennrick P. Agustin', 'Fire', 'testing sa google may apoy sa bundok', '2024-11-03 02:52:26', 'Laguio', 'sais', 0),
(38, 'Dennrick P. Agustin', 'Fire', 'testing sa google may apoy sa bundok', '2024-11-03 02:59:47', 'Laguio', 'sais', 0),
(39, 'Dennrick P. Agustin', 'Fire', 'testing sa google may apoy sa bundok', '2024-11-03 03:00:28', 'Laguio', 'sais', 0),
(40, 'Dennrick P. Agustin', 'Fire', 'testing sa google may apoy sa bundok', '2024-11-03 03:00:46', 'Laguio', 'sais', 0),
(41, 'Dennrick P. Agustin', 'Fire', 'testing sa google may apoy sa bundok', '2024-11-03 03:06:19', 'Laguio', 'sais', 0),
(42, 'Dennrick P. Agustin', 'Car Accident', 'sunog po testing sa goolge', '2024-11-03 03:06:44', 'Pandenio', 'Daang Hari', 0),
(43, 'Dennrick P. Agustin', 'Car Accident', 'sunog po testing sa goolge', '2024-11-03 03:07:12', 'Pandenio', 'Daang Hari', 0),
(44, 'Dennrick P. Agustin', 'Car Accident', 'qwrqweqwe', '2024-11-03 03:08:01', 'Acevida', 'qweqwe', 0),
(45, 'Dennrick P. Agustin', 'Car Accident', 'sunog po testing sa goolge', '2024-11-03 03:25:56', 'Pandenio', 'Daang Hari', 0),
(46, 'Dennrick P. Agustin', 'Car Accident', '12312412', '2024-11-03 03:29:38', 'Acevida', '1231', 0),
(47, 'Dennrick P. Agustin', 'Fire', 'dkopo alam basta nasunog nlng', '2024-11-03 03:33:12', 'Magsaysay', 'testing sa google ulit', 0),
(48, 'Dennrick P. Agustin', 'Car Accident', 'qwrqweqwewqerqw', '2024-11-20 12:49:43', 'Acevida', 'Daang Hari', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`) VALUES
(1, 'Dennrick P. Agustin', 'dennrickagustin@gmail.com', 'scrypt:32768:8:1$dIWY5MjhnI3K6lQK$90a7c1d6b807080ead6878aa3824f31288487541a308bbd38ba19e20b494d25fb9e25446a6ac6cecc2f6d892a34739ca9c6417978a59415b76d606c0438902d8'),
(2, 'Lea Belleza', 'Lea@gmail.com', 'scrypt:32768:8:1$K0ZoV1r0NcIxbLmB$c5da990948d9dc814862a930475232d4af410e86b751b747d09cbe0870727cba33dc5574d1c8fbe7362805183fb74716c52584586067498248af7beab207e24d'),
(3, 'admin', 'admin@admin.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangay_contacts`
--
ALTER TABLE `barangay_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contact_numbers`
--
ALTER TABLE `emergency_contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotline_id` (`hotline_id`);

--
-- Indexes for table `emergency_hotlines`
--
ALTER TABLE `emergency_hotlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_reports`
--
ALTER TABLE `emergency_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangay_contacts`
--
ALTER TABLE `barangay_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `emergency_contact_numbers`
--
ALTER TABLE `emergency_contact_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `emergency_hotlines`
--
ALTER TABLE `emergency_hotlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emergency_reports`
--
ALTER TABLE `emergency_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emergency_contact_numbers`
--
ALTER TABLE `emergency_contact_numbers`
  ADD CONSTRAINT `emergency_contact_numbers_ibfk_1` FOREIGN KEY (`hotline_id`) REFERENCES `emergency_hotlines` (`id`) ON DELETE CASCADE;
--
-- Database: `eventify`
--
CREATE DATABASE IF NOT EXISTS `eventify` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eventify`;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `max_participants` int(11) NOT NULL,
  `zoom_link` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `location`, `date`, `created_by`, `status`, `created_at`, `updated_at`, `image`, `max_participants`, `zoom_link`, `duration`) VALUES
(1, 'Clemet', 'aetwqegwegqwg', 'sa amin', '2025-04-16', '2', 'approved', '2025-04-15 11:34:26', '2025-04-15 11:34:37', '1.png', 10, 'youtube.com', 12);

-- --------------------------------------------------------

--
-- Table structure for table `event_participants`
--

CREATE TABLE `event_participants` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_participants`
--

INSERT INTO `event_participants` (`id`, `event_id`, `user_id`, `joined_at`, `status`, `user_name`) VALUES
(1, 1, 4, '2025-04-15 11:45:54', NULL, '123');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` enum('client','organizer','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'client'),
(2, 'organizer'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `address`, `contact_number`, `gender`, `age`, `dob`, `role_id`, `created_at`) VALUES
(2, 'organizer@organizer.com', 'scrypt:32768:8:1$UwZJ6mhQ50Ru02Ki$df3329d5300177fdde99fe4479e0f62c8a775b949108e832f19f37d4a3b0a1f9200e825c9f6996559dd2452dc85c1b361810b9a90ae4688c1e19997969c2de7f', 'organizer', '09505646655', 'male', 12, '2024-10-28', 2, '2024-10-28 13:00:34'),
(3, 'admin@admin.com', 'scrypt:32768:8:1$3hgWe0TJAgNOYmMH$60c3da64978d899398658f677c35f13bfaaf29a36c37416a07f89a3288e0d495ca8f28bc98e30b6b286c17bd3780698d5085576f2392a101ab2a3ecde1e69510', 'admin', '09505646655', 'male', 21, '2024-10-28', 3, '2024-10-28 13:06:27'),
(4, 'user@user.com', 'scrypt:32768:8:1$bnCv9Y2jrBE5GROr$acd21bfc6330efbf9cfce731bcdb6ec691dd8ec28f91c45aa48e9b82b2330fee89cb739a1535a673d073aeeef03869b58d80ee6d8be2c72d18311111bb5014f7', 'user', 'user', 'male', 21, '2024-10-30', 1, '2024-10-30 07:44:08'),
(5, 'organizer2@organizer.com', 'scrypt:32768:8:1$KGMlcY9cksGRw8o9$76f479418cf9d698cbe9b71d02072ccfda9d01a47eea32d3954541934097a85d6002d3096194b89ab7fd62325a83f34fea15fb2dd282ee5c4bea2d0a64a0d86d', 'organizer2', 'organizer2', 'male', 21, '2024-11-29', 2, '2024-11-01 09:26:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_participants`
--
ALTER TABLE `event_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_participants`
--
ALTER TABLE `event_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_participants`
--
ALTER TABLE `event_participants`
  ADD CONSTRAINT `event_participants_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_participants_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `flaskdb`
--
CREATE DATABASE IF NOT EXISTS `flaskdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `flaskdb`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `created_at`) VALUES
(5, 'dennrick', 'dennrick@gmail.com', '2024-10-23 10:47:09'),
(7, 'admin', 'Admin@admin.com', '2024-10-23 10:47:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `flask_db`
--
CREATE DATABASE IF NOT EXISTS `flask_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `flask_db`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `new_emergens`
--
CREATE DATABASE IF NOT EXISTS `new_emergens` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `new_emergens`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `barangay` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `barangay`, `created_at`) VALUES
(1, 'superadmin', 'superadmin@superadmin.com', 'superadmin', 'super admin', '2024-11-30 06:30:49'),
(2, 'bagumbong', 'bagumbong@bagumbong.com', 'bagumbong', 'Bagumbong', '2024-11-30 11:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `document_requests`
--

CREATE TABLE `document_requests` (
  `id` int(11) NOT NULL,
  `tracking_code` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `document_type` varchar(50) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `barangay` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_requests`
--

INSERT INTO `document_requests` (`id`, `tracking_code`, `fullname`, `pickup_date`, `purpose`, `status`, `document_type`, `fee`, `barangay`) VALUES
(1, '20241130184015DYQQKZ', 'denn', '2024-11-30', 'testing\r\n', 'pending', 'Barangay Certificate', 100.00, 'Bagumbong'),
(2, '20241130191059O0HCGE', 'testing2', '2024-12-31', 'Testing ulit', 'pending', 'Barangay ID', 50.00, 'Baguyo'),
(3, '20250412201140KAXV3V', 'yeah', '2025-04-12', 'pera', 'pending', 'Solo Parent ID', 50.00, 'Punta');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_reports`
--

CREATE TABLE `emergency_reports` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `date_submitted` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_reports`
--

INSERT INTO `emergency_reports` (`id`, `name`, `email`, `barangay`, `message`, `date_submitted`, `read_status`) VALUES
(1, 'qwe', 'qwe@qwe.qwe', 'Bagumbong', 'qwe', '2024-11-30 11:45:39', 1),
(2, 'qweqwe', 'qweqwe@qwe.qwe', 'Paalaman', 'qweqwe', '2024-11-30 11:47:30', 1),
(3, 'red', 'red@gmail.com', 'Lubo', 'secret', '2024-11-30 11:50:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `national_id` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `civil_status` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `voter_status` varchar(255) NOT NULL,
  `barangay` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `barangay`, `created_at`) VALUES
(1, 'user', 'user@user.com', 'user', 'Bagumbong', '2024-11-30 10:03:25'),
(4, 'user2', 'user2@user.com', 'user2', 'Baguyo', '2024-11-30 11:10:32'),
(5, 'den', 'den@gmail.com', 'den', 'Punta', '2025-04-12 12:11:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `document_requests`
--
ALTER TABLE `document_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_reports`
--
ALTER TABLE `emergency_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document_requests`
--
ALTER TABLE `document_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `emergency_reports`
--
ALTER TABLE `emergency_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"flaskdb\",\"table\":\"users\"},{\"db\":\"safesuite\",\"table\":\"feedback\"},{\"db\":\"safesuite\",\"table\":\"scans\"},{\"db\":\"emergency_response\",\"table\":\"reports\"},{\"db\":\"emergency_response\",\"table\":\"users\"},{\"db\":\"emergency_response\",\"table\":\"accounts\"},{\"db\":\"student_management\",\"table\":\"students\"},{\"db\":\"testimonials_db\",\"table\":\"testimonials\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-10-23 10:13:13', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":211}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `safesuite`
--
CREATE DATABASE IF NOT EXISTS `safesuite` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `safesuite`;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `feedback_text` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `feedback_text`, `submitted_at`) VALUES
(2, 'Hello po ganda po ng website nyo', '2024-10-23 07:54:08'),
(3, 'gg', '2024-10-23 07:56:08'),
(4, 'Hello testing lng eto kung gagana', '2024-10-23 08:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `scans`
--

CREATE TABLE `scans` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `scan_count` int(11) DEFAULT 1,
  `scanned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scans`
--

INSERT INTO `scans` (`id`, `url`, `result_status`, `level`, `category`, `scan_count`, `scanned_at`) VALUES
(1, 'https://vryjm.page.link/jS6a', 'Malicious', 4, 'Phishing', 4, '2024-10-23 04:50:34'),
(3, 'https://wwv.thepiratebay3.co/', 'Safe', 1, '', 1, '2024-10-23 06:47:26'),
(4, 'http://www.dcs-bidenquiry.org', 'Spam', 3, 'Spam', 2, '2024-10-23 06:48:49'),
(5, 'https://www.globaljetcargos.com', 'Malicious', 4, 'Phishing', 1, '2024-10-23 07:17:05'),
(6, 'https://www.pentagonbk.org', 'Spam', 3, 'Spam', 1, '2024-10-23 08:11:55'),
(7, 'https://chatgpt.com/c/6730b12f-3d50-8011-9987-c50008025ad4', 'Safe', 1, '', 1, '2024-11-10 14:35:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scans`
--
ALTER TABLE `scans`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `scans`
--
ALTER TABLE `scans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `student_management`
--
CREATE DATABASE IF NOT EXISTS `student_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `student_management`;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(3) NOT NULL,
  `course` varchar(255) NOT NULL,
  `skills` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `phone` decimal(11,0) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `age`, `course`, `skills`, `education`, `experience`, `phone`, `image_path`) VALUES
(1, 'Dennrick P. Agustin', 'Denden@gmail.com', 21, 'BSIT 3C AMG A', NULL, NULL, 'Web Developer', 9505646655, 'static/uploads/428612745_1679585516200326_947331673298688244_n.jpg'),
(2, 'Reden V. Gemanel', 'RedenGamer08@gmail.com', 55, 'BSIT 3C AMG A', NULL, NULL, 'Mage at Palpitate', 9505646655, 'static/uploads/449069522_1183798615977177_6328149427568042864_n.jpg'),
(3, 'Prince Josh Christian A. De Belen', 'joshdebelen@gmail.com', 21, 'BSIT 3C AMG A', NULL, NULL, 'Josh Mojica/ Kangkong CEO', 9123456789, 'static/uploads/Kangkong-Chips-Josh-Mojica-02.webp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `testimonials_db`
--
CREATE DATABASE IF NOT EXISTS `testimonials_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `testimonials_db`;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `testimonial` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `testimonial`) VALUES
(1, 'hello', 'testing'),
(2, 'Dennrick', 'So Ayun Nagana nmn sya ng matino\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `verandacafe`
--
CREATE DATABASE IF NOT EXISTS `verandacafe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `verandacafe`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `temporary_user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menucategories`
--

CREATE TABLE `menucategories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menucategories`
--

INSERT INTO `menucategories` (`id`, `name`, `description`) VALUES
(1, 'Unli Rice', 'Unli sa sarap'),
(2, 'Tapsilog', 'Filipino breakfast favorites'),
(3, 'Beverage', 'Refreshing drinks'),
(18, 'Daily Offers', 'With Discount');

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discounted_price` int(11) NOT NULL,
  `preparation_time` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_bestSeller` tinyint(1) NOT NULL,
  `sales_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitems`
--

INSERT INTO `menuitems` (`id`, `name`, `price`, `discounted_price`, `preparation_time`, `category_id`, `image_url`, `is_active`, `is_bestSeller`, `sales_count`) VALUES
(5, 'Chicken Inasal', 159.00, 0, 32, 1, '/static/upload/Inasal.png', 0, 1, 0),
(22, 'Chicken Inasal', 129.00, 0, 15, 18, '/static/upload/Inasal.png', 1, 1, 0),
(24, 'Chicksilog', 129.00, 0, 15, 1, '/static/upload/Chicksilogunli.webp', 0, 1, 0),
(25, 'Pork Marinated', 139.00, 0, 20, 1, '/static/upload/Pork_Marinated.webp', 0, 1, 0),
(26, 'Liemsilog', 119.00, 0, 15, 1, '/static/upload/liemsilog_unli.webp', 0, 1, 0),
(27, 'Embusilog', 129.00, 0, 20, 1, '/static/upload/liemsilog_unli.webp', 0, 1, 0),
(28, 'Longsilog Marilaw', 159.00, 0, 20, 1, '/static/upload/Longsilog_Marilaw.webp', 0, 1, 0),
(29, 'Chicksilog', 89.00, 0, 15, 2, '/static/upload/Chicksilog.webp', 0, 1, 0),
(30, 'Embusilog', 79.00, 0, 15, 2, '/static/upload/Embusilog.webp', 0, 1, 0),
(31, 'Liemsilog', 69.00, 0, 20, 2, '/static/upload/Liemsilog.webp', 0, 1, 0),
(32, 'Tosilog', 59.00, 0, 15, 2, '/static/upload/Tosilog.webp', 0, 1, 0),
(33, 'Shanghaisilog', 79.00, 0, 15, 2, '/static/upload/Shanghai_Silog.webp', 0, 1, 0),
(34, 'Longsilog Garlic', 59.00, 0, 20, 2, '/static/upload/Longsilog_Garlic.webp', 0, 1, 0),
(35, 'Adobosilog ', 69.00, 0, 20, 2, '/static/upload/Adobosilog.webp', 0, 1, 0),
(36, 'Fish Fillet Silog', 89.00, 0, 20, 2, '/static/upload/5.webp', 0, 1, 0),
(37, 'Danggit Silog', 59.00, 0, 15, 2, '/static/upload/Danggit_Silog.webp', 0, 1, 0),
(38, 'Porksilog ', 89.00, 0, 20, 2, '/static/upload/Porksilog.webp', 0, 1, 0),
(39, 'Longsilog Hamonado', 79.00, 0, 20, 2, '/static/upload/Longsilog_Hamonado.webp', 0, 1, 0),
(40, 'Coke', 85.00, 0, 1, 3, '/static/upload/Rectangle_4.png', 0, 1, 0),
(41, 'Ice Tea Pitcher', 59.00, 0, 1, 3, '/static/upload/pitcher.png', 0, 1, 0),
(42, 'Sprite', 85.00, 0, 1, 3, '/static/upload/sprite.png', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `menu_item_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dine_in_takeout` enum('Dine In','Take Out') NOT NULL DEFAULT 'Dine In',
  `customer_name` varchar(255) DEFAULT NULL,
  `special_requests` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_name`, `price`, `quantity`, `order_status`, `created_at`, `updated_at`, `dine_in_takeout`, `customer_name`, `special_requests`) VALUES
(1, '806758e2-16f7-42f2-b523-79680d156d7c', 'Chicken Inasal', 129.00, 2, '', '2025-01-01 17:21:44', '2025-01-04 11:31:53', 'Dine In', NULL, NULL),
(2, '806758e2-16f7-42f2-b523-79680d156d7c', 'Chicksilog', 129.00, 1, '', '2025-01-01 17:21:44', '2025-01-04 11:31:53', 'Dine In', NULL, NULL),
(3, '806758e2-16f7-42f2-b523-79680d156d7c', 'Coke', 85.00, 1, '', '2025-01-01 17:21:44', '2025-01-04 11:31:53', 'Dine In', NULL, NULL),
(4, '44f7a323-9290-4eda-84d0-92dc96ebfa8d', 'Chicken Inasal', 159.00, 1, 'Cancelled', '2025-01-01 17:30:35', '2025-02-02 08:24:03', 'Dine In', NULL, NULL),
(5, '44f7a323-9290-4eda-84d0-92dc96ebfa8d', 'Chicksilog', 129.00, 1, 'Cancelled', '2025-01-01 17:30:35', '2025-02-02 08:24:03', 'Dine In', NULL, NULL),
(6, '30ba2256-58b9-4345-bda4-8657ec7d15cf', 'Chicken Inasal', 159.00, 1, '', '2025-01-01 17:49:15', '2025-02-02 08:24:14', 'Dine In', '', ''),
(7, '30ba2256-58b9-4345-bda4-8657ec7d15cf', 'Chicken Inasal', 159.00, 1, '', '2025-01-01 17:51:59', '2025-02-02 08:24:14', 'Dine In', '', ''),
(8, '6a07fc36-cee3-404a-ab19-4679dbcf1cde', 'Chicksilog', 129.00, 1, '', '2025-01-01 17:52:27', '2025-01-04 11:31:50', 'Dine In', 'denn', 'toyo'),
(9, 'e6d35db7-7ddc-440c-b8a9-bdecb9c15857', 'Chicken Inasal', 159.00, 1, '', '2025-01-04 11:31:33', '2025-01-04 11:31:43', 'Dine In', 'gg', 'gg'),
(10, '8f7cbfb5-602c-49ee-9d62-52c62e2707c2', 'Chicken Inasal', 159.00, 1, 'Cancelled', '2025-02-02 07:59:39', '2025-02-02 08:24:11', 'Dine In', 'clement', 'toyo'),
(11, '147a6a38-1185-4c55-8c1b-7afd769114c5', 'Pork Marinated', 139.00, 5, '', '2025-02-02 08:23:39', '2025-02-02 08:23:49', 'Dine In', 'Juwow', '1 bil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menucategories`
--
ALTER TABLE `menucategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `menucategories`
--
ALTER TABLE `menucategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `menucategories` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menuitems` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
