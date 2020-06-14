-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 12, 2020 at 12:35 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `httest_live_stream`
--
CREATE DATABASE IF NOT EXISTS `httest_live_stream` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `httest_live_stream`;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `evt_id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `evt_name` varchar(100) NOT NULL,
  `evt_date` date NOT NULL,
  `evt_time` time NOT NULL,
  `evt_genre` varchar(50) NOT NULL,
  `evt_img_link` varchar(100) NOT NULL,
  `evt_desc` text NOT NULL,
  `evt_deleted` int(2) NOT NULL,
  PRIMARY KEY (`evt_id`),
  KEY `fk_key_userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`evt_id`, `userid`, `evt_name`, `evt_date`, `evt_time`, `evt_genre`, `evt_img_link`, `evt_desc`, `evt_deleted`) VALUES
(1, 15, 'testing event', '2020-06-12', '12:39:00', '', '../event_covers/img_01.jpg', 'sample description', 0),
(2, 15, 'testing event 2', '2020-06-15', '12:37:00', 'jazz', '../event_covers/img_01.jpg', 'testing description 2', 0),
(3, 15, 'upload test event', '2020-06-14', '21:01:00', 'pop', '../event_covers/img_01.jpg', 'sample upload test', 0),
(4, 15, 'upload test event 2', '2020-06-13', '21:05:00', 'classical', '../event_covers/img_01.jpg', 'sample upload test 2', 0),
(5, 14, 'event one', '2020-06-16', '20:02:00', 'rock', '../event_covers/img_01.jpg', 'desc one', 0),
(6, 14, 'event two', '2020-06-02', '20:03:00', 'pop', '../event_covers/img_02.png', 'desc two', 0),
(7, 14, 'event three', '2020-06-03', '20:03:00', 'blues', '../event_covers/img_03.jpg', 'desc three', 0),
(8, 14, 'event four', '2020-06-04', '20:04:00', 'jazz', '../event_covers/img_01.jpg', 'desc four', 0),
(9, 14, 'event five', '2020-06-07', '20:05:00', 'classical', '../event_covers/img_01.jpg', 'desc five', 0),
(10, 14, 'event six', '2020-06-10', '20:06:00', 'rock', '../event_covers/img_01.jpg', 'desc six', 0),
(11, 14, 'event seven', '2020-06-10', '20:07:00', 'pop', '../event_covers/img_01.jpg', 'desc seven', 0),
(12, 14, 'event eight', '2020-06-12', '20:08:00', 'pop', '../event_covers/img_01.jpg', 'desc eight', 0),
(13, 14, 'event nine', '2020-06-11', '20:09:00', 'jazz', '../event_covers/img_03.jpg', 'desc nine', 0);

-- --------------------------------------------------------

--
-- Table structure for table `events_list`
--

