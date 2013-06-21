-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2013 at 08:19 PM
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
(1, 1, 2, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 1, '0000-00-00 00:00:00'),
(2, 2, 3, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 1, '0000-00-00 00:00:00'),
(3, 1, 3, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 2, '0000-00-00 00:00:00'),
(4, 3, 4, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 1, '0000-00-00 00:00:00'),
(5, 2, 4, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 2, '0000-00-00 00:00:00'),
(6, 1, 4, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 3, '0000-00-00 00:00:00'),
(7, 4, 5, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 1, '0000-00-00 00:00:00'),
(8, 3, 5, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 2, '0000-00-00 00:00:00'),
(9, 2, 5, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 3, '0000-00-00 00:00:00'),
(10, 1, 5, 'Pending', '0000-00-00', 0, '2013-06-20 00:00:00', 4, '0000-00-00 00:00:00');

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
(4, 3, 'root 4', 'root 4', '12344', 123456, 'root@a.com', 1, '1', '1', '1', '1', 3000),
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
(1, 1, '2013-06-20', '0000-00-00', 0),
(2, 2, '2013-06-20', '0000-00-00', 0),
(3, 3, '2013-06-20', '0000-00-00', 0),
(4, 4, '2013-06-20', '0000-00-00', 0),
(5, 5, '2013-06-20', '0000-00-00', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
