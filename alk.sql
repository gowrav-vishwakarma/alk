-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 09, 2013 at 08:16 AM
-- Server version: 5.1.70-cll
-- PHP Version: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `builtup4_db`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=171 ;

--
-- Dumping data for table `filestore_file`
--

INSERT INTO `filestore_file` (`id`, `filestore_type_id`, `filestore_volume_id`, `filename`, `original_filename`, `filesize`, `filenum`, `deleted`) VALUES
(3, 4, 1, '0/20130704162003_1_thumb-images1.jpg', 'thumb_images1.jpg', 0, 0, ''),
(4, 4, 1, '0/20130704162003__images1.jpg', 'images1.jpg', 23450, 0, ''),
(5, 4, 1, '0/20130704162059_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(6, 4, 1, '0/20130704162059__images3.jpg', 'images3.jpg', 18225, 0, ''),
(7, 2, 1, '0/20130704162125_1_thumb-517e235a8cb975d08d346073f4efe5d9.jpeg', 'thumb_517e235a8cb975d08d346073f4efe5d9.jpeg', 0, 0, ''),
(8, 2, 1, '0/20130704162125__517e235a8cb975d08d346073f4efe5d9.jpeg', '517e235a8cb975d08d346073f4efe5d9.jpeg', 3614, 0, ''),
(9, 4, 1, '0/20130704162154_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(10, 4, 1, '0/20130704162154__images3.jpg', 'images3.jpg', 18225, 0, ''),
(11, 4, 1, '0/20130704163644_1_thumb-images1.jpg', 'thumb_images1.jpg', 0, 0, ''),
(12, 4, 1, '0/20130704163644__images1.jpg', 'images1.jpg', 23450, 0, ''),
(13, 4, 1, '0/20130704163700_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(14, 4, 1, '0/20130704163700__images3.jpg', 'images3.jpg', 18225, 0, ''),
(15, 4, 1, '0/20130704163714_1_thumb-images4.jpg', 'thumb_images4.jpg', 0, 0, ''),
(16, 4, 1, '0/20130704163714__images4.jpg', 'images4.jpg', 19304, 0, ''),
(17, 4, 1, '0/20130704163735_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(18, 4, 1, '0/20130704163735__images3.jpg', 'images3.jpg', 18225, 0, ''),
(19, 4, 1, '0/20130704164032_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(20, 4, 1, '0/20130704164032__images3.jpg', 'images3.jpg', 18225, 0, ''),
(21, 4, 1, '0/20130704164100_1_thumb-images4.jpg', 'thumb_images4.jpg', 0, 0, ''),
(22, 4, 1, '0/20130704164100__images4.jpg', 'images4.jpg', 19304, 0, ''),
(23, 4, 1, '0/20130704164116_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(24, 4, 1, '0/20130704164116__images3.jpg', 'images3.jpg', 18225, 0, ''),
(25, 4, 1, '0/20130704164223_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(26, 4, 1, '0/20130704164223__images3.jpg', 'images3.jpg', 18225, 0, ''),
(27, 4, 1, '0/20130704164236_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(28, 4, 1, '0/20130704164236__images3.jpg', 'images3.jpg', 18225, 0, ''),
(29, 4, 1, '0/20130704164406_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(30, 4, 1, '0/20130704164406__images3.jpg', 'images3.jpg', 18225, 0, ''),
(31, 4, 1, '0/20130704165004_1_thumb-images1.jpg', 'thumb_images1.jpg', 0, 0, ''),
(32, 4, 1, '0/20130704165004__images1.jpg', 'images1.jpg', 23450, 0, ''),
(33, 4, 1, '0/20130704165040_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(34, 4, 1, '0/20130704165040__images3.jpg', 'images3.jpg', 18225, 0, ''),
(35, 4, 1, '0/20130704165056_1_thumb-images3.jpg', 'thumb_images3.jpg', 0, 0, ''),
(36, 4, 1, '0/20130704165056__images3.jpg', 'images3.jpg', 18225, 0, ''),
(37, 4, 1, '0/20130704165112_1_thumb-images4.jpg', 'thumb_images4.jpg', 0, 0, ''),
(38, 4, 1, '0/20130704165112__images4.jpg', 'images4.jpg', 19304, 0, ''),
(39, 4, 1, '0/20130704165804_1_thumb-images1.jpg', 'thumb_images1.jpg', 0, 0, ''),
(40, 4, 1, '0/20130704165804__images1.jpg', 'images1.jpg', 23450, 0, ''),
(41, 4, 1, '0/20130704195347_1_thumb-vvv.jpg', 'thumb_vvv.jpg', 0, 0, ''),
(42, 4, 1, '0/20130704195347__vvv.jpg', 'vvv.jpg', 40383, 0, ''),
(43, 4, 1, '0/20130704195627_1_thumb-img020.jpg', 'thumb_img020.jpg', 0, 0, ''),
(44, 4, 1, '0/20130704195627__img020.jpg', 'img020.jpg', 71278, 0, ''),
(45, 4, 1, '0/20130704195704_1_thumb-san.jpg', 'thumb_san.jpg', 0, 0, ''),
(46, 4, 1, '0/20130704195704__san.jpg', 'san.jpg', 40939, 0, ''),
(47, 4, 1, '0/20130704195737_1_thumb-vvv.jpg', 'thumb_vvv.jpg', 0, 0, ''),
(48, 4, 1, '0/20130704195737__vvv.jpg', 'vvv.jpg', 40383, 0, ''),
(49, 4, 1, '0/20130704195752_1_thumb-img020.jpg', 'thumb_img020.jpg', 0, 0, ''),
(50, 4, 1, '0/20130704195752__img020.jpg', 'img020.jpg', 71278, 0, ''),
(51, 4, 1, '0/20130704201925_1_thumb-purse.jpg', 'thumb_purse.jpg', 0, 0, ''),
(52, 4, 1, '0/20130704201925__purse.jpg', 'purse.jpg', 27538, 0, ''),
(53, 4, 1, '0/20130704211124_1_thumb-pi-kansara-builtup4.jpg', 'thumb_pi kansara builtup4.jpg', 0, 0, ''),
(54, 4, 1, '0/20130704211124__pi-kansara-builtup4.jpg', 'pi kansara builtup4.jpg', 161451, 0, ''),
(55, 4, 1, '0/20130704211257_1_thumb-sangeeta-builtup4.jpg', 'thumb_sangeeta builtup4.jpg', 0, 0, ''),
(56, 4, 1, '0/20130704211257__sangeeta-builtup4.jpg', 'sangeeta builtup4.jpg', 162031, 0, ''),
(57, 4, 1, '0/20130704211318_1_thumb-builtup.jpg', 'thumb_builtup.jpg', 0, 0, ''),
(58, 4, 1, '0/20130704211318__builtup.jpg', 'builtup.jpg', 128847, 0, ''),
(59, 4, 1, '0/20130705095247_1_thumb-scam.jpg', 'thumb_scam.jpg', 0, 0, ''),
(60, 4, 1, '0/20130705095247__scam.jpg', 'scam.jpg', 113602, 0, ''),
(61, 4, 1, '0/20130705095322_1_thumb-scam.jpg', 'thumb_scam.jpg', 0, 0, ''),
(62, 4, 1, '0/20130705095322__scam.jpg', 'scam.jpg', 113602, 0, ''),
(63, 4, 1, '0/20130705101211_1_thumb-kansara500rajeevr.jpg', 'thumb_kansara500rajeevr.jpg', 0, 0, ''),
(64, 4, 1, '0/20130705101211__kansara500rajeevr.jpg', 'kansara500rajeevr.jpg', 162177, 0, ''),
(65, 4, 1, '0/20130705101537_1_thumb-sangeeta1000rajeevr.jpg', 'thumb_sangeeta1000rajeevr.jpg', 0, 0, ''),
(66, 4, 1, '0/20130705101537__sangeeta1000rajeevr.jpg', 'sangeeta1000rajeevr.jpg', 158609, 0, ''),
(67, 4, 1, '0/20130705101719_1_thumb-sangeeta1000rajeevr.jpg', 'thumb_sangeeta1000rajeevr.jpg', 0, 0, ''),
(68, 4, 1, '0/20130705101719__sangeeta1000rajeevr.jpg', 'sangeeta1000rajeevr.jpg', 158609, 0, ''),
(69, 4, 1, '0/20130705140118_1_thumb-scam.jpg', 'thumb_scam.jpg', 0, 0, ''),
(70, 4, 1, '0/20130705140118__scam.jpg', 'scam.jpg', 113602, 0, ''),
(71, 4, 1, '0/20130705140137_1_thumb-scam.jpg', 'thumb_scam.jpg', 0, 0, ''),
(72, 4, 1, '0/20130705140137__scam.jpg', 'scam.jpg', 113602, 0, ''),
(73, 4, 1, '0/20130705140308_1_thumb-purse.jpg', 'thumb_purse.jpg', 0, 0, ''),
(74, 4, 1, '0/20130705140308__purse.jpg', 'purse.jpg', 27538, 0, ''),
(75, 4, 1, '0/20130705140332_1_thumb-rupya.jpg', 'thumb_rupya.jpg', 0, 0, ''),
(76, 4, 1, '0/20130705140332__rupya.jpg', 'rupya.jpg', 74532, 0, ''),
(77, 1, 1, '0/20130705145109_1_thumb-asdf.png', 'thumb_asdf.png', 0, 0, ''),
(78, 1, 1, '0/20130705145109__asdf.png', 'asdf.png', 165123, 0, ''),
(79, 4, 1, '0/20130705145323_1_thumb-img020.jpg', 'thumb_img020.jpg', 0, 0, ''),
(80, 4, 1, '0/20130705145323__img020.jpg', 'img020.jpg', 71278, 0, ''),
(81, 4, 1, '0/20130705145346_1_thumb-vvv.jpg', 'thumb_vvv.jpg', 0, 0, ''),
(82, 4, 1, '0/20130705145346__vvv.jpg', 'vvv.jpg', 40383, 0, ''),
(83, 4, 1, '0/20130705145410_1_thumb-pppp.jpg', 'thumb_pppp.jpg', 0, 0, ''),
(84, 4, 1, '0/20130705145410__pppp.jpg', 'pppp.jpg', 30952, 0, ''),
(85, 4, 1, '0/20130705164439_1_thumb-photo0003.jpg', 'thumb_Photo0003.jpg', 0, 0, ''),
(86, 4, 1, '0/20130705164439__photo0003.jpg', 'Photo0003.jpg', 1368665, 0, ''),
(87, 4, 1, '0/20130705164936_1_thumb-photo0004.jpg', 'thumb_Photo0004.jpg', 0, 0, ''),
(88, 4, 1, '0/20130705164936__photo0004.jpg', 'Photo0004.jpg', 1405977, 0, ''),
(89, 4, 1, '0/20130705165334_1_thumb-photo0003.jpg', 'thumb_Photo0003.jpg', 0, 0, ''),
(90, 4, 1, '0/20130705165334__photo0003.jpg', 'Photo0003.jpg', 1368665, 0, ''),
(91, 4, 1, '0/20130705165804_1_thumb-photo0004.jpg', 'thumb_Photo0004.jpg', 0, 0, ''),
(92, 4, 1, '0/20130705165804__photo0004.jpg', 'Photo0004.jpg', 1405977, 0, ''),
(93, 4, 1, '0/20130705182945_1_thumb-builtup-vedsingh.jpg', 'thumb_builtup vedsingh.jpg', 0, 0, ''),
(94, 4, 1, '0/20130705182945__builtup-vedsingh.jpg', 'builtup vedsingh.jpg', 159499, 0, ''),
(95, 1, 1, '0/20130705184442_1_thumb-bbbb.png', 'thumb_bbbb.png', 0, 0, ''),
(96, 1, 1, '0/20130705184442__bbbb.png', 'bbbb.png', 139394, 0, ''),
(97, 1, 1, '0/20130705184507_1_thumb-bbbb.png', 'thumb_bbbb.png', 0, 0, ''),
(98, 1, 1, '0/20130705184507__bbbb.png', 'bbbb.png', 139394, 0, ''),
(99, 1, 1, '0/20130705184602_1_thumb-bbbb.png', 'thumb_bbbb.png', 0, 0, ''),
(100, 1, 1, '0/20130705184602__bbbb.png', 'bbbb.png', 139394, 0, ''),
(101, 1, 1, '0/20130705184856_1_thumb-bbbb.png', 'thumb_bbbb.png', 0, 0, ''),
(102, 1, 1, '0/20130705184856__bbbb.png', 'bbbb.png', 32573, 0, ''),
(103, 4, 1, '0/20130706011328_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(104, 4, 1, '0/20130706011328__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(105, 4, 1, '0/20130706125952_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(106, 4, 1, '0/20130706125952__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(107, 4, 1, '0/20130706130241_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(108, 4, 1, '0/20130706130241__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(109, 4, 1, '0/20130706130717_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(110, 4, 1, '0/20130706130717__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(111, 4, 1, '0/20130706131013_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(112, 4, 1, '0/20130706131013__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(113, 4, 1, '0/20130706142327_1_thumb-img020.jpg', 'thumb_img020.jpg', 0, 0, ''),
(114, 4, 1, '0/20130706142327__img020.jpg', 'img020.jpg', 71278, 0, ''),
(115, 4, 1, '0/20130706142407_1_thumb-img020.jpg', 'thumb_img020.jpg', 0, 0, ''),
(116, 4, 1, '0/20130706142407__img020.jpg', 'img020.jpg', 71278, 0, ''),
(117, 1, 1, '0/20130706142445_1_thumb-asdf.png', 'thumb_asdf.png', 0, 0, ''),
(118, 1, 1, '0/20130706142445__asdf.png', 'asdf.png', 171844, 0, ''),
(119, 1, 1, '0/20130706142549_1_thumb-asdf.png', 'thumb_asdf.png', 0, 0, ''),
(120, 1, 1, '0/20130706142549__asdf.png', 'asdf.png', 171844, 0, ''),
(121, 1, 1, '0/20130706151416_1_thumb-asdf.png', 'thumb_asdf.png', 0, 0, ''),
(122, 1, 1, '0/20130706151416__asdf.png', 'asdf.png', 171844, 0, ''),
(123, 4, 1, '0/20130706151517_1_thumb-img020.jpg', 'thumb_img020.jpg', 0, 0, ''),
(124, 4, 1, '0/20130706151517__img020.jpg', 'img020.jpg', 71278, 0, ''),
(125, 4, 1, '0/20130706151542_1_thumb-vvv.jpg', 'thumb_vvv.jpg', 0, 0, ''),
(126, 4, 1, '0/20130706151542__vvv.jpg', 'vvv.jpg', 40383, 0, ''),
(127, 4, 1, '0/20130706151608_1_thumb-vvv.jpg', 'thumb_vvv.jpg', 0, 0, ''),
(128, 4, 1, '0/20130706151608__vvv.jpg', 'vvv.jpg', 40383, 0, ''),
(129, 4, 1, '0/20130706153301_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(130, 4, 1, '0/20130706153301__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(131, 4, 1, '0/20130706153326_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(132, 4, 1, '0/20130706153326__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(133, 4, 1, '0/20130706153348_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(134, 4, 1, '0/20130706153348__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(135, 4, 1, '0/20130706153412_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(136, 4, 1, '0/20130706153412__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(137, 4, 1, '0/20130706154324_1_thumb-vvv.jpg', 'thumb_vvv.jpg', 0, 0, ''),
(138, 4, 1, '0/20130706154324__vvv.jpg', 'vvv.jpg', 40383, 0, ''),
(139, 4, 1, '0/20130706154347_1_thumb-vvv.jpg', 'thumb_vvv.jpg', 0, 0, ''),
(140, 4, 1, '0/20130706154347__vvv.jpg', 'vvv.jpg', 40383, 0, ''),
(141, 1, 1, '0/20130706154514_1_thumb-bbbb.png', 'thumb_bbbb.png', 0, 0, ''),
(142, 1, 1, '0/20130706154514__bbbb.png', 'bbbb.png', 12397, 0, ''),
(143, 1, 1, '0/20130706154528_1_thumb-bbbb.png', 'thumb_bbbb.png', 0, 0, ''),
(144, 1, 1, '0/20130706154528__bbbb.png', 'bbbb.png', 12397, 0, ''),
(145, 1, 1, '0/20130706154540_1_thumb-bbbb.png', 'thumb_bbbb.png', 0, 0, ''),
(146, 1, 1, '0/20130706154540__bbbb.png', 'bbbb.png', 12397, 0, ''),
(147, 4, 1, '0/20130706161242_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(148, 4, 1, '0/20130706161242__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(149, 4, 1, '0/20130706161317_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(150, 4, 1, '0/20130706161317__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(151, 4, 1, '0/20130706161354_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(152, 4, 1, '0/20130706161354__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(153, 4, 1, '0/20130706161431_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(154, 4, 1, '0/20130706161431__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(155, 1, 1, '0/20130706173103_1_thumb-alok.png', 'thumb_alok.png', 0, 0, ''),
(156, 1, 1, '0/20130706173103__alok.png', 'alok.png', 78208, 0, ''),
(157, 1, 1, '0/20130706173314_1_thumb-alok.png', 'thumb_alok.png', 0, 0, ''),
(158, 1, 1, '0/20130706173314__alok.png', 'alok.png', 78208, 0, ''),
(159, 1, 1, '0/20130706173534_1_thumb-alok.png', 'thumb_alok.png', 0, 0, ''),
(160, 1, 1, '0/20130706173534__alok.png', 'alok.png', 78208, 0, ''),
(161, 1, 1, '0/20130706173634_1_thumb-alok.png', 'thumb_alok.png', 0, 0, ''),
(162, 1, 1, '0/20130706173634__alok.png', 'alok.png', 78208, 0, ''),
(163, 4, 1, '0/20130709121522_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(164, 4, 1, '0/20130709121522__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(165, 4, 1, '0/20130709121540_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(166, 4, 1, '0/20130709121540__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(167, 4, 1, '0/20130709121601_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(168, 4, 1, '0/20130709121601__addfuture.jpg', 'addfuture.jpg', 160056, 0, ''),
(169, 4, 1, '0/20130709121634_1_thumb-addfuture.jpg', 'thumb_addfuture.jpg', 0, 0, ''),
(170, 4, 1, '0/20130709121634__addfuture.jpg', 'addfuture.jpg', 160056, 0, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

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
(12, NULL, 24, 23),
(13, NULL, 26, 25),
(14, NULL, 28, 27),
(15, NULL, 30, 29),
(16, NULL, 32, 31),
(17, NULL, 34, 33),
(18, NULL, 36, 35),
(19, NULL, 38, 37),
(20, NULL, 40, 39),
(21, NULL, 42, 41),
(22, NULL, 44, 43),
(23, NULL, 46, 45),
(24, NULL, 48, 47),
(25, NULL, 50, 49),
(26, NULL, 52, 51),
(27, NULL, 54, 53),
(28, NULL, 56, 55),
(29, NULL, 58, 57),
(30, NULL, 60, 59),
(31, NULL, 62, 61),
(32, NULL, 64, 63),
(33, NULL, 66, 65),
(34, NULL, 68, 67),
(35, NULL, 70, 69),
(36, NULL, 72, 71),
(37, NULL, 74, 73),
(38, NULL, 76, 75),
(39, NULL, 78, 77),
(40, NULL, 80, 79),
(41, NULL, 82, 81),
(42, NULL, 84, 83),
(43, NULL, 86, 85),
(44, NULL, 88, 87),
(45, NULL, 90, 89),
(46, NULL, 92, 91),
(47, NULL, 94, 93),
(48, NULL, 96, 95),
(49, NULL, 98, 97),
(50, NULL, 100, 99),
(51, NULL, 102, 101),
(52, NULL, 104, 103),
(53, NULL, 106, 105),
(54, NULL, 108, 107),
(55, NULL, 110, 109),
(56, NULL, 112, 111),
(57, NULL, 114, 113),
(58, NULL, 116, 115),
(59, NULL, 118, 117),
(60, NULL, 120, 119),
(61, NULL, 122, 121),
(62, NULL, 124, 123),
(63, NULL, 126, 125),
(64, NULL, 128, 127),
(65, NULL, 130, 129),
(66, NULL, 132, 131),
(67, NULL, 134, 133),
(68, NULL, 136, 135),
(69, NULL, 138, 137),
(70, NULL, 140, 139),
(71, NULL, 142, 141),
(72, NULL, 144, 143),
(73, NULL, 146, 145),
(74, NULL, 148, 147),
(75, NULL, 150, 149),
(76, NULL, 152, 151),
(77, NULL, 154, 153),
(78, NULL, 156, 155),
(79, NULL, 158, 157),
(80, NULL, 160, 159),
(81, NULL, 162, 161),
(82, NULL, 164, 163),
(83, NULL, 166, 165),
(84, NULL, 168, 167),
(85, NULL, 170, 169);

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
(1, 'upload', 'upload', 1000000000, 0, 226, 'Y', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `gift`
--

INSERT INTO `gift` (`id`, `gift_to_id`, `gift_from_id`, `status`, `approved_rejected_date`, `bank_slip_id`, `gift_send_date`, `requested_level`, `last_update_date`) VALUES
(1, 1, 2, 'Approved By Admin', '2013-07-04', 30, '2013-07-04 00:00:00', 1, '2013-07-04 16:45:36'),
(2, 2, 3, 'Approved', '2013-07-04', 26, '2013-07-04 00:00:00', 1, '2013-07-04 16:43:47'),
(3, 1, 3, 'Approved By Admin', '2013-07-04', 28, '2013-07-04 00:00:00', 2, '2013-07-04 16:45:40'),
(4, 3, 4, 'Approved', '2013-07-04', 20, '2013-07-04 00:00:00', 1, '2013-07-04 16:42:56'),
(5, 2, 4, 'Approved', '2013-07-04', 22, '2013-07-04 00:00:00', 2, '2013-07-04 16:43:51'),
(6, 1, 4, 'Approved By Admin', '2013-07-04', 24, '2013-07-04 00:00:00', 3, '2013-07-04 16:45:44'),
(7, 4, 5, 'Pending', '0000-00-00', 32, '2013-07-04 00:00:00', 1, '2013-07-04 16:50:11'),
(8, 3, 5, 'Pending', '0000-00-00', 34, '2013-07-04 00:00:00', 2, '2013-07-04 16:50:42'),
(9, 2, 5, 'Pending', '0000-00-00', 36, '2013-07-04 00:00:00', 3, '2013-07-04 16:50:57'),
(10, 1, 5, 'Approved By Admin', '2013-07-04', 40, '2013-07-04 00:00:00', 4, '2013-07-04 17:58:33'),
(11, 5, 6, 'Approved', '2013-07-04', 4, '2013-07-04 00:00:00', 1, '2013-07-04 16:25:52'),
(12, 4, 6, 'Approved', '2013-07-04', 6, '2013-07-04 00:00:00', 2, '2013-07-04 16:26:35'),
(13, 3, 6, 'Approved', '2013-07-04', 8, '2013-07-04 00:00:00', 3, '2013-07-04 16:27:13'),
(14, 2, 6, 'Approved', '2013-07-04', 10, '2013-07-04 00:00:00', 4, '2013-07-04 16:27:39'),
(15, 5, 7, 'Approved', '2013-07-04', 12, '2013-07-04 00:00:00', 1, '2013-07-04 16:38:30'),
(16, 4, 7, 'Approved', '2013-07-04', 14, '2013-07-04 00:00:00', 2, '2013-07-04 16:40:12'),
(17, 3, 7, 'Approved', '2013-07-04', 16, '2013-07-04 00:00:00', 3, '2013-07-04 16:42:13'),
(18, 2, 7, 'Approved', '2013-07-04', 18, '2013-07-04 00:00:00', 4, '2013-07-04 16:43:56'),
(19, 7, 8, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 1, '2013-07-04 18:31:01'),
(20, 5, 8, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 2, '2013-07-04 18:31:01'),
(21, 4, 8, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 3, '2013-07-04 18:31:01'),
(22, 3, 8, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 4, '2013-07-04 18:31:01'),
(23, 8, 9, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 1, '2013-07-04 18:33:33'),
(24, 7, 9, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 2, '2013-07-04 18:33:33'),
(25, 5, 9, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 3, '2013-07-04 18:33:33'),
(26, 4, 9, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 4, '2013-07-04 18:33:33'),
(27, 9, 10, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 1, '2013-07-04 18:44:43'),
(28, 8, 10, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 2, '2013-07-04 18:44:43'),
(29, 7, 10, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 3, '2013-07-04 18:44:43'),
(30, 5, 10, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 4, '2013-07-04 18:44:43'),
(31, 10, 11, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 1, '2013-07-04 19:24:17'),
(32, 9, 11, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 2, '2013-07-04 19:24:17'),
(33, 8, 11, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 3, '2013-07-04 19:24:17'),
(34, 7, 11, 'Pending', '0000-00-00', 0, '2013-07-04 00:00:00', 4, '2013-07-04 19:24:17'),
(35, 11, 12, 'Approved', '2013-07-04', 42, '2013-07-04 00:00:00', 1, '2013-07-04 19:59:59'),
(36, 10, 12, 'Approved', '2013-07-04', 44, '2013-07-04 00:00:00', 2, '2013-07-04 20:01:25'),
(37, 9, 12, 'Approved', '2013-07-04', 46, '2013-07-04 00:00:00', 3, '2013-07-04 19:59:58'),
(38, 8, 12, 'Approved', '2013-07-04', 50, '2013-07-04 00:00:00', 4, '2013-07-04 20:01:11'),
(39, 12, 13, 'Approved', '2013-07-04', 52, '2013-07-04 00:00:00', 1, '2013-07-04 21:20:40'),
(40, 11, 13, 'Approved', '2013-07-04', 54, '2013-07-04 00:00:00', 2, '2013-07-04 21:20:02'),
(41, 10, 13, 'Approved', '2013-07-04', 56, '2013-07-04 00:00:00', 3, '2013-07-04 21:19:30'),
(42, 9, 13, 'Approved', '2013-07-04', 58, '2013-07-04 00:00:00', 4, '2013-07-04 21:18:31'),
(43, 13, 14, 'Approved', '2013-07-05', 60, '2013-07-04 00:00:00', 1, '2013-07-05 10:38:09'),
(44, 12, 14, 'Approved', '2013-07-05', 62, '2013-07-04 00:00:00', 2, '2013-07-05 10:37:07'),
(45, 11, 14, 'Approved', '2013-07-05', 64, '2013-07-04 00:00:00', 3, '2013-07-05 10:34:09'),
(46, 10, 14, 'Approved', '2013-07-05', 66, '2013-07-04 00:00:00', 4, '2013-07-05 11:16:16'),
(47, 13, 15, 'Approved', '2013-07-05', 78, '2013-07-05 00:00:00', 1, '2013-07-05 14:52:43'),
(48, 12, 15, 'Approved', '2013-07-05', 80, '2013-07-05 00:00:00', 2, '2013-07-05 14:55:34'),
(49, 11, 15, 'Approved', '2013-07-05', 82, '2013-07-05 00:00:00', 3, '2013-07-05 14:56:01'),
(50, 10, 15, 'Approved', '2013-07-05', 84, '2013-07-05 00:00:00', 4, '2013-07-05 14:57:34'),
(51, 14, 16, 'Approved', '2013-07-05', 72, '2013-07-05 00:00:00', 1, '2013-07-05 14:08:26'),
(52, 13, 16, 'Approved', '2013-07-05', 74, '2013-07-05 00:00:00', 2, '2013-07-05 14:10:24'),
(53, 12, 16, 'Approved', '2013-07-05', 76, '2013-07-05 00:00:00', 3, '2013-07-05 14:09:23'),
(54, 11, 16, 'Approved', '2013-07-05', 94, '2013-07-05 00:00:00', 4, '2013-07-05 18:34:24'),
(55, 16, 17, 'Approved', '2013-07-05', 92, '2013-07-05 00:00:00', 1, '2013-07-05 20:12:13'),
(56, 14, 17, 'Approved', '2013-07-05', 90, '2013-07-05 00:00:00', 2, '2013-07-05 20:07:23'),
(57, 13, 17, 'Approved', '2013-07-05', 88, '2013-07-05 00:00:00', 3, '2013-07-05 19:39:18'),
(58, 12, 17, 'Approved', '2013-07-05', 86, '2013-07-05 00:00:00', 4, '2013-07-05 19:41:23'),
(59, 15, 18, 'Approved', '2013-07-05', 102, '2013-07-05 00:00:00', 1, '2013-07-05 18:50:09'),
(60, 13, 18, 'Approved', '2013-07-05', 96, '2013-07-05 00:00:00', 2, '2013-07-05 18:48:34'),
(61, 12, 18, 'Approved', '2013-07-05', 98, '2013-07-05 00:00:00', 3, '2013-07-05 18:49:51'),
(62, 11, 18, 'Approved', '2013-07-05', 100, '2013-07-05 00:00:00', 4, '2013-07-05 18:50:50'),
(63, 18, 19, 'Approved', '2013-07-06', 114, '2013-07-05 00:00:00', 1, '2013-07-06 14:28:52'),
(64, 15, 19, 'Approved', '2013-07-06', 116, '2013-07-05 00:00:00', 2, '2013-07-06 14:29:45'),
(65, 13, 19, 'Approved', '2013-07-06', 118, '2013-07-05 00:00:00', 3, '2013-07-06 15:05:03'),
(66, 12, 19, 'Approved', '2013-07-06', 120, '2013-07-05 00:00:00', 4, '2013-07-06 15:03:34'),
(67, 7, 20, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 1, '2013-07-06 00:52:13'),
(68, 5, 20, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 2, '2013-07-06 00:52:13'),
(69, 4, 20, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 3, '2013-07-06 00:52:13'),
(70, 3, 20, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 4, '2013-07-06 00:52:13'),
(71, 7, 21, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 1, '2013-07-06 01:19:30'),
(72, 5, 21, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 2, '2013-07-06 01:19:30'),
(73, 4, 21, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 3, '2013-07-06 01:19:30'),
(74, 3, 21, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 4, '2013-07-06 01:19:30'),
(75, 13, 22, 'Approved', '2013-07-06', 106, '2013-07-06 00:00:00', 1, '2013-07-06 13:13:34'),
(76, 12, 22, 'Approved', '2013-07-06', 108, '2013-07-06 00:00:00', 2, '2013-07-06 13:15:30'),
(77, 11, 22, 'Approved', '2013-07-06', 110, '2013-07-06 00:00:00', 3, '2013-07-06 13:12:54'),
(78, 10, 22, 'Approved', '2013-07-06', 112, '2013-07-06 00:00:00', 4, '2013-07-06 13:44:09'),
(79, 19, 23, 'Approved', '2013-07-06', 128, '2013-07-06 00:00:00', 1, '2013-07-06 15:17:19'),
(80, 18, 23, 'Approved', '2013-07-06', 126, '2013-07-06 00:00:00', 2, '2013-07-06 15:26:41'),
(81, 15, 23, 'Approved', '2013-07-06', 124, '2013-07-06 00:00:00', 3, '2013-07-06 15:28:31'),
(82, 13, 23, 'Approved', '2013-07-06', 122, '2013-07-06 00:00:00', 4, '2013-07-06 15:26:59'),
(83, 22, 24, 'Approved', '2013-07-06', 130, '2013-07-06 00:00:00', 1, '2013-07-06 15:35:35'),
(84, 13, 24, 'Approved', '2013-07-06', 132, '2013-07-06 00:00:00', 2, '2013-07-06 15:34:12'),
(85, 12, 24, 'Approved', '2013-07-06', 134, '2013-07-06 00:00:00', 3, '2013-07-06 15:38:19'),
(86, 11, 24, 'Approved', '2013-07-06', 136, '2013-07-06 00:00:00', 4, '2013-07-06 15:42:19'),
(87, 23, 25, 'Approved', '2013-07-06', 138, '2013-07-06 00:00:00', 1, '2013-07-06 18:41:29'),
(88, 19, 25, 'Approved', '2013-07-06', 140, '2013-07-06 00:00:00', 2, '2013-07-06 18:40:56'),
(89, 18, 25, 'Approved', '2013-07-06', 142, '2013-07-06 00:00:00', 3, '2013-07-06 15:49:40'),
(90, 15, 25, 'Approved', '2013-07-06', 146, '2013-07-06 00:00:00', 4, '2013-07-06 15:46:36'),
(91, 24, 26, 'Approved', '2013-07-06', 148, '2013-07-06 00:00:00', 1, '2013-07-06 16:16:29'),
(92, 22, 26, 'Approved', '2013-07-06', 150, '2013-07-06 00:00:00', 2, '2013-07-06 16:15:44'),
(93, 13, 26, 'Approved', '2013-07-06', 152, '2013-07-06 00:00:00', 3, '2013-07-06 16:33:04'),
(94, 12, 26, 'Approved', '2013-07-06', 154, '2013-07-06 00:00:00', 4, '2013-07-06 16:34:24'),
(95, 13, 27, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 1, '2013-07-06 16:18:59'),
(96, 12, 27, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 2, '2013-07-06 16:19:00'),
(97, 11, 27, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 3, '2013-07-06 16:19:00'),
(98, 10, 27, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 4, '2013-07-06 16:19:00'),
(99, 13, 28, 'Approved', '2013-07-06', 156, '2013-07-06 00:00:00', 1, '2013-07-06 17:33:58'),
(100, 12, 28, 'Approved', '2013-07-06', 158, '2013-07-06 00:00:00', 2, '2013-07-06 17:35:36'),
(101, 11, 28, 'Approved', '2013-07-06', 160, '2013-07-06 00:00:00', 3, '2013-07-06 17:56:25'),
(102, 10, 28, 'Approved', '2013-07-07', 162, '2013-07-06 00:00:00', 4, '2013-07-07 10:57:42'),
(103, 25, 29, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 1, '2013-07-06 18:46:07'),
(104, 23, 29, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 2, '2013-07-06 18:46:08'),
(105, 19, 29, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 3, '2013-07-06 18:46:08'),
(106, 18, 29, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 4, '2013-07-06 18:46:08'),
(107, 25, 30, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 1, '2013-07-06 18:48:24'),
(108, 23, 30, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 2, '2013-07-06 18:48:24'),
(109, 19, 30, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 3, '2013-07-06 18:48:24'),
(110, 18, 30, 'Pending', '0000-00-00', 0, '2013-07-06 00:00:00', 4, '2013-07-06 18:48:24'),
(111, 16, 31, 'Pending', '0000-00-00', 0, '2013-07-09 00:00:00', 1, '2013-07-09 11:23:47'),
(112, 14, 31, 'Pending', '0000-00-00', 0, '2013-07-09 00:00:00', 2, '2013-07-09 11:23:47'),
(113, 13, 31, 'Pending', '0000-00-00', 0, '2013-07-09 00:00:00', 3, '2013-07-09 11:23:47'),
(114, 12, 31, 'Pending', '0000-00-00', 0, '2013-07-09 00:00:00', 4, '2013-07-09 11:23:47'),
(115, 6, 32, 'Approved', '2013-07-09', 166, '2013-07-09 00:00:00', 1, '2013-07-09 12:21:33'),
(116, 5, 32, 'Approved', '2013-07-09', 168, '2013-07-09 00:00:00', 2, '2013-07-09 12:20:42'),
(117, 4, 32, 'Approved', '2013-07-09', 170, '2013-07-09 00:00:00', 3, '2013-07-09 12:22:24'),
(118, 3, 32, 'Approved', '2013-07-09', 164, '2013-07-09 00:00:00', 4, '2013-07-09 12:19:31');

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
  `mobile_number` varchar(255) NOT NULL,
  `email_Id` varchar(255) NOT NULL,
  `is_active` tinyint(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `IFSC` varchar(255) NOT NULL,
  `bank_location` varchar(255) NOT NULL,
  `points_available` int(11) NOT NULL,
  `system_points` tinyint(4) NOT NULL DEFAULT '0',
  `Joining_Date` date NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `sponsor_id`, `name`, `username`, `password`, `mobile_number`, `email_Id`, `is_active`, `bank_name`, `account_number`, `IFSC`, `bank_location`, `points_available`, `system_points`, `Joining_Date`, `city`, `state`) VALUES
(1, NULL, 'root 1', '', '12344', '123456', 'bharat@gmail.com', 1, 'Bank Name 1', 'account Number 1', 'IFSC 1', 'bank location 1', 0, 0, '2013-07-04', '', ''),
(2, 1, 'root 2', '', '12344', '123456', 'rajesh56@gmail.com', 1, 'Bank Name 2', 'account Number 2', 'IFSC 2', 'bank location 2', 0, 0, '2013-07-04', '', ''),
(3, 2, 'root 3', '', '12344', '123456', 'sheleshshah43@gmail.com', 1, 'Bank Name 3', 'account Number 3', 'IFSC 3', 'bank location 3', 0, 0, '2013-07-04', '', ''),
(4, 3, 'root 4', '', '12344', '123456', 'ganesh900@gmail.com', 1, 'Bank Name 4', 'account Number 4', 'IFSC 4', 'bank location 4', 0, 0, '2013-07-04', '', ''),
(5, 4, 'root 5', '', '12344', '123456', 'ganesh909@gmail.com', 1, 'Bank Name 5', 'account Number 5', 'IFSC 5', 'bank location 5', 0, 0, '2013-07-04', '', ''),
(6, 5, 'alok', '', '123123', '9287689098', 'ankit90@gmail.com', 1, 'Yes Bank', '6578686', '11111', 'udaipur', 6000, 1, '2013-07-04', 'udaipur', 'Rajasthan'),
(7, 5, 'alok', '', '123123', '9978767890', 'bhupesh@gmail.com', 1, 'Yes Bank', '6578686', '11111', 'udaipur', 0, 0, '2013-07-04', 'Udaipur', 'Rajasthan'),
(8, 7, 'BHARAT VYAS', '', '123123', '0000000000', 'bharat1970@gmail.com', 1, 'icici', '73843094587', 'icic8757', 'dadar', 0, 0, '2013-07-04', 'mumbai', 'maharastra'),
(9, 8, 'sunil waghela', '', '123123', '9351415335', 'himanshu75@gmail.com', 1, 'idbi', '0091104000164382', 'ibkl0000091', 'rajasthan', 3000, 0, '2013-07-04', 'surat', 'guj'),
(10, 9, 'Sangeeta Avasthi', '', '123123', '8859144144', 'avasthisangeeta2@gmail.com', 1, 'axis', '913010019725039', 'UTIB0000584', 'haldwani', 0, 0, '2013-07-04', 'haldwani', 'utrakhand'),
(11, 10, 'P. I. Kansara', '', '123123', '9045036664', 'pikansara@gmail.com', 1, 'state bank of india', '30383786832', 'SBIN0005318', 'Station Road Bhayander west', 0, 0, '2013-07-04', 'mumbai', 'maharstra'),
(12, 11, 'AVSHESH RAWAL', '', 'builtup77773333', '7737500924', 'arawal007@gmail.com', 1, 'SBI', '30776272286', 'SBIN0007889', 'CITY BRANCH', 0, 1, '2013-07-04', 'UDAIPUR', 'RAJASTHAN'),
(13, 12, 'NIDHI RAWAL', '', 'builtup77773333', '9214355469', 'alokrawal2525@gmail.com', 1, 'AXIS', '911010007052767', 'UTIB0000097', 'MAIN BRANCH', 0, 1, '2013-07-04', 'UDAIPUR', 'RAJASTHAN'),
(14, 13, 'RAJEEV KUMAR RATHI', '', 'rathiabcd', '9719257257', 'rajeevrathi6@gmail.com', 1, 'SBI', '20149323445', 'SBIN0012849', 'BHUPATWALA', 6000, 1, '2013-07-04', 'HARIDWAR', 'UTTARAKHAND'),
(15, 13, 'BHARAT KUMAR DAS', '', 'dass1111', '9758223444', 'bharatdas28@gmail.com', 1, 'ICICI', '192401501106', 'ICIC0001924', 'HALDWANI', 3000, 0, '2013-07-05', 'HALDWANI', 'UTTARAKHAND'),
(16, 14, 'VED SINGH', '', 'rathiabcd', '7500008086', 'rathirajeev007@gmail.com', 1, 'SBI', '20149323445', 'SBIN0012849', 'HARIDWAR', 9000, 1, '2013-07-05', 'HARIDWAR', 'UTTARAKHAND'),
(17, 16, 'RAMESH CHANDRA SINGH BISHT', '', 'R150769', '9720167668', 'rcsbisht69@gmail.com', 1, 'SBI', '31753519938', 'SBIN0001827', 'RISHIKESH', 12000, 1, '2013-07-05', 'RISHIKESH', 'UTTARAKHAND'),
(18, 15, 'Heena Das', '', 'dass1111', '9359411122', 'dasheena02@gmail.com', 1, 'ICICI Bank', '192401501105', 'ICIC0001924', 'Haldwani', 3000, 0, '2013-07-05', 'Haldwani', 'Uttrakhand'),
(19, 18, 'Harjeet Singh', '', 'hs123', '7409474332', 'harjeetsingh407@gmail.com', 1, 'IDBI Bank', '325104000020396', 'IBKL0000325', 'Haldwani', 9000, 1, '2013-07-05', 'Dehradun', 'Uttrakhand'),
(20, 7, 'rakesh', '', '123123', '0000000000', 'r@gmail.com', 1, 'sbi', '46765434578', 'sbin009878', 'gan', 0, 0, '2013-07-06', 'mumbai', 'mh'),
(21, 7, 'asha', '', '123123', '000000000', 'asha@gmail.com', 1, 'd', '1', '2', 'e', 0, 0, '2013-07-06', 'd', 'w'),
(22, 13, 'MURLI DHAR SAHU', '', '1234567890', '8560083298', 'murli.sahu.udaipur@gmail.com', 1, 'AXIS BANK', '913010020901000', 'UTIB0000097', 'MAIN BRANCH', 6000, 1, '2013-07-06', 'UDAIPUR', 'RAJASTHAN'),
(23, 19, 'Harjeet Singh', '', 'hs123', '9219666001', 'harjeet.nagpal@yahoo.com', 1, 'IDBI Bank', '325104000020396', 'IBKL0000325', 'Haldwani', 9000, 1, '2013-07-06', 'Dehradun', 'Uttrakhand'),
(24, 22, 'Murlidhar sahu', '', '1234567890', '8560083298', 'dsahu2255@gmail.com', 1, 'axis bank', '913010020901000', 'utib0000097', 'udaipur', 12000, 1, '2013-07-06', 'udaipur', 'raj'),
(25, 23, 'Harjeet Singh', '', 'hs123', '7409331318', 'write2harjeet@yahoo.in', 1, 'IDBI Bank', '325104000020396', 'IBKL0000325', 'Haldwani', 6000, 1, '2013-07-06', 'Dehradun', 'Uttrakhand'),
(26, 24, 'prabhulal sahu', '', '1234567890', '9828450365', 'plsahu.888@gmail.com', 1, 'p.n.b', '3566000100096655', 'punb0356600', 'udaipur', 12000, 1, '2013-07-06', 'udaipur', 'raj'),
(27, 13, 'PRAVIN DESHMUKH', '', 'abcd1234', '9713245550', 'pravindeshmukh303@gmail.com', 1, 'SBI', '31084854749', 'SBIN0000389', 'MAIN BRANCH', 0, 0, '2013-07-06', 'ITARSI', 'U.P.'),
(28, 13, 'SANDEEP YADAV', '', '58673700', '8382092968', 'sandeepwmm@gmail.com', 1, 'PUNJAB NATIONAL BANK', '4747001500124225', 'PUNB0474700', 'FAZIL NAGAR ', 12000, 1, '2013-07-06', 'LUCKHNOW', 'U.P.'),
(29, 25, 'Ashmeet Kaur', '', 'hs123', '8954001313', 'team_haldwani@yahoo.com', 1, 'Dena Bank', '117110013567', 'BKDN0721171', 'Dehradun', 0, 0, '2013-07-06', 'Dehradun', 'Uttarakhand'),
(30, 25, 'Ashmeet Kaur', '', 'hs123', '7409050001', 's.harjeet47@yahoo.com', 1, 'Dena Bank', '117110013567', 'BKDN0721171', 'Dehradun', 0, 0, '2013-07-06', 'Dehradun', 'Uttarakhand'),
(31, 16, 'Raj Kumar', '', 'rajk', '9910177970', 'mail2raj1985@gmail.com', 1, 'ICICI BANK', '003101544616', 'ICIC0000031', 'Sec- 18 , Noida', 0, 0, '2013-07-09', 'Mahender Garh', 'Haryana'),
(32, 6, 'ramlal', '', '123123', '0000000000', 'rambuiltup@gmail.com', 1, 'buuh', '8979987', 'gh', 'nbghjgh', 9000, 0, '2013-07-09', 'gan', 'guj');

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
  `points_required` int(11) NOT NULL,
  `last_update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pin_purchase_request`
--

INSERT INTO `pin_purchase_request` (`id`, `request_from_id`, `currently_requested_to_id`, `request_at`, `status`, `bank_slip_id`, `transfer_time`, `points_required`, `last_update_date`) VALUES
(1, 6, 1, '2013-07-04', 'Pending', 0, 0, 1, '2013-07-04 16:29:50'),
(2, 7, 2, '2013-07-06', 'Approved', 104, 1, 1, '2013-07-06 01:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `points_transfer`
--

CREATE TABLE IF NOT EXISTS `points_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `no_of_points` int(11) NOT NULL,
  `transfered_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `points_transfer`
--

INSERT INTO `points_transfer` (`id`, `from_id`, `to_id`, `no_of_points`, `transfered_on`) VALUES
(5, 32, 6, 1, '2013-07-09 12:25:08');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
