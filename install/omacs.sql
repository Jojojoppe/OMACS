-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2019 at 04:54 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL,
  `viewed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`id`, `user`, `page`, `timestamp`, `ip`, `viewed`) VALUES
(1, 11, '70', '2019-01-12 14:05:39', '192.168.178.1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `crons`
--

CREATE TABLE `crons` (
  `id` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `sort` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crons`
--

INSERT INTO `crons` (`id`, `active`, `sort`, `name`, `file`, `createdby`, `created`, `modified`) VALUES
(1, 0, 100, 'Auto-Backup', 'backup.php', 1, '2017-09-16 07:49:22', '2017-11-11 20:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `crons_logs`
--

CREATE TABLE `crons_logs` (
  `id` int(11) NOT NULL,
  `cron_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `website_name` varchar(100) NOT NULL,
  `smtp_server` varchar(100) NOT NULL,
  `smtp_port` int(10) NOT NULL,
  `email_login` varchar(150) NOT NULL,
  `email_pass` varchar(100) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `verify_url` varchar(255) NOT NULL,
  `email_act` int(1) NOT NULL,
  `debug_level` int(1) NOT NULL DEFAULT '0',
  `isSMTP` int(1) NOT NULL DEFAULT '0',
  `isHTML` varchar(5) NOT NULL DEFAULT 'true',
  `useSMTPauth` varchar(6) NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `website_name`, `smtp_server`, `smtp_port`, `email_login`, `email_pass`, `from_name`, `from_email`, `transport`, `verify_url`, `email_act`, `debug_level`, `isSMTP`, `isHTML`, `useSMTPauth`) VALUES
(1, 'OMACS', 'example.com', 25, 'test', 'test', 'OMACS', 'OMACS@example.com', 'tls', 'http://example.com', 0, 0, 1, 'true', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `groups_menus`
--

CREATE TABLE `groups_menus` (
  `id` int(11) NOT NULL,
  `group_id` int(15) NOT NULL,
  `menu_id` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_menus`
--

INSERT INTO `groups_menus` (`id`, `group_id`, `menu_id`) VALUES
(30, 2, 9),
(29, 0, 8),
(28, 0, 7),
(27, 0, 21),
(5, 0, 3),
(6, 0, 1),
(7, 0, 2),
(8, 0, 51),
(9, 0, 52),
(10, 0, 37),
(11, 0, 38),
(12, 2, 39),
(13, 2, 40),
(14, 2, 41),
(15, 2, 42),
(16, 2, 43),
(17, 2, 44),
(18, 2, 45),
(19, 0, 46),
(20, 0, 47),
(21, 0, 49),
(26, 0, 20),
(25, 0, 18),
(31, 2, 10),
(32, 2, 11),
(33, 2, 12),
(34, 2, 13),
(35, 2, 14),
(36, 2, 15),
(37, 0, 16);

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `stripe_ts` varchar(255) NOT NULL,
  `stripe_tp` varchar(255) NOT NULL,
  `stripe_ls` varchar(255) NOT NULL,
  `stripe_lp` varchar(255) NOT NULL,
  `recap_pub` varchar(100) NOT NULL,
  `recap_pri` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(3) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logtype` varchar(25) NOT NULL,
  `lognote` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `logdate`, `logtype`, `lognote`) VALUES
(79, 1, '2018-04-26 00:51:08', 'System Updates', 'Reformatted existing vericodes'),
(80, 1, '2018-04-26 00:51:08', 'System Updates', 'Update 3GJYaKcqUtw7 successfully deployed.'),
(81, 1, '2018-04-26 00:51:08', 'System Updates', 'Updated old Blacklisted logs to IP Logging type.'),
(82, 1, '2018-04-26 00:51:08', 'System Updates', 'Added cloaking to users.'),
(83, 1, '2018-04-26 00:51:08', 'System Updates', 'Update 2XQjsKYJAfn1 successfully deployed.'),
(84, 1, '2018-04-26 00:51:08', 'System Updates', 'Updated force_notif to 0 if you had not set it already.'),
(85, 1, '2018-04-26 00:51:08', 'System Updates', 'Update 549DLFeHMNw7 successfully deployed.'),
(86, 1, '2018-04-26 00:51:08', 'System Updates', 'Added registration to settings.'),
(87, 1, '2018-04-26 00:51:08', 'System Updates', 'Update 4Dgt2XVjgz2x successfully deployed.'),
(88, 1, '2018-04-26 00:51:08', 'System Updates', 'Added Vericode Expiry to Users Table.'),
(89, 1, '2018-04-26 00:51:08', 'System Updates', 'Reformatted exiting page titles only if they weren\'t modified.'),
(90, 1, '2018-04-26 00:51:08', 'System Updates', 'Update VLBp32gTWvEo successfully deployed.'),
(91, 1, '2018-04-26 00:51:08', 'System Updates', 'Update Q3KlhjdtxE5X successfully deployed.'),
(92, 1, '2018-04-26 00:51:08', 'System Updates', 'Added join_vericode_expiry and reset_vericode_expiry to settings table.'),
(93, 1, '2018-04-26 00:51:08', 'System Updates', 'Update ug5D3pVrNvfS successfully deployed.'),
(94, 1, '2018-04-26 00:51:09', 'System Updates', 'Added pin to users, admin_verify and admin_verify_timeout to settings'),
(95, 1, '2018-04-26 00:51:09', 'System Updates', 'Added admin_pin page to pages table'),
(96, 1, '2018-04-26 00:51:09', 'System Updates', 'Update 69FbVbv4Jtrz successfully deployed.'),
(97, 1, '2018-04-26 00:51:09', 'System Updates', 'Added twoDate to users'),
(98, 1, '2018-04-26 00:51:09', 'System Updates', 'Update 4A6BdJHyvP4a successfully deployed.'),
(99, 1, '2018-04-26 00:51:09', 'System Updates', 'Update 37wvsb5BzymK successfully deployed.'),
(100, 1, '2018-04-26 00:51:09', 'System Updates', 'Alert only: Failure dropping fingerprint_assets Error: ERROR #42S02: Unknown table \'4322.fingerprint_assets\''),
(101, 1, '2018-04-26 00:51:09', 'System Updates', 'Alert only: Failure dropping Fingerprint_Assets Error: ERROR #42S02: Unknown table \'4322.fingerprint_assets\''),
(102, 1, '2018-04-26 00:51:09', 'System Updates', 'Alert only: Failure dropping fingerprints Error: ERROR #42S02: Unknown table \'4322.fingerprints\''),
(103, 1, '2018-04-26 00:51:09', 'System Updates', 'Alert only: Failure dropping Fingerprints Error: ERROR #42S02: Unknown table \'4322.fingerprints\''),
(104, 1, '2018-04-26 00:51:09', 'System Updates', 'Alert only: Failure dropping us_fingerprints Error: ERROR #42S02: Unknown table \'4322.us_fingerprints\''),
(105, 1, '2018-04-26 00:51:09', 'System Updates', 'Created table us_fingerprints'),
(106, 1, '2018-04-26 00:51:09', 'System Updates', 'Set kFingerprintID to Auto Increment'),
(107, 1, '2018-04-26 00:51:09', 'System Updates', 'Created table us_fingerprint_assets'),
(108, 1, '2018-04-26 00:51:09', 'System Updates', 'Set kFingerprintAssetID to Auto Increment'),
(109, 1, '2018-04-26 00:51:09', 'System Updates', 'Update c7tZQf926zKq successfully deployed.'),
(110, 1, '2018-04-26 00:51:09', 'System Updates', 'Allowed password to be NULL'),
(111, 1, '2018-04-26 00:51:09', 'System Updates', 'Update ockrg4eU33GP successfully deployed.'),
(112, 1, '2018-04-26 00:51:09', 'System Updates', 'Created table us_user_sessions'),
(113, 1, '2018-04-26 00:51:09', 'System Updates', 'Added session_manager to settings table.'),
(114, 1, '2018-04-26 00:51:09', 'System Updates', 'Updated session_manager to enabled.'),
(115, 1, '2018-04-26 00:51:09', 'System Updates', 'Added users/manage_sessions.php to pages table.'),
(116, 1, '2018-04-26 00:51:09', 'System Updates', 'Added permissions to users/manage_sessions.php.'),
(117, 1, '2018-04-26 00:51:09', 'System Updates', 'Added users/admin_manage_sessions.php to pages table.'),
(118, 1, '2018-04-26 00:51:09', 'System Updates', 'Added permissions to users/admin_manage_sessions.php.'),
(119, 1, '2018-04-26 00:51:09', 'System Updates', 'Update XX4zArPs4tor successfully deployed.'),
(120, 1, '2018-05-24 13:01:16', 'System Upates', 'Sanitized 0 Bios'),
(121, 1, '2018-05-24 13:01:16', 'System Updates', 'Update mS5VtQCZjyJs successfully deployed.'),
(122, 1, '2018-05-24 13:01:49', 'User Manager', 'Updated email for The from userspicephp@gmail.com to joppeblondel@gmail.com.'),
(123, 1, '2018-05-24 13:02:03', 'User Manager', 'Updated password for The.'),
(124, 1, '2018-05-24 13:02:46', 'Setting Change', 'Changed messaging from 1 to 0.'),
(125, 1, '2018-05-24 13:02:47', 'Setting Change', 'Changed site_name from UserSpice to OCAMS.'),
(126, 1, '2018-05-24 13:02:47', 'Setting Change', 'Changed copyright from UserSpice to Joppe Blondel.'),
(127, 1, '2018-05-24 13:03:08', 'Setting Change', 'Changed registration from 1 to 0.'),
(128, 1, '2018-05-24 13:03:08', 'Setting Change', 'Changed join_vericode_expiry from 24 to 48.'),
(129, 1, '2018-05-24 13:03:08', 'Setting Change', 'Changed reset_vericode_expiry from 15 to 30.'),
(130, 1, '2018-05-24 13:03:56', 'Email Settings', 'Updated email_login.'),
(131, 1, '2018-05-24 13:03:56', 'Email Settings', 'Updated email_pass.'),
(132, 1, '2018-05-24 13:03:57', 'Email Settings', 'Updated from_name from User Spice to OCAMS.'),
(133, 1, '2018-05-24 13:03:57', 'Email Settings', 'Updated from_email from yourEmail@gmail.com to OCAMS@example.com.'),
(134, 1, '2018-05-24 13:03:57', 'Email Settings', 'Updated verify_url from http://localhost/43 to https://joppeb.nl/TEST/.'),
(135, 1, '2018-05-24 13:03:57', 'Email Settings', 'Updated isSMTP from 0 to 1.'),
(136, 1, '2018-05-24 13:08:25', 'User', 'User logged in.'),
(137, 1, '2018-05-24 13:09:16', 'Pages Manager', 'Changed private from public to private for Page #1.'),
(138, 1, '2018-05-24 13:09:31', 'Pages Manager', 'Changed re_auth from No to Yes for Page #1.'),
(139, 1, '2018-05-24 13:10:17', 'User', 'User logged in.'),
(140, 1, '2018-05-24 13:12:18', 'User', 'User logged in.'),
(141, 1, '2018-05-24 13:12:41', 'Pages Manager', 'Changed re_auth from Yes to No for Page #1.'),
(142, 1, '2018-05-24 13:14:19', 'User', 'User logged in.'),
(143, 1, '2018-05-24 13:14:46', 'Pages Manager', 'Changed private from private to public for Page #1 and stripped re_auth.'),
(144, 1, '2018-05-24 13:36:21', 'User', 'User logged in.'),
(145, 1, '2018-05-24 13:36:48', 'User', 'User logged in.'),
(146, 1, '2018-05-24 13:42:57', 'User', 'User logged in.'),
(147, 1, '2018-05-24 13:43:59', 'User', 'User logged in.'),
(148, 1, '2018-05-24 13:50:14', 'User', 'User logged in.'),
(149, 1, '2018-05-24 13:50:47', 'User', 'User logged in.'),
(150, 1, '2018-05-24 13:51:11', 'User', 'User logged in.'),
(151, 1, '2018-05-24 13:52:14', 'User', 'User logged in.'),
(152, 1, '2018-05-24 13:53:09', 'User', 'User logged in.'),
(153, 1, '2018-05-24 13:53:48', 'User', 'User logged in.'),
(154, 1, '2018-05-24 14:01:31', 'User', 'User logged in.'),
(155, 1, '2018-05-24 14:02:43', 'User', 'User logged in.'),
(156, 1, '2018-05-24 14:04:32', 'User', 'User logged in.'),
(157, 1, '2018-05-24 14:05:28', 'User', 'User logged in.'),
(158, 1, '2018-05-24 14:08:39', 'User Manager', 'Deleted user named Sample.'),
(159, 1, '2018-05-24 14:08:53', 'User', 'User logged in.'),
(160, 1, '2018-05-24 14:16:40', 'Setting Change', 'Changed force_pr from 0 to 1.'),
(161, 11, '2018-05-24 14:17:10', 'User', 'User logged in.'),
(162, 11, '2018-05-24 14:17:14', 'User Manager', 'Added user joppe.'),
(163, 1, '2018-05-24 14:17:58', 'User', 'User logged in.'),
(164, 11, '2018-05-24 14:19:42', 'User', 'Requested password reset.'),
(165, 11, '2018-05-24 14:19:58', 'User', 'Reset password.'),
(166, 11, '2018-05-24 14:20:10', 'User', 'User logged in.'),
(167, 1, '2018-05-24 14:20:36', 'User', 'User logged in.'),
(168, 1, '2018-05-24 14:21:03', 'Permissions Manager', 'Added Permission Level named com_webcie.'),
(169, 1, '2018-05-24 14:22:24', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(170, 11, '2018-05-24 14:22:52', 'User', 'User logged in.'),
(171, 1, '2018-05-24 14:24:23', 'User', 'User logged in.'),
(172, 11, '2018-05-24 14:24:38', 'User', 'User logged in.'),
(173, 1, '2018-05-24 14:36:33', 'Setting Change', 'Changed us_css1 from ../users/css/color_schemes/bootstrap.min.css to ../users/css/color_schemes/dark.css.'),
(174, 1, '2018-05-24 14:36:56', 'Setting Change', 'Changed us_css2 from ../users/css/sb-admin.css to ../users/css/bootstrap.min.css.'),
(175, 1, '2018-05-24 14:36:56', 'Setting Change', 'Changed us_css3 from ../users/css/custom.css to ../users/css/bootstrap.min.css.'),
(176, 1, '2018-05-24 14:37:06', 'Setting Change', 'Changed us_css2 from ../users/css/bootstrap.min.css to ../users/css/cyborg.bootstrap.min.css.'),
(177, 1, '2018-05-24 14:37:19', 'Setting Change', 'Changed us_css3 from ../users/css/bootstrap.min.css to ../users/css/cyborg.bootstrap.min.css.'),
(178, 1, '2018-05-24 14:37:32', 'Setting Change', 'Changed us_css1 from ../users/css/color_schemes/dark.css to ../users/css/color_schemes/clean.css.'),
(179, 1, '2018-05-24 14:37:43', 'Setting Change', 'Changed us_css2 from ../users/css/cyborg.bootstrap.min.css to ../users/css/lavish.theme.min.css.'),
(180, 1, '2018-05-24 14:37:48', 'Setting Change', 'Changed us_css3 from ../users/css/cyborg.bootstrap.min.css to ../users/css/sb-admin.css.'),
(181, 1, '2018-05-24 14:38:06', 'Setting Change', 'Changed us_css1 from ../users/css/color_schemes/clean.css to ../users/css/color_schemes/bootstrap.min.css.'),
(182, 1, '2018-05-24 14:38:06', 'Setting Change', 'Changed us_css2 from ../users/css/lavish.theme.min.css to ../users/css/bootstrap.min.css.'),
(183, 1, '2018-05-24 14:38:06', 'Setting Change', 'Changed us_css3 from ../users/css/sb-admin.css to ../users/css/bootstrap.min.css.'),
(184, 1, '2018-05-24 14:38:14', 'Setting Change', 'Changed us_css1 from ../users/css/color_schemes/bootstrap.min.css to ../users/css/color_schemes/standard.css.'),
(185, 1, '2018-05-24 14:38:44', 'Setting Change', 'Changed us_css3 from ../users/css/bootstrap.min.css to ../users/css/custom.css.'),
(186, 1, '2018-05-24 14:38:59', 'Setting Change', 'Changed us_css2 from ../users/css/bootstrap.min.css to ../users/css/bootstrap.css.'),
(187, 1, '2018-05-24 14:40:06', 'Setting Change', 'Changed us_css2 from ../users/css/bootstrap.css to ../users/css/sb-admin.css.'),
(188, 1, '2018-05-24 14:40:16', 'Setting Change', 'Changed us_css1 from ../users/css/color_schemes/standard.css to ../users/css/color_schemes/bootstrap.min.css.'),
(189, 1, '2018-05-24 14:40:28', 'Setting Change', 'Changed us_css3 from ../users/css/custom.css to ../users/css/cyborg.bootstrap.min.css.'),
(190, 1, '2018-05-24 14:40:33', 'Setting Change', 'Changed us_css3 from ../users/css/cyborg.bootstrap.min.css to ../users/css/us-admin.css.'),
(191, 1, '2018-05-24 14:40:38', 'Setting Change', 'Changed us_css3 from ../users/css/us-admin.css to ../users/css/timepicker.css.'),
(192, 1, '2018-05-24 14:40:45', 'Setting Change', 'Changed us_css3 from ../users/css/timepicker.css to ../users/css/lavish.theme.min.css.'),
(193, 1, '2018-05-24 14:40:58', 'Setting Change', 'Changed us_css3 from ../users/css/lavish.theme.min.css to ../users/css/custom.css.'),
(194, 1, '2018-05-24 14:55:30', 'User', 'User logged in.'),
(195, 11, '2018-05-24 14:58:10', 'User', 'User logged in.'),
(196, 11, '2018-05-24 15:02:59', 'User', 'User logged in.'),
(197, 1, '2018-05-24 15:05:05', 'User', 'User logged in.'),
(198, 11, '2018-05-24 17:12:33', 'User', 'User logged in.'),
(199, 1, '2018-05-24 17:13:16', 'User', 'User logged in.'),
(200, 1, '2018-05-24 17:13:32', 'User', 'User logged in.'),
(201, 11, '2018-05-25 15:03:28', 'User', 'User logged in.'),
(202, 11, '2018-05-25 15:05:09', 'User', 'User logged in.'),
(203, 1, '2018-05-25 15:05:49', 'User', 'User logged in.'),
(204, 1, '2018-05-25 15:13:21', 'User', 'User logged in.'),
(205, 11, '2018-05-25 15:20:36', 'User', 'User logged in.'),
(206, 1, '2018-05-25 15:28:03', 'User', 'User logged in.'),
(207, 1, '2018-05-25 15:41:03', 'User', 'Changed fname from The to Joppe.'),
(208, 1, '2018-05-25 15:41:03', 'User', 'Changed lname from Admin to Blondel.'),
(209, 11, '2018-05-25 16:12:49', 'User', 'Requested password reset.'),
(210, 11, '2018-05-25 16:17:15', 'User', 'Requested password reset.'),
(211, 11, '2018-05-25 16:18:04', 'User', 'Reset password.'),
(212, 11, '2018-05-25 16:21:35', 'User', 'Requested password reset.'),
(213, 11, '2018-05-25 16:30:13', 'User', 'Requested password reset.'),
(214, 11, '2018-05-25 17:10:29', 'User', 'Requested password reset.'),
(215, 11, '2018-05-25 17:10:52', 'User', 'Reset password.'),
(216, 1, '2018-05-25 17:11:07', 'User', 'User logged in.'),
(217, 1, '2018-05-25 17:52:31', 'Permissions Manager', 'Deleted com_webcie.'),
(218, 1, '2018-05-25 17:52:53', 'Permissions Manager', 'Added Permission Level named omacs_editUsers.'),
(219, 1, '2018-05-25 17:53:50', 'Permission Manager', 'Added 1 users(s) to Permission #4.'),
(220, 1, '2018-05-25 18:08:10', 'User', 'User logged in.'),
(221, 11, '2018-05-25 18:08:52', 'User', 'User logged in.'),
(222, 1, '2018-05-25 18:09:31', 'User', 'User logged in.'),
(223, 12, '2018-05-25 18:12:05', 'User', 'User logged in.'),
(224, 12, '2018-05-25 18:12:09', 'User Manager', 'Added user test.'),
(225, 12, '2018-05-25 18:12:59', 'User', 'Requested password reset.'),
(226, 12, '2018-05-25 18:13:16', 'User', 'Reset password.'),
(227, 12, '2018-05-25 18:13:23', 'User', 'User logged in.'),
(228, 11, '2018-05-25 18:13:59', 'User', 'User logged in.'),
(229, 1, '2018-05-25 18:15:22', 'User', 'User logged in.'),
(230, 1, '2018-05-25 18:17:10', 'Permissions Manager', 'Added Permission Level named omacs_settings.'),
(231, 1, '2018-05-25 18:17:21', 'Permissions Manager', 'Added Permission Level named omacs_styleSettings.'),
(232, 1, '2018-05-25 18:19:25', 'User Manager', 'Added 2 permission(s) to Joppe Blondel.'),
(233, 12, '2018-05-25 18:49:19', 'User', 'User logged in.'),
(234, 1, '2018-05-25 18:56:32', 'User', 'User logged in.'),
(235, 1, '2018-05-25 19:00:28', 'User', 'User logged in.'),
(236, 11, '2018-05-25 19:03:58', 'User', 'User logged in.'),
(237, 1, '2018-05-25 19:05:00', 'User', 'User logged in.'),
(238, 11, '2018-05-25 19:05:24', 'User', 'User logged in.'),
(239, 1, '2018-05-25 19:05:34', 'User', 'User logged in.'),
(240, 1, '2018-05-25 19:06:40', 'Permission Manager', 'Added 1 users(s) to Permission #2.'),
(241, 11, '2018-05-25 19:06:48', 'User', 'User logged in.'),
(242, 11, '2018-05-25 19:15:48', 'User Manager', 'Deleted 1 permission(s) from Joppe Blondel.'),
(243, 12, '2018-05-25 19:16:55', 'User', 'User logged in.'),
(244, 1, '2018-05-25 19:17:40', 'User', 'User logged in.'),
(245, 12, '2018-05-25 19:45:00', 'User', 'User logged in.'),
(246, 11, '2018-05-25 20:15:17', 'User', 'User logged in.'),
(247, 1, '2018-05-25 20:15:52', 'User', 'User logged in.'),
(248, 11, '2018-05-25 20:19:26', 'User', 'User logged in.'),
(249, 11, '2018-05-25 20:27:18', 'User', 'User logged in.'),
(250, 1, '2018-05-26 08:58:01', 'User', 'User logged in.'),
(251, 13, '2018-05-26 09:22:53', 'User', 'User logged in.'),
(252, 13, '2018-05-26 09:22:59', 'User Manager', 'Added user joppeB.'),
(253, 1, '2018-05-26 09:23:41', 'User', 'User logged in.'),
(254, 1, '2018-05-26 09:28:39', 'User Manager', 'Deleted user named Joppe.'),
(255, 14, '2018-05-26 09:29:06', 'User', 'User logged in.'),
(256, 14, '2018-05-26 09:29:09', 'User Manager', 'Added user joppeb.'),
(257, 1, '2018-05-26 09:31:36', 'User', 'User logged in.'),
(258, 1, '2018-05-26 09:31:55', 'User Manager', 'Deleted user named Joppe.'),
(259, 15, '2018-05-26 09:33:18', 'User', 'User logged in.'),
(260, 15, '2018-05-26 09:33:19', 'User Manager', 'Added user joppeb.'),
(261, 1, '2018-05-26 09:34:13', 'User', 'User logged in.'),
(262, 1, '2018-05-26 09:35:38', 'Setting Change', 'Changed site_name from OCAMS to OMACS.'),
(263, 1, '2018-05-26 09:36:56', 'User Manager', 'Deleted user named Joppe.'),
(264, 16, '2018-05-26 09:37:27', 'User', 'User logged in.'),
(265, 16, '2018-05-26 09:37:29', 'User Manager', 'Added user joppeb.'),
(266, 1, '2018-05-26 09:40:42', 'User', 'User logged in.'),
(267, 1, '2018-05-26 09:41:09', 'User Manager', 'Deleted user named Joppe.'),
(268, 17, '2018-05-26 09:41:42', 'User', 'User logged in.'),
(269, 17, '2018-05-26 09:41:47', 'User Manager', 'Added user joppeb.'),
(270, 1, '2018-05-26 09:49:47', 'User', 'User logged in.'),
(271, 1, '2018-05-26 09:50:07', 'User Manager', 'Deleted user named Joppe.'),
(272, 1, '2018-05-26 09:50:47', 'User Manager', 'Added user joppeb.'),
(273, 1, '2018-05-26 09:52:21', 'User Manager', 'Deleted user named Joppe.'),
(274, 1, '2018-05-26 09:52:48', 'User Manager', 'Added user joppeb.'),
(275, 1, '2018-05-26 09:53:59', 'User', 'User logged in.'),
(276, 1, '2018-05-26 09:54:18', 'Setting Change', 'Changed force_pr from 1 to 0.'),
(277, 1, '2018-05-26 09:54:25', 'User Manager', 'Deleted user named Joppe.'),
(278, 1, '2018-05-26 09:57:16', 'User Manager', 'Added user joppeb.'),
(279, 20, '2018-05-26 09:57:45', 'User', 'User logged in.'),
(280, 1, '2018-05-26 09:58:25', 'User', 'User logged in.'),
(281, 1, '2018-05-26 09:58:37', 'Setting Change', 'Changed force_pr from 0 to 1.'),
(282, 1, '2018-05-26 09:58:50', 'User Manager', 'Deleted user named Joppe.'),
(283, 1, '2018-05-26 10:01:05', 'User Manager', 'Added user joppeb.'),
(284, 21, '2018-05-26 10:01:41', 'User', 'Requested password reset.'),
(285, 21, '2018-05-26 10:02:29', 'User', 'Reset password.'),
(286, 1, '2018-05-26 10:02:45', 'User', 'User logged in.'),
(287, 1, '2018-05-26 10:07:49', 'User', 'User logged in.'),
(288, 1, '2018-05-26 10:08:04', 'User Manager', 'Deleted user named Joppe.'),
(289, 1, '2018-05-26 10:09:06', 'User Manager', 'Added user joppeb.'),
(290, 1, '2018-05-26 10:09:40', 'User', 'User logged in.'),
(291, 1, '2018-05-26 10:10:18', 'User Manager', 'Deleted user named Joppe.'),
(292, 1, '2018-05-26 10:10:46', 'User Manager', 'Added user joppeb.'),
(293, 23, '2018-05-26 10:11:18', 'User', 'Reset password.'),
(294, 1, '2018-05-26 10:11:30', 'User', 'User logged in.'),
(295, 1, '2018-05-26 10:21:33', 'User Manager', 'Added 2 permission(s) to J Blondel.'),
(296, 1, '2018-05-26 10:23:01', 'User Manager', 'Updated first name for This from This to T.'),
(297, 1, '2018-05-26 10:23:01', 'User Manager', 'Updated last name for This from IsaTest to Est.'),
(298, 1, '2018-05-26 10:23:50', 'User Manager', 'Deleted user named T.'),
(299, 1, '2018-05-26 10:23:57', 'User Manager', 'Deleted user named J.'),
(300, 11, '2018-05-26 10:25:13', 'User', 'User logged in.'),
(301, 11, '2018-05-26 10:25:47', 'User Manager', 'Added user test.'),
(302, 11, '2018-05-26 10:28:54', 'User Manager', 'Added 2 permission(s) to Te St.'),
(303, 24, '2018-05-26 10:29:31', 'User', 'Requested password reset.'),
(304, 24, '2018-05-26 10:29:55', 'User', 'Reset password.'),
(305, 24, '2018-05-26 10:30:05', 'User', 'User logged in.'),
(306, 11, '2018-05-26 10:32:07', 'User Manager', 'Deleted 2 permission(s) from Te St.'),
(307, 11, '2018-05-26 11:14:00', 'User Manager', 'Updated force_pr for Te from 0 to 1.'),
(308, 11, '2018-05-26 11:15:05', 'User Manager', 'Updated force_pr for Te from 1 to 0.'),
(309, 11, '2018-05-26 11:15:21', 'User Manager', 'Sent password reset email to Te, Vericode expires in 30 minutes.'),
(310, 11, '2018-05-26 11:15:22', 'User Manager', 'Updated force_pr for Te from 0 to 1.'),
(311, 11, '2018-05-26 11:15:54', 'User Manager', 'Updated force_pr for Te from 1 to 0.'),
(312, 11, '2018-05-26 11:17:39', 'User Manager', 'Deleted user named Te.'),
(313, 11, '2018-05-26 11:19:38', 'User Manager', 'Added user test.'),
(314, 11, '2018-05-26 11:19:53', 'User Manager', 'Updated password for Te.'),
(315, 11, '2018-05-26 11:20:04', 'User Manager', 'Updated force_pr for Te from 1 to 0.'),
(316, 11, '2018-05-26 11:20:19', 'User Manager', 'Updated active for Te from 1 to 0.'),
(317, 25, '2018-05-26 11:20:43', 'User', 'User logged in.'),
(318, 11, '2018-05-26 11:20:54', 'User Manager', 'Updated active for Te from 1 to 1.'),
(319, 11, '2018-05-26 11:21:20', 'User Manager', 'Deleted user named Te.'),
(320, 11, '2018-05-26 11:21:48', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(321, 11, '2018-05-26 11:22:18', 'Email Settings', 'Updated from_name from OCAMS to OMACS.'),
(322, 11, '2018-05-26 11:22:18', 'Email Settings', 'Updated from_email from OCAMS@example.com to OMACS@example.com.'),
(323, 11, '2018-05-26 11:22:40', 'User Manager', 'Deleted 1 permission(s) from Joppe Blondel.'),
(324, 11, '2018-05-26 11:28:09', 'User', 'User logged in.'),
(325, 1, '2018-05-26 12:57:48', 'User', 'User logged in.'),
(326, 1, '2018-05-26 13:11:11', 'Permissions Manager', 'Added Permission Level named omacs_editPermissions.'),
(327, 1, '2018-05-26 13:47:19', 'Permissions Manager', 'Added Permission Level named test.'),
(328, 1, '2018-05-26 13:52:26', 'Permissions Manager', 'Deleted test.'),
(329, 11, '2018-05-26 13:56:30', 'User', 'User logged in.'),
(330, 11, '2018-05-26 13:56:50', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(331, 11, '2018-05-26 14:33:40', 'User', 'User logged in.'),
(332, 11, '2018-05-26 15:26:36', 'User', 'Changed lname from Blondel to Blondel2.'),
(333, 11, '2018-05-26 15:26:46', 'User', 'Changed lname from Blondel2 to Blondel.'),
(334, 11, '2018-05-26 15:43:56', 'User', 'User logged in.'),
(335, 11, '2018-05-26 15:45:20', 'User', 'User logged in.'),
(336, 11, '2018-05-26 15:50:21', 'User', 'User logged in.'),
(337, 11, '2018-05-26 16:10:39', 'User', 'Requested password reset.'),
(338, 11, '2018-05-26 16:12:26', 'User', 'Reset password.'),
(339, 11, '2018-05-26 16:13:28', 'User', 'User logged in.'),
(340, 11, '2018-05-26 17:38:50', 'Permission Manager', 'Deleted 1 users(s) from Permission #1.'),
(341, 11, '2018-05-26 17:38:56', 'Permission Manager', 'Added 1 users(s) to Permission #1.'),
(342, 11, '2018-05-26 17:44:46', 'User Manager', 'Added user test.'),
(343, 11, '2018-05-26 17:48:37', 'User Manager', 'Deleted user named Te.'),
(344, 11, '2018-05-26 18:14:46', 'User', 'User logged in.'),
(345, 11, '2018-05-26 18:17:55', 'User', 'User logged in.'),
(346, 11, '2018-05-26 18:31:07', 'User', 'User logged in.'),
(347, 11, '2018-05-26 18:33:17', 'Permissions Manager', 'Deleted omacs_settings.'),
(348, 11, '2018-05-26 18:33:21', 'Permissions Manager', 'Deleted omacs_editPermissions.'),
(349, 11, '2018-05-26 18:33:25', 'Permissions Manager', 'Deleted omacs_styleSettings.'),
(350, 11, '2018-05-26 18:33:28', 'Permissions Manager', 'Deleted omacs_editUsers.'),
(351, 11, '2018-05-26 18:38:18', 'User', 'User logged in.'),
(352, 1, '2018-05-26 19:17:17', 'User', 'User logged in.'),
(353, 11, '2018-05-26 19:17:40', 'User', 'User logged in.'),
(354, 11, '2018-05-26 19:57:40', 'User', 'User logged in.'),
(355, 11, '2018-05-27 08:50:56', 'User', 'User logged in.'),
(356, 11, '2018-05-29 12:57:30', 'User', 'User logged in.'),
(357, 11, '2018-05-31 11:35:48', 'User', 'User logged in.'),
(358, 11, '2018-05-31 11:39:50', 'Permission Manager', 'Added 1 users(s) to Permission #2.'),
(359, 11, '2018-05-31 11:39:57', 'Permission Manager', 'Deleted 1 users(s) from Permission #2.'),
(360, 11, '2018-05-31 11:40:00', 'Permission Manager', 'Added 1 users(s) to Permission #2.'),
(361, 1, '2018-12-15 20:35:32', 'User', 'User logged in.'),
(362, 1, '2018-12-15 20:38:50', 'Permissions Manager', 'Added Permission Level named www.'),
(363, 11, '2019-01-11 12:47:21', 'User', 'User logged in.'),
(364, 11, '2019-01-11 13:02:57', 'User Manager', 'Added user test1.'),
(365, 11, '2019-01-11 13:04:04', 'User Manager', 'Sent password reset email to Test, Vericode expires in 30 minutes.'),
(366, 11, '2019-01-11 13:04:04', 'User Manager', 'Updated email for Test from jojojoppe@gmail.com to jojojoppe96@gmail.com.'),
(367, 11, '2019-01-11 13:04:30', 'User Manager', 'Sent password reset email to Test, Vericode expires in 30 minutes.'),
(368, 12, '2019-01-11 13:05:01', 'User', 'Requested password reset.'),
(369, 12, '2019-01-11 13:05:20', 'User', 'Reset password.'),
(370, 12, '2019-01-11 13:05:49', 'User', 'User logged in.'),
(371, 11, '2019-01-11 13:23:15', 'User', 'User logged in.'),
(372, 11, '2019-01-11 13:24:37', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(373, 11, '2019-01-11 13:24:51', 'Permission Manager', 'Added 1 users(s) to Permission #4.'),
(374, 12, '2019-01-11 13:25:04', 'User', 'User logged in.'),
(375, 11, '2019-01-11 13:53:28', 'Permissions Manager', 'Added Permission Level named create_pages.'),
(376, 11, '2019-01-11 13:54:31', 'User Manager', 'Added 1 permission(s) to Test 1.'),
(377, 11, '2019-01-11 14:14:07', 'Permissions Manager', 'Deleted create_pages.'),
(378, 1, '2019-01-11 15:24:25', 'User', 'User logged in.'),
(379, 1, '2019-01-11 15:26:07', 'Permissions Manager', 'Added Permission Level named acdc.'),
(380, 1, '2019-01-11 20:59:08', 'User', 'User logged in.'),
(381, 1, '2019-01-11 20:59:44', 'User', 'User logged in.'),
(382, 11, '2019-01-12 11:11:22', 'Permissions Manager', 'Changed Permission Name from User to normal user.'),
(383, 11, '2019-01-12 11:11:58', 'Permissions Manager', 'Changed Permission Name from www to webcie.'),
(384, 11, '2019-01-12 11:12:11', 'Permissions Manager', 'Changed Permission Name from normal user to User.'),
(385, 1, '2019-01-12 11:21:31', 'User', 'User logged in.'),
(386, 11, '2019-01-12 11:29:16', 'Permissions Manager', 'Added Permission Level named test.'),
(387, 11, '2019-01-12 11:29:32', 'Permissions Manager', 'Deleted test.'),
(388, 11, '2019-01-12 11:30:02', 'Permissions Manager', 'Added Permission Level named test.'),
(389, 11, '2019-01-12 11:30:06', 'Permissions Manager', 'Deleted test.'),
(390, 11, '2019-01-12 11:30:53', 'Permissions Manager', 'Added Permission Level named test.'),
(391, 11, '2019-01-12 11:30:57', 'Permissions Manager', 'Deleted test.'),
(392, 11, '2019-01-12 11:31:24', 'Permissions Manager', 'Added Permission Level named test.'),
(393, 11, '2019-01-12 11:31:28', 'Permissions Manager', 'Deleted test.'),
(394, 11, '2019-01-12 11:32:58', 'Permissions Manager', 'Added Permission Level named test.'),
(395, 11, '2019-01-12 11:33:01', 'Permissions Manager', 'Added Permission Level named test 1.'),
(396, 11, '2019-01-12 11:33:03', 'Permissions Manager', 'Added Permission Level named test 2.'),
(397, 11, '2019-01-12 11:33:07', 'Permissions Manager', 'Deleted test.'),
(398, 11, '2019-01-12 11:34:05', 'Permissions Manager', 'Deleted test 1.'),
(399, 11, '2019-01-12 11:36:57', 'Permissions Manager', 'Deleted test 2.'),
(400, 11, '2019-01-12 11:38:58', 'Permissions Manager', 'Added Permission Level named test.'),
(401, 11, '2019-01-12 11:40:04', 'Permissions Manager', 'Deleted test.'),
(402, 11, '2019-01-12 11:40:41', 'Permissions Manager', 'Added Permission Level named test.'),
(403, 11, '2019-01-12 11:40:44', 'Permissions Manager', 'Deleted test.'),
(404, 11, '2019-01-12 11:45:24', 'Permissions Manager', 'Deleted acdc.'),
(405, 11, '2019-01-12 11:48:02', 'Permissions Manager', 'Added Permission Level named acdc.'),
(406, 11, '2019-01-12 11:48:06', 'Permissions Manager', 'Deleted acdc.'),
(407, 11, '2019-01-12 11:50:56', 'Permissions Manager', 'Added Permission Level named acdc.'),
(408, 11, '2019-01-12 11:51:00', 'Permissions Manager', 'Deleted acdc.'),
(409, 11, '2019-01-12 11:52:16', 'Permissions Manager', 'Added Permission Level named acdc.'),
(410, 11, '2019-01-12 11:52:20', 'Permissions Manager', 'Deleted acdc.'),
(411, 11, '2019-01-12 11:53:09', 'Permissions Manager', 'Added Permission Level named acdc.'),
(412, 11, '2019-01-12 11:53:14', 'Permissions Manager', 'Deleted acdc.'),
(413, 11, '2019-01-12 11:54:10', 'Permissions Manager', 'Added Permission Level named acdc.'),
(414, 11, '2019-01-12 11:54:13', 'Permissions Manager', 'Deleted acdc.'),
(415, 11, '2019-01-12 11:55:00', 'Permissions Manager', 'Added Permission Level named acdc.'),
(416, 11, '2019-01-12 11:55:03', 'Permissions Manager', 'Deleted acdc.'),
(417, 11, '2019-01-12 11:56:00', 'Permissions Manager', 'Added Permission Level named acdc.'),
(418, 11, '2019-01-12 11:56:03', 'Permissions Manager', 'Deleted acdc.'),
(419, 11, '2019-01-12 11:57:30', 'Permissions Manager', 'Added Permission Level named acdc.'),
(420, 11, '2019-01-12 11:57:34', 'Permissions Manager', 'Deleted acdc.'),
(421, 11, '2019-01-12 11:57:59', 'Permissions Manager', 'Added Permission Level named acdc.'),
(422, 11, '2019-01-12 11:58:02', 'Permissions Manager', 'Deleted acdc.'),
(423, 11, '2019-01-12 11:58:53', 'Permissions Manager', 'Added Permission Level named acdc.'),
(424, 11, '2019-01-12 11:58:56', 'Permissions Manager', 'Deleted acdc.'),
(425, 11, '2019-01-12 12:00:30', 'Permissions Manager', 'Added Permission Level named acdc.'),
(426, 11, '2019-01-12 12:00:34', 'Permissions Manager', 'Deleted acdc.'),
(427, 11, '2019-01-12 12:00:45', 'Permissions Manager', 'Added Permission Level named acdc.'),
(428, 11, '2019-01-12 12:00:50', 'Permissions Manager', 'Deleted acdc.'),
(429, 11, '2019-01-12 12:02:01', 'Permissions Manager', 'Added Permission Level named acdc.'),
(430, 11, '2019-01-12 12:02:03', 'Permissions Manager', 'Deleted acdc.'),
(431, 11, '2019-01-12 12:03:19', 'Permissions Manager', 'Added Permission Level named acdc.'),
(432, 11, '2019-01-12 12:03:25', 'Permissions Manager', 'Deleted acdc.'),
(433, 11, '2019-01-12 12:03:37', 'Permissions Manager', 'Added Permission Level named acdc.'),
(434, 11, '2019-01-12 12:06:53', 'Permissions Manager', 'Changed Permission Name from acdc to acdc_com.'),
(435, 11, '2019-01-12 12:08:40', 'Permissions Manager', 'Changed Permission Name from acdc_com to acdc.'),
(436, 11, '2019-01-12 12:10:22', 'Permissions Manager', 'Changed Permission Name from acdc to acdc_com.'),
(437, 11, '2019-01-12 12:15:34', 'Permissions Manager', 'Deleted acdc_com.'),
(438, 11, '2019-01-12 12:15:55', 'Permissions Manager', 'Added Permission Level named acdc.'),
(439, 11, '2019-01-12 12:15:59', 'Permissions Manager', 'Deleted acdc.'),
(440, 11, '2019-01-12 12:17:25', 'Permissions Manager', 'Deleted wocfyc.'),
(441, 11, '2019-01-12 12:18:59', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(442, 11, '2019-01-12 12:19:02', 'Permissions Manager', 'Added Permission Level named acdc.'),
(443, 11, '2019-01-12 12:19:29', 'Permissions Manager', 'Deleted wocfyc.'),
(444, 11, '2019-01-12 12:19:49', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(445, 11, '2019-01-12 12:20:09', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(446, 11, '2019-01-12 12:22:39', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(447, 11, '2019-01-12 12:23:00', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(448, 11, '2019-01-12 12:23:45', 'Permissions Manager', 'Deleted wocfyc_com.'),
(449, 11, '2019-01-12 12:24:12', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(450, 11, '2019-01-12 12:24:30', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(451, 11, '2019-01-12 12:24:39', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(452, 11, '2019-01-12 12:24:45', 'Permissions Manager', 'Deleted wocfyc.'),
(453, 11, '2019-01-12 12:25:11', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(454, 11, '2019-01-12 12:25:23', 'Permissions Manager', 'Deleted wocfyc.'),
(455, 11, '2019-01-12 12:26:58', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(456, 11, '2019-01-12 12:27:01', 'Permissions Manager', 'Deleted wocfyc.'),
(457, 11, '2019-01-12 12:27:21', 'Permissions Manager', 'Added Permission Level named wocyfc.'),
(458, 11, '2019-01-12 12:27:25', 'Permissions Manager', 'Deleted wocyfc.'),
(459, 11, '2019-01-12 12:27:55', 'Permissions Manager', 'Deleted acdc.'),
(460, 11, '2019-01-12 12:28:55', 'Permissions Manager', 'Added Permission Level named acdc.'),
(461, 11, '2019-01-12 12:28:59', 'Permissions Manager', 'Deleted acdc.'),
(462, 11, '2019-01-12 12:30:13', 'Permissions Manager', 'Added Permission Level named acdc.'),
(463, 11, '2019-01-12 12:30:16', 'Permissions Manager', 'Deleted acdc.'),
(464, 11, '2019-01-12 12:30:34', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(465, 11, '2019-01-12 12:30:38', 'Permissions Manager', 'Deleted wocfyc.'),
(466, 11, '2019-01-12 12:31:25', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(467, 11, '2019-01-12 12:31:28', 'Permissions Manager', 'Deleted wocfyc.'),
(468, 11, '2019-01-12 12:31:51', 'Permissions Manager', 'Added Permission Level named wocyfc.'),
(469, 11, '2019-01-12 12:31:55', 'Permissions Manager', 'Deleted wocyfc.'),
(470, 11, '2019-01-12 12:32:00', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(471, 11, '2019-01-12 12:32:07', 'Permissions Manager', 'Deleted wocfyc.'),
(472, 11, '2019-01-12 12:41:31', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(473, 11, '2019-01-12 12:41:36', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(474, 11, '2019-01-12 12:48:54', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(475, 11, '2019-01-12 12:49:06', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(476, 11, '2019-01-12 12:49:13', 'Permissions Manager', 'Deleted wocfyc_com.'),
(477, 11, '2019-01-12 12:49:17', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(478, 11, '2019-01-12 12:49:40', 'Permissions Manager', 'Deleted wocfyc.'),
(479, 11, '2019-01-12 12:51:46', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(480, 11, '2019-01-12 12:51:50', 'Permissions Manager', 'Deleted wocfyc.'),
(481, 11, '2019-01-12 12:53:46', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(482, 11, '2019-01-12 12:53:50', 'Permissions Manager', 'Deleted wocfyc.'),
(483, 11, '2019-01-12 12:56:54', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(484, 11, '2019-01-12 12:57:01', 'Permissions Manager', 'Deleted wocfyc.'),
(485, 11, '2019-01-12 13:05:41', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(486, 11, '2019-01-12 13:05:58', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(487, 11, '2019-01-12 13:06:12', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(488, 11, '2019-01-12 13:06:25', 'Permissions Manager', 'Deleted wocfyc.'),
(489, 11, '2019-01-12 13:07:13', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(490, 11, '2019-01-12 13:07:27', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(491, 11, '2019-01-12 13:10:20', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(492, 11, '2019-01-12 13:10:35', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(493, 11, '2019-01-12 13:11:03', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(494, 11, '2019-01-12 13:11:15', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(495, 11, '2019-01-12 13:12:29', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(496, 11, '2019-01-12 13:13:13', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(497, 11, '2019-01-12 13:15:10', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(498, 11, '2019-01-12 13:15:26', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(499, 11, '2019-01-12 13:16:15', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(500, 11, '2019-01-12 13:16:20', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(501, 11, '2019-01-12 13:19:21', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(502, 11, '2019-01-12 13:19:38', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(503, 11, '2019-01-12 13:25:36', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(504, 11, '2019-01-12 13:25:57', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(505, 11, '2019-01-12 13:29:32', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(506, 11, '2019-01-12 13:29:54', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(507, 11, '2019-01-12 13:32:58', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(508, 11, '2019-01-12 13:34:04', 'Permissions Manager', 'Changed Permission Name from wocfyc to wocfyc_com.'),
(509, 11, '2019-01-12 13:34:12', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc.'),
(510, 11, '2019-01-12 13:34:35', 'Permissions Manager', 'Added Permission Level named acdc.'),
(511, 11, '2019-01-12 13:38:18', 'Permissions Manager', 'Deleted wocfyc.'),
(512, 11, '2019-01-12 13:38:37', 'Permissions Manager', 'Added Permission Level named wocfyc_com.'),
(513, 11, '2019-01-12 13:38:53', 'Permissions Manager', 'Added Permission Level named wocyfc.'),
(514, 11, '2019-01-12 13:40:39', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc_a.'),
(515, 11, '2019-01-12 13:42:12', 'Permissions Manager', 'Changed Permission Name from wocfyc_a to wocfyc_com.'),
(516, 11, '2019-01-12 13:42:14', 'Permissions Manager', 'Changed Permission Name from wocfyc_com to wocfyc_a.'),
(517, 11, '2019-01-12 13:42:39', 'Permissions Manager', 'Deleted wocfyc_a.'),
(518, 11, '2019-01-12 13:43:12', 'Permissions Manager', 'Added Permission Level named wocfyc_a.'),
(519, 11, '2019-01-12 13:44:34', 'Permissions Manager', 'Deleted wocfyc_a.'),
(520, 11, '2019-01-12 13:44:49', 'Permissions Manager', 'Changed Permission Name from acdc to acdc_com.'),
(521, 11, '2019-01-12 13:45:00', 'Permissions Manager', 'Changed Permission Name from acdc_com to acdc.'),
(522, 11, '2019-01-12 13:45:06', 'Permissions Manager', 'Deleted acdc.'),
(523, 11, '2019-01-12 13:45:09', 'Permissions Manager', 'Deleted wocyfc.'),
(524, 11, '2019-01-12 13:45:13', 'Permissions Manager', 'Added Permission Level named acdc.'),
(525, 11, '2019-01-12 13:45:17', 'Permissions Manager', 'Added Permission Level named wocfyc.'),
(526, 11, '2019-01-12 13:47:03', 'Permissions Manager', 'Changed Permission Name from webcie to www.'),
(527, 11, '2019-01-12 13:47:06', 'Permissions Manager', 'Changed Permission Name from www to webcie.'),
(528, 11, '2019-01-12 13:48:48', 'User Manager', 'Deleted 1 permission(s) from Joppe Blondel.'),
(529, 11, '2019-01-12 13:48:48', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(530, 1, '2019-01-12 13:49:19', 'User', 'User logged in.'),
(531, 11, '2019-01-12 13:50:28', 'User', 'User logged in.'),
(532, 1, '2019-01-12 13:50:43', 'User', 'User logged in.'),
(533, 11, '2019-01-12 13:56:04', 'User Manager', 'Deleted user named Test.'),
(534, 11, '2019-01-12 13:56:20', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(535, 11, '2019-01-12 13:56:23', 'User Manager', 'Deleted 1 permission(s) from Joppe Blondel.'),
(536, 11, '2019-01-12 13:57:40', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(537, 11, '2019-01-12 14:18:22', 'User Manager', 'Added user test.'),
(538, 11, '2019-01-12 14:19:31', 'User Manager', 'Sent password reset email to Test, Vericode expires in 30 minutes.'),
(539, 11, '2019-01-12 14:22:15', 'User Manager', 'Sent password reset email to Test, Vericode expires in 30 minutes.'),
(540, 13, '2019-01-12 14:22:47', 'User', 'Requested password reset.'),
(541, 13, '2019-01-12 14:24:36', 'User', 'Reset password.'),
(542, 13, '2019-01-12 14:25:05', 'User', 'User logged in.'),
(543, 11, '2019-01-12 14:27:33', 'User Manager', 'Deleted 1 permission(s) from Joppe Blondel.'),
(544, 11, '2019-01-12 14:29:34', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(545, 11, '2019-01-12 14:30:01', 'User Manager', 'Deleted 1 permission(s) from Joppe Blondel.'),
(546, 11, '2019-01-12 15:04:28', 'Permission Manager', 'Added 1 users(s) to Permission #2.'),
(547, 11, '2019-01-12 15:14:30', 'Permission Manager', 'Deleted 1 users(s) from Permission #2.'),
(548, 11, '2019-01-12 15:14:33', 'Permission Manager', 'Added 1 users(s) to Permission #2.'),
(549, 11, '2019-01-12 15:14:36', 'Permission Manager', 'Deleted 1 users(s) from Permission #2.'),
(550, 1, '2019-01-12 15:17:34', 'User', 'User logged in.'),
(551, 11, '2019-01-13 10:07:42', 'User', 'User logged in.'),
(552, 11, '2019-01-13 10:15:31', 'User Manager', 'Added 1 permission(s) to Joppe Blondel.'),
(553, 13, '2019-01-13 18:32:42', 'User', 'User logged in.'),
(554, 1, '2019-01-13 18:44:41', 'User', 'User logged in.'),
(555, 11, '2019-01-13 18:48:21', 'User', 'User logged in.'),
(556, 11, '2019-01-13 18:48:42', 'Permission Manager', 'Deleted 1 users(s) from Permission #2.'),
(557, 11, '2019-01-13 18:51:26', 'Permission Manager', 'Added 1 users(s) to Permission #2.'),
(558, 11, '2019-01-14 12:53:49', 'User', 'User logged in.'),
(559, 11, '2019-01-14 16:42:08', 'User', 'User logged in.'),
(560, 11, '2019-01-14 16:42:45', 'User Manager', 'Deleted user named Joppe.'),
(561, 1, '2019-01-14 16:42:53', 'User', 'User logged in.'),
(562, 1, '2019-01-14 16:43:03', 'User Manager', 'Deleted user named Test.'),
(563, 1, '2019-01-14 16:43:17', 'User Manager', 'Updated first name for Joppe from Joppe to Admin.'),
(564, 1, '2019-01-14 16:43:45', 'User Manager', 'Updated first name for Admin from Admin to OMACS.'),
(565, 1, '2019-01-14 16:43:45', 'User Manager', 'Updated last name for Admin from Blondel to ADMIN.'),
(566, 1, '2019-01-14 16:43:45', 'User Manager', 'Updated email for Admin from joppeblondel@gmail.com to email@address.com.'),
(567, 1, '2019-01-14 16:44:21', 'User', 'Updated password.'),
(568, 1, '2019-01-14 16:45:02', 'Permissions Manager', 'Deleted webcie.'),
(569, 1, '2019-01-14 16:45:05', 'Permissions Manager', 'Deleted acdc.'),
(570, 1, '2019-01-14 16:45:08', 'Permissions Manager', 'Deleted wocfyc.'),
(571, 1, '2019-01-14 16:48:19', 'Email Settings', 'Updated smtp_server from smtp.gmail.com to example.com.'),
(572, 1, '2019-01-14 16:48:19', 'Email Settings', 'Updated website_name from User Spice to OMACS.'),
(573, 1, '2019-01-14 16:48:19', 'Email Settings', 'Updated smtp_port from 587 to 25.'),
(574, 1, '2019-01-14 16:48:19', 'Email Settings', 'Updated email_login.'),
(575, 1, '2019-01-14 16:48:19', 'Email Settings', 'Updated email_pass.'),
(576, 1, '2019-01-14 16:49:21', 'Email Settings', 'Updated verify_url from https://joppeb.nl/TEST/ to http://example.com.');

-- --------------------------------------------------------

--
-- Table structure for table `logs_exempt`
--

CREATE TABLE `logs_exempt` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `parent` int(10) NOT NULL,
  `dropdown` int(1) NOT NULL,
  `logged_in` int(1) NOT NULL,
  `display_order` int(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon_class` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `parent`, `dropdown`, `logged_in`, `display_order`, `label`, `link`, `icon_class`) VALUES
(1, 'main', 2, 0, 1, 1, 'Home', '', 'fa fa-fw fa-home'),
(2, 'main', -1, 1, 1, 14, '', '', 'fa fa-fw fa-cogs'),
(3, 'main', -1, 0, 1, 11, '{{username}}', 'users/account.php', 'fa fa-fw fa-user'),
(4, 'main', -1, 1, 0, 3, 'Help', '', 'fa fa-fw fa-life-ring'),
(5, 'main', -1, 0, 0, 2, 'Register', 'users/join.php', 'fa fa-fw fa-plus-square'),
(6, 'main', -1, 0, 0, 1, 'Log In', 'users/login.php', 'fa fa-fw fa-sign-in'),
(7, 'main', 2, 0, 1, 2, 'Account', 'users/account.php', 'fa fa-fw fa-user'),
(8, 'main', 2, 0, 1, 3, '{{hr}}', '', ''),
(9, 'main', 2, 0, 1, 4, 'Admin Dashboard', 'users/admin.php', 'fa fa-fw fa-cogs'),
(10, 'main', 2, 0, 1, 5, 'User Management', 'users/admin_users.php', 'fa fa-fw fa-user'),
(11, 'main', 2, 0, 1, 6, 'Permissions Manager', 'users/admin_permissions.php', 'fa fa-fw fa-lock'),
(12, 'main', 2, 0, 1, 7, 'Page Management', 'users/admin_pages.php', 'fa fa-fw fa-wrench'),
(13, 'main', 2, 0, 1, 8, 'Messages Manager', 'users/admin_messages.php', 'fa fa-fw fa-envelope'),
(14, 'main', 2, 0, 1, 9, 'System Logs', 'users/admin_logs.php', 'fa fa-fw fa-search'),
(15, 'main', 2, 0, 1, 10, '{{hr}}', '', ''),
(16, 'main', 2, 0, 1, 11, 'Logout', 'users/logout.php', 'fa fa-fw fa-sign-out'),
(17, 'main', -1, 0, 0, 0, 'Home', '', 'fa fa-fw fa-home'),
(18, 'main', -1, 0, 1, 10, 'Home', '', 'fa fa-fw fa-home'),
(19, 'main', 4, 0, 0, 1, 'Forgot Password', 'users/forgot_password.php', 'fa fa-fw fa-wrench'),
(20, 'main', -1, 0, 1, 12, '{{notifications}}', '', ''),
(21, 'main', -1, 0, 1, 13, '{{messages}}', '', ''),
(22, 'main', 4, 0, 0, 99999, 'Resend Activation Email', 'users/verify_resend.php', 'fa fa-exclamation-triangle');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_body` text NOT NULL,
  `msg_read` int(1) NOT NULL,
  `msg_thread` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  `sent_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `msg_from`, `msg_to`, `msg_body`, `msg_read`, `msg_thread`, `deleted`, `sent_on`) VALUES
