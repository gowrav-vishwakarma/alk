-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2013 at 09:22 PM
-- Server version: 5.1.61
-- PHP Version: 5.3.6-13ubuntu3.10

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `filestore_file`
--

INSERT INTO `filestore_file` (`id`, `filestore_type_id`, `filestore_volume_id`, `filename`, `original_filename`, `filesize`, `filenum`, `deleted`) VALUES
(1, 2, 1, '0/20130620225907_1_thumb-1ms-212660.jpg', 'thumb_1ms-212660.jpg', 0, 0, ''),
(2, 2, 1, '0/20130620225907__1ms-212660.jpg', '1ms-212660.jpg', 246953, 0, ''),
(3, 2, 1, '0/20130620225930_1_thumb-1ms-212660.jpg', 'thumb_1ms-212660.jpg', 0, 0, ''),
(4, 2, 1, '0/20130620225930__1ms-212660.jpg', '1ms-212660.jpg', 246953, 0, ''),
(15, 2, 1, '0/20130621130457_1_thumb-funny20.jpg', 'thumb_funny20.jpg', 0, 0, ''),
(16, 2, 1, '0/20130621130457__funny20.jpg', 'funny20.jpg', 22927, 0, ''),
(23, 2, 1, '0/20130621205154_1_thumb-321466-528906707151745-1926555858-n.jpg', 'thumb_321466_528906707151745_1926555858_n.jpg', 0, 0, ''),
(24, 2, 1, '0/20130621205154__321466-528906707151745-1926555858-n.jpg', '321466_528906707151745_1926555858_n.jpg', 14615, 0, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `filestore_image`
--

INSERT INTO `filestore_image` (`id`, `name`, `original_file_id`, `thumb_file_id`) VALUES
(1, NULL, 2, 1),
(2, NULL, 4, 3),
(3, NULL, 6, 5),
(4, NULL, 8, 7),
(5, NULL, 10, 9),
(6, NULL, 12, 11),
(7, NULL, 14, 13),
(8, NULL, 16, 15),
(9, NULL, 18, 17),
(10, NULL, 20, 19),
(11, NULL, 22, 21),
(12, NULL, 24, 23);

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
(1, 'upload', 'upload', 1000000000, 0, 24, 'Y', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `gift`
--

INSERT INTO `gift` (`id`, `gift_to_id`, `gift_from_id`, `status`, `approved_rejected_date`, `bank_slip_id`, `gift_send_date`, `requested_level`, `last_update_date`) VALUES
(1, 1, 2, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 1, '2013-06-21 21:07:53'),
(2, 2, 3, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 1, '2013-06-21 21:07:53'),
(3, 1, 3, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 2, '2013-06-21 21:07:53'),
(4, 3, 4, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 1, '2013-06-21 21:07:53'),
(5, 2, 4, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 2, '2013-06-21 21:07:53'),
(6, 1, 4, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 3, '2013-06-21 21:07:53'),
(7, 4, 5, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 1, '2013-06-21 21:07:53'),
(8, 3, 5, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 2, '2013-06-21 21:07:53'),
(9, 2, 5, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 3, '2013-06-21 21:07:53'),
(10, 1, 5, 'Pending', '0000-00-00', 0, '2013-06-21 00:00:00', 4, '2013-06-21 21:07:54');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `sponsor_id`, `name`, `username`, `password`, `mobile_number`, `email_Id`, `is_active`, `bank_name`, `account_number`, `IFSC`, `bank_location`, `points_available`) VALUES
(1, NULL, 'root 1', 'root 1', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(2, 1, 'root 2', 'root 2', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(3, 2, 'root 3', 'root 3', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(4, 3, 'root 4', 'root 4', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0),
(5, 4, 'root 5', 'root 5', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pins`
--

CREATE TABLE IF NOT EXISTS `pins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by_id` int(11) NOT NULL,
  `current_owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `is_used` tinyint(4) NOT NULL,
  `sold_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pin_purchase_request`
--

INSERT INTO `pin_purchase_request` (`id`, `request_from_id`, `currently_requested_to_id`, `request_at`, `status`, `bank_slip_id`) VALUES
(1, 3, 1, '2013-06-20', 'Pending', 24),
(2, 3, 3, '2013-06-20', 'Rejected', 16);

-- --------------------------------------------------------

--
-- Table structure for table `topups`
--

CREATE TABLE IF NOT EXISTS `topups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `withdrawal_requested_on` date NOT NULL,
  `is_withdrawable` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `topups`
--

INSERT INTO `topups` (`id`, `member_id`, `created_at`, `withdrawal_requested_on`, `is_withdrawable`) VALUES
(1, 1, '2013-06-21', '0000-00-00', 0),
(2, 2, '2013-06-21', '0000-00-00', 0),
(3, 3, '2013-06-21', '0000-00-00', 0),
(4, 4, '2013-06-21', '0000-00-00', 0),
(5, 5, '2013-06-21', '0000-00-00', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
