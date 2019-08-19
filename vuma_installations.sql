-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2019 at 10:44 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vuma_installations`
--

-- --------------------------------------------------------

--
-- Table structure for table `installation`
--

CREATE TABLE `installation` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `address` varchar(250) NOT NULL,
  `appointment_date` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `installation`
--

INSERT INTO `installation` (`id`, `customer_name`, `address`, `appointment_date`, `status_id`, `date_created`, `date_modified`) VALUES
(1, 'William', '89 Jeppe', '2019-08-19', 1, '2019-08-19 17:48:47', '2019-08-19 19:17:38'),
(2, 'William', '89 Eloff', '2019-08-19', 1, '2019-08-19 18:00:56', '2019-08-19 18:00:56'),
(3, 'William', '89 Eloff', '2019-08-19', 1, '2019-08-19 18:01:59', '2019-08-19 18:01:59'),
(4, 'William', '89 Eloff', '2019-08-19', 1, '2019-08-19 18:03:04', '2019-08-19 18:03:04'),
(5, 'William', '89 Eloff', '2019-08-19', 1, '2019-08-19 18:06:10', '2019-08-19 18:06:10'),
(6, 'William', '89 Eloff', '2019-08-19', 1, '2019-08-19 18:28:10', '2019-08-19 18:28:10'),
(7, 'William', '89 Eloff', '2019-08-19', 1, '2019-08-19 19:17:48', '2019-08-19 19:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(150) NOT NULL,
  `notes` varchar(250) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`, `notes`, `date`) VALUES
(1, 'installation requested', '', '2019-08-19 15:14:20'),
(2, 'Installation in progress', '', '2019-08-19 15:14:20'),
(3, 'Installation Complete', '', '2019-08-19 15:14:20'),
(4, 'Installation Rejected', '', '2019-08-19 15:14:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `installation`
--
ALTER TABLE `installation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `status_id_2` (`status_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `installation`
--
ALTER TABLE `installation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `installation`
--
ALTER TABLE `installation`
  ADD CONSTRAINT `installation_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