(1, 1, 2, '&lt;p&gt;fgds&lt;/p&gt;', 0, 1, 0, '2017-08-06 00:13:47'),
(2, 1, 2, '&lt;p&gt;Did it work?&lt;/p&gt;', 0, 2, 0, '2017-09-09 15:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_subject` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `archive_from` int(1) NOT NULL DEFAULT '0',
  `archive_to` int(1) NOT NULL DEFAULT '0',
  `hidden_from` int(1) NOT NULL DEFAULT '0',
  `hidden_to` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_threads`
--

INSERT INTO `message_threads` (`id`, `msg_to`, `msg_from`, `msg_subject`, `last_update`, `last_update_by`, `archive_from`, `archive_to`, `hidden_from`, `hidden_to`) VALUES
(1, 2, 1, 'Testiing123', '2017-08-06 00:13:47', 1, 0, 0, 0, 0),
(2, 2, 1, 'Testing Message Badge', '2017-09-09 15:10:09', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mqtt`
--

CREATE TABLE `mqtt` (
  `id` int(11) NOT NULL,
  `server` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mqtt`
--

INSERT INTO `mqtt` (`id`, `server`, `port`, `username`, `password`, `nickname`) VALUES
(2, '192.168.0.222', 1883, '', '', 'Raspberry PI MQTT2');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `is_archived` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `omacs`
--

CREATE TABLE `omacs` (
  `type` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `omacs`
--

INSERT INTO `omacs` (`type`, `data`) VALUES
('pages', 'ewogICAgImhvbWUiOiB7CiAgICAgICAgInRpdGxlIjogIkhvbWUiLAogICAgICAgICJ0eXBlIjogInBhZ2UiLAogICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAiVXNlciIsCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImxvZ2luIjogdHJ1ZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogewogICAgICAgICAgICAiMSI6ICJBZG1pbmlzdHJhdG9yIgogICAgICAgIH0sCiAgICAgICAgImNvbnRlbnQiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJ0eXBlIjogImNhcmQiLAogICAgICAgICAgICAgICAgInRpdGxlIjogIk9NQUNTIiwKICAgICAgICAgICAgICAgICJwZXJtIjogW10sCiAgICAgICAgICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgICAgICAgICAiY2FuX2VkaXQiOiBbXSwKICAgICAgICAgICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgICAgICAgICAiY29udGVudCI6IHsKICAgICAgICAgICAgICAgICAgICAidHlwZSI6ICJ0ZXh0IiwKICAgICAgICAgICAgICAgICAgICAiZGF0YSI6IFsKICAgICAgICAgICAgICAgICAgICAgICAgIldlbGNvbWUgdG8gW2JdT01BQ1NbXC9iXSFcIlwiIgogICAgICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQogICAgICAgIF0sCiAgICAgICAgInRhcmdldCI6IFsKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInBlcm0iOiBbCiAgICAgICAgICAgICAgICAgICAgIlVzZXIiLAogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgICAgICAgICAiVXNlciIsCiAgICAgICAgICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICBdCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAgICAgICAgICJVc2VyIiwKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIsCiAgICAgICAgICAgICAgICAgICAgInd3dyIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICAgICAgICAgIlVzZXIiLAogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIiwKICAgICAgICAgICAgICAgICAgICAid3d3IgogICAgICAgICAgICAgICAgXQogICAgICAgICAgICB9LAogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgICAgICAgICAiVXNlciIsCiAgICAgICAgICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJVc2VyIiwKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgfQogICAgICAgIF0KICAgIH0sCiAgICAicHJvZmlsZSI6IHsKICAgICAgICAidGl0bGUiOiAiUHJvZmlsZSIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgIlVzZXIiCiAgICAgICAgXSwKICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImNvbnRlbnQiOiAiZGlyZWN0XC9wcm9maWxlLnBocCIKICAgIH0sCiAgICAicHJvZmlsZV9zZXR0aW5ncyI6IHsKICAgICAgICAidGl0bGUiOiAiUHJvZmlsZSBzZXR0aW5ncyIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgIlVzZXIiCiAgICAgICAgXSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgImNvbnRlbnQiOiAiZGlyZWN0XC9wcm9maWxlX3NldHRpbmdzLnBocCIKICAgIH0sCiAgICAibG9naW4iOiB7CiAgICAgICAgInRpdGxlIjogIkxvZ2luIiwKICAgICAgICAidHlwZSI6ICJkaXJlY3QiLAogICAgICAgICJwZXJtIjogW10sCiAgICAgICAgImxvZ2luIjogZmFsc2UsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgXSwKICAgICAgICAiY29udGVudCI6ICJkaXJlY3RcL2xvZ2luLnBocCIKICAgIH0sCiAgICAiZm9yZ290X3Bhc3N3b3JkIjogewogICAgICAgICJ0aXRsZSI6ICJGb3Jnb3QgcGFzc3dvcmQiLAogICAgICAgICJ0eXBlIjogImRpcmVjdCIsCiAgICAgICAgInBlcm0iOiBbXSwKICAgICAgICAibG9naW4iOiBmYWxzZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJjb250ZW50IjogImRpcmVjdFwvZm9yZ290X3Bhc3N3b3JkLnBocCIKICAgIH0sCiAgICAicGFzc3dvcmRfcmVzZXQiOiB7CiAgICAgICAgInRpdGxlIjogIkZvcmdvdCBwYXNzd29yZCIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAicGVybSI6IFtdLAogICAgICAgICJsb2dpbiI6IGZhbHNlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImNvbnRlbnQiOiAiZGlyZWN0XC9mb3Jnb3RfcGFzc3dvcmRfcmVzZXQucGhwIgogICAgfSwKICAgICI0MDMiOiB7CiAgICAgICAgInRpdGxlIjogIjQwMyBmb3JiaWRkZW4iLAogICAgICAgICJ0eXBlIjogImRpcmVjdCIsCiAgICAgICAgInBlcm0iOiBbXSwKICAgICAgICAibG9naW4iOiBmYWxzZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJjb250ZW50IjogImRpcmVjdFwvNDAzLnBocCIKICAgIH0sCiAgICAiY29weXJpZ2h0IjogewogICAgICAgICJ0aXRsZSI6ICJDb3B5cmlnaHQiLAogICAgICAgICJ0eXBlIjogInBhZ2UiLAogICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJsb2dpbiI6IGZhbHNlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImNvbnRlbnQiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJ0aXRsZSI6ICJDb3B5cmlnaHQiLAogICAgICAgICAgICAgICAgInR5cGUiOiAiY2FyZCIsCiAgICAgICAgICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgImxvZ2luIjogZmFsc2UsCiAgICAgICAgICAgICAgICAiY29udGVudCI6IHsKICAgICAgICAgICAgICAgICAgICAidHlwZSI6ICJ0ZXh0IiwKICAgICAgICAgICAgICAgICAgICAiZGF0YSI6IFsKICAgICAgICAgICAgICAgICAgICAgICAgIk9NQUNTIC0gVGhlIG9ubGluZSBtZW1iZXIgYW5kIGNvbW1pdHRlZSBzeXN0ZW1cbkNvcHlyaWdodCAoQykgMjAxOCAtIEpvcHBlIEJsb25kZWxcblxuVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU6IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZFwvb3IgbW9kaWZ5XG5pdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieVxudGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgZWl0aGVyIHZlcnNpb24gMyBvZiB0aGUgTGljZW5zZSwgb3JcbihhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uXG5cblRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLFxuYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2Zcbk1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGVcbkdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuXG5cbltiXVt1cmw9P3ZpZXduYT1saWNlbmNlXUEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2VuY2VbXC91cmxdW1wvYl0iCiAgICAgICAgICAgICAgICAgICAgXQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9LAogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAidGl0bGUiOiAiQWJvdXQgT01BQ1MiLAogICAgICAgICAgICAgICAgInR5cGUiOiAiY2FyZCIsCiAgICAgICAgICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgICAgICAgICAiVXNlciIsCiAgICAgICAgICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJVc2VyIiwKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAibG9naW4iOiBmYWxzZSwKICAgICAgICAgICAgICAgICJjb250ZW50IjogewogICAgICAgICAgICAgICAgICAgICJ0eXBlIjogImRpcmVjdCIsCiAgICAgICAgICAgICAgICAgICAgImRhdGEiOiBbCiAgICAgICAgICAgICAgICAgICAgICAgICJhYm91dC5waHAiCiAgICAgICAgICAgICAgICAgICAgXQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9LAogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAidGl0bGUiOiAiVXNlZCBzb2Z0d2FyZSIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJjYXJkIiwKICAgICAgICAgICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAgICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAibG9naW4iOiBmYWxzZSwKICAgICAgICAgICAgICAgICJjb250ZW50IjogewogICAgICAgICAgICAgICAgICAgICJ0eXBlIjogInRleHQiLAogICAgICAgICAgICAgICAgICAgICJkYXRhIjogWwogICAgICAgICAgICAgICAgICAgICAgICAiT01BQ1MgaXMgYnVpbGQgdXBvbiBvdGhlciBwaWVjZXMgb2Ygc29mdHdhcmU6XG5baV1bdXJsPWh0dHA6XC9cL3d3dy51c2Vyc3BpY2UuY29tXSsgVXNlcnNwaWNlW1wvdXJsXVtcL2ldXG5PTUFDUyBoYXMgZnVsbHkgaW50ZWdyYXRlZCBVc2Vyc3BpY2UgaW4gaXRzIGVudmlyb25tZW50LCB0aHVzIGVkaXRlZCB0aGVpciBjb2RlLiBDb3BpZXMgYXJlIG1hZGUgb2YgaW1wb3J0YW50IGZpbGVzIGFuZCBjaGFuZ2VkIGludG8gT01BQ1MgcGFnZXMuIE9yaWdpbmFsIGZpbGVzIGFyZSBrZXB0IGluIHRoZSBwbGFjZSBVc2Vyc3BpY2UgaGFkIHRoZW06IG5hbWVseSB0aGUgJ3VzZXJzJyBmb2xkZXIuIFVzZXJzcGljZSBpcyBzdGlsbCBhY2Nlc3NpYmxlIHZpYSB0aGUgJ1VzZXJzcGljZSBkYXNoYm9hcmQnIG9wdGlvbiBpbiB0aGUgT01BQ1MgbWVudSwgdmlzaWJsZSBmb3IgdXNlcnMgd2l0aCBhZG1pbmlzdHJhdG9yIHJpZ2h0cy5cbltpXVt1cmw9aHR0cDpcL1wvanNjb2xvci5jb21dKyBqc2NvbG9yW1wvdXJsXVtcL2ldXG5baV1bdXJsPWh0dHA6XC9cL21hbm9zLm1hbGlodS5nclwvanF1ZXJ5LWN1c3RvbS1jb250ZW50LXNjcm9sbGVyXC9dKyBqUXVlcnkgY3VzdG9tIHNjcm9sbGJhcltcL3VybF1bXC9pXSIKICAgICAgICAgICAgICAgICAgICBdCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KICAgICAgICBdLAogICAgICAgICJ0YXJnZXQiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgfSwKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInBlcm0iOiBbCiAgICAgICAgICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXQogICAgICAgICAgICB9CiAgICAgICAgXQogICAgfSwKICAgICJvbWFjc19zdHlsZSI6IHsKICAgICAgICAidGl0bGUiOiAiU3R5bGUgc2V0dGluZ3MiLAogICAgICAgICJ0eXBlIjogImRpcmVjdCIsCiAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICIxIjogIkFkbWluaXN0cmF0b3IiCiAgICAgICAgfSwKICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImNvbnRlbnQiOiAiZGlyZWN0XC9zdHlsZV9zZXR0aW5ncy5waHAiCiAgICB9LAogICAgImhlbHAiOiB7CiAgICAgICAgInRpdGxlIjogIkhlbHAiLAogICAgICAgICJ0eXBlIjogInBhZ2UiLAogICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAiVXNlciIsCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImxvZ2luIjogZmFsc2UsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgXSwKICAgICAgICAiY29udGVudCI6IFsKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInR5cGUiOiAiY2FyZCIsCiAgICAgICAgICAgICAgICAidGl0bGUiOiAiSGVscCIsCiAgICAgICAgICAgICAgICAicGVybSI6IFtdLAogICAgICAgICAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogW10sCiAgICAgICAgICAgICAgICAibG9naW4iOiBmYWxzZSwKICAgICAgICAgICAgICAgICJjb250ZW50IjogewogICAgICAgICAgICAgICAgICAgICJ0eXBlIjogImFjY29yZGlvbiIsCiAgICAgICAgICAgICAgICAgICAgImRhdGEiOiBbCiAgICAgICAgICAgICAgICAgICAgICAgICJJbnRyb2R1Y3Rpb25cXENBUkRTIEFQSSB2MlxcIiwKICAgICAgICAgICAgICAgICAgICAgICAgIlxcXFwiCiAgICAgICAgICAgICAgICAgICAgXQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CiAgICAgICAgXSwKICAgICAgICAidGFyZ2V0IjogWwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICBdCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAgICAgICAgICJVc2VyIiwKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICAgICAgICAgIlVzZXIiLAogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXQogICAgICAgICAgICB9CiAgICAgICAgXQogICAgfSwKICAgICJwZXJtaXNzaW9ucyI6IHsKICAgICAgICAidGl0bGUiOiAiTWFuYWdlIHBlcm1pc3Npb25zIiwKICAgICAgICAidHlwZSI6ICJkaXJlY3QiLAogICAgICAgICJwZXJtIjogewogICAgICAgICAgICAiMSI6ICJBZG1pbmlzdHJhdG9yIgogICAgICAgIH0sCiAgICAgICAgImxvZ2luIjogdHJ1ZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJjb250ZW50IjogImRpcmVjdFwvYWRtaW5fcGVybWlzc2lvbnMucGhwIgogICAgfSwKICAgICJwZXJtaXNzaW9uIjogewogICAgICAgICJ0aXRsZSI6ICJQZXJtaXNzaW9uIHNldHRpbmdzIiwKICAgICAgICAidHlwZSI6ICJkaXJlY3QiLAogICAgICAgICJwZXJtIjogewogICAgICAgICAgICAiMSI6ICJBZG1pbmlzdHJhdG9yIgogICAgICAgIH0sCiAgICAgICAgImxvZ2luIjogdHJ1ZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJjb250ZW50IjogImRpcmVjdFwvYWRtaW5fcGVybWlzc2lvbi5waHAiCiAgICB9LAogICAgInVzZXJzIjogewogICAgICAgICJ0aXRsZSI6ICJNYW5hZ2UgdXNlcnMiLAogICAgICAgICJ0eXBlIjogImRpcmVjdCIsCiAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICIxIjogIkFkbWluaXN0cmF0b3IiCiAgICAgICAgfSwKICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImNvbnRlbnQiOiAiZGlyZWN0XC9hZG1pbl91c2Vycy5waHAiCiAgICB9LAogICAgInVzZXIiOiB7CiAgICAgICAgInRpdGxlIjogIlVzZXIgc2V0dGluZ3MiLAogICAgICAgICJ0eXBlIjogImRpcmVjdCIsCiAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICIxIjogIkFkbWluaXN0cmF0b3IiCiAgICAgICAgfSwKICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImNvbnRlbnQiOiAiZGlyZWN0XC9hZG1pbl91c2VyLnBocCIKICAgIH0sCiAgICAibWVudSI6IHsKICAgICAgICAidGl0bGUiOiAiTWVudSBzZXR0aW5ncyIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAicGVybSI6IHsKICAgICAgICAgICAgIjEiOiAiQWRtaW5pc3RyYXRvciIKICAgICAgICB9LAogICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgXSwKICAgICAgICAiY29udGVudCI6ICJkaXJlY3RcL21lbnVfc2V0dGluZ3MucGhwIgogICAgfSwKICAgICJtZW51X3NldHRpbmciOiB7CiAgICAgICAgInRpdGxlIjogIk1lbnUgaXRlbSBzZXR0aW5ncyIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAicGVybSI6IHsKICAgICAgICAgICAgIjEiOiAiQWRtaW5pc3RyYXRvciIKICAgICAgICB9LAogICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgXSwKICAgICAgICAiY29udGVudCI6ICJkaXJlY3RcL21lbnVfc2V0dGluZy5waHAiCiAgICB9LAogICAgInBhZ2VzIjogewogICAgICAgICJ0aXRsZSI6ICJQYWdlIHNldHRpbmdzIiwKICAgICAgICAidHlwZSI6ICJkaXJlY3QiLAogICAgICAgICJwZXJtIjogewogICAgICAgICAgICAiMSI6ICJBZG1pbmlzdHJhdG9yIgogICAgICAgIH0sCiAgICAgICAgImxvZ2luIjogdHJ1ZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJjb250ZW50IjogImRpcmVjdFwvcGFnZV9zZXR0aW5ncy5waHAiCiAgICB9LAogICAgIjQwNCI6IHsKICAgICAgICAidGl0bGUiOiAiNDA0IE5vdCBmb3VuZCIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAicGVybSI6IFtdLAogICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgXSwKICAgICAgICAiY29udGVudCI6ICJkaXJlY3RcLzQwNC5waHAiCiAgICB9LAogICAgInBhZ2Vfc2V0dGluZyI6IHsKICAgICAgICAidGl0bGUiOiAiUGFnZSBzZXR0aW5ncyIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgIlVzZXIiLAogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgXSwKICAgICAgICAiY29udGVudCI6ICJkaXJlY3RcL3BhZ2Vfc2V0dGluZy5waHAiCiAgICB9LAogICAgImNhcmRzIjogewogICAgICAgICJ0aXRsZSI6ICJDYXJkcyIsCiAgICAgICAgInR5cGUiOiAiZGlyZWN0IiwKICAgICAgICAiY29udGVudCI6ICJkaXJlY3RcL2NhcmRzLnBocCIsCiAgICAgICAgImxvZ2luIjogdHJ1ZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJwZXJtIjogewogICAgICAgICAgICAiMSI6ICJBZG1pbmlzdHJhdG9yIgogICAgICAgIH0KICAgIH0sCiAgICAibGljZW5jZSI6IHsKICAgICAgICAidGl0bGUiOiAiTGljZW5jZSIsCiAgICAgICAgInR5cGUiOiAicGFnZSIsCiAgICAgICAgImNvbnRlbnQiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJ0aXRsZSI6ICJHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRSIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJjYXJkIiwKICAgICAgICAgICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAgICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAibG9naW4iOiBmYWxzZSwKICAgICAgICAgICAgICAgICJjb250ZW50IjogewogICAgICAgICAgICAgICAgICAgICJ0eXBlIjogInRleHQiLAogICAgICAgICAgICAgICAgICAgICJkYXRhIjogWwogICAgICAgICAgICAgICAgICAgICAgICAiVmVyc2lvbiAzLCAyOSBKdW5lIDIwMDdcblxuQ29weXJpZ2h0IChDKSAyMDA3IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiA8aHR0cDpcL1wvZnNmLm9yZ1wvPlxuXG5FdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuXG5cbltiXVByZWFtYmxlW1wvYl1cblRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpcyBhIGZyZWUsIGNvcHlsZWZ0IGxpY2Vuc2UgZm9yIHNvZnR3YXJlIGFuZCBvdGhlciBraW5kcyBvZiB3b3Jrcy5cblxuVGhlIGxpY2Vuc2VzIGZvciBtb3N0IHNvZnR3YXJlIGFuZCBvdGhlciBwcmFjdGljYWwgd29ya3MgYXJlIGRlc2lnbmVkIHRvIHRha2UgYXdheSB5b3VyIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSB0aGUgd29ya3MuIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaXMgaW50ZW5kZWQgdG8gZ3VhcmFudGVlIHlvdXIgZnJlZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdlIGFsbCB2ZXJzaW9ucyBvZiBhIHByb2dyYW0tLXRvIG1ha2Ugc3VyZSBpdCByZW1haW5zIGZyZWUgc29mdHdhcmUgZm9yIGFsbCBpdHMgdXNlcnMuIFdlLCB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCB1c2UgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3N0IG9mIG91ciBzb2Z0d2FyZTsgaXQgYXBwbGllcyBhbHNvIHRvIGFueSBvdGhlciB3b3JrIHJlbGVhc2VkIHRoaXMgd2F5IGJ5IGl0cyBhdXRob3JzLiBZb3UgY2FuIGFwcGx5IGl0IHRvIHlvdXIgcHJvZ3JhbXMsIHRvby5cblxuV2hlbiB3ZSBzcGVhayBvZiBmcmVlIHNvZnR3YXJlLCB3ZSBhcmUgcmVmZXJyaW5nIHRvIGZyZWVkb20sIG5vdCBwcmljZS4gT3VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2VzIGFyZSBkZXNpZ25lZCB0byBtYWtlIHN1cmUgdGhhdCB5b3UgaGF2ZSB0aGUgZnJlZWRvbSB0byBkaXN0cmlidXRlIGNvcGllcyBvZiBmcmVlIHNvZnR3YXJlIChhbmQgY2hhcmdlIGZvciB0aGVtIGlmIHlvdSB3aXNoKSwgdGhhdCB5b3UgcmVjZWl2ZSBzb3VyY2UgY29kZSBvciBjYW4gZ2V0IGl0IGlmIHlvdSB3YW50IGl0LCB0aGF0IHlvdSBjYW4gY2hhbmdlIHRoZSBzb2Z0d2FyZSBvciB1c2UgcGllY2VzIG9mIGl0IGluIG5ldyBmcmVlIHByb2dyYW1zLCBhbmQgdGhhdCB5b3Uga25vdyB5b3UgY2FuIGRvIHRoZXNlIHRoaW5ncy5cblxuVG8gcHJvdGVjdCB5b3VyIHJpZ2h0cywgd2UgbmVlZCB0byBwcmV2ZW50IG90aGVycyBmcm9tIGRlbnlpbmcgeW91IHRoZXNlIHJpZ2h0cyBvciBhc2tpbmcgeW91IHRvIHN1cnJlbmRlciB0aGUgcmlnaHRzLiBUaGVyZWZvcmUsIHlvdSBoYXZlIGNlcnRhaW4gcmVzcG9uc2liaWxpdGllcyBpZiB5b3UgZGlzdHJpYnV0ZSBjb3BpZXMgb2YgdGhlIHNvZnR3YXJlLCBvciBpZiB5b3UgbW9kaWZ5IGl0OiByZXNwb25zaWJpbGl0aWVzIHRvIHJlc3BlY3QgdGhlIGZyZWVkb20gb2Ygb3RoZXJzLlxuXG5Gb3IgZXhhbXBsZSwgaWYgeW91IGRpc3RyaWJ1dGUgY29waWVzIG9mIHN1Y2ggYSBwcm9ncmFtLCB3aGV0aGVyIGdyYXRpcyBvciBmb3IgYSBmZWUsIHlvdSBtdXN0IHBhc3Mgb24gdG8gdGhlIHJlY2lwaWVudHMgdGhlIHNhbWUgZnJlZWRvbXMgdGhhdCB5b3UgcmVjZWl2ZWQuIFlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXksIHRvbywgcmVjZWl2ZSBvciBjYW4gZ2V0IHRoZSBzb3VyY2UgY29kZS4gQW5kIHlvdSBtdXN0IHNob3cgdGhlbSB0aGVzZSB0ZXJtcyBzbyB0aGV5IGtub3cgdGhlaXIgcmlnaHRzLlxuXG5EZXZlbG9wZXJzIHRoYXQgdXNlIHRoZSBHTlUgR1BMIHByb3RlY3QgeW91ciByaWdodHMgd2l0aCB0d28gc3RlcHM6ICgxKSBhc3NlcnQgY29weXJpZ2h0IG9uIHRoZSBzb2Z0d2FyZSwgYW5kICgyKSBvZmZlciB5b3UgdGhpcyBMaWNlbnNlIGdpdmluZyB5b3UgbGVnYWwgcGVybWlzc2lvbiB0byBjb3B5LCBkaXN0cmlidXRlIGFuZFwvb3IgbW9kaWZ5IGl0LlxuXG5Gb3IgdGhlIGRldmVsb3BlcnMnIGFuZCBhdXRob3JzJyBwcm90ZWN0aW9uLCB0aGUgR1BMIGNsZWFybHkgZXhwbGFpbnMgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhpcyBmcmVlIHNvZnR3YXJlLiBGb3IgYm90aCB1c2VycycgYW5kIGF1dGhvcnMnIHNha2UsIHRoZSBHUEwgcmVxdWlyZXMgdGhhdCBtb2RpZmllZCB2ZXJzaW9ucyBiZSBtYXJrZWQgYXMgY2hhbmdlZCwgc28gdGhhdCB0aGVpciBwcm9ibGVtcyB3aWxsIG5vdCBiZSBhdHRyaWJ1dGVkIGVycm9uZW91c2x5IHRvIGF1dGhvcnMgb2YgcHJldmlvdXMgdmVyc2lvbnMuXG5cblNvbWUgZGV2aWNlcyBhcmUgZGVzaWduZWQgdG8gZGVueSB1c2VycyBhY2Nlc3MgdG8gaW5zdGFsbCBvciBydW4gbW9kaWZpZWQgdmVyc2lvbnMgb2YgdGhlIHNvZnR3YXJlIGluc2lkZSB0aGVtLCBhbHRob3VnaCB0aGUgbWFudWZhY3R1cmVyIGNhbiBkbyBzby4gVGhpcyBpcyBmdW5kYW1lbnRhbGx5IGluY29tcGF0aWJsZSB3aXRoIHRoZSBhaW0gb2YgcHJvdGVjdGluZyB1c2VycycgZnJlZWRvbSB0byBjaGFuZ2UgdGhlIHNvZnR3YXJlLiBUaGUgc3lzdGVtYXRpYyBwYXR0ZXJuIG9mIHN1Y2ggYWJ1c2Ugb2NjdXJzIGluIHRoZSBhcmVhIG9mIHByb2R1Y3RzIGZvciBpbmRpdmlkdWFscyB0byB1c2UsIHdoaWNoIGlzIHByZWNpc2VseSB3aGVyZSBpdCBpcyBtb3N0IHVuYWNjZXB0YWJsZS4gVGhlcmVmb3JlLCB3ZSBoYXZlIGRlc2lnbmVkIHRoaXMgdmVyc2lvbiBvZiB0aGUgR1BMIHRvIHByb2hpYml0IHRoZSBwcmFjdGljZSBmb3IgdGhvc2UgcHJvZHVjdHMuIElmIHN1Y2ggcHJvYmxlbXMgYXJpc2Ugc3Vic3RhbnRpYWxseSBpbiBvdGhlciBkb21haW5zLCB3ZSBzdGFuZCByZWFkeSB0byBleHRlbmQgdGhpcyBwcm92aXNpb24gdG8gdGhvc2UgZG9tYWlucyBpbiBmdXR1cmUgdmVyc2lvbnMgb2YgdGhlIEdQTCwgYXMgbmVlZGVkIHRvIHByb3RlY3QgdGhlIGZyZWVkb20gb2YgdXNlcnMuXG5cbkZpbmFsbHksIGV2ZXJ5IHByb2dyYW0gaXMgdGhyZWF0ZW5lZCBjb25zdGFudGx5IGJ5IHNvZnR3YXJlIHBhdGVudHMuIFN0YXRlcyBzaG91bGQgbm90IGFsbG93IHBhdGVudHMgdG8gcmVzdHJpY3QgZGV2ZWxvcG1lbnQgYW5kIHVzZSBvZiBzb2Z0d2FyZSBvbiBnZW5lcmFsLXB1cnBvc2UgY29tcHV0ZXJzLCBidXQgaW4gdGhvc2UgdGhhdCBkbywgd2Ugd2lzaCB0byBhdm9pZCB0aGUgc3BlY2lhbCBkYW5nZXIgdGhhdCBwYXRlbnRzIGFwcGxpZWQgdG8gYSBmcmVlIHByb2dyYW0gY291bGQgbWFrZSBpdCBlZmZlY3RpdmVseSBwcm9wcmlldGFyeS4gVG8gcHJldmVudCB0aGlzLCB0aGUgR1BMIGFzc3VyZXMgdGhhdCBwYXRlbnRzIGNhbm5vdCBiZSB1c2VkIHRvIHJlbmRlciB0aGUgcHJvZ3JhbSBub24tZnJlZS5cblxuVGhlIHByZWNpc2UgdGVybXMgYW5kIGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQgbW9kaWZpY2F0aW9uIGZvbGxvdy5cblxuW2JdVEVSTVMgQU5EIENPTkRJVElPTlNbXC9iXVxuW3VdW2ldMC4gRGVmaW5pdGlvbnMuW1wvaV1bXC91XVxuXHUyMDFjVGhpcyBMaWNlbnNlXHUyMDFkIHJlZmVycyB0byB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLlxuXG5cdTIwMWNDb3B5cmlnaHRcdTIwMWQgYWxzbyBtZWFucyBjb3B5cmlnaHQtbGlrZSBsYXdzIHRoYXQgYXBwbHkgdG8gb3RoZXIga2luZHMgb2Ygd29ya3MsIHN1Y2ggYXMgc2VtaWNvbmR1Y3RvciBtYXNrcy5cblxuXHUyMDFjVGhlIFByb2dyYW1cdTIwMWQgcmVmZXJzIHRvIGFueSBjb3B5cmlnaHRhYmxlIHdvcmsgbGljZW5zZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiBFYWNoIGxpY2Vuc2VlIGlzIGFkZHJlc3NlZCBhcyBcdTIwMWN5b3VcdTIwMWQuIFx1MjAxY0xpY2Vuc2Vlc1x1MjAxZCBhbmQgXHUyMDFjcmVjaXBpZW50c1x1MjAxZCBtYXkgYmUgaW5kaXZpZHVhbHMgb3Igb3JnYW5pemF0aW9ucy5cblxuVG8gXHUyMDFjbW9kaWZ5XHUyMDFkIGEgd29yayBtZWFucyB0byBjb3B5IGZyb20gb3IgYWRhcHQgYWxsIG9yIHBhcnQgb2YgdGhlIHdvcmsgaW4gYSBmYXNoaW9uIHJlcXVpcmluZyBjb3B5cmlnaHQgcGVybWlzc2lvbiwgb3RoZXIgdGhhbiB0aGUgbWFraW5nIG9mIGFuIGV4YWN0IGNvcHkuIFRoZSByZXN1bHRpbmcgd29yayBpcyBjYWxsZWQgYSBcdTIwMWNtb2RpZmllZCB2ZXJzaW9uXHUyMDFkIG9mIHRoZSBlYXJsaWVyIHdvcmsgb3IgYSB3b3JrIFx1MjAxY2Jhc2VkIG9uXHUyMDFkIHRoZSBlYXJsaWVyIHdvcmsuXG5cbkEgXHUyMDFjY292ZXJlZCB3b3JrXHUyMDFkIG1lYW5zIGVpdGhlciB0aGUgdW5tb2RpZmllZCBQcm9ncmFtIG9yIGEgd29yayBiYXNlZCBvbiB0aGUgUHJvZ3JhbS5cblxuVG8gXHUyMDFjcHJvcGFnYXRlXHUyMDFkIGEgd29yayBtZWFucyB0byBkbyBhbnl0aGluZyB3aXRoIGl0IHRoYXQsIHdpdGhvdXQgcGVybWlzc2lvbiwgd291bGQgbWFrZSB5b3UgZGlyZWN0bHkgb3Igc2Vjb25kYXJpbHkgbGlhYmxlIGZvciBpbmZyaW5nZW1lbnQgdW5kZXIgYXBwbGljYWJsZSBjb3B5cmlnaHQgbGF3LCBleGNlcHQgZXhlY3V0aW5nIGl0IG9uIGEgY29tcHV0ZXIgb3IgbW9kaWZ5aW5nIGEgcHJpdmF0ZSBjb3B5LiBQcm9wYWdhdGlvbiBpbmNsdWRlcyBjb3B5aW5nLCBkaXN0cmlidXRpb24gKHdpdGggb3Igd2l0aG91dCBtb2RpZmljYXRpb24pLCBtYWtpbmcgYXZhaWxhYmxlIHRvIHRoZSBwdWJsaWMsIGFuZCBpbiBzb21lIGNvdW50cmllcyBvdGhlciBhY3Rpdml0aWVzIGFzIHdlbGwuXG5cblRvIFx1MjAxY2NvbnZleVx1MjAxZCBhIHdvcmsgbWVhbnMgYW55IGtpbmQgb2YgcHJvcGFnYXRpb24gdGhhdCBlbmFibGVzIG90aGVyIHBhcnRpZXMgdG8gbWFrZSBvciByZWNlaXZlIGNvcGllcy4gTWVyZSBpbnRlcmFjdGlvbiB3aXRoIGEgdXNlciB0aHJvdWdoIGEgY29tcHV0ZXIgbmV0d29yaywgd2l0aCBubyB0cmFuc2ZlciBvZiBhIGNvcHksIGlzIG5vdCBjb252ZXlpbmcuXG5cbkFuIGludGVyYWN0aXZlIHVzZXIgaW50ZXJmYWNlIGRpc3BsYXlzIFx1MjAxY0FwcHJvcHJpYXRlIExlZ2FsIE5vdGljZXNcdTIwMWQgdG8gdGhlIGV4dGVudCB0aGF0IGl0IGluY2x1ZGVzIGEgY29udmVuaWVudCBhbmQgcHJvbWluZW50bHkgdmlzaWJsZSBmZWF0dXJlIHRoYXQgKDEpIGRpc3BsYXlzIGFuIGFwcHJvcHJpYXRlIGNvcHlyaWdodCBub3RpY2UsIGFuZCAoMikgdGVsbHMgdGhlIHVzZXIgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhlIHdvcmsgKGV4Y2VwdCB0byB0aGUgZXh0ZW50IHRoYXQgd2FycmFudGllcyBhcmUgcHJvdmlkZWQpLCB0aGF0IGxpY2Vuc2VlcyBtYXkgY29udmV5IHRoZSB3b3JrIHVuZGVyIHRoaXMgTGljZW5zZSwgYW5kIGhvdyB0byB2aWV3IGEgY29weSBvZiB0aGlzIExpY2Vuc2UuIElmIHRoZSBpbnRlcmZhY2UgcHJlc2VudHMgYSBsaXN0IG9mIHVzZXIgY29tbWFuZHMgb3Igb3B0aW9ucywgc3VjaCBhcyBhIG1lbnUsIGEgcHJvbWluZW50IGl0ZW0gaW4gdGhlIGxpc3QgbWVldHMgdGhpcyBjcml0ZXJpb24uXG5cbltpXVt1XTEuIFNvdXJjZSBDb2RlLltcL3VdW1wvaV1cblRoZSBcdTIwMWNzb3VyY2UgY29kZVx1MjAxZCBmb3IgYSB3b3JrIG1lYW5zIHRoZSBwcmVmZXJyZWQgZm9ybSBvZiB0aGUgd29yayBmb3IgbWFraW5nIG1vZGlmaWNhdGlvbnMgdG8gaXQuIFx1MjAxY09iamVjdCBjb2RlXHUyMDFkIG1lYW5zIGFueSBub24tc291cmNlIGZvcm0gb2YgYSB3b3JrLlxuXG5BIFx1MjAxY1N0YW5kYXJkIEludGVyZmFjZVx1MjAxZCBtZWFucyBhbiBpbnRlcmZhY2UgdGhhdCBlaXRoZXIgaXMgYW4gb2ZmaWNpYWwgc3RhbmRhcmQgZGVmaW5lZCBieSBhIHJlY29nbml6ZWQgc3RhbmRhcmRzIGJvZHksIG9yLCBpbiB0aGUgY2FzZSBvZiBpbnRlcmZhY2VzIHNwZWNpZmllZCBmb3IgYSBwYXJ0aWN1bGFyIHByb2dyYW1taW5nIGxhbmd1YWdlLCBvbmUgdGhhdCBpcyB3aWRlbHkgdXNlZCBhbW9uZyBkZXZlbG9wZXJzIHdvcmtpbmcgaW4gdGhhdCBsYW5ndWFnZS5cblxuVGhlIFx1MjAxY1N5c3RlbSBMaWJyYXJpZXNcdTIwMWQgb2YgYW4gZXhlY3V0YWJsZSB3b3JrIGluY2x1ZGUgYW55dGhpbmcsIG90aGVyIHRoYW4gdGhlIHdvcmsgYXMgYSB3aG9sZSwgdGhhdCAoYSkgaXMgaW5jbHVkZWQgaW4gdGhlIG5vcm1hbCBmb3JtIG9mIHBhY2thZ2luZyBhIE1ham9yIENvbXBvbmVudCwgYnV0IHdoaWNoIGlzIG5vdCBwYXJ0IG9mIHRoYXQgTWFqb3IgQ29tcG9uZW50LCBhbmQgKGIpIHNlcnZlcyBvbmx5IHRvIGVuYWJsZSB1c2Ugb2YgdGhlIHdvcmsgd2l0aCB0aGF0IE1ham9yIENvbXBvbmVudCwgb3IgdG8gaW1wbGVtZW50IGEgU3RhbmRhcmQgSW50ZXJmYWNlIGZvciB3aGljaCBhbiBpbXBsZW1lbnRhdGlvbiBpcyBhdmFpbGFibGUgdG8gdGhlIHB1YmxpYyBpbiBzb3VyY2UgY29kZSBmb3JtLiBBIFx1MjAxY01ham9yIENvbXBvbmVudFx1MjAxZCwgaW4gdGhpcyBjb250ZXh0LCBtZWFucyBhIG1ham9yIGVzc2VudGlhbCBjb21wb25lbnQgKGtlcm5lbCwgd2luZG93IHN5c3RlbSwgYW5kIHNvIG9uKSBvZiB0aGUgc3BlY2lmaWMgb3BlcmF0aW5nIHN5c3RlbSAoaWYgYW55KSBvbiB3aGljaCB0aGUgZXhlY3V0YWJsZSB3b3JrIHJ1bnMsIG9yIGEgY29tcGlsZXIgdXNlZCB0byBwcm9kdWNlIHRoZSB3b3JrLCBvciBhbiBvYmplY3QgY29kZSBpbnRlcnByZXRlciB1c2VkIHRvIHJ1biBpdC5cblxuVGhlIFx1MjAxY0NvcnJlc3BvbmRpbmcgU291cmNlXHUyMDFkIGZvciBhIHdvcmsgaW4gb2JqZWN0IGNvZGUgZm9ybSBtZWFucyBhbGwgdGhlIHNvdXJjZSBjb2RlIG5lZWRlZCB0byBnZW5lcmF0ZSwgaW5zdGFsbCwgYW5kIChmb3IgYW4gZXhlY3V0YWJsZSB3b3JrKSBydW4gdGhlIG9iamVjdCBjb2RlIGFuZCB0byBtb2RpZnkgdGhlIHdvcmssIGluY2x1ZGluZyBzY3JpcHRzIHRvIGNvbnRyb2wgdGhvc2UgYWN0aXZpdGllcy4gSG93ZXZlciwgaXQgZG9lcyBub3QgaW5jbHVkZSB0aGUgd29yaydzIFN5c3RlbSBMaWJyYXJpZXMsIG9yIGdlbmVyYWwtcHVycG9zZSB0b29scyBvciBnZW5lcmFsbHkgYXZhaWxhYmxlIGZyZWUgcHJvZ3JhbXMgd2hpY2ggYXJlIHVzZWQgdW5tb2RpZmllZCBpbiBwZXJmb3JtaW5nIHRob3NlIGFjdGl2aXRpZXMgYnV0IHdoaWNoIGFyZSBub3QgcGFydCBvZiB0aGUgd29yay4gRm9yIGV4YW1wbGUsIENvcnJlc3BvbmRpbmcgU291cmNlIGluY2x1ZGVzIGludGVyZmFjZSBkZWZpbml0aW9uIGZpbGVzIGFzc29jaWF0ZWQgd2l0aCBzb3VyY2UgZmlsZXMgZm9yIHRoZSB3b3JrLCBhbmQgdGhlIHNvdXJjZSBjb2RlIGZvciBzaGFyZWQgbGlicmFyaWVzIGFuZCBkeW5hbWljYWxseSBsaW5rZWQgc3VicHJvZ3JhbXMgdGhhdCB0aGUgd29yayBpcyBzcGVjaWZpY2FsbHkgZGVzaWduZWQgdG8gcmVxdWlyZSwgc3VjaCBhcyBieSBpbnRpbWF0ZSBkYXRhIGNvbW11bmljYXRpb24gb3IgY29udHJvbCBmbG93IGJldHdlZW4gdGhvc2Ugc3VicHJvZ3JhbXMgYW5kIG90aGVyIHBhcnRzIG9mIHRoZSB3b3JrLlxuXG5UaGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgbmVlZCBub3QgaW5jbHVkZSBhbnl0aGluZyB0aGF0IHVzZXJzIGNhbiByZWdlbmVyYXRlIGF1dG9tYXRpY2FsbHkgZnJvbSBvdGhlciBwYXJ0cyBvZiB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UuXG5cblRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZSBmb3IgYSB3b3JrIGluIHNvdXJjZSBjb2RlIGZvcm0gaXMgdGhhdCBzYW1lIHdvcmsuXG5cbltpXVt1XTIuIEJhc2ljIFBlcm1pc3Npb25zLltcL3VdW1wvaV1cbkFsbCByaWdodHMgZ3JhbnRlZCB1bmRlciB0aGlzIExpY2Vuc2UgYXJlIGdyYW50ZWQgZm9yIHRoZSB0ZXJtIG9mIGNvcHlyaWdodCBvbiB0aGUgUHJvZ3JhbSwgYW5kIGFyZSBpcnJldm9jYWJsZSBwcm92aWRlZCB0aGUgc3RhdGVkIGNvbmRpdGlvbnMgYXJlIG1ldC4gVGhpcyBMaWNlbnNlIGV4cGxpY2l0bHkgYWZmaXJtcyB5b3VyIHVubGltaXRlZCBwZXJtaXNzaW9uIHRvIHJ1biB0aGUgdW5tb2RpZmllZCBQcm9ncmFtLiBUaGUgb3V0cHV0IGZyb20gcnVubmluZyBhIGNvdmVyZWQgd29yayBpcyBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZSBvbmx5IGlmIHRoZSBvdXRwdXQsIGdpdmVuIGl0cyBjb250ZW50LCBjb25zdGl0dXRlcyBhIGNvdmVyZWQgd29yay4gVGhpcyBMaWNlbnNlIGFja25vd2xlZGdlcyB5b3VyIHJpZ2h0cyBvZiBmYWlyIHVzZSBvciBvdGhlciBlcXVpdmFsZW50LCBhcyBwcm92aWRlZCBieSBjb3B5cmlnaHQgbGF3LlxuXG5Zb3UgbWF5IG1ha2UsIHJ1biBhbmQgcHJvcGFnYXRlIGNvdmVyZWQgd29ya3MgdGhhdCB5b3UgZG8gbm90IGNvbnZleSwgd2l0aG91dCBjb25kaXRpb25zIHNvIGxvbmcgYXMgeW91ciBsaWNlbnNlIG90aGVyd2lzZSByZW1haW5zIGluIGZvcmNlLiBZb3UgbWF5IGNvbnZleSBjb3ZlcmVkIHdvcmtzIHRvIG90aGVycyBmb3IgdGhlIHNvbGUgcHVycG9zZSBvZiBoYXZpbmcgdGhlbSBtYWtlIG1vZGlmaWNhdGlvbnMgZXhjbHVzaXZlbHkgZm9yIHlvdSwgb3IgcHJvdmlkZSB5b3Ugd2l0aCBmYWNpbGl0aWVzIGZvciBydW5uaW5nIHRob3NlIHdvcmtzLCBwcm92aWRlZCB0aGF0IHlvdSBjb21wbHkgd2l0aCB0aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlIGluIGNvbnZleWluZyBhbGwgbWF0ZXJpYWwgZm9yIHdoaWNoIHlvdSBkbyBub3QgY29udHJvbCBjb3B5cmlnaHQuIFRob3NlIHRodXMgbWFraW5nIG9yIHJ1bm5pbmcgdGhlIGNvdmVyZWQgd29ya3MgZm9yIHlvdSBtdXN0IGRvIHNvIGV4Y2x1c2l2ZWx5IG9uIHlvdXIgYmVoYWxmLCB1bmRlciB5b3VyIGRpcmVjdGlvbiBhbmQgY29udHJvbCwgb24gdGVybXMgdGhhdCBwcm9oaWJpdCB0aGVtIGZyb20gbWFraW5nIGFueSBjb3BpZXMgb2YgeW91ciBjb3B5cmlnaHRlZCBtYXRlcmlhbCBvdXRzaWRlIHRoZWlyIHJlbGF0aW9uc2hpcCB3aXRoIHlvdS5cblxuQ29udmV5aW5nIHVuZGVyIGFueSBvdGhlciBjaXJjdW1zdGFuY2VzIGlzIHBlcm1pdHRlZCBzb2xlbHkgdW5kZXIgdGhlIGNvbmRpdGlvbnMgc3RhdGVkIGJlbG93LiBTdWJsaWNlbnNpbmcgaXMgbm90IGFsbG93ZWQ7IHNlY3Rpb24gMTAgbWFrZXMgaXQgdW5uZWNlc3NhcnkuXG5cblt1XVtpXTMuIFByb3RlY3RpbmcgVXNlcnMnIExlZ2FsIFJpZ2h0cyBGcm9tIEFudGktQ2lyY3VtdmVudGlvbiBMYXcuW1wvaV1bXC91XVxuTm8gY292ZXJlZCB3b3JrIHNoYWxsIGJlIGRlZW1lZCBwYXJ0IG9mIGFuIGVmZmVjdGl2ZSB0ZWNobm9sb2dpY2FsIG1lYXN1cmUgdW5kZXIgYW55IGFwcGxpY2FibGUgbGF3IGZ1bGZpbGxpbmcgb2JsaWdhdGlvbnMgdW5kZXIgYXJ0aWNsZSAxMSBvZiB0aGUgV0lQTyBjb3B5cmlnaHQgdHJlYXR5IGFkb3B0ZWQgb24gMjAgRGVjZW1iZXIgMTk5Niwgb3Igc2ltaWxhciBsYXdzIHByb2hpYml0aW5nIG9yIHJlc3RyaWN0aW5nIGNpcmN1bXZlbnRpb24gb2Ygc3VjaCBtZWFzdXJlcy5cblxuV2hlbiB5b3UgY29udmV5IGEgY292ZXJlZCB3b3JrLCB5b3Ugd2FpdmUgYW55IGxlZ2FsIHBvd2VyIHRvIGZvcmJpZCBjaXJjdW12ZW50aW9uIG9mIHRlY2hub2xvZ2ljYWwgbWVhc3VyZXMgdG8gdGhlIGV4dGVudCBzdWNoIGNpcmN1bXZlbnRpb24gaXMgZWZmZWN0ZWQgYnkgZXhlcmNpc2luZyByaWdodHMgdW5kZXIgdGhpcyBMaWNlbnNlIHdpdGggcmVzcGVjdCB0byB0aGUgY292ZXJlZCB3b3JrLCBhbmQgeW91IGRpc2NsYWltIGFueSBpbnRlbnRpb24gdG8gbGltaXQgb3BlcmF0aW9uIG9yIG1vZGlmaWNhdGlvbiBvZiB0aGUgd29yayBhcyBhIG1lYW5zIG9mIGVuZm9yY2luZywgYWdhaW5zdCB0aGUgd29yaydzIHVzZXJzLCB5b3VyIG9yIHRoaXJkIHBhcnRpZXMnIGxlZ2FsIHJpZ2h0cyB0byBmb3JiaWQgY2lyY3VtdmVudGlvbiBvZiB0ZWNobm9sb2dpY2FsIG1lYXN1cmVzLlxuXG5baV1bdV00LiBDb252ZXlpbmcgVmVyYmF0aW0gQ29waWVzLltcL3VdW1wvaV1cbllvdSBtYXkgY29udmV5IHZlcmJhdGltIGNvcGllcyBvZiB0aGUgUHJvZ3JhbSdzIHNvdXJjZSBjb2RlIGFzIHlvdSByZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92aWRlZCB0aGF0IHlvdSBjb25zcGljdW91c2x5IGFuZCBhcHByb3ByaWF0ZWx5IHB1Ymxpc2ggb24gZWFjaCBjb3B5IGFuIGFwcHJvcHJpYXRlIGNvcHlyaWdodCBub3RpY2U7IGtlZXAgaW50YWN0IGFsbCBub3RpY2VzIHN0YXRpbmcgdGhhdCB0aGlzIExpY2Vuc2UgYW5kIGFueSBub24tcGVybWlzc2l2ZSB0ZXJtcyBhZGRlZCBpbiBhY2NvcmQgd2l0aCBzZWN0aW9uIDcgYXBwbHkgdG8gdGhlIGNvZGU7IGtlZXAgaW50YWN0IGFsbCBub3RpY2VzIG9mIHRoZSBhYnNlbmNlIG9mIGFueSB3YXJyYW50eTsgYW5kIGdpdmUgYWxsIHJlY2lwaWVudHMgYSBjb3B5IG9mIHRoaXMgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBQcm9ncmFtLlxuXG5Zb3UgbWF5IGNoYXJnZSBhbnkgcHJpY2Ugb3Igbm8gcHJpY2UgZm9yIGVhY2ggY29weSB0aGF0IHlvdSBjb252ZXksIGFuZCB5b3UgbWF5IG9mZmVyIHN1cHBvcnQgb3Igd2FycmFudHkgcHJvdGVjdGlvbiBmb3IgYSBmZWUuXG5cblt1XVtpXTUuIENvbnZleWluZyBNb2RpZmllZCBTb3VyY2UgVmVyc2lvbnMuW1wvaV1bXC91XVxuWW91IG1heSBjb252ZXkgYSB3b3JrIGJhc2VkIG9uIHRoZSBQcm9ncmFtLCBvciB0aGUgbW9kaWZpY2F0aW9ucyB0byBwcm9kdWNlIGl0IGZyb20gdGhlIFByb2dyYW0sIGluIHRoZSBmb3JtIG9mIHNvdXJjZSBjb2RlIHVuZGVyIHRoZSB0ZXJtcyBvZiBzZWN0aW9uIDQsIHByb3ZpZGVkIHRoYXQgeW91IGFsc28gbWVldCBhbGwgb2YgdGhlc2UgY29uZGl0aW9uczpcblxuYSkgVGhlIHdvcmsgbXVzdCBjYXJyeSBwcm9taW5lbnQgbm90aWNlcyBzdGF0aW5nIHRoYXQgeW91IG1vZGlmaWVkIGl0LCBhbmQgZ2l2aW5nIGEgcmVsZXZhbnQgZGF0ZS5cbmIpIFRoZSB3b3JrIG11c3QgY2FycnkgcHJvbWluZW50IG5vdGljZXMgc3RhdGluZyB0aGF0IGl0IGlzIHJlbGVhc2VkIHVuZGVyIHRoaXMgTGljZW5zZSBhbmQgYW55IGNvbmRpdGlvbnMgYWRkZWQgdW5kZXIgc2VjdGlvbiA3LiBUaGlzIHJlcXVpcmVtZW50IG1vZGlmaWVzIHRoZSByZXF1aXJlbWVudCBpbiBzZWN0aW9uIDQgdG8gXHUyMDFja2VlcCBpbnRhY3QgYWxsIG5vdGljZXNcdTIwMWQuXG5jKSBZb3UgbXVzdCBsaWNlbnNlIHRoZSBlbnRpcmUgd29yaywgYXMgYSB3aG9sZSwgdW5kZXIgdGhpcyBMaWNlbnNlIHRvIGFueW9uZSB3aG8gY29tZXMgaW50byBwb3NzZXNzaW9uIG9mIGEgY29weS4gVGhpcyBMaWNlbnNlIHdpbGwgdGhlcmVmb3JlIGFwcGx5LCBhbG9uZyB3aXRoIGFueSBhcHBsaWNhYmxlIHNlY3Rpb24gNyBhZGRpdGlvbmFsIHRlcm1zLCB0byB0aGUgd2hvbGUgb2YgdGhlIHdvcmssIGFuZCBhbGwgaXRzIHBhcnRzLCByZWdhcmRsZXNzIG9mIGhvdyB0aGV5IGFyZSBwYWNrYWdlZC4gVGhpcyBMaWNlbnNlIGdpdmVzIG5vIHBlcm1pc3Npb24gdG8gbGljZW5zZSB0aGUgd29yayBpbiBhbnkgb3RoZXIgd2F5LCBidXQgaXQgZG9lcyBub3QgaW52YWxpZGF0ZSBzdWNoIHBlcm1pc3Npb24gaWYgeW91IGhhdmUgc2VwYXJhdGVseSByZWNlaXZlZCBpdC5cbmQpIElmIHRoZSB3b3JrIGhhcyBpbnRlcmFjdGl2ZSB1c2VyIGludGVyZmFjZXMsIGVhY2ggbXVzdCBkaXNwbGF5IEFwcHJvcHJpYXRlIExlZ2FsIE5vdGljZXM7IGhvd2V2ZXIsIGlmIHRoZSBQcm9ncmFtIGhhcyBpbnRlcmFjdGl2ZSBpbnRlcmZhY2VzIHRoYXQgZG8gbm90IGRpc3BsYXkgQXBwcm9wcmlhdGUgTGVnYWwgTm90aWNlcywgeW91ciB3b3JrIG5lZWQgbm90IG1ha2UgdGhlbSBkbyBzby5cbkEgY29tcGlsYXRpb24gb2YgYSBjb3ZlcmVkIHdvcmsgd2l0aCBvdGhlciBzZXBhcmF0ZSBhbmQgaW5kZXBlbmRlbnQgd29ya3MsIHdoaWNoIGFyZSBub3QgYnkgdGhlaXIgbmF0dXJlIGV4dGVuc2lvbnMgb2YgdGhlIGNvdmVyZWQgd29yaywgYW5kIHdoaWNoIGFyZSBub3QgY29tYmluZWQgd2l0aCBpdCBzdWNoIGFzIHRvIGZvcm0gYSBsYXJnZXIgcHJvZ3JhbSwgaW4gb3Igb24gYSB2b2x1bWUgb2YgYSBzdG9yYWdlIG9yIGRpc3RyaWJ1dGlvbiBtZWRpdW0sIGlzIGNhbGxlZCBhbiBcdTIwMWNhZ2dyZWdhdGVcdTIwMWQgaWYgdGhlIGNvbXBpbGF0aW9uIGFuZCBpdHMgcmVzdWx0aW5nIGNvcHlyaWdodCBhcmUgbm90IHVzZWQgdG8gbGltaXQgdGhlIGFjY2VzcyBvciBsZWdhbCByaWdodHMgb2YgdGhlIGNvbXBpbGF0aW9uJ3MgdXNlcnMgYmV5b25kIHdoYXQgdGhlIGluZGl2aWR1YWwgd29ya3MgcGVybWl0LiBJbmNsdXNpb24gb2YgYSBjb3ZlcmVkIHdvcmsgaW4gYW4gYWdncmVnYXRlIGRvZXMgbm90IGNhdXNlIHRoaXMgTGljZW5zZSB0byBhcHBseSB0byB0aGUgb3RoZXIgcGFydHMgb2YgdGhlIGFnZ3JlZ2F0ZS5cblxuW3VdW2ldNi4gQ29udmV5aW5nIE5vbi1Tb3VyY2UgRm9ybXMuW1wvaV1bXC91XVxuWW91IG1heSBjb252ZXkgYSBjb3ZlcmVkIHdvcmsgaW4gb2JqZWN0IGNvZGUgZm9ybSB1bmRlciB0aGUgdGVybXMgb2Ygc2VjdGlvbnMgNCBhbmQgNSwgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBjb252ZXkgdGhlIG1hY2hpbmUtcmVhZGFibGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZSwgaW4gb25lIG9mIHRoZXNlIHdheXM6XG5cbmEpIENvbnZleSB0aGUgb2JqZWN0IGNvZGUgaW4sIG9yIGVtYm9kaWVkIGluLCBhIHBoeXNpY2FsIHByb2R1Y3QgKGluY2x1ZGluZyBhIHBoeXNpY2FsIGRpc3RyaWJ1dGlvbiBtZWRpdW0pLCBhY2NvbXBhbmllZCBieSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgZml4ZWQgb24gYSBkdXJhYmxlIHBoeXNpY2FsIG1lZGl1bSBjdXN0b21hcmlseSB1c2VkIGZvciBzb2Z0d2FyZSBpbnRlcmNoYW5nZS5cbmIpIENvbnZleSB0aGUgb2JqZWN0IGNvZGUgaW4sIG9yIGVtYm9kaWVkIGluLCBhIHBoeXNpY2FsIHByb2R1Y3QgKGluY2x1ZGluZyBhIHBoeXNpY2FsIGRpc3RyaWJ1dGlvbiBtZWRpdW0pLCBhY2NvbXBhbmllZCBieSBhIHdyaXR0ZW4gb2ZmZXIsIHZhbGlkIGZvciBhdCBsZWFzdCB0aHJlZSB5ZWFycyBhbmQgdmFsaWQgZm9yIGFzIGxvbmcgYXMgeW91IG9mZmVyIHNwYXJlIHBhcnRzIG9yIGN1c3RvbWVyIHN1cHBvcnQgZm9yIHRoYXQgcHJvZHVjdCBtb2RlbCwgdG8gZ2l2ZSBhbnlvbmUgd2hvIHBvc3Nlc3NlcyB0aGUgb2JqZWN0IGNvZGUgZWl0aGVyICgxKSBhIGNvcHkgb2YgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIGZvciBhbGwgdGhlIHNvZnR3YXJlIGluIHRoZSBwcm9kdWN0IHRoYXQgaXMgY292ZXJlZCBieSB0aGlzIExpY2Vuc2UsIG9uIGEgZHVyYWJsZSBwaHlzaWNhbCBtZWRpdW0gY3VzdG9tYXJpbHkgdXNlZCBmb3Igc29mdHdhcmUgaW50ZXJjaGFuZ2UsIGZvciBhIHByaWNlIG5vIG1vcmUgdGhhbiB5b3VyIHJlYXNvbmFibGUgY29zdCBvZiBwaHlzaWNhbGx5IHBlcmZvcm1pbmcgdGhpcyBjb252ZXlpbmcgb2Ygc291cmNlLCBvciAoMikgYWNjZXNzIHRvIGNvcHkgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIGZyb20gYSBuZXR3b3JrIHNlcnZlciBhdCBubyBjaGFyZ2UuXG5jKSBDb252ZXkgaW5kaXZpZHVhbCBjb3BpZXMgb2YgdGhlIG9iamVjdCBjb2RlIHdpdGggYSBjb3B5IG9mIHRoZSB3cml0dGVuIG9mZmVyIHRvIHByb3ZpZGUgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlLiBUaGlzIGFsdGVybmF0aXZlIGlzIGFsbG93ZWQgb25seSBvY2Nhc2lvbmFsbHkgYW5kIG5vbmNvbW1lcmNpYWxseSwgYW5kIG9ubHkgaWYgeW91IHJlY2VpdmVkIHRoZSBvYmplY3QgY29kZSB3aXRoIHN1Y2ggYW4gb2ZmZXIsIGluIGFjY29yZCB3aXRoIHN1YnNlY3Rpb24gNmIuXG5kKSBDb252ZXkgdGhlIG9iamVjdCBjb2RlIGJ5IG9mZmVyaW5nIGFjY2VzcyBmcm9tIGEgZGVzaWduYXRlZCBwbGFjZSAoZ3JhdGlzIG9yIGZvciBhIGNoYXJnZSksIGFuZCBvZmZlciBlcXVpdmFsZW50IGFjY2VzcyB0byB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgaW4gdGhlIHNhbWUgd2F5IHRocm91Z2ggdGhlIHNhbWUgcGxhY2UgYXQgbm8gZnVydGhlciBjaGFyZ2UuIFlvdSBuZWVkIG5vdCByZXF1aXJlIHJlY2lwaWVudHMgdG8gY29weSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgYWxvbmcgd2l0aCB0aGUgb2JqZWN0IGNvZGUuIElmIHRoZSBwbGFjZSB0byBjb3B5IHRoZSBvYmplY3QgY29kZSBpcyBhIG5ldHdvcmsgc2VydmVyLCB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgbWF5IGJlIG9uIGEgZGlmZmVyZW50IHNlcnZlciAob3BlcmF0ZWQgYnkgeW91IG9yIGEgdGhpcmQgcGFydHkpIHRoYXQgc3VwcG9ydHMgZXF1aXZhbGVudCBjb3B5aW5nIGZhY2lsaXRpZXMsIHByb3ZpZGVkIHlvdSBtYWludGFpbiBjbGVhciBkaXJlY3Rpb25zIG5leHQgdG8gdGhlIG9iamVjdCBjb2RlIHNheWluZyB3aGVyZSB0byBmaW5kIHRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZS4gUmVnYXJkbGVzcyBvZiB3aGF0IHNlcnZlciBob3N0cyB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UsIHlvdSByZW1haW4gb2JsaWdhdGVkIHRvIGVuc3VyZSB0aGF0IGl0IGlzIGF2YWlsYWJsZSBmb3IgYXMgbG9uZyBhcyBuZWVkZWQgdG8gc2F0aXNmeSB0aGVzZSByZXF1aXJlbWVudHMuXG5lKSBDb252ZXkgdGhlIG9iamVjdCBjb2RlIHVzaW5nIHBlZXItdG8tcGVlciB0cmFuc21pc3Npb24sIHByb3ZpZGVkIHlvdSBpbmZvcm0gb3RoZXIgcGVlcnMgd2hlcmUgdGhlIG9iamVjdCBjb2RlIGFuZCBDb3JyZXNwb25kaW5nIFNvdXJjZSBvZiB0aGUgd29yayBhcmUgYmVpbmcgb2ZmZXJlZCB0byB0aGUgZ2VuZXJhbCBwdWJsaWMgYXQgbm8gY2hhcmdlIHVuZGVyIHN1YnNlY3Rpb24gNmQuXG5BIHNlcGFyYWJsZSBwb3J0aW9uIG9mIHRoZSBvYmplY3QgY29kZSwgd2hvc2Ugc291cmNlIGNvZGUgaXMgZXhjbHVkZWQgZnJvbSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgYXMgYSBTeXN0ZW0gTGlicmFyeSwgbmVlZCBub3QgYmUgaW5jbHVkZWQgaW4gY29udmV5aW5nIHRoZSBvYmplY3QgY29kZSB3b3JrLlxuXG5BIFx1MjAxY1VzZXIgUHJvZHVjdFx1MjAxZCBpcyBlaXRoZXIgKDEpIGEgXHUyMDFjY29uc3VtZXIgcHJvZHVjdFx1MjAxZCwgd2hpY2ggbWVhbnMgYW55IHRhbmdpYmxlIHBlcnNvbmFsIHByb3BlcnR5IHdoaWNoIGlzIG5vcm1hbGx5IHVzZWQgZm9yIHBlcnNvbmFsLCBmYW1pbHksIG9yIGhvdXNlaG9sZCBwdXJwb3Nlcywgb3IgKDIpIGFueXRoaW5nIGRlc2lnbmVkIG9yIHNvbGQgZm9yIGluY29ycG9yYXRpb24gaW50byBhIGR3ZWxsaW5nLiBJbiBkZXRlcm1pbmluZyB3aGV0aGVyIGEgcHJvZHVjdCBpcyBhIGNvbnN1bWVyIHByb2R1Y3QsIGRvdWJ0ZnVsIGNhc2VzIHNoYWxsIGJlIHJlc29sdmVkIGluIGZhdm9yIG9mIGNvdmVyYWdlLiBGb3IgYSBwYXJ0aWN1bGFyIHByb2R1Y3QgcmVjZWl2ZWQgYnkgYSBwYXJ0aWN1bGFyIHVzZXIsIFx1MjAxY25vcm1hbGx5IHVzZWRcdTIwMWQgcmVmZXJzIHRvIGEgdHlwaWNhbCBvciBjb21tb24gdXNlIG9mIHRoYXQgY2xhc3Mgb2YgcHJvZHVjdCwgcmVnYXJkbGVzcyBvZiB0aGUgc3RhdHVzIG9mIHRoZSBwYXJ0aWN1bGFyIHVzZXIgb3Igb2YgdGhlIHdheSBpbiB3aGljaCB0aGUgcGFydGljdWxhciB1c2VyIGFjdHVhbGx5IHVzZXMsIG9yIGV4cGVjdHMgb3IgaXMgZXhwZWN0ZWQgdG8gdXNlLCB0aGUgcHJvZHVjdC4gQSBwcm9kdWN0IGlzIGEgY29uc3VtZXIgcHJvZHVjdCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIHByb2R1Y3QgaGFzIHN1YnN0YW50aWFsIGNvbW1lcmNpYWwsIGluZHVzdHJpYWwgb3Igbm9uLWNvbnN1bWVyIHVzZXMsIHVubGVzcyBzdWNoIHVzZXMgcmVwcmVzZW50IHRoZSBvbmx5IHNpZ25pZmljYW50IG1vZGUgb2YgdXNlIG9mIHRoZSBwcm9kdWN0LlxuXG5cdTIwMWNJbnN0YWxsYXRpb24gSW5mb3JtYXRpb25cdTIwMWQgZm9yIGEgVXNlciBQcm9kdWN0IG1lYW5zIGFueSBtZXRob2RzLCBwcm9jZWR1cmVzLCBhdXRob3JpemF0aW9uIGtleXMsIG9yIG90aGVyIGluZm9ybWF0aW9uIHJlcXVpcmVkIHRvIGluc3RhbGwgYW5kIGV4ZWN1dGUgbW9kaWZpZWQgdmVyc2lvbnMgb2YgYSBjb3ZlcmVkIHdvcmsgaW4gdGhhdCBVc2VyIFByb2R1Y3QgZnJvbSBhIG1vZGlmaWVkIHZlcnNpb24gb2YgaXRzIENvcnJlc3BvbmRpbmcgU291cmNlLiBUaGUgaW5mb3JtYXRpb24gbXVzdCBzdWZmaWNlIHRvIGVuc3VyZSB0aGF0IHRoZSBjb250aW51ZWQgZnVuY3Rpb25pbmcgb2YgdGhlIG1vZGlmaWVkIG9iamVjdCBjb2RlIGlzIGluIG5vIGNhc2UgcHJldmVudGVkIG9yIGludGVyZmVyZWQgd2l0aCBzb2xlbHkgYmVjYXVzZSBtb2RpZmljYXRpb24gaGFzIGJlZW4gbWFkZS5cblxuSWYgeW91IGNvbnZleSBhbiBvYmplY3QgY29kZSB3b3JrIHVuZGVyIHRoaXMgc2VjdGlvbiBpbiwgb3Igd2l0aCwgb3Igc3BlY2lmaWNhbGx5IGZvciB1c2UgaW4sIGEgVXNlciBQcm9kdWN0LCBhbmQgdGhlIGNvbnZleWluZyBvY2N1cnMgYXMgcGFydCBvZiBhIHRyYW5zYWN0aW9uIGluIHdoaWNoIHRoZSByaWdodCBvZiBwb3NzZXNzaW9uIGFuZCB1c2Ugb2YgdGhlIFVzZXIgUHJvZHVjdCBpcyB0cmFuc2ZlcnJlZCB0byB0aGUgcmVjaXBpZW50IGluIHBlcnBldHVpdHkgb3IgZm9yIGEgZml4ZWQgdGVybSAocmVnYXJkbGVzcyBvZiBob3cgdGhlIHRyYW5zYWN0aW9uIGlzIGNoYXJhY3Rlcml6ZWQpLCB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgY29udmV5ZWQgdW5kZXIgdGhpcyBzZWN0aW9uIG11c3QgYmUgYWNjb21wYW5pZWQgYnkgdGhlIEluc3RhbGxhdGlvbiBJbmZvcm1hdGlvbi4gQnV0IHRoaXMgcmVxdWlyZW1lbnQgZG9lcyBub3QgYXBwbHkgaWYgbmVpdGhlciB5b3Ugbm9yIGFueSB0aGlyZCBwYXJ0eSByZXRhaW5zIHRoZSBhYmlsaXR5IHRvIGluc3RhbGwgbW9kaWZpZWQgb2JqZWN0IGNvZGUgb24gdGhlIFVzZXIgUHJvZHVjdCAoZm9yIGV4YW1wbGUsIHRoZSB3b3JrIGhhcyBiZWVuIGluc3RhbGxlZCBpbiBST00pLlxuXG5UaGUgcmVxdWlyZW1lbnQgdG8gcHJvdmlkZSBJbnN0YWxsYXRpb24gSW5mb3JtYXRpb24gZG9lcyBub3QgaW5jbHVkZSBhIHJlcXVpcmVtZW50IHRvIGNvbnRpbnVlIHRvIHByb3ZpZGUgc3VwcG9ydCBzZXJ2aWNlLCB3YXJyYW50eSwgb3IgdXBkYXRlcyBmb3IgYSB3b3JrIHRoYXQgaGFzIGJlZW4gbW9kaWZpZWQgb3IgaW5zdGFsbGVkIGJ5IHRoZSByZWNpcGllbnQsIG9yIGZvciB0aGUgVXNlciBQcm9kdWN0IGluIHdoaWNoIGl0IGhhcyBiZWVuIG1vZGlmaWVkIG9yIGluc3RhbGxlZC4gQWNjZXNzIHRvIGEgbmV0d29yayBtYXkgYmUgZGVuaWVkIHdoZW4gdGhlIG1vZGlmaWNhdGlvbiBpdHNlbGYgbWF0ZXJpYWxseSBhbmQgYWR2ZXJzZWx5IGFmZmVjdHMgdGhlIG9wZXJhdGlvbiBvZiB0aGUgbmV0d29yayBvciB2aW9sYXRlcyB0aGUgcnVsZXMgYW5kIHByb3RvY29scyBmb3IgY29tbXVuaWNhdGlvbiBhY3Jvc3MgdGhlIG5ldHdvcmsuXG5cbkNvcnJlc3BvbmRpbmcgU291cmNlIGNvbnZleWVkLCBhbmQgSW5zdGFsbGF0aW9uIEluZm9ybWF0aW9uIHByb3ZpZGVkLCBpbiBhY2NvcmQgd2l0aCB0aGlzIHNlY3Rpb24gbXVzdCBiZSBpbiBhIGZvcm1hdCB0aGF0IGlzIHB1YmxpY2x5IGRvY3VtZW50ZWQgKGFuZCB3aXRoIGFuIGltcGxlbWVudGF0aW9uIGF2YWlsYWJsZSB0byB0aGUgcHVibGljIGluIHNvdXJjZSBjb2RlIGZvcm0pLCBhbmQgbXVzdCByZXF1aXJlIG5vIHNwZWNpYWwgcGFzc3dvcmQgb3Iga2V5IGZvciB1bnBhY2tpbmcsIHJlYWRpbmcgb3IgY29weWluZy5cblxuW3VdW2ldNy4gQWRkaXRpb25hbCBUZXJtcy5bXC9pXVtcL3VdXG5cdTIwMWNBZGRpdGlvbmFsIHBlcm1pc3Npb25zXHUyMDFkIGFyZSB0ZXJtcyB0aGF0IHN1cHBsZW1lbnQgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZSBieSBtYWtpbmcgZXhjZXB0aW9ucyBmcm9tIG9uZSBvciBtb3JlIG9mIGl0cyBjb25kaXRpb25zLiBBZGRpdGlvbmFsIHBlcm1pc3Npb25zIHRoYXQgYXJlIGFwcGxpY2FibGUgdG8gdGhlIGVudGlyZSBQcm9ncmFtIHNoYWxsIGJlIHRyZWF0ZWQgYXMgdGhvdWdoIHRoZXkgd2VyZSBpbmNsdWRlZCBpbiB0aGlzIExpY2Vuc2UsIHRvIHRoZSBleHRlbnQgdGhhdCB0aGV5IGFyZSB2YWxpZCB1bmRlciBhcHBsaWNhYmxlIGxhdy4gSWYgYWRkaXRpb25hbCBwZXJtaXNzaW9ucyBhcHBseSBvbmx5IHRvIHBhcnQgb2YgdGhlIFByb2dyYW0sIHRoYXQgcGFydCBtYXkgYmUgdXNlZCBzZXBhcmF0ZWx5IHVuZGVyIHRob3NlIHBlcm1pc3Npb25zLCBidXQgdGhlIGVudGlyZSBQcm9ncmFtIHJlbWFpbnMgZ292ZXJuZWQgYnkgdGhpcyBMaWNlbnNlIHdpdGhvdXQgcmVnYXJkIHRvIHRoZSBhZGRpdGlvbmFsIHBlcm1pc3Npb25zLlxuXG5XaGVuIHlvdSBjb252ZXkgYSBjb3B5IG9mIGEgY292ZXJlZCB3b3JrLCB5b3UgbWF5IGF0IHlvdXIgb3B0aW9uIHJlbW92ZSBhbnkgYWRkaXRpb25hbCBwZXJtaXNzaW9ucyBmcm9tIHRoYXQgY29weSwgb3IgZnJvbSBhbnkgcGFydCBvZiBpdC4gKEFkZGl0aW9uYWwgcGVybWlzc2lvbnMgbWF5IGJlIHdyaXR0ZW4gdG8gcmVxdWlyZSB0aGVpciBvd24gcmVtb3ZhbCBpbiBjZXJ0YWluIGNhc2VzIHdoZW4geW91IG1vZGlmeSB0aGUgd29yay4pIFlvdSBtYXkgcGxhY2UgYWRkaXRpb25hbCBwZXJtaXNzaW9ucyBvbiBtYXRlcmlhbCwgYWRkZWQgYnkgeW91IHRvIGEgY292ZXJlZCB3b3JrLCBmb3Igd2hpY2ggeW91IGhhdmUgb3IgY2FuIGdpdmUgYXBwcm9wcmlhdGUgY29weXJpZ2h0IHBlcm1pc3Npb24uXG5cbk5vdHdpdGhzdGFuZGluZyBhbnkgb3RoZXIgcHJvdmlzaW9uIG9mIHRoaXMgTGljZW5zZSwgZm9yIG1hdGVyaWFsIHlvdSBhZGQgdG8gYSBjb3ZlcmVkIHdvcmssIHlvdSBtYXkgKGlmIGF1dGhvcml6ZWQgYnkgdGhlIGNvcHlyaWdodCBob2xkZXJzIG9mIHRoYXQgbWF0ZXJpYWwpIHN1cHBsZW1lbnQgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZSB3aXRoIHRlcm1zOlxuXG5hKSBEaXNjbGFpbWluZyB3YXJyYW50eSBvciBsaW1pdGluZyBsaWFiaWxpdHkgZGlmZmVyZW50bHkgZnJvbSB0aGUgdGVybXMgb2Ygc2VjdGlvbnMgMTUgYW5kIDE2IG9mIHRoaXMgTGljZW5zZTsgb3JcbmIpIFJlcXVpcmluZyBwcmVzZXJ2YXRpb24gb2Ygc3BlY2lmaWVkIHJlYXNvbmFibGUgbGVnYWwgbm90aWNlcyBvciBhdXRob3IgYXR0cmlidXRpb25zIGluIHRoYXQgbWF0ZXJpYWwgb3IgaW4gdGhlIEFwcHJvcHJpYXRlIExlZ2FsIE5vdGljZXMgZGlzcGxheWVkIGJ5IHdvcmtzIGNvbnRhaW5pbmcgaXQ7IG9yXG5jKSBQcm9oaWJpdGluZyBtaXNyZXByZXNlbnRhdGlvbiBvZiB0aGUgb3JpZ2luIG9mIHRoYXQgbWF0ZXJpYWwsIG9yIHJlcXVpcmluZyB0aGF0IG1vZGlmaWVkIHZlcnNpb25zIG9mIHN1Y2ggbWF0ZXJpYWwgYmUgbWFya2VkIGluIHJlYXNvbmFibGUgd2F5cyBhcyBkaWZmZXJlbnQgZnJvbSB0aGUgb3JpZ2luYWwgdmVyc2lvbjsgb3JcbmQpIExpbWl0aW5nIHRoZSB1c2UgZm9yIHB1YmxpY2l0eSBwdXJwb3NlcyBvZiBuYW1lcyBvZiBsaWNlbnNvcnMgb3IgYXV0aG9ycyBvZiB0aGUgbWF0ZXJpYWw7IG9yXG5lKSBEZWNsaW5pbmcgdG8gZ3JhbnQgcmlnaHRzIHVuZGVyIHRyYWRlbWFyayBsYXcgZm9yIHVzZSBvZiBzb21lIHRyYWRlIG5hbWVzLCB0cmFkZW1hcmtzLCBvciBzZXJ2aWNlIG1hcmtzOyBvclxuZikgUmVxdWlyaW5nIGluZGVtbmlmaWNhdGlvbiBvZiBsaWNlbnNvcnMgYW5kIGF1dGhvcnMgb2YgdGhhdCBtYXRlcmlhbCBieSBhbnlvbmUgd2hvIGNvbnZleXMgdGhlIG1hdGVyaWFsIChvciBtb2RpZmllZCB2ZXJzaW9ucyBvZiBpdCkgd2l0aCBjb250cmFjdHVhbCBhc3N1bXB0aW9ucyBvZiBsaWFiaWxpdHkgdG8gdGhlIHJlY2lwaWVudCwgZm9yIGFueSBsaWFiaWxpdHkgdGhhdCB0aGVzZSBjb250cmFjdHVhbCBhc3N1bXB0aW9ucyBkaXJlY3RseSBpbXBvc2Ugb24gdGhvc2UgbGljZW5zb3JzIGFuZCBhdXRob3JzLlxuQWxsIG90aGVyIG5vbi1wZXJtaXNzaXZlIGFkZGl0aW9uYWwgdGVybXMgYXJlIGNvbnNpZGVyZWQgXHUyMDFjZnVydGhlciByZXN0cmljdGlvbnNcdTIwMWQgd2l0aGluIHRoZSBtZWFuaW5nIG9mIHNlY3Rpb24gMTAuIElmIHRoZSBQcm9ncmFtIGFzIHlvdSByZWNlaXZlZCBpdCwgb3IgYW55IHBhcnQgb2YgaXQsIGNvbnRhaW5zIGEgbm90aWNlIHN0YXRpbmcgdGhhdCBpdCBpcyBnb3Zlcm5lZCBieSB0aGlzIExpY2Vuc2UgYWxvbmcgd2l0aCBhIHRlcm0gdGhhdCBpcyBhIGZ1cnRoZXIgcmVzdHJpY3Rpb24sIHlvdSBtYXkgcmVtb3ZlIHRoYXQgdGVybS4gSWYgYSBsaWNlbnNlIGRvY3VtZW50IGNvbnRhaW5zIGEgZnVydGhlciByZXN0cmljdGlvbiBidXQgcGVybWl0cyByZWxpY2Vuc2luZyBvciBjb252ZXlpbmcgdW5kZXIgdGhpcyBMaWNlbnNlLCB5b3UgbWF5IGFkZCB0byBhIGNvdmVyZWQgd29yayBtYXRlcmlhbCBnb3Zlcm5lZCBieSB0aGUgdGVybXMgb2YgdGhhdCBsaWNlbnNlIGRvY3VtZW50LCBwcm92aWRlZCB0aGF0IHRoZSBmdXJ0aGVyIHJlc3RyaWN0aW9uIGRvZXMgbm90IHN1cnZpdmUgc3VjaCByZWxpY2Vuc2luZyBvciBjb252ZXlpbmcuXG5cbklmIHlvdSBhZGQgdGVybXMgdG8gYSBjb3ZlcmVkIHdvcmsgaW4gYWNjb3JkIHdpdGggdGhpcyBzZWN0aW9uLCB5b3UgbXVzdCBwbGFjZSwgaW4gdGhlIHJlbGV2YW50IHNvdXJjZSBmaWxlcywgYSBzdGF0ZW1lbnQgb2YgdGhlIGFkZGl0aW9uYWwgdGVybXMgdGhhdCBhcHBseSB0byB0aG9zZSBmaWxlcywgb3IgYSBub3RpY2UgaW5kaWNhdGluZyB3aGVyZSB0byBmaW5kIHRoZSBhcHBsaWNhYmxlIHRlcm1zLlxuXG5BZGRpdGlvbmFsIHRlcm1zLCBwZXJtaXNzaXZlIG9yIG5vbi1wZXJtaXNzaXZlLCBtYXkgYmUgc3RhdGVkIGluIHRoZSBmb3JtIG9mIGEgc2VwYXJhdGVseSB3cml0dGVuIGxpY2Vuc2UsIG9yIHN0YXRlZCBhcyBleGNlcHRpb25zOyB0aGUgYWJvdmUgcmVxdWlyZW1lbnRzIGFwcGx5IGVpdGhlciB3YXkuXG5cblt1XVtpXTguIFRlcm1pbmF0aW9uLltcL2ldW1wvdV1cbllvdSBtYXkgbm90IHByb3BhZ2F0ZSBvciBtb2RpZnkgYSBjb3ZlcmVkIHdvcmsgZXhjZXB0IGFzIGV4cHJlc3NseSBwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuIEFueSBhdHRlbXB0IG90aGVyd2lzZSB0byBwcm9wYWdhdGUgb3IgbW9kaWZ5IGl0IGlzIHZvaWQsIGFuZCB3aWxsIGF1dG9tYXRpY2FsbHkgdGVybWluYXRlIHlvdXIgcmlnaHRzIHVuZGVyIHRoaXMgTGljZW5zZSAoaW5jbHVkaW5nIGFueSBwYXRlbnQgbGljZW5zZXMgZ3JhbnRlZCB1bmRlciB0aGUgdGhpcmQgcGFyYWdyYXBoIG9mIHNlY3Rpb24gMTEpLlxuXG5Ib3dldmVyLCBpZiB5b3UgY2Vhc2UgYWxsIHZpb2xhdGlvbiBvZiB0aGlzIExpY2Vuc2UsIHRoZW4geW91ciBsaWNlbnNlIGZyb20gYSBwYXJ0aWN1bGFyIGNvcHlyaWdodCBob2xkZXIgaXMgcmVpbnN0YXRlZCAoYSkgcHJvdmlzaW9uYWxseSwgdW5sZXNzIGFuZCB1bnRpbCB0aGUgY29weXJpZ2h0IGhvbGRlciBleHBsaWNpdGx5IGFuZCBmaW5hbGx5IHRlcm1pbmF0ZXMgeW91ciBsaWNlbnNlLCBhbmQgKGIpIHBlcm1hbmVudGx5LCBpZiB0aGUgY29weXJpZ2h0IGhvbGRlciBmYWlscyB0byBub3RpZnkgeW91IG9mIHRoZSB2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5zIHByaW9yIHRvIDYwIGRheXMgYWZ0ZXIgdGhlIGNlc3NhdGlvbi5cblxuTW9yZW92ZXIsIHlvdXIgbGljZW5zZSBmcm9tIGEgcGFydGljdWxhciBjb3B5cmlnaHQgaG9sZGVyIGlzIHJlaW5zdGF0ZWQgcGVybWFuZW50bHkgaWYgdGhlIGNvcHlyaWdodCBob2xkZXIgbm90aWZpZXMgeW91IG9mIHRoZSB2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5zLCB0aGlzIGlzIHRoZSBmaXJzdCB0aW1lIHlvdSBoYXZlIHJlY2VpdmVkIG5vdGljZSBvZiB2aW9sYXRpb24gb2YgdGhpcyBMaWNlbnNlIChmb3IgYW55IHdvcmspIGZyb20gdGhhdCBjb3B5cmlnaHQgaG9sZGVyLCBhbmQgeW91IGN1cmUgdGhlIHZpb2xhdGlvbiBwcmlvciB0byAzMCBkYXlzIGFmdGVyIHlvdXIgcmVjZWlwdCBvZiB0aGUgbm90aWNlLlxuXG5UZXJtaW5hdGlvbiBvZiB5b3VyIHJpZ2h0cyB1bmRlciB0aGlzIHNlY3Rpb24gZG9lcyBub3QgdGVybWluYXRlIHRoZSBsaWNlbnNlcyBvZiBwYXJ0aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcyBvciByaWdodHMgZnJvbSB5b3UgdW5kZXIgdGhpcyBMaWNlbnNlLiBJZiB5b3VyIHJpZ2h0cyBoYXZlIGJlZW4gdGVybWluYXRlZCBhbmQgbm90IHBlcm1hbmVudGx5IHJlaW5zdGF0ZWQsIHlvdSBkbyBub3QgcXVhbGlmeSB0byByZWNlaXZlIG5ldyBsaWNlbnNlcyBmb3IgdGhlIHNhbWUgbWF0ZXJpYWwgdW5kZXIgc2VjdGlvbiAxMC5cblxuW2ldW3VdOS4gQWNjZXB0YW5jZSBOb3QgUmVxdWlyZWQgZm9yIEhhdmluZyBDb3BpZXMuW1wvdV1bXC9pXVxuWW91IGFyZSBub3QgcmVxdWlyZWQgdG8gYWNjZXB0IHRoaXMgTGljZW5zZSBpbiBvcmRlciB0byByZWNlaXZlIG9yIHJ1biBhIGNvcHkgb2YgdGhlIFByb2dyYW0uIEFuY2lsbGFyeSBwcm9wYWdhdGlvbiBvZiBhIGNvdmVyZWQgd29yayBvY2N1cnJpbmcgc29sZWx5IGFzIGEgY29uc2VxdWVuY2Ugb2YgdXNpbmcgcGVlci10by1wZWVyIHRyYW5zbWlzc2lvbiB0byByZWNlaXZlIGEgY29weSBsaWtld2lzZSBkb2VzIG5vdCByZXF1aXJlIGFjY2VwdGFuY2UuIEhvd2V2ZXIsIG5vdGhpbmcgb3RoZXIgdGhhbiB0aGlzIExpY2Vuc2UgZ3JhbnRzIHlvdSBwZXJtaXNzaW9uIHRvIHByb3BhZ2F0ZSBvciBtb2RpZnkgYW55IGNvdmVyZWQgd29yay4gVGhlc2UgYWN0aW9ucyBpbmZyaW5nZSBjb3B5cmlnaHQgaWYgeW91IGRvIG5vdCBhY2NlcHQgdGhpcyBMaWNlbnNlLiBUaGVyZWZvcmUsIGJ5IG1vZGlmeWluZyBvciBwcm9wYWdhdGluZyBhIGNvdmVyZWQgd29yaywgeW91IGluZGljYXRlIHlvdXIgYWNjZXB0YW5jZSBvZiB0aGlzIExpY2Vuc2UgdG8gZG8gc28uXG5cblt1XVtpXTEwLiBBdXRvbWF0aWMgTGljZW5zaW5nIG9mIERvd25zdHJlYW0gUmVjaXBpZW50cy5bXC9pXVtcL3VdXG5FYWNoIHRpbWUgeW91IGNvbnZleSBhIGNvdmVyZWQgd29yaywgdGhlIHJlY2lwaWVudCBhdXRvbWF0aWNhbGx5IHJlY2VpdmVzIGEgbGljZW5zZSBmcm9tIHRoZSBvcmlnaW5hbCBsaWNlbnNvcnMsIHRvIHJ1biwgbW9kaWZ5IGFuZCBwcm9wYWdhdGUgdGhhdCB3b3JrLCBzdWJqZWN0IHRvIHRoaXMgTGljZW5zZS4gWW91IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGVuZm9yY2luZyBjb21wbGlhbmNlIGJ5IHRoaXJkIHBhcnRpZXMgd2l0aCB0aGlzIExpY2Vuc2UuXG5cbkFuIFx1MjAxY2VudGl0eSB0cmFuc2FjdGlvblx1MjAxZCBpcyBhIHRyYW5zYWN0aW9uIHRyYW5zZmVycmluZyBjb250cm9sIG9mIGFuIG9yZ2FuaXphdGlvbiwgb3Igc3Vic3RhbnRpYWxseSBhbGwgYXNzZXRzIG9mIG9uZSwgb3Igc3ViZGl2aWRpbmcgYW4gb3JnYW5pemF0aW9uLCBvciBtZXJnaW5nIG9yZ2FuaXphdGlvbnMuIElmIHByb3BhZ2F0aW9uIG9mIGEgY292ZXJlZCB3b3JrIHJlc3VsdHMgZnJvbSBhbiBlbnRpdHkgdHJhbnNhY3Rpb24sIGVhY2ggcGFydHkgdG8gdGhhdCB0cmFuc2FjdGlvbiB3aG8gcmVjZWl2ZXMgYSBjb3B5IG9mIHRoZSB3b3JrIGFsc28gcmVjZWl2ZXMgd2hhdGV2ZXIgbGljZW5zZXMgdG8gdGhlIHdvcmsgdGhlIHBhcnR5J3MgcHJlZGVjZXNzb3IgaW4gaW50ZXJlc3QgaGFkIG9yIGNvdWxkIGdpdmUgdW5kZXIgdGhlIHByZXZpb3VzIHBhcmFncmFwaCwgcGx1cyBhIHJpZ2h0IHRvIHBvc3Nlc3Npb24gb2YgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIG9mIHRoZSB3b3JrIGZyb20gdGhlIHByZWRlY2Vzc29yIGluIGludGVyZXN0LCBpZiB0aGUgcHJlZGVjZXNzb3IgaGFzIGl0IG9yIGNhbiBnZXQgaXQgd2l0aCByZWFzb25hYmxlIGVmZm9ydHMuXG5cbllvdSBtYXkgbm90IGltcG9zZSBhbnkgZnVydGhlciByZXN0cmljdGlvbnMgb24gdGhlIGV4ZXJjaXNlIG9mIHRoZSByaWdodHMgZ3JhbnRlZCBvciBhZmZpcm1lZCB1bmRlciB0aGlzIExpY2Vuc2UuIEZvciBleGFtcGxlLCB5b3UgbWF5IG5vdCBpbXBvc2UgYSBsaWNlbnNlIGZlZSwgcm95YWx0eSwgb3Igb3RoZXIgY2hhcmdlIGZvciBleGVyY2lzZSBvZiByaWdodHMgZ3JhbnRlZCB1bmRlciB0aGlzIExpY2Vuc2UsIGFuZCB5b3UgbWF5IG5vdCBpbml0aWF0ZSBsaXRpZ2F0aW9uIChpbmNsdWRpbmcgYSBjcm9zcy1jbGFpbSBvciBjb3VudGVyY2xhaW0gaW4gYSBsYXdzdWl0KSBhbGxlZ2luZyB0aGF0IGFueSBwYXRlbnQgY2xhaW0gaXMgaW5mcmluZ2VkIGJ5IG1ha2luZywgdXNpbmcsIHNlbGxpbmcsIG9mZmVyaW5nIGZvciBzYWxlLCBvciBpbXBvcnRpbmcgdGhlIFByb2dyYW0gb3IgYW55IHBvcnRpb24gb2YgaXQuXG5cbltpXVt1XTExLiBQYXRlbnRzLltcL3VdW1wvaV1cbkEgXHUyMDFjY29udHJpYnV0b3JcdTIwMWQgaXMgYSBjb3B5cmlnaHQgaG9sZGVyIHdobyBhdXRob3JpemVzIHVzZSB1bmRlciB0aGlzIExpY2Vuc2Ugb2YgdGhlIFByb2dyYW0gb3IgYSB3b3JrIG9uIHdoaWNoIHRoZSBQcm9ncmFtIGlzIGJhc2VkLiBUaGUgd29yayB0aHVzIGxpY2Vuc2VkIGlzIGNhbGxlZCB0aGUgY29udHJpYnV0b3IncyBcdTIwMWNjb250cmlidXRvciB2ZXJzaW9uXHUyMDFkLlxuXG5BIGNvbnRyaWJ1dG9yJ3MgXHUyMDFjZXNzZW50aWFsIHBhdGVudCBjbGFpbXNcdTIwMWQgYXJlIGFsbCBwYXRlbnQgY2xhaW1zIG93bmVkIG9yIGNvbnRyb2xsZWQgYnkgdGhlIGNvbnRyaWJ1dG9yLCB3aGV0aGVyIGFscmVhZHkgYWNxdWlyZWQgb3IgaGVyZWFmdGVyIGFjcXVpcmVkLCB0aGF0IHdvdWxkIGJlIGluZnJpbmdlZCBieSBzb21lIG1hbm5lciwgcGVybWl0dGVkIGJ5IHRoaXMgTGljZW5zZSwgb2YgbWFraW5nLCB1c2luZywgb3Igc2VsbGluZyBpdHMgY29udHJpYnV0b3IgdmVyc2lvbiwgYnV0IGRvIG5vdCBpbmNsdWRlIGNsYWltcyB0aGF0IHdvdWxkIGJlIGluZnJpbmdlZCBvbmx5IGFzIGEgY29uc2VxdWVuY2Ugb2YgZnVydGhlciBtb2RpZmljYXRpb24gb2YgdGhlIGNvbnRyaWJ1dG9yIHZlcnNpb24uIEZvciBwdXJwb3NlcyBvZiB0aGlzIGRlZmluaXRpb24sIFx1MjAxY2NvbnRyb2xcdTIwMWQgaW5jbHVkZXMgdGhlIHJpZ2h0IHRvIGdyYW50IHBhdGVudCBzdWJsaWNlbnNlcyBpbiBhIG1hbm5lciBjb25zaXN0ZW50IHdpdGggdGhlIHJlcXVpcmVtZW50cyBvZiB0aGlzIExpY2Vuc2UuXG5cbkVhY2ggY29udHJpYnV0b3IgZ3JhbnRzIHlvdSBhIG5vbi1leGNsdXNpdmUsIHdvcmxkd2lkZSwgcm95YWx0eS1mcmVlIHBhdGVudCBsaWNlbnNlIHVuZGVyIHRoZSBjb250cmlidXRvcidzIGVzc2VudGlhbCBwYXRlbnQgY2xhaW1zLCB0byBtYWtlLCB1c2UsIHNlbGwsIG9mZmVyIGZvciBzYWxlLCBpbXBvcnQgYW5kIG90aGVyd2lzZSBydW4sIG1vZGlmeSBhbmQgcHJvcGFnYXRlIHRoZSBjb250ZW50cyBvZiBpdHMgY29udHJpYnV0b3IgdmVyc2lvbi5cblxuSW4gdGhlIGZvbGxvd2luZyB0aHJlZSBwYXJhZ3JhcGhzLCBhIFx1MjAxY3BhdGVudCBsaWNlbnNlXHUyMDFkIGlzIGFueSBleHByZXNzIGFncmVlbWVudCBvciBjb21taXRtZW50LCBob3dldmVyIGRlbm9taW5hdGVkLCBub3QgdG8gZW5mb3JjZSBhIHBhdGVudCAoc3VjaCBhcyBhbiBleHByZXNzIHBlcm1pc3Npb24gdG8gcHJhY3RpY2UgYSBwYXRlbnQgb3IgY292ZW5hbnQgbm90IHRvIHN1ZSBmb3IgcGF0ZW50IGluZnJpbmdlbWVudCkuIFRvIFx1MjAxY2dyYW50XHUyMDFkIHN1Y2ggYSBwYXRlbnQgbGljZW5zZSB0byBhIHBhcnR5IG1lYW5zIHRvIG1ha2Ugc3VjaCBhbiBhZ3JlZW1lbnQgb3IgY29tbWl0bWVudCBub3QgdG8gZW5mb3JjZSBhIHBhdGVudCBhZ2FpbnN0IHRoZSBwYXJ0eS5cblxuSWYgeW91IGNvbnZleSBhIGNvdmVyZWQgd29yaywga25vd2luZ2x5IHJlbHlpbmcgb24gYSBwYXRlbnQgbGljZW5zZSwgYW5kIHRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZSBvZiB0aGUgd29yayBpcyBub3QgYXZhaWxhYmxlIGZvciBhbnlvbmUgdG8gY29weSwgZnJlZSBvZiBjaGFyZ2UgYW5kIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UsIHRocm91Z2ggYSBwdWJsaWNseSBhdmFpbGFibGUgbmV0d29yayBzZXJ2ZXIgb3Igb3RoZXIgcmVhZGlseSBhY2Nlc3NpYmxlIG1lYW5zLCB0aGVuIHlvdSBtdXN0IGVpdGhlciAoMSkgY2F1c2UgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIHRvIGJlIHNvIGF2YWlsYWJsZSwgb3IgKDIpIGFycmFuZ2UgdG8gZGVwcml2ZSB5b3Vyc2VsZiBvZiB0aGUgYmVuZWZpdCBvZiB0aGUgcGF0ZW50IGxpY2Vuc2UgZm9yIHRoaXMgcGFydGljdWxhciB3b3JrLCBvciAoMykgYXJyYW5nZSwgaW4gYSBtYW5uZXIgY29uc2lzdGVudCB3aXRoIHRoZSByZXF1aXJlbWVudHMgb2YgdGhpcyBMaWNlbnNlLCB0byBleHRlbmQgdGhlIHBhdGVudCBsaWNlbnNlIHRvIGRvd25zdHJlYW0gcmVjaXBpZW50cy4gXHUyMDFjS25vd2luZ2x5IHJlbHlpbmdcdTIwMWQgbWVhbnMgeW91IGhhdmUgYWN0dWFsIGtub3dsZWRnZSB0aGF0LCBidXQgZm9yIHRoZSBwYXRlbnQgbGljZW5zZSwgeW91ciBjb252ZXlpbmcgdGhlIGNvdmVyZWQgd29yayBpbiBhIGNvdW50cnksIG9yIHlvdXIgcmVjaXBpZW50J3MgdXNlIG9mIHRoZSBjb3ZlcmVkIHdvcmsgaW4gYSBjb3VudHJ5LCB3b3VsZCBpbmZyaW5nZSBvbmUgb3IgbW9yZSBpZGVudGlmaWFibGUgcGF0ZW50cyBpbiB0aGF0IGNvdW50cnkgdGhhdCB5b3UgaGF2ZSByZWFzb24gdG8gYmVsaWV2ZSBhcmUgdmFsaWQuXG5cbklmLCBwdXJzdWFudCB0byBvciBpbiBjb25uZWN0aW9uIHdpdGggYSBzaW5nbGUgdHJhbnNhY3Rpb24gb3IgYXJyYW5nZW1lbnQsIHlvdSBjb252ZXksIG9yIHByb3BhZ2F0ZSBieSBwcm9jdXJpbmcgY29udmV5YW5jZSBvZiwgYSBjb3ZlcmVkIHdvcmssIGFuZCBncmFudCBhIHBhdGVudCBsaWNlbnNlIHRvIHNvbWUgb2YgdGhlIHBhcnRpZXMgcmVjZWl2aW5nIHRoZSBjb3ZlcmVkIHdvcmsgYXV0aG9yaXppbmcgdGhlbSB0byB1c2UsIHByb3BhZ2F0ZSwgbW9kaWZ5IG9yIGNvbnZleSBhIHNwZWNpZmljIGNvcHkgb2YgdGhlIGNvdmVyZWQgd29yaywgdGhlbiB0aGUgcGF0ZW50IGxpY2Vuc2UgeW91IGdyYW50IGlzIGF1dG9tYXRpY2FsbHkgZXh0ZW5kZWQgdG8gYWxsIHJlY2lwaWVudHMgb2YgdGhlIGNvdmVyZWQgd29yayBhbmQgd29ya3MgYmFzZWQgb24gaXQuXG5cbkEgcGF0ZW50IGxpY2Vuc2UgaXMgXHUyMDFjZGlzY3JpbWluYXRvcnlcdTIwMWQgaWYgaXQgZG9lcyBub3QgaW5jbHVkZSB3aXRoaW4gdGhlIHNjb3BlIG9mIGl0cyBjb3ZlcmFnZSwgcHJvaGliaXRzIHRoZSBleGVyY2lzZSBvZiwgb3IgaXMgY29uZGl0aW9uZWQgb24gdGhlIG5vbi1leGVyY2lzZSBvZiBvbmUgb3IgbW9yZSBvZiB0aGUgcmlnaHRzIHRoYXQgYXJlIHNwZWNpZmljYWxseSBncmFudGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gWW91IG1heSBub3QgY29udmV5IGEgY292ZXJlZCB3b3JrIGlmIHlvdSBhcmUgYSBwYXJ0eSB0byBhbiBhcnJhbmdlbWVudCB3aXRoIGEgdGhpcmQgcGFydHkgdGhhdCBpcyBpbiB0aGUgYnVzaW5lc3Mgb2YgZGlzdHJpYnV0aW5nIHNvZnR3YXJlLCB1bmRlciB3aGljaCB5b3UgbWFrZSBwYXltZW50IHRvIHRoZSB0aGlyZCBwYXJ0eSBiYXNlZCBvbiB0aGUgZXh0ZW50IG9mIHlvdXIgYWN0aXZpdHkgb2YgY29udmV5aW5nIHRoZSB3b3JrLCBhbmQgdW5kZXIgd2hpY2ggdGhlIHRoaXJkIHBhcnR5IGdyYW50cywgdG8gYW55IG9mIHRoZSBwYXJ0aWVzIHdobyB3b3VsZCByZWNlaXZlIHRoZSBjb3ZlcmVkIHdvcmsgZnJvbSB5b3UsIGEgZGlzY3JpbWluYXRvcnkgcGF0ZW50IGxpY2Vuc2UgKGEpIGluIGNvbm5lY3Rpb24gd2l0aCBjb3BpZXMgb2YgdGhlIGNvdmVyZWQgd29yayBjb252ZXllZCBieSB5b3UgKG9yIGNvcGllcyBtYWRlIGZyb20gdGhvc2UgY29waWVzKSwgb3IgKGIpIHByaW1hcmlseSBmb3IgYW5kIGluIGNvbm5lY3Rpb24gd2l0aCBzcGVjaWZpYyBwcm9kdWN0cyBvciBjb21waWxhdGlvbnMgdGhhdCBjb250YWluIHRoZSBjb3ZlcmVkIHdvcmssIHVubGVzcyB5b3UgZW50ZXJlZCBpbnRvIHRoYXQgYXJyYW5nZW1lbnQsIG9yIHRoYXQgcGF0ZW50IGxpY2Vuc2Ugd2FzIGdyYW50ZWQsIHByaW9yIHRvIDI4IE1hcmNoIDIwMDcuXG5cbk5vdGhpbmcgaW4gdGhpcyBMaWNlbnNlIHNoYWxsIGJlIGNvbnN0cnVlZCBhcyBleGNsdWRpbmcgb3IgbGltaXRpbmcgYW55IGltcGxpZWQgbGljZW5zZSBvciBvdGhlciBkZWZlbnNlcyB0byBpbmZyaW5nZW1lbnQgdGhhdCBtYXkgb3RoZXJ3aXNlIGJlIGF2YWlsYWJsZSB0byB5b3UgdW5kZXIgYXBwbGljYWJsZSBwYXRlbnQgbGF3LlxuXG5bdV1baV0xMi4gTm8gU3VycmVuZGVyIG9mIE90aGVycycgRnJlZWRvbS5bXC9pXVtcL3VdXG5JZiBjb25kaXRpb25zIGFyZSBpbXBvc2VkIG9uIHlvdSAod2hldGhlciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50IG9yIG90aGVyd2lzZSkgdGhhdCBjb250cmFkaWN0IHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZSwgdGhleSBkbyBub3QgZXhjdXNlIHlvdSBmcm9tIHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZS4gSWYgeW91IGNhbm5vdCBjb252ZXkgYSBjb3ZlcmVkIHdvcmsgc28gYXMgdG8gc2F0aXNmeSBzaW11bHRhbmVvdXNseSB5b3VyIG9ibGlnYXRpb25zIHVuZGVyIHRoaXMgTGljZW5zZSBhbmQgYW55IG90aGVyIHBlcnRpbmVudCBvYmxpZ2F0aW9ucywgdGhlbiBhcyBhIGNvbnNlcXVlbmNlIHlvdSBtYXkgbm90IGNvbnZleSBpdCBhdCBhbGwuIEZvciBleGFtcGxlLCBpZiB5b3UgYWdyZWUgdG8gdGVybXMgdGhhdCBvYmxpZ2F0ZSB5b3UgdG8gY29sbGVjdCBhIHJveWFsdHkgZm9yIGZ1cnRoZXIgY29udmV5aW5nIGZyb20gdGhvc2UgdG8gd2hvbSB5b3UgY29udmV5IHRoZSBQcm9ncmFtLCB0aGUgb25seSB3YXkgeW91IGNvdWxkIHNhdGlzZnkgYm90aCB0aG9zZSB0ZXJtcyBhbmQgdGhpcyBMaWNlbnNlIHdvdWxkIGJlIHRvIHJlZnJhaW4gZW50aXJlbHkgZnJvbSBjb252ZXlpbmcgdGhlIFByb2dyYW0uXG5cbltpXVt1XTEzLiBVc2Ugd2l0aCB0aGUgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLltcL3VdW1wvaV1cbk5vdHdpdGhzdGFuZGluZyBhbnkgb3RoZXIgcHJvdmlzaW9uIG9mIHRoaXMgTGljZW5zZSwgeW91IGhhdmUgcGVybWlzc2lvbiB0byBsaW5rIG9yIGNvbWJpbmUgYW55IGNvdmVyZWQgd29yayB3aXRoIGEgd29yayBsaWNlbnNlZCB1bmRlciB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBBZmZlcm8gR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpbnRvIGEgc2luZ2xlIGNvbWJpbmVkIHdvcmssIGFuZCB0byBjb252ZXkgdGhlIHJlc3VsdGluZyB3b3JrLiBUaGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlIHdpbGwgY29udGludWUgdG8gYXBwbHkgdG8gdGhlIHBhcnQgd2hpY2ggaXMgdGhlIGNvdmVyZWQgd29yaywgYnV0IHRoZSBzcGVjaWFsIHJlcXVpcmVtZW50cyBvZiB0aGUgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLCBzZWN0aW9uIDEzLCBjb25jZXJuaW5nIGludGVyYWN0aW9uIHRocm91Z2ggYSBuZXR3b3JrIHdpbGwgYXBwbHkgdG8gdGhlIGNvbWJpbmF0aW9uIGFzIHN1Y2guXG5cbltpXVt1XTE0LiBSZXZpc2VkIFZlcnNpb25zIG9mIHRoaXMgTGljZW5zZS5bXC91XVtcL2ldXG5UaGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIG1heSBwdWJsaXNoIHJldmlzZWQgYW5kXC9vciBuZXcgdmVyc2lvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZyb20gdGltZSB0byB0aW1lLiBTdWNoIG5ldyB2ZXJzaW9ucyB3aWxsIGJlIHNpbWlsYXIgaW4gc3Bpcml0IHRvIHRoZSBwcmVzZW50IHZlcnNpb24sIGJ1dCBtYXkgZGlmZmVyIGluIGRldGFpbCB0byBhZGRyZXNzIG5ldyBwcm9ibGVtcyBvciBjb25jZXJucy5cblxuRWFjaCB2ZXJzaW9uIGlzIGdpdmVuIGEgZGlzdGluZ3Vpc2hpbmcgdmVyc2lvbiBudW1iZXIuIElmIHRoZSBQcm9ncmFtIHNwZWNpZmllcyB0aGF0IGEgY2VydGFpbiBudW1iZXJlZCB2ZXJzaW9uIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBcdTIwMWNvciBhbnkgbGF0ZXIgdmVyc2lvblx1MjAxZCBhcHBsaWVzIHRvIGl0LCB5b3UgaGF2ZSB0aGUgb3B0aW9uIG9mIGZvbGxvd2luZyB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgZWl0aGVyIG9mIHRoYXQgbnVtYmVyZWQgdmVyc2lvbiBvciBvZiBhbnkgbGF0ZXIgdmVyc2lvbiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4gSWYgdGhlIFByb2dyYW0gZG9lcyBub3Qgc3BlY2lmeSBhIHZlcnNpb24gbnVtYmVyIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwgeW91IG1heSBjaG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi5cblxuSWYgdGhlIFByb2dyYW0gc3BlY2lmaWVzIHRoYXQgYSBwcm94eSBjYW4gZGVjaWRlIHdoaWNoIGZ1dHVyZSB2ZXJzaW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgY2FuIGJlIHVzZWQsIHRoYXQgcHJveHkncyBwdWJsaWMgc3RhdGVtZW50IG9mIGFjY2VwdGFuY2Ugb2YgYSB2ZXJzaW9uIHBlcm1hbmVudGx5IGF1dGhvcml6ZXMgeW91IHRvIGNob29zZSB0aGF0IHZlcnNpb24gZm9yIHRoZSBQcm9ncmFtLlxuXG5MYXRlciBsaWNlbnNlIHZlcnNpb25zIG1heSBnaXZlIHlvdSBhZGRpdGlvbmFsIG9yIGRpZmZlcmVudCBwZXJtaXNzaW9ucy4gSG93ZXZlciwgbm8gYWRkaXRpb25hbCBvYmxpZ2F0aW9ucyBhcmUgaW1wb3NlZCBvbiBhbnkgYXV0aG9yIG9yIGNvcHlyaWdodCBob2xkZXIgYXMgYSByZXN1bHQgb2YgeW91ciBjaG9vc2luZyB0byBmb2xsb3cgYSBsYXRlciB2ZXJzaW9uLlxuXG5bdV1baV0xNS4gRGlzY2xhaW1lciBvZiBXYXJyYW50eS5bXC9pXVtcL3VdXG5USEVSRSBJUyBOTyBXQVJSQU5UWSBGT1IgVEhFIFBST0dSQU0sIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVEIEJZIEFQUExJQ0FCTEUgTEFXLiBFWENFUFQgV0hFTiBPVEhFUldJU0UgU1RBVEVEIElOIFdSSVRJTkcgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORFwvT1IgT1RIRVIgUEFSVElFUyBQUk9WSURFIFRIRSBQUk9HUkFNIFx1MjAxY0FTIElTXHUyMDFkIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVJVEhFUiBFWFBSRVNTRUQgT1IgSU1QTElFRCwgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gVEhFIEVOVElSRSBSSVNLIEFTIFRPIFRIRSBRVUFMSVRZIEFORCBQRVJGT1JNQU5DRSBPRiBUSEUgUFJPR1JBTSBJUyBXSVRIIFlPVS4gU0hPVUxEIFRIRSBQUk9HUkFNIFBST1ZFIERFRkVDVElWRSwgWU9VIEFTU1VNRSBUSEUgQ09TVCBPRiBBTEwgTkVDRVNTQVJZIFNFUlZJQ0lORywgUkVQQUlSIE9SIENPUlJFQ1RJT04uXG5cblt1XVtpXTE2LiBMaW1pdGF0aW9uIG9mIExpYWJpbGl0eS5bXC9pXVtcL3VdXG5JTiBOTyBFVkVOVCBVTkxFU1MgUkVRVUlSRUQgQlkgQVBQTElDQUJMRSBMQVcgT1IgQUdSRUVEIFRPIElOIFdSSVRJTkcgV0lMTCBBTlkgQ09QWVJJR0hUIEhPTERFUiwgT1IgQU5ZIE9USEVSIFBBUlRZIFdITyBNT0RJRklFUyBBTkRcL09SIENPTlZFWVMgVEhFIFBST0dSQU0gQVMgUEVSTUlUVEVEIEFCT1ZFLCBCRSBMSUFCTEUgVE8gWU9VIEZPUiBEQU1BR0VTLCBJTkNMVURJTkcgQU5ZIEdFTkVSQUwsIFNQRUNJQUwsIElOQ0lERU5UQUwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTIEFSSVNJTkcgT1VUIE9GIFRIRSBVU0UgT1IgSU5BQklMSVRZIFRPIFVTRSBUSEUgUFJPR1JBTSAoSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBMT1NTIE9GIERBVEEgT1IgREFUQSBCRUlORyBSRU5ERVJFRCBJTkFDQ1VSQVRFIE9SIExPU1NFUyBTVVNUQUlORUQgQlkgWU9VIE9SIFRISVJEIFBBUlRJRVMgT1IgQSBGQUlMVVJFIE9GIFRIRSBQUk9HUkFNIFRPIE9QRVJBVEUgV0lUSCBBTlkgT1RIRVIgUFJPR1JBTVMpLCBFVkVOIElGIFNVQ0ggSE9MREVSIE9SIE9USEVSIFBBUlRZIEhBUyBCRUVOIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFUy5cblxuW3VdW2ldMTcuIEludGVycHJldGF0aW9uIG9mIFNlY3Rpb25zIDE1IGFuZCAxNi5bXC9pXVtcL3VdXG5JZiB0aGUgZGlzY2xhaW1lciBvZiB3YXJyYW50eSBhbmQgbGltaXRhdGlvbiBvZiBsaWFiaWxpdHkgcHJvdmlkZWQgYWJvdmUgY2Fubm90IGJlIGdpdmVuIGxvY2FsIGxlZ2FsIGVmZmVjdCBhY2NvcmRpbmcgdG8gdGhlaXIgdGVybXMsIHJldmlld2luZyBjb3VydHMgc2hhbGwgYXBwbHkgbG9jYWwgbGF3IHRoYXQgbW9zdCBjbG9zZWx5IGFwcHJveGltYXRlcyBhbiBhYnNvbHV0ZSB3YWl2ZXIgb2YgYWxsIGNpdmlsIGxpYWJpbGl0eSBpbiBjb25uZWN0aW9uIHdpdGggdGhlIFByb2dyYW0sIHVubGVzcyBhIHdhcnJhbnR5IG9yIGFzc3VtcHRpb24gb2YgbGlhYmlsaXR5IGFjY29tcGFuaWVzIGEgY29weSBvZiB0aGUgUHJvZ3JhbSBpbiByZXR1cm4gZm9yIGEgZmVlLlxuXG5FTkQgT0YgVEVSTVMgQU5EIENPTkRJVElPTlMiCiAgICAgICAgICAgICAgICAgICAgXQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CiAgICAgICAgXSwKICAgICAgICAibG9naW4iOiBmYWxzZSwKICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJ0YXJnZXQiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJwZXJtIjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgfQogICAgICAgIF0KICAgIH0KfQ==');
INSERT INTO `omacs` (`type`, `data`) VALUES
('menu', 'ewogICAgImhvbWUiOiB7CiAgICAgICAgInRpdGxlIjogIkhvbWUiLAogICAgICAgICJ0eXBlIjogImludGVybiIsCiAgICAgICAgInBlcm0iOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgImxvZ2luIjogZmFsc2UsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IHsKICAgICAgICAgICAgIjEiOiAiQWRtaW5pc3RyYXRvciIKICAgICAgICB9LAogICAgICAgICJ0YXJnZXQiOiAiaG9tZSIKICAgIH0sCiAgICAidXNlciI6IHsKICAgICAgICAidGl0bGUiOiAiVXNlciIsCiAgICAgICAgInR5cGUiOiAic3ViIiwKICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgIlVzZXIiLAogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgXSwKICAgICAgICAidGFyZ2V0IjogWwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAidGl0bGUiOiAiUHJvZmlsZSIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJpbnRlcm4iLAogICAgICAgICAgICAgICAgInBlcm0iOiBbXSwKICAgICAgICAgICAgICAgICJsb2dpbiI6IHRydWUsCiAgICAgICAgICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICAgICAgICAgIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgInRhcmdldCI6ICJwcm9maWxlIgogICAgICAgICAgICB9LAogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAidGl0bGUiOiAiTG9nb3V0IiwKICAgICAgICAgICAgICAgICJ0eXBlIjogImV4dGVybiIsCiAgICAgICAgICAgICAgICAicGVybSI6IFtdLAogICAgICAgICAgICAgICAgImxvZ2luIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAgICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAidGFyZ2V0IjogInVzZXJzXC9sb2dvdXQucGhwIgogICAgICAgICAgICB9CiAgICAgICAgXQogICAgfSwKICAgICJvbWFjcyI6IHsKICAgICAgICAidGl0bGUiOiAiT01BQ1MiLAogICAgICAgICJ0eXBlIjogInN1YiIsCiAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICIxIjogIkFkbWluaXN0cmF0b3IiCiAgICAgICAgfSwKICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgInRhcmdldCI6IHsKICAgICAgICAgICAgInVzZXJzIjogewogICAgICAgICAgICAgICAgInRpdGxlIjogIk1hbmFnZSB1c2VycyIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJpbnRlcm4iLAogICAgICAgICAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICAgICAgICAgIjEiOiAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJ0YXJnZXQiOiAidXNlcnMiCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJwZXJtIjogewogICAgICAgICAgICAgICAgInRpdGxlIjogIk1hbmFnZSBwZXJtaXNzaW9ucyIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJpbnRlcm4iLAogICAgICAgICAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICAgICAgICAgIjEiOiAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJ0YXJnZXQiOiAicGVybWlzc2lvbnMiCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJtZW51IjogewogICAgICAgICAgICAgICAgInRpdGxlIjogIk1lbnUgc2V0dGluZ3MiLAogICAgICAgICAgICAgICAgInR5cGUiOiAiaW50ZXJuIiwKICAgICAgICAgICAgICAgICJwZXJtIjogewogICAgICAgICAgICAgICAgICAgICIxIjogIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgImxvZ2luIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAgICAgICAgICJjYW5fZWRpdCI6IFsKICAgICAgICAgICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAidGFyZ2V0IjogIm1lbnUiCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJwYWdlcyI6IHsKICAgICAgICAgICAgICAgICJ0aXRsZSI6ICJQYWdlcyIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJpbnRlcm4iLAogICAgICAgICAgICAgICAgInRhcmdldCI6ICJwYWdlcyIsCiAgICAgICAgICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJwZXJtIjogewogICAgICAgICAgICAgICAgICAgICIxIjogIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJzdHlsZSI6IHsKICAgICAgICAgICAgICAgICJ0aXRsZSI6ICJTdHlsZSBzZXR0aW5ncyIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJpbnRlcm4iLAogICAgICAgICAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICAgICAgICAgIjEiOiAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJ0YXJnZXQiOiAib21hY3Nfc3R5bGUiCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJjYXJkcyI6IHsKICAgICAgICAgICAgICAgICJ0aXRsZSI6ICJDYXJkcyIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJpbnRlcm4iLAogICAgICAgICAgICAgICAgInRhcmdldCI6ICJjYXJkcyIsCiAgICAgICAgICAgICAgICAiZWRpdCI6IHRydWUsCiAgICAgICAgICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJwZXJtIjogewogICAgICAgICAgICAgICAgICAgICIxIjogIkFkbWluaXN0cmF0b3IiCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJkYXNoYm9hcmQiOiB7CiAgICAgICAgICAgICAgICAidGl0bGUiOiAiVXNlclNwaWNlIGRhc2hib2FyZCIsCiAgICAgICAgICAgICAgICAidHlwZSI6ICJleHRlcm4iLAogICAgICAgICAgICAgICAgInBlcm0iOiB7CiAgICAgICAgICAgICAgICAgICAgIjEiOiAiQWRtaW5pc3RyYXRvciIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAibG9naW4iOiB0cnVlLAogICAgICAgICAgICAgICAgImVkaXQiOiB0cnVlLAogICAgICAgICAgICAgICAgImNhbl9lZGl0IjogWwogICAgICAgICAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJ0YXJnZXQiOiAidXNlcnNcLyIKICAgICAgICAgICAgfQogICAgICAgIH0KICAgIH0sCiAgICAiaGVscCI6IHsKICAgICAgICAidGl0bGUiOiAiSGVscCIsCiAgICAgICAgInR5cGUiOiAiaW50ZXJuIiwKICAgICAgICAicGVybSI6IFsKICAgICAgICAgICAgIlVzZXIiLAogICAgICAgICAgICAiQWRtaW5pc3RyYXRvciIKICAgICAgICBdLAogICAgICAgICJsb2dpbiI6IGZhbHNlLAogICAgICAgICJlZGl0IjogdHJ1ZSwKICAgICAgICAiY2FuX2VkaXQiOiBbCiAgICAgICAgICAgICJBZG1pbmlzdHJhdG9yIgogICAgICAgIF0sCiAgICAgICAgInRhcmdldCI6ICJoZWxwIgogICAgfQp9');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `re_auth` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page`, `title`, `private`, `re_auth`) VALUES
(1, 'index.php', 'Home', 0, 0),
(2, 'z_us_root.php', '', 0, 0),
(3, 'users/account.php', 'Account Dashboard', 1, 0),
(4, 'users/admin.php', 'Admin Dashboard', 1, 0),
(5, 'users/admin_page.php', 'Pages Manager', 1, 0),
(6, 'users/admin_pages.php', 'Pages Manager', 1, 0),
(7, 'users/admin_permission.php', 'Permissions Manager', 1, 0),
(8, 'users/admin_permissions.php', 'Permissions Manager', 1, 0),
(9, 'users/admin_user.php', 'User Manager', 1, 0),
(10, 'users/admin_users.php', 'User Manager', 1, 1),
(11, 'users/edit_profile.php', 'Edit Profile', 1, 0),
(12, 'users/email_settings.php', 'Email Settings', 1, 0),
(13, 'users/email_test.php', 'Email Test', 1, 0),
(14, 'users/forgot_password.php', 'Forgotten Password', 0, 0),
(15, 'users/forgot_password_reset.php', 'Reset Forgotten Password', 0, 0),
(16, 'users/index.php', 'Home', 0, 0),
(17, 'users/init.php', '', 0, 0),
(18, 'users/join.php', 'Join', 0, 0),
(19, 'users/joinThankYou.php', 'Join', 0, 0),
(20, 'users/login.php', 'Login', 0, 0),
(21, 'users/logout.php', 'Logout', 0, 0),
(22, 'users/profile.php', 'Profile', 1, 0),
(23, 'users/times.php', '', 0, 0),
(24, 'users/user_settings.php', 'User Settings', 1, 0),
(25, 'users/verify.php', 'Account Verification', 0, 0),
(26, 'users/verify_resend.php', 'Account Verification', 0, 0),
(27, 'users/view_all_users.php', 'View All Users', 1, 0),
(28, 'usersc/empty.php', '', 0, 0),
(31, 'users/oauth_success.php', '', 0, 0),
(33, 'users/fb-callback.php', '', 0, 0),
(37, 'users/check_updates.php', 'Check For Updates', 1, 0),
(38, 'users/google_helpers.php', '', 0, 0),
(39, 'users/tomfoolery.php', 'Security Log', 1, 0),
(41, 'users/messages.php', 'Messages', 1, 0),
(42, 'users/message.php', 'Messages', 1, 0),
(44, 'users/admin_backup.php', 'Backup Manager', 1, 0),
(45, 'users/maintenance.php', 'Maintenance', 0, 0),
(47, 'users/mqtt_settings.php', 'MQTT Settings', 1, 0),
(49, 'users/admin_verify.php', 'Password Verification', 1, 0),
(50, 'users/cron_manager.php', 'Cron Manager', 1, 0),
(51, 'users/cron_post.php', '', 1, 0),
(52, 'users/admin_message.php', 'Messages Manager', 1, 0),
(53, 'users/admin_messages.php', 'Messages Manager', 1, 0),
(55, 'users/admin_logs.php', 'Logs Manager', 1, 0),
(56, 'users/admin_logs_exempt.php', 'Logs Manager', 1, 0),
(57, 'users/admin_logs_manager.php', 'Logs Manager', 1, 0),
(58, 'users/admin_logs_mapper.php', 'Logs Manager', 1, 0),
(68, 'users/update.php', 'Update Manager', 1, 0),
(69, 'users/admin_menu_item.php', 'Menu Manager', 1, 0),
(70, 'users/admin_menus.php', 'Menu Manager', 1, 0),
(71, 'users/admin_menu.php', 'Menu Manager', 1, 0),
(72, 'users/admin_ips.php', 'IP Manager', 1, 0),
(73, 'users/subscribe.php', '', 1, 0),
(74, 'users/admin_notifications.php', 'Notifications Manager', 1, 0),
(76, 'users/enable2fa.php', 'Enable 2 Factor Auth', 1, 0),
(77, 'users/disable2fa.php', 'Disable 2 Factor Auth', 1, 0),
(78, 'users/admin_forms.php', 'Form Manager', 1, 0),
(79, 'users/admin_form_views.php', 'Form View Manager', 1, 0),
(80, 'users/edit_form.php', 'Form Editor', 1, 0),
(81, 'users/admin_pin.php', 'Verification PIN Set', 1, 0),
(82, 'users/manage2fa.php', 'Manage Two FA', 1, 0),
(83, 'users/manage_sessions.php', 'Session Manage', 1, 0),
(84, 'users/admin_manage_sessions.php', 'Session Manage', 1, 1),
(85, '403.php', '', 1, 0),
(86, 'users/twofa.php', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `permission_page_matches`
--

CREATE TABLE `permission_page_matches` (
  `id` int(11) NOT NULL,
  `permission_id` int(15) NOT NULL,
  `page_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_page_matches`
--

INSERT INTO `permission_page_matches` (`id`, `permission_id`, `page_id`) VALUES
(2, 2, 27),
(3, 1, 24),
(4, 1, 22),
(5, 2, 13),
(6, 2, 12),
(7, 1, 11),
(8, 2, 10),
(9, 2, 9),
(10, 2, 8),
(11, 2, 7),
(12, 2, 6),
(13, 2, 5),
(14, 2, 4),
(15, 1, 3),
(16, 2, 37),
(17, 2, 39),
(19, 2, 40),
(21, 2, 41),
(23, 2, 42),
(27, 1, 42),
(28, 1, 27),
(29, 1, 41),
(30, 1, 40),
(31, 2, 44),
(32, 2, 47),
(33, 2, 51),
(34, 2, 50),
(35, 2, 49),
(36, 2, 53),
(37, 2, 52),
(38, 2, 68),
(39, 2, 55),
(40, 2, 56),
(41, 2, 71),
(42, 2, 58),
(43, 2, 57),
(44, 2, 53),
(45, 2, 74),
(46, 2, 75),
(47, 1, 75),
(48, 1, 76),
(49, 2, 76),
(50, 1, 77),
(51, 2, 77),
(52, 2, 78),
(53, 2, 80),
(54, 1, 81),
(55, 1, 82),
(56, 1, 83),
(57, 2, 84);

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('joppe', '[{\"db\":\"omacs\",\"table\":\"omacs\"},{\"db\":\"omacs\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('joppe', 'omacs', 'omacs', '{\"sorted_col\":\"`data` ASC\"}', '2019-01-13 12:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('joppe', '2019-01-13 12:23:46', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `bio`) VALUES
(1, 1, '&lt;h1&gt;This is the Admin&#039;s bio.&lt;/h1&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(50) NOT NULL,
  `recaptcha` int(1) NOT NULL DEFAULT '0',
  `force_ssl` int(1) NOT NULL,
  `css_sample` int(1) NOT NULL,
  `us_css1` varchar(255) NOT NULL,
  `us_css2` varchar(255) NOT NULL,
  `us_css3` varchar(255) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `language` varchar(255) NOT NULL,
  `track_guest` int(1) NOT NULL,
  `site_offline` int(1) NOT NULL,
  `force_pr` int(1) NOT NULL,
  `glogin` int(1) NOT NULL DEFAULT '0',
  `fblogin` int(1) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `gsecret` varchar(255) NOT NULL,
  `gredirect` varchar(255) NOT NULL,
  `ghome` varchar(255) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `fbsecret` varchar(255) NOT NULL,
  `fbcallback` varchar(255) NOT NULL,
  `graph_ver` varchar(255) NOT NULL,
  `finalredir` varchar(255) NOT NULL,
  `req_cap` int(1) NOT NULL,
  `req_num` int(1) NOT NULL,
  `min_pw` int(2) NOT NULL,
  `max_pw` int(3) NOT NULL,
  `min_un` int(2) NOT NULL,
  `max_un` int(3) NOT NULL,
  `messaging` int(1) NOT NULL,
  `snooping` int(1) NOT NULL,
  `echouser` int(11) NOT NULL,
  `wys` int(1) NOT NULL,
  `change_un` int(1) NOT NULL,
  `backup_dest` varchar(255) NOT NULL,
  `backup_source` varchar(255) NOT NULL,
  `backup_table` varchar(255) NOT NULL,
  `msg_notification` int(1) NOT NULL,
  `permission_restriction` int(1) NOT NULL,
  `auto_assign_un` int(1) NOT NULL,
  `page_permission_restriction` int(1) NOT NULL,
  `msg_blocked_users` int(1) NOT NULL,
  `msg_default_to` int(1) NOT NULL,
  `notifications` int(1) NOT NULL,
  `notif_daylimit` int(3) NOT NULL,
  `recap_public` varchar(100) NOT NULL,
  `recap_private` varchar(100) NOT NULL,
  `page_default_private` int(1) NOT NULL,
  `navigation_type` tinyint(1) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `custom_settings` int(1) NOT NULL,
  `system_announcement` varchar(255) NOT NULL,
  `twofa` int(1) DEFAULT '0',
  `force_notif` tinyint(1) DEFAULT NULL,
  `cron_ip` varchar(255) DEFAULT NULL,
  `registration` tinyint(1) DEFAULT NULL,
  `join_vericode_expiry` int(9) UNSIGNED NOT NULL,
  `reset_vericode_expiry` int(9) UNSIGNED NOT NULL,
  `admin_verify` tinyint(1) NOT NULL,
  `admin_verify_timeout` int(9) NOT NULL,
  `session_manager` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `recaptcha`, `force_ssl`, `css_sample`, `us_css1`, `us_css2`, `us_css3`, `site_name`, `language`, `track_guest`, `site_offline`, `force_pr`, `glogin`, `fblogin`, `gid`, `gsecret`, `gredirect`, `ghome`, `fbid`, `fbsecret`, `fbcallback`, `graph_ver`, `finalredir`, `req_cap`, `req_num`, `min_pw`, `max_pw`, `min_un`, `max_un`, `messaging`, `snooping`, `echouser`, `wys`, `change_un`, `backup_dest`, `backup_source`, `backup_table`, `msg_notification`, `permission_restriction`, `auto_assign_un`, `page_permission_restriction`, `msg_blocked_users`, `msg_default_to`, `notifications`, `notif_daylimit`, `recap_public`, `recap_private`, `page_default_private`, `navigation_type`, `copyright`, `custom_settings`, `system_announcement`, `twofa`, `force_notif`, `cron_ip`, `registration`, `join_vericode_expiry`, `reset_vericode_expiry`, `admin_verify`, `admin_verify_timeout`, `session_manager`) VALUES
(1, 0, 0, 0, '../users/css/color_schemes/bootstrap.min.css', '../users/css/sb-admin.css', '../users/css/custom.css', 'OMACS', 'en', 1, 0, 1, 0, 0, '', '', '', '', '', '', '', '', '', 0, 0, 6, 30, 4, 30, 0, 1, 0, 1, 0, '/', 'everything', '', 0, 0, 0, 0, 0, 1, 0, 7, '6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI', '6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe', 1, 1, 'Joppe Blondel', 1, '', 0, 0, 'off', 0, 48, 30, 1, 120, 0);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `migration` varchar(15) NOT NULL,
  `applied_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `migration`, `applied_on`) VALUES
(15, '1XdrInkjV86F', '2018-02-18 22:33:24'),
(16, '3GJYaKcqUtw7', '2018-04-25 16:51:08'),
(17, '3GJYaKcqUtz8', '2018-04-25 16:51:08'),
(18, '69qa8h6E1bzG', '2018-04-25 16:51:08'),
(19, '2XQjsKYJAfn1', '2018-04-25 16:51:08'),
(20, '549DLFeHMNw7', '2018-04-25 16:51:08'),
(21, '4Dgt2XVjgz2x', '2018-04-25 16:51:08'),
(22, 'VLBp32gTWvEo', '2018-04-25 16:51:08'),
(23, 'Q3KlhjdtxE5X', '2018-04-25 16:51:08'),
(24, 'ug5D3pVrNvfS', '2018-04-25 16:51:08'),
(25, '69FbVbv4Jtrz', '2018-04-25 16:51:09'),
(26, '4A6BdJHyvP4a', '2018-04-25 16:51:09'),
(27, '37wvsb5BzymK', '2018-04-25 16:51:09'),
(28, 'c7tZQf926zKq', '2018-04-25 16:51:09'),
(29, 'ockrg4eU33GP', '2018-04-25 16:51:09'),
(30, 'XX4zArPs4tor', '2018-04-25 16:51:09'),
(31, 'pv7r2EHbVvhD', '2018-04-26 00:00:00'),
(32, 'uNT7NpgcBDFD', '2018-04-26 00:00:00'),
(33, 'mS5VtQCZjyJs', '2018-05-24 13:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `email_new` varchar(155) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `permissions` int(11) NOT NULL,
  `logins` int(100) NOT NULL,
  `account_owner` tinyint(4) NOT NULL DEFAULT '0',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT '0',
  `vericode` varchar(15) NOT NULL,
  `vericode_expiry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL,
  `oauth_provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gpluslink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fb_uid` varchar(255) NOT NULL,
  `un_changed` int(1) NOT NULL,
  `msg_exempt` int(1) NOT NULL DEFAULT '0',
  `last_confirm` datetime DEFAULT NULL,
  `protected` int(1) NOT NULL DEFAULT '0',
  `dev_user` int(1) NOT NULL DEFAULT '0',
  `msg_notification` int(1) NOT NULL DEFAULT '1',
  `force_pr` int(1) NOT NULL DEFAULT '0',
  `twoKey` varchar(16) DEFAULT NULL,
  `twoEnabled` int(1) DEFAULT '0',
  `twoDate` datetime DEFAULT NULL,
  `cloak_allowed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_new`, `username`, `password`, `pin`, `fname`, `lname`, `permissions`, `logins`, `account_owner`, `account_id`, `company`, `join_date`, `last_login`, `email_verified`, `vericode`, `vericode_expiry`, `active`, `oauth_provider`, `oauth_uid`, `gender`, `locale`, `gpluslink`, `picture`, `created`, `modified`, `fb_uid`, `un_changed`, `msg_exempt`, `last_confirm`, `protected`, `dev_user`, `msg_notification`, `force_pr`, `twoKey`, `twoEnabled`, `twoDate`, `cloak_allowed`) VALUES
(1, 'email@address.com', NULL, 'admin', '$2y$12$q7PNOeushA4xHFsuA03ApOXOCB6iloV/hTi6SjYwC635AgHfjTNIC', NULL, 'OMACS', 'ADMIN', 1, 63, 1, 0, 'UserSpice', '2016-01-01 00:00:00', '2019-01-14 17:42:53', 1, 'CzK3eu1XDB0oytQ', '2019-01-14 16:44:21', 0, '', '', '', '', '', '', '0000-00-00 00:00:00', '1899-11-30 00:00:00', '', 0, 1, '2017-10-08 15:24:37', 1, 0, 1, 0, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(10) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `timestamp` varchar(15) NOT NULL,
  `user_id` int(10) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `ip`, `timestamp`, `user_id`, `session`) VALUES
(1, '192.168.178.1', '1547484561', 1, ''),
(3, '192.168.178.1', '1547484136', 11, '');

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uagent` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_matches`
--

CREATE TABLE `user_permission_matches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_permission_matches`
--

INSERT INTO `user_permission_matches` (`id`, `user_id`, `permission_id`) VALUES
(100, 1, 1),
(150, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `us_fingerprints`
--

CREATE TABLE `us_fingerprints` (
  `kFingerprintID` int(11) UNSIGNED NOT NULL,
  `fkUserID` int(11) NOT NULL,
  `Fingerprint` varchar(32) NOT NULL,
  `Fingerprint_Expiry` datetime NOT NULL,
  `Fingerprint_Added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_fingerprint_assets`
--

CREATE TABLE `us_fingerprint_assets` (
  `kFingerprintAssetID` int(11) UNSIGNED NOT NULL,
  `fkFingerprintID` int(11) NOT NULL,
  `IP_Address` varchar(255) NOT NULL,
  `User_Browser` varchar(255) NOT NULL,
  `User_OS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_forms`
--

CREATE TABLE `us_forms` (
  `id` int(11) NOT NULL,
  `form` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_form_validation`
--

CREATE TABLE `us_form_validation` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_form_validation`
--

INSERT INTO `us_form_validation` (`id`, `value`, `description`, `params`) VALUES
(1, 'min', 'Minimum # of Characters', 'number'),
(2, 'max', 'Maximum # of Characters', 'number'),
(3, 'is_numeric', 'Must be a number', 'true'),
(4, 'valid_email', 'Must be a valid email address', 'true'),
(5, '<', 'Must be a number less than', 'number'),
(6, '>', 'Must be a number greater than', 'number'),
(7, '<=', 'Must be a number less than or equal to', 'number'),
(8, '>=', 'Must be a number greater than or equal to', 'number'),
(9, '!=', 'Must not be equal to', 'text'),
(10, '==', 'Must be equal to', 'text'),
(11, 'is_integer', 'Must be an integer', 'true'),
(12, 'is_timezone', 'Must be a valid timezone name', 'true'),
(13, 'is_datetime', 'Must be a valid DateTime', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `us_form_views`
--

CREATE TABLE `us_form_views` (
  `id` int(11) NOT NULL,
  `form_name` varchar(255) NOT NULL,
  `view_name` varchar(255) NOT NULL,
  `fields` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_blacklist`
--

CREATE TABLE `us_ip_blacklist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `last_user` int(11) NOT NULL DEFAULT '0',
  `reason` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_blacklist`
--

INSERT INTO `us_ip_blacklist` (`id`, `ip`, `last_user`, `reason`) VALUES
(3, '192.168.0.21', 1, 0),
(4, '192.168.0.22', 1, 0),
(10, '192.168.0.222', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_list`
--

CREATE TABLE `us_ip_list` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_list`
--

INSERT INTO `us_ip_list` (`id`, `ip`, `user_id`, `timestamp`) VALUES
(1, '::1', 1, '2017-10-09 15:20:03'),
(2, '192.168.178.1', 1, '2019-01-14 16:42:53'),
(3, '130.89.231.205', 1, '2018-05-24 17:13:17'),
(4, '130.89.236.62', 11, '2018-05-29 12:57:30'),
(5, '130.89.92.100', 11, '2018-05-31 11:35:48'),
(6, '130.89.208.189', 11, '2019-01-14 12:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_whitelist`
--

CREATE TABLE `us_ip_whitelist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_whitelist`
--

INSERT INTO `us_ip_whitelist` (`id`, `ip`) VALUES
(2, '192.168.0.21'),
(3, '192.168.0.23');

-- --------------------------------------------------------

--
-- Table structure for table `us_user_sessions`
--

CREATE TABLE `us_user_sessions` (
  `kUserSessionID` int(11) UNSIGNED NOT NULL,
  `fkUserID` int(11) UNSIGNED NOT NULL,
  `UserFingerprint` varchar(255) NOT NULL,
  `UserSessionIP` varchar(255) NOT NULL,
  `UserSessionOS` varchar(255) NOT NULL,
  `UserSessionBrowser` varchar(255) NOT NULL,
  `UserSessionStarted` datetime NOT NULL,
  `UserSessionLastUsed` datetime DEFAULT NULL,
  `UserSessionLastPage` varchar(255) NOT NULL,
  `UserSessionEnded` tinyint(1) NOT NULL DEFAULT '0',
  `UserSessionEnded_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons_logs`
--
ALTER TABLE `crons_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_menus`
--
ALTER TABLE `groups_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_exempt`
--
ALTER TABLE `logs_exempt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `logs_exempt_type` (`name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mqtt`
--
ALTER TABLE `mqtt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`) USING BTREE;

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_fingerprints`
--
ALTER TABLE `us_fingerprints`
  ADD PRIMARY KEY (`kFingerprintID`);

--
-- Indexes for table `us_fingerprint_assets`
--
ALTER TABLE `us_fingerprint_assets`
  ADD PRIMARY KEY (`kFingerprintAssetID`);

--
-- Indexes for table `us_forms`
--
ALTER TABLE `us_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_form_validation`
--
ALTER TABLE `us_form_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_form_views`
--
ALTER TABLE `us_form_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_list`
--
ALTER TABLE `us_ip_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_user_sessions`
--
ALTER TABLE `us_user_sessions`
  ADD PRIMARY KEY (`kUserSessionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crons`
--
ALTER TABLE `crons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crons_logs`
--
ALTER TABLE `crons_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups_menus`
--
ALTER TABLE `groups_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `logs_exempt`
--
ALTER TABLE `logs_exempt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mqtt`
--
ALTER TABLE `mqtt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `us_fingerprints`
--
ALTER TABLE `us_fingerprints`
  MODIFY `kFingerprintID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_fingerprint_assets`
--
ALTER TABLE `us_fingerprint_assets`
  MODIFY `kFingerprintAssetID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_forms`
--
ALTER TABLE `us_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_form_validation`
--
ALTER TABLE `us_form_validation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `us_form_views`
--
ALTER TABLE `us_form_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `us_ip_list`
--
ALTER TABLE `us_ip_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `us_user_sessions`
--
ALTER TABLE `us_user_sessions`
  MODIFY `kUserSessionID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
