-- phpMyAdmin SQL Dump
-- version 3.5.7deb1.precise~ppa.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2013 at 10:51 PM
-- Server version: 5.5.28-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alk`
--

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE IF NOT EXISTS `complains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) NOT NULL,
  `pin_request_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `against_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `last_update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `complains`
--

INSERT INTO `complains` (`id`, `gift_id`, `pin_request_id`, `from_id`, `against_id`, `message`, `created_at`, `status`, `action`, `last_update_at`) VALUES
(3, 11, 0, 6, 5, 'maine paisa diya hai', '2013-07-01 22:26:20', 'Send', '', '2013-07-01 22:26:20');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_file`
--

CREATE TABLE IF NOT EXISTS `filestore_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(11) NOT NULL DEFAULT '0',
  `filestore_volume_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filenum` int(11) NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `filestore_file`
--

INSERT INTO `filestore_file` (`id`, `filestore_type_id`, `filestore_volume_id`, `filename`, `original_filename`, `filesize`, `filenum`, `deleted`) VALUES
(35, 2, 1, '0/20130701210858_1_thumb-1.jpg', 'thumb_1.jpg', 0, 0, ''),
(36, 2, 1, '0/20130701210858__1.jpg', '1.jpg', 107739, 0, ''),
(37, 2, 1, '0/20130701221922_1_thumb-1.jpg', 'thumb_1.jpg', 0, 0, ''),
(38, 2, 1, '0/20130701221922__1.jpg', '1.jpg', 107739, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_image`
--

CREATE TABLE IF NOT EXISTS `filestore_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_file_id` int(11) NOT NULL DEFAULT '0',
  `thumb_file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `filestore_image`
--

INSERT INTO `filestore_image` (`id`, `name`, `original_file_id`, `thumb_file_id`) VALUES
(18, NULL, 36, 35),
(19, NULL, 38, 37);

-- --------------------------------------------------------

--
-- Table structure for table `filestore_type`
--

CREATE TABLE IF NOT EXISTS `filestore_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(64) NOT NULL DEFAULT '',
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `filestore_type`
--

INSERT INTO `filestore_type` (`id`, `name`, `mime_type`, `extension`) VALUES
(1, 'png', 'image/png', 'png'),
(2, 'jpeg', 'image/jpeg', 'jpeg'),
(3, 'gif', 'image/gif', 'gif'),
(4, 'jpg', 'image/jpg', 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_volume`
--

CREATE TABLE IF NOT EXISTS `filestore_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `dirname` varchar(255) NOT NULL DEFAULT '',
  `total_space` bigint(20) NOT NULL DEFAULT '0',
  `used_space` bigint(20) NOT NULL DEFAULT '0',
  `stored_files_cnt` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') DEFAULT 'Y',
  `last_filenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `filestore_volume`
--

INSERT INTO `filestore_volume` (`id`, `name`, `dirname`, `total_space`, `used_space`, `stored_files_cnt`, `enabled`, `last_filenum`) VALUES
(1, 'upload', 'upload', 1000000000, 0, 38, 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

CREATE TABLE IF NOT EXISTS `gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_to_id` int(11) NOT NULL,
  `gift_from_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `approved_rejected_date` date NOT NULL,
  `bank_slip_id` int(11) NOT NULL,
  `gift_send_date` datetime NOT NULL,
  `requested_level` int(11) NOT NULL,
  `last_update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `gift`
--

INSERT INTO `gift` (`id`, `gift_to_id`, `gift_from_id`, `status`, `approved_rejected_date`, `bank_slip_id`, `gift_send_date`, `requested_level`, `last_update_date`) VALUES
(1, 1, 2, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 1, '2013-07-01 20:24:35'),
(2, 2, 3, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 1, '2013-07-01 20:24:35'),
(3, 1, 3, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 2, '2013-07-01 20:24:35'),
(4, 3, 4, 'Approved', '0000-00-00', 0, '2013-07-01 00:00:00', 1, '2013-07-01 21:49:07'),
(5, 2, 4, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 2, '2013-07-01 20:24:35'),
(6, 1, 4, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 3, '2013-07-01 20:24:35'),
(7, 4, 5, 'Approved', '0000-00-00', 0, '2013-07-01 00:00:00', 1, '2013-07-01 21:20:47'),
(8, 3, 5, 'Approved', '0000-00-00', 0, '2013-07-01 00:00:00', 2, '2013-07-01 21:18:01'),
(9, 2, 5, 'Approved', '0000-00-00', 0, '2013-07-01 00:00:00', 3, '2013-07-01 21:17:47'),
(10, 1, 5, 'Approved', '0000-00-00', 0, '2013-07-01 00:00:00', 4, '2013-07-01 21:17:31'),
(11, 5, 6, 'Complained', '0000-00-00', 38, '2013-07-01 00:00:00', 1, '2013-07-01 22:26:20'),
(12, 4, 6, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 2, '2013-07-01 22:12:45'),
(13, 3, 6, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 3, '2013-07-01 22:12:45'),
(14, 2, 6, 'Pending', '0000-00-00', 0, '2013-07-01 00:00:00', 4, '2013-07-01 22:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_number` int(255) NOT NULL,
  `email_Id` varchar(255) NOT NULL,
  `is_active` tinyint(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `IFSC` varchar(255) NOT NULL,
  `bank_location` varchar(255) NOT NULL,
  `points_available` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `sponsor_id`, `name`, `username`, `password`, `mobile_number`, `email_Id`, `is_active`, `bank_name`, `account_number`, `IFSC`, `bank_location`, `points_available`) VALUES
(1, NULL, 'root 1', 'root 1', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(2, 1, 'root 2', 'root 2', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(3, 2, 'root 3', 'root 3', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(4, 3, 'root 4', 'root 4', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(5, 4, 'root 5', 'root 5', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 3000),
(6, 5, 'root 6', 'root 6', '12345', 1234567890, 'gowravvishwakarma@gmail.com', 1, 'yesbank', '12331', '112121', '12121kjhk', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pin_purchase_request`
--

CREATE TABLE IF NOT EXISTS `pin_purchase_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_from_id` int(11) NOT NULL,
  `currently_requested_to_id` int(11) NOT NULL,
  `request_at` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `bank_slip_id` int(11) NOT NULL,
  `transfer_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pin_purchase_request`
--

INSERT INTO `pin_purchase_request` (`id`, `request_from_id`, `currently_requested_to_id`, `request_at`, `status`, `bank_slip_id`, `transfer_time`) VALUES
(1, 3, 1, '2013-07-01', 'Pending', 36, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
