-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2025 at 12:35 AM
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
-- Database: `dtrecorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `category` enum('office','personnel') NOT NULL DEFAULT 'personnel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `category`) VALUES
(1, 'CAHS OFFICE', 'CAHS', 'office'),
(2, 'CEA OFFICE', 'CEA', 'office'),
(3, 'CITE OFFICE', 'CITE', 'office'),
(4, 'CMA OFFICE', 'CMA', 'office'),
(5, 'CELA OFFICE', 'CELA', 'office'),
(6, 'CCJE OFFICE', 'CCJE', 'office'),
(7, 'CAS OFFICE', 'CAS', 'office'),
(8, 'Professor', 'Prof', 'personnel');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`) VALUES
(1, 'CAHS'),
(7, 'CAS'),
(6, 'CCJE'),
(2, 'CEA'),
(5, 'CELA'),
(3, 'CITE'),
(4, 'CMA');

-- --------------------------------------------------------

--
-- Table structure for table `duty_logs`
--

CREATE TABLE `duty_logs` (
  `id` int(11) NOT NULL,
  `assigned_id` int(11) NOT NULL,
  `duty_date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  `remarks` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `logged_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `duty_logs`
--

INSERT INTO `duty_logs` (`id`, `assigned_id`, `duty_date`, `time_in`, `time_out`, `remarks`, `approved_by`, `logged_at`) VALUES
(19, 5, '2025-10-17', '20:46:00', '20:47:00', 'CAHS', 1, '2025-10-17 20:49:40'),
(20, 6, '2025-10-17', '20:47:00', '20:48:00', 'Test', NULL, '2025-10-17 20:55:16'),
(21, 5, '2025-10-17', '20:55:00', '20:56:00', 'Test', 1, '2025-10-17 20:55:58'),
(22, 5, '2025-10-17', '22:34:00', '22:36:00', 'Cahs 2 mins', 1, '2025-10-17 22:34:37'),
(23, 8, '2025-10-17', '22:36:00', '22:38:00', 'test 2 mins', NULL, '2025-10-17 22:36:08'),
(24, 5, '2025-10-17', '22:45:00', '23:45:00', 'test cahs', 1, '2025-10-17 22:46:04'),
(25, 5, '2025-10-18', '06:02:00', '07:02:00', '1 hour test now', 1, '2025-10-18 06:03:11'),
(26, 5, '2025-10-18', '13:35:00', '20:35:00', 'try', 1, '2025-10-18 13:35:44'),
(27, 5, '2025-10-18', '13:36:00', '13:37:00', 'ret', 1, '2025-10-18 17:36:56'),
(28, 5, '2025-10-18', '17:36:00', '17:37:00', 'asd', 1, '2025-10-18 17:36:56'),
(29, 5, '2025-11-07', '17:37:00', '17:39:00', 'asd', 1, '2025-10-18 17:37:16'),
(30, 5, '2025-10-08', '17:40:00', '17:39:00', 'asdasd', 1, '2025-10-18 17:37:17'),
(31, 5, '3123-12-31', '12:31:00', '12:31:00', '123123', 1, '2025-10-24 07:55:42'),
(32, 5, '3123-12-31', '12:31:00', '12:31:00', '123123123123123', 1, '2025-10-24 07:56:40'),
(33, 5, '4444-04-04', '16:44:00', '12:31:00', '44444412243', 1, '2025-10-25 21:13:27'),
(34, 5, '3123-12-31', '12:31:00', '15:12:00', '123123123123', 1, '2025-10-25 21:13:51'),
(35, 10, '2025-10-25', '21:14:00', '21:14:00', 'Check', 1, '2025-10-25 21:15:05'),
(36, 11, '2025-10-25', '21:46:00', '21:47:00', 'Test', NULL, '2025-10-25 21:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `duty_requests`
--

CREATE TABLE `duty_requests` (
  `id` int(11) NOT NULL,
  `assigned_id` int(11) NOT NULL,
  `duty_date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  `remarks` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `submitted_at` datetime DEFAULT current_timestamp(),
  `reviewed_at` datetime DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `duty_requests`
--

INSERT INTO `duty_requests` (`id`, `assigned_id`, `duty_date`, `time_in`, `time_out`, `remarks`, `status`, `submitted_at`, `reviewed_at`, `reviewed_by`) VALUES
(38, 5, '2025-10-17', '20:46:00', '20:47:00', 'CAHS', 'approved', '2025-10-17 20:47:04', '2025-10-17 20:49:40', 1),
(39, 6, '2025-10-17', '20:47:00', '20:48:00', 'Test', 'approved', '2025-10-17 20:47:57', '2025-10-17 20:55:16', NULL),
(40, 7, '2025-10-17', '20:48:00', '20:49:00', 'TestTestTest', 'pending', '2025-10-17 20:48:24', NULL, NULL),
(41, 5, '2025-10-17', '20:55:00', '20:56:00', 'Test', 'approved', '2025-10-17 20:55:40', '2025-10-17 20:55:58', 1),
(42, 5, '2025-10-17', '20:57:00', '20:58:00', 'Test', 'rejected', '2025-10-17 20:55:49', '2025-10-17 20:56:01', 1),
(43, 5, '2025-10-17', '22:34:00', '22:36:00', 'Cahs 2 mins', 'approved', '2025-10-17 22:34:22', '2025-10-17 22:34:37', 1),
(44, 8, '2025-10-17', '22:36:00', '22:38:00', 'test 2 mins', 'approved', '2025-10-17 22:35:49', '2025-10-17 22:36:08', NULL),
(45, 5, '2025-10-17', '22:45:00', '23:45:00', 'test cahs', 'approved', '2025-10-17 22:45:48', '2025-10-17 22:46:04', 1),
(46, 5, '2025-10-18', '06:02:00', '07:02:00', '1 hour test now', 'approved', '2025-10-18 06:03:04', '2025-10-18 06:03:11', 1),
(47, 5, '2025-10-18', '13:35:00', '20:35:00', 'try', 'approved', '2025-10-18 13:35:36', '2025-10-18 13:35:44', 1),
(48, 5, '2025-10-18', '13:36:00', '13:37:00', 'ret', 'approved', '2025-10-18 13:36:14', '2025-10-18 17:36:56', 1),
(49, 5, '2025-10-18', '17:36:00', '17:37:00', 'asd', 'approved', '2025-10-18 17:36:49', '2025-10-18 17:36:56', 1),
(50, 5, '2025-11-07', '17:37:00', '17:39:00', 'asd', 'approved', '2025-10-18 17:37:06', '2025-10-18 17:37:16', 1),
(51, 5, '2025-10-08', '17:40:00', '17:39:00', 'asdasd', 'approved', '2025-10-18 17:37:13', '2025-10-18 17:37:17', 1),
(52, 5, '2025-10-24', '07:51:00', '07:52:00', 'Test', 'rejected', '2025-10-24 07:51:25', '2025-10-27 17:47:24', 1),
(53, 5, '2025-10-24', '07:53:00', '07:55:00', 'Test', 'rejected', '2025-10-24 07:52:01', '2025-10-27 17:47:24', 1),
(54, 5, '2025-10-28', '11:52:00', '07:56:00', 'Test', 'rejected', '2025-10-24 07:52:09', '2025-10-27 17:47:24', 1),
(55, 5, '2025-10-24', '07:56:00', '11:54:00', 'Cadawd', 'rejected', '2025-10-24 07:54:19', '2025-10-27 17:47:24', 1),
(56, 5, '2025-10-16', '07:58:00', '00:54:00', 'Tadawdawd', 'rejected', '2025-10-24 07:54:37', '2025-10-27 17:47:24', 1),
(57, 5, '2025-10-24', '07:54:00', '07:57:00', 'Tawdawd', 'rejected', '2025-10-24 07:54:43', '2025-10-27 17:47:24', 1),
(58, 5, '2025-10-24', '07:59:00', '11:55:00', 'awdawd', 'rejected', '2025-10-24 07:55:06', '2025-10-27 17:47:24', 1),
(59, 5, '2025-10-31', '12:31:00', '12:31:00', '123123123', 'rejected', '2025-10-24 07:55:19', '2025-10-27 17:47:24', 1),
(60, 5, '3123-12-31', '12:31:00', '12:31:00', '123123', 'approved', '2025-10-24 07:55:22', '2025-10-24 07:55:42', 1),
(61, 5, '3123-12-31', '23:23:00', '12:31:00', '123123123', 'rejected', '2025-10-24 07:55:27', '2025-10-24 08:01:16', 1),
(62, 5, '3123-12-31', '12:31:00', '12:31:00', '123123123123123', 'approved', '2025-10-24 07:55:35', '2025-10-24 07:56:40', 1),
(63, 5, '3123-12-31', '12:31:00', '15:12:00', '123123123123', 'approved', '2025-10-24 08:01:31', '2025-10-25 21:13:51', 1),
(64, 5, '3321-12-31', '12:33:00', '04:12:00', '541243', 'rejected', '2025-10-24 08:01:37', '2025-10-25 21:13:44', 1),
(65, 5, '4444-04-04', '16:44:00', '12:31:00', '44444412243', 'approved', '2025-10-24 08:01:48', '2025-10-25 21:13:27', 1),
(66, 10, '2025-10-25', '21:14:00', '21:14:00', 'Check', 'approved', '2025-10-25 21:14:57', '2025-10-25 21:15:05', 1),
(67, 6, '2025-10-25', '21:45:00', '21:46:00', 'Test', 'rejected', '2025-10-25 21:45:34', '2025-10-25 21:45:39', NULL),
(68, 11, '2025-10-25', '21:46:00', '21:47:00', 'Test', 'approved', '2025-10-25 21:46:55', '2025-10-25 21:47:00', NULL),
(69, 11, '2025-10-25', '21:47:00', '21:49:00', 'Test 2', 'rejected', '2025-10-25 21:47:28', '2025-10-25 21:47:35', NULL),
(70, 12, '2025-10-25', '22:57:00', '22:58:00', 'Nigga test 1', 'approved', '2025-10-25 22:57:29', '2025-10-25 22:57:57', NULL),
(71, 5, '2025-10-30', '08:25:00', '08:26:00', 'Test', 'pending', '2025-10-30 08:25:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scholarship_types`
--

CREATE TABLE `scholarship_types` (
  `id` int(11) NOT NULL,
  `scholarship_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scholarship_types`
--

INSERT INTO `scholarship_types` (`id`, `scholarship_name`) VALUES
(1, 'HK25'),
(2, 'HK50'),
(3, 'HK75'),
(4, 'SA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `password_hash` varchar(255) NOT NULL,
  `reset_token_hash` varchar(64) DEFAULT NULL,
  `reset_token_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `email_address`, `student_id`, `created_at`, `password_hash`, `reset_token_hash`, `reset_token_expiration`) VALUES
(1, 'Carl Elijah Ron', 'Cayabyab', 'Canullas', 'test@phinmaed.com', '03-01-2425-041045', '2025-10-16 06:13:03', '$2y$10$NwLxsA9fAG8ZannYKJhLK.0pKWibqSU9WQDquq9jJFxgXMbuhiZk6', NULL, NULL),
(2, 'Arceli', 'Viernes', 'Mapili', 'arvi.mapili.up@phinmaed.com', '03-01-2425-043344', '2025-10-16 09:58:56', '$2y$10$QT796RCm/OQ9UBfj4YRdwO6NM6SQd6CwvULRe1jq04R53mg7w2Qry', NULL, NULL),
(3, 'Jeverlee', 'Resonable', 'Naron', 'jere.naron.up@phinmaed.com', '03-01-2425-045551', '2025-10-16 10:00:26', '$2y$10$ufkk45PnsJuvGQGBANtS7.HC/LUMFUk926cSOgnwvhGNKHriKbwHq', NULL, NULL),
(4, 'Miguel', 'Galpao', 'Nasurada', 'miga.nasurada.up@phinmaed.com', '03-01-2425-449255', '2025-10-16 10:01:15', '$2y$10$uKU0LWMHToNe1AgmPBd2xOc12MbEWx9KBucMOgy7QvMbs9SQNc5Q.', NULL, NULL),
(5, 'Junald', 'Sapiera', 'Valencia', 'unsa.valencia.up@phinmaed.com', '03-01-2425-040144', '2025-10-16 10:02:32', '$2y$10$ebzBiK.Pnz2zyNha34Ne7.3E2T3qn5GbL.49HWiPiGeDMIjvQcssq', '82dd598297412a9019e2722e6e740347236a414d31357c40c33d53beae2b217f', '2025-10-17 22:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `users_assigned`
--

CREATE TABLE `users_assigned` (
  `assigned_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `assigned_at` datetime DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_assigned`
--

INSERT INTO `users_assigned` (`assigned_id`, `admin_id`, `student_id`, `assigned_at`, `is_active`) VALUES
(5, 1, 1, '2025-10-30 08:24:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

CREATE TABLE `users_info` (
  `user_id` bigint(20) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `scholarship_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_info`
--

INSERT INTO `users_info` (`user_id`, `department_id`, `scholarship_id`) VALUES
(1, 3, 1),
(2, 1, 1),
(3, 3, 4),
(4, 3, 1),
(5, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `duty_logs`
--
ALTER TABLE `duty_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_id` (`assigned_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `duty_requests`
--
ALTER TABLE `duty_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_id` (`assigned_id`),
  ADD KEY `reviewed_by` (`reviewed_by`);

--
-- Indexes for table `scholarship_types`
--
ALTER TABLE `scholarship_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `scholarship_name` (`scholarship_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_address` (`email_address`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `reset_token_hash` (`reset_token_hash`);

--
-- Indexes for table `users_assigned`
--
ALTER TABLE `users_assigned`
  ADD PRIMARY KEY (`assigned_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `users_info_department` (`department_id`),
  ADD KEY `users_info_scholarship` (`scholarship_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `duty_logs`
--
ALTER TABLE `duty_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `duty_requests`
--
ALTER TABLE `duty_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `scholarship_types`
--
ALTER TABLE `scholarship_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_assigned`
--
ALTER TABLE `users_assigned`
  MODIFY `assigned_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `duty_logs`
--
ALTER TABLE `duty_logs`
  ADD CONSTRAINT `duty_logs_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `duty_requests`
--
ALTER TABLE `duty_requests`
  ADD CONSTRAINT `duty_requests_ibfk_2` FOREIGN KEY (`reviewed_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users_assigned`
--
ALTER TABLE `users_assigned`
  ADD CONSTRAINT `users_assigned_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_assigned_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_info`
--
ALTER TABLE `users_info`
  ADD CONSTRAINT `users_info_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `users_info_scholarship` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarship_types` (`id`),
  ADD CONSTRAINT `users_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