DROP TABLE IF EXISTS `events_list`;
CREATE TABLE IF NOT EXISTS `events_list` (
  `eventlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `evt_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `deleted` int(5) NOT NULL,
  PRIMARY KEY (`eventlist_id`),
  KEY `FK_userid` (`userid`),
  KEY `FK_eventid` (`evt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events_list`
--

INSERT INTO `events_list` (`eventlist_id`, `userid`, `evt_id`, `date`, `deleted`) VALUES
(1, 15, 5, '2020-06-06 00:00:00', 0),
(2, 15, 6, '2020-06-06 00:00:00', 0),
(3, 15, 7, '2020-06-06 00:00:00', 0),
(4, 15, 10, '2020-06-06 00:00:00', 0),
(5, 14, 9, '2020-06-07 00:00:00', 0),
(6, 14, 11, '2020-06-10 00:00:00', 0),
(7, 14, 13, '2020-06-09 00:00:00', 0),
(8, 14, 12, '2020-06-08 00:00:00', 0),
(9, 15, 10, '2020-06-10 00:00:00', 0),
(10, 15, 11, '2020-06-10 00:00:00', 0),
(11, 15, 12, '2020-06-10 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `live_stream_details`
--

DROP TABLE IF EXISTS `live_stream_details`;
CREATE TABLE IF NOT EXISTS `live_stream_details` (
  `stream_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ls_id` varchar(10) NOT NULL,
  `ls_name` varchar(50) NOT NULL,
  `primary_server` text NOT NULL,
  `stream_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `player_id` varchar(10) NOT NULL,
  `deleted` int(1) NOT NULL,
  PRIMARY KEY (`stream_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `live_stream_details`
--

INSERT INTO `live_stream_details` (`stream_id`, `user_id`, `ls_id`, `ls_name`, `primary_server`, `stream_name`, `username`, `password`, `player_id`, `deleted`) VALUES
(1, 1, '1', '1', '1', '1', '1', '1', '1', 1),
(2, 17, 'b5sjg6hx', '04-06-2020', '', '', '', '', 'tpvzzbpb', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_comment_id` int(11) NOT NULL,
  `evt_id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `comment_sender_name` varchar(40) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`comment_id`, `parent_comment_id`, `evt_id`, `userid`, `comment`, `comment_sender_name`, `date`) VALUES
(1, 0, 5, 14, 'hi', 'saish', '2020-06-07 21:01:37'),
(2, 0, 5, 14, 'hello', 'Saish', '2020-06-07 21:13:24'),
(3, 0, 5, 14, 'hey', 'Saish', '2020-06-07 21:13:32'),
(4, 0, 5, 14, 'ha', 'Saish', '2020-06-07 21:13:34'),
(5, 0, 5, 14, 'ie', 'Saish', '2020-06-07 21:13:36'),
(6, 0, 5, 14, 'id', 'Saish', '2020-06-07 21:13:37'),
(7, 0, 5, 14, 'iw', 'Saish', '2020-06-07 21:13:37'),
(8, 0, 5, 14, 'ie', 'Saish', '2020-06-07 21:13:38'),
(9, 0, 5, 14, 'akjdbakjsbdkasj', 'Saish', '2020-06-07 21:13:40'),
(10, 0, 5, 14, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th', 'Saish', '2020-06-07 21:14:07'),
(11, 0, 4, 14, 'asd', 'Saish', '2020-06-07 21:23:09'),
(12, 0, 4, 14, 'qwe', 'Saish', '2020-06-07 21:23:17'),
(13, 0, 5, 14, 'you', 'Saish', '2020-06-08 05:22:13'),
(14, 0, 4, 15, 'hello', 'saish', '2020-06-08 05:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `thumbs`
--

DROP TABLE IF EXISTS `thumbs`;
CREATE TABLE IF NOT EXISTS `thumbs` (
  `likes_id` int(11) NOT NULL AUTO_INCREMENT,
  `evt_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `thumbs` tinyint(1) NOT NULL,
  PRIMARY KEY (`likes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thumbs`
--

INSERT INTO `thumbs` (`likes_id`, `evt_id`, `userid`, `thumbs`) VALUES
(1, 4, 15, 1),
(2, 4, 15, 1),
(3, 4, 15, 1),
(4, 4, 15, 1),
(5, 4, 15, 1),
(6, 4, 15, 1),
(7, 4, 15, 1),
(8, 4, 15, 1),
(9, 4, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `usertype` char(2) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `approval` char(2) NOT NULL,
  `hashcode` varchar(50) NOT NULL,
  `notification_flag` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `firstname`, `lastname`, `username`, `email`, `password`, `usertype`, `phone`, `address`, `approval`, `hashcode`, `notification_flag`) VALUES
(1, 'test first', 'test last', 'testing', 'test@testing.com', 'e19d5cd5af0378da05f63f891c7467af', 'A', '9876543210', 'test address near testing company', '0', '', 1),
(2, 'first user', 'last user', 'user123', 'user@test.com', 'e19d5cd5af0378da05f63f891c7467af', 'U', NULL, NULL, '0', '', 1),
(3, 'kunal', 'kerkar', 'kk', 'kkk@helixtech.co', '905f2c88a21d367a8fc2bb536bc57d1e', 'U', NULL, NULL, '0', '', 1),
(4, 'Niranjan', 'Naik', '', 'niranjan.n@helixtech.co', 'e10adc3949ba59abbe56e057f20f883e', 'U', NULL, NULL, '0', '', 1),
(5, 'Niranjan', 'Naik', '', 'niranjan.n@helixtech.co', 'e10adc3949ba59abbe56e057f20f883e', 'U', NULL, NULL, '0', '', 1),
(6, 'test first 1', 'test last 1', '', 'test@testing.com', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec619473716a', 1),
(7, 'test first 2', 'test last 2', '', 'test@testing.com', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec6561f40cb6', 1),
(8, 'saish', 'shinde', NULL, 'saish.s@helixtech', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec753b5e14cc', 1),
(9, 'saish', 'shinde', NULL, 'saish.s@helix', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec754dc142a0', 1),
(10, 'saish', 'shinde', NULL, 'saish@helixtech.co', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec755030a26b', 1),
(11, 'saish', 'shinde', NULL, 'saish.s@helix.co', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec7567bd0943', 1),
(12, 'saish', 'shinde', NULL, 'saish.s@tech.co', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec757f40a363', 1),
(13, 'saish', 'shinde', NULL, 'sais@helixtech.co', 'e19d5cd5af0378da05f63f891c7467af', 'L', NULL, NULL, '0', '5ec759ccb7d29', 1),
(14, 'Saish', 'Shinde', NULL, 'saishs@helixtech.co', 'a99442d2a736365f5fe637e299b0e339', 'L', NULL, NULL, '1', '5ec75a2963371', 0),
(15, 'saish', 'shinde', NULL, 'saish.s@helixtech.co', 'e19d5cd5af0378da05f63f891c7467af', 'U', NULL, NULL, '1', '5ec7937a21a6f', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
