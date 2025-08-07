-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 31, 2025 at 09:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25


CREATE DATABASE IF NOT EXISTS `test`;
USE `test`;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `eve_log`
--

CREATE TABLE `eve_log` (
  `id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `src_ip` varchar(45) DEFAULT NULL,
  `dest_ip` varchar(45) DEFAULT NULL,
  `proto` varchar(10) DEFAULT NULL,
  `alert_msg` text DEFAULT NULL,
  `signature_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eve_log`
--

INSERT INTO `eve_log` (`id`, `timestamp`, `src_ip`, `dest_ip`, `proto`, `alert_msg`, `signature_id`) VALUES
(1, '2025-07-31 08:49:08', '192.168.102.138', '192.168.102.2', 'UDP', 'ET FILE_SHARING File Hosting Service Domain Domain in DNS Lookup (files .pythonhosted .org)', 2049201),
(2, '2025-07-31 08:49:08', '192.168.102.138', '192.168.102.2', 'UDP', 'ET FILE_SHARING File Hosting Service Domain Domain in DNS Lookup (files .pythonhosted .org)', 2049201),
(3, '2025-07-31 08:49:08', '192.168.102.138', '151.101.0.223', 'TCP', 'ET INFO Observed File Hosting Service Domain (files .pythonhosted .org in TLS SNI)', 2049202);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eve_log`
--
ALTER TABLE `eve_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eve_log`
--
ALTER TABLE `eve_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
