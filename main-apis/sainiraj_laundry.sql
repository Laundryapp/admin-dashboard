-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 14, 2018 at 01:56 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sainiraj_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_logininfo_master`
--

CREATE TABLE `tbl_admin_logininfo_master` (
  `aid` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `verification_key` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_users_master`
--

CREATE TABLE `tbl_admin_users_master` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A-Acctive, I - Inactive',
  `otp` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_communications`
--

CREATE TABLE `tbl_communications` (
  `commid` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_communications`
--

INSERT INTO `tbl_communications` (`commid`, `category_name`, `subject`, `message`, `created_date_time`) VALUES
(1, 'activation_mail_m', 'Account Activation', '<img class=\"img-responsive\" src=\"logo.png\" width=\"30%\"><br>\r\n<p style=\"color:#777;font-family:helvetica;font-style:italic;font-size:28px\";>Now, Always Get Sales > Your Ad Spends</p>\r\n <div style=\"color:#4da4af;font-family:Calibri;\">\r\n<h2 style=\"color:#4da4af;font-size:20px;\">Account Activation</h2>\r\n<p style=\"margin-top:-20px;\">Hello, FULLNAME</p>\r\n		<p>Thank you for registering with our website. To complete the process of sign-up please follow the below steps:</p>\r\n		\r\n		</p>\r\n		<p><strong>Step 1</strong> : Click the activation button provided below to verify your email address.</p>\r\n		\r\n		<p style=\"\"><a href=\"ACTIVATION_LINK\" class=\"button-0\">Click to Activate</a></p>\r\n		<p>Your Pay India account is subjected to following Terms & Conditions. \r\n		<a href=\"https://piscore.in/application/views/terms-conditions.php\">Read here</a><br>\r\n		For any issues feel free to contact <a href=\"mailto:customercare@piscore.in\">Customer Care</a></p>\r\n		<p><strong>Regards,</strong> <br> Laundry Team</p>', '2018-11-15 14:09:20'),
(2, 'Forgot Password', 'Forgot Password', '<img class=\"img-responsive\" src=\"logo.png\" width=\"30%\"><br>\r\n<p style=\"color:#777;font-family:helvetica;font-style:italic;font-size:28px\";>Now, Always Get Sales > Your Ad Spends</p>\r\n <div style=\"color:#4da4af;font-family:Calibri;\">\r\n<h2 style=\"color:#4da4af;font-size:20px;\">Forgot Password</h2><br>\r\n<p style=\"margin-top:-20px;\">Hi,</p>\r\n		<p style=\"text-align:justify;font-size:15px;margin-top:-10px;;\">  Click the link below to reset you account password:</p> <p>Activation Link: <a href=\"ACTIVATION_LINK\">ACTIVATION_LINK</a></p> <p>Regards, <br> Laundry Team</p>\r\n		</div>', '2018-11-15 14:10:01'),
(9, 'activation_mail_m', 'Account Activation', '<img class=\"img-responsive\" src=\"logo.png\" width=\"30%\"><br>\r\n<p style=\"color:#777;font-family:helvetica;font-style:italic;font-size:28px\";>Now, Always Get Sales > Your Ad Spends</p>\r\n <div style=\"color:#4da4af;font-family:Calibri;\">\r\n<h2 style=\"color:#4da4af;font-size:20px;\">Account Activation</h2>\r\n<p style=\"margin-top:-20px;\">Hello, FULLNAME</p>\r\n		<p>Thank you for registering with our website. To complete the process of sign-up please follow the below steps:</p>\r\n		<p><strong>Step 1</strong> : SMS the given OTP via your registered mobile number to 9030423457.</p>\r\n		<p>Your OTP: <span  style=\"font-size:20px;font-weight:800;\">MOBILE_ACTIVATION_CODE</span></p>\r\n		Example: OTP to 9030423457<br><br>\r\n		\r\n		</p>\r\n		<p><strong>Step 2</strong> : Click the activation button provided below to verify your email address.</p>\r\n		\r\n		<p style=\"\"><a href=\"ACTIVATION_LINK\" class=\"button-0\">Click to Activate</a></p>\r\n		<p>Your Pay India account is subjected to following Terms & Conditions. \r\n		<a href=\"https://piscore.in/application/views/terms-conditions.php\">Read here</a><br>\r\n		For any issues feel free to contact <a href=\"mailto:customercare@piscore.in\">Customer Care</a></p>\r\n		<p><strong>Regards,</strong> <br> Laundry Team</p>', '2018-11-15 14:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_drivers_master`
--

CREATE TABLE `tbl_drivers_master` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(10) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pancard` varchar(10) NOT NULL,
  `driving_license` varchar(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobile` bigint(12) NOT NULL,
  `alternate_mobile` varchar(100) NOT NULL,
  `timeframes` varchar(500) NOT NULL,
  `cab_type` varchar(50) NOT NULL,
  `cab_number` varchar(50) NOT NULL,
  `car_model` varchar(100) NOT NULL,
  `car_color` varchar(225) NOT NULL,
  `sms_verification_key` varchar(255) NOT NULL,
  `rest_verification_key` varchar(255) NOT NULL,
  `driver_token` varchar(500) NOT NULL,
  `profile_pic` varchar(500) NOT NULL,
  `driver_status` int(11) NOT NULL,
  `online_status` int(11) NOT NULL,
  `available_days` text NOT NULL,
  `available_timeframes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_drivers_master`
--

INSERT INTO `tbl_drivers_master` (`id`, `unique_id`, `name`, `email`, `password`, `pancard`, `driving_license`, `address`, `mobile`, `alternate_mobile`, `timeframes`, `cab_type`, `cab_number`, `car_model`, `car_color`, `sms_verification_key`, `rest_verification_key`, `driver_token`, `profile_pic`, `driver_status`, `online_status`, `available_days`, `available_timeframes`, `created_at`) VALUES
(1, 'MM_DR001', 'drv01', 'drv01@drvtest.com', 'ad19f17c7ac6d5fe5e559c05cc46c50e', '', 'Drver1', '1 , Mitcham Lane, LONDON', 7777777701, '', '', '', 'Dr 01 Ap 0101', '', '', '', '2ad8b695fc00981cf7e9d7220ef075b0', 'eA5GC3MxNkk:APA91bGCs1FNOoa4tlcuor1Fc-yDLNfc_wE7gcQKel6BJPGYC40CLAEKYFdFBut-RmMqP0jfBWbdahvEMBZxA992j13-HNCvd8AeIRKTRVjAdonjAcTzjshJy2tx6cGwHTnAcfJKMNGD', '', 0, 0, '', '', '2018-11-12 11:30:16'),
(2, 'MM_DR002', 'Drv02', 'drv02@drvtest.com', '92cb2da9a6ecafbbaac2e9c234ba139d', '', 'Drv02', '110 , Bulstrode Road, HOUNSLOW', 7777777702, '', '', '', 'Dr 02 Ap 0202', '', '', '', 'b1cb8f769d940144621a60e09163a4b2', 'eo3e7g3C6UE:APA91bFQujOdH8LiHcDsR_3ikxumtwrHhV8L1z0xMfbI3OWC3M03vYrD206K3RMDxmYEPS35tc6GWXuzmX5XieYqup-4BT9XoSady50yP1BrrL4ZuKB8BFLevyHHY3ShPqkuOLATBXPT', '', 0, 0, '', '', '2018-11-12 11:32:12'),
(3, 'MM_DR003', 'Drv03', 'drv03@drvtest.com', '756c9389dbe81aab531d0a9557f20f84', '', 'Drver03', '1a,  , Mitcham Lane, LONDON', 7777777703, '', '', '', 'DR03AP 0303', '', '', '', '9600f2b93bea100c6e32bbd24872699e', 'ciqKP9yB8OM:APA91bGBdoztvSuzDgKkVICHKOaSJK1NW5JuAyanYCL4TTVrBKYSbNFUEwUs46AgVbMA11ROJy1y7hOmNxt40Q6Txy41PG8n9W0IjtlxxLkfUyFmZkmM6pI3o49vOtNcIx3N5ESq8as9', '', 0, 0, '', '', '2018-11-12 11:36:17'),
(4, 'MM_DR004', 'Drv04', 'drv04@drvtest.com', '11446866a948b2fa86d66d6d854ebe0f', '', 'Driver04', '110 , Bulstrode Road, HOUNSLOW', 7777777704, '', '', '', 'Dr 04 Ap 0404', '', '', '', '3256e1b52563601416739bc0a85a0381', 'eo3e7g3C6UE:APA91bFQujOdH8LiHcDsR_3ikxumtwrHhV8L1z0xMfbI3OWC3M03vYrD206K3RMDxmYEPS35tc6GWXuzmX5XieYqup-4BT9XoSady50yP1BrrL4ZuKB8BFLevyHHY3ShPqkuOLATBXPT', '', 0, 0, '', '', '2018-11-12 11:38:01'),
(5, 'MM_DR005', 'Drv05', 'drv05@drvtest.com', 'e3761c8fc27162df5af554d3a36ff125', '', 'Driver05', '72 , Bulstrode Road, HOUNSLOW', 7777777705, '', '', '', 'Dr 05 Ap 0505', '', '', '', '479279073df7398af0068b553b655ed0', 'cWdx4jR1IOE:APA91bGogLAxuS7KKE-M2qFcCDyGbDba2M9uq3e4gYU4FhTMWfYtZMGUdi4Dc9ZzbRzl9VCSpHyxELaSs1nB61ABDDmBB9QADkLkdF3ulslARWwTT3LznRkDD9JW0Nuh3WeeF0knXqqo', '', 0, 0, '', '', '2018-11-12 11:39:54'),
(6, 'MM_DR006', 'Drv06', 'drv06@drvtest.com', 'ea29580662c5681bccc9644edcd46e6c', '', 'Drivrer06', '1a,  , Mitcham Lane, LONDON', 7777777706, '', '', '', 'Dr 06 Ap 0606', '', '', '', 'd19982b4e7576afab6eb6d730036b175', 'dhPhIUVFngA:APA91bEe1EEVF-xQ5fD7IpTGK_DlDEyqrjdufIj7k90yFNf3iSIxrSnnCAtIdt0-L_N6e9zRvAa8LXriNDOBZ1kWJU6PMJk9wL4aFuxs6PEO4gQBqbVY-YDnpmHjHuQ7ZxbcJJxCXmTo', '', 0, 0, '', '', '2018-11-12 11:43:07'),
(7, 'MM_DR007', 'Drv07', 'drv07@drvtest.com', '9be104f5e9aab29d6f045661641cb943', '', 'Driver07', '1 , Mitcham Lane, LONDON', 7777777707, '', '', '', 'Dr 07 Ap 0707', '', '', '', '90723f1964798f812dd04651e599923c', 'dJ0xQjUhBE8:APA91bGyZ8aM2K-bLUklPkCY0uIwXptK7GZ7ZKWibUKGKmJH0UjRXsjXDnRdZ6ctZ-aSHmXsKiHoIJU92m8hoAwymmTFMPAYjqD_oUlL6Jdn0YAkZ20xTy43PFny94D_gNIeHTP4laOu', '', 0, 0, '', '', '2018-11-12 11:51:34'),
(8, 'MM_DR008', 'Drv08', 'drv08@drvtest.com', 'cf0973cb144774d29df12994dd698b9e', '', 'Drovrr08', '1a,  , Mitcham Lane, LONDON', 7777777708, '', '', '', 'Dr 08 Ap 0808', '', '', '', '2df780685e384a2eb4eba9abddd8cb59', 'eo3e7g3C6UE:APA91bFQujOdH8LiHcDsR_3ikxumtwrHhV8L1z0xMfbI3OWC3M03vYrD206K3RMDxmYEPS35tc6GWXuzmX5XieYqup-4BT9XoSady50yP1BrrL4ZuKB8BFLevyHHY3ShPqkuOLATBXPT', '', 0, 0, '', '', '2018-11-12 11:53:15'),
(9, 'MM_DR009', 'Drv09', 'drv09@drvtest.com', '5abee2cadf949fc7e50e7e09e4418e00', '', 'Driver 09', '3-3a,  , Mitcham Lane, LONDON', 7777777709, '', '', '', 'Dr 09 Ap 0909', '', '', '', '9a0f2fd6bb0d06506e7ab5be3077612c', 'eo3e7g3C6UE:APA91bFQujOdH8LiHcDsR_3ikxumtwrHhV8L1z0xMfbI3OWC3M03vYrD206K3RMDxmYEPS35tc6GWXuzmX5XieYqup-4BT9XoSady50yP1BrrL4ZuKB8BFLevyHHY3ShPqkuOLATBXPT', '', 0, 0, '', '', '2018-11-12 11:54:58'),
(10, 'MM_DR010', 'Drv11', 'drv11@drvtest.com', 'a8ef6667ef4a6c58131608ed34064940', '', 'Driver11', '9a,  , Mitcham Lane, LONDON', 7777777711, '', '', '', 'Dr 11 Ap 1111', '', '', '', '20d3bb4aecfc0f25efa05cd990322d42', 'co1YgR4RpRs:APA91bG7avLijIZZMeHeiDmC-DBfHPE7sgv9e240BoFZu92lU3vZx5-y0Treq-L3S7vy2Q-r-pqFgwdNwn82bJnU4Tbni1vvnokjGBFHOQF8TNrzeEIKfSwXU_dSXpCRQ47zdf8RZmJ3', '', 0, 0, '', '', '2018-11-12 11:57:57'),
(11, 'MM_DR011', 'Drv12', 'drv12@drvtest.com', '8cd47a15db4fe2751471447e7ca6c068', '', 'Driver12', '1a,  , Mitcham Lane, LONDON', 7777777712, '', '', '', 'Dr 12 Ap 1212', '', '', '', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 'eo3e7g3C6UE:APA91bFQujOdH8LiHcDsR_3ikxumtwrHhV8L1z0xMfbI3OWC3M03vYrD206K3RMDxmYEPS35tc6GWXuzmX5XieYqup-4BT9XoSady50yP1BrrL4ZuKB8BFLevyHHY3ShPqkuOLATBXPT', '', 0, 0, '', '', '2018-11-12 11:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_history`
--

CREATE TABLE `tbl_login_history` (
  `logid` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `hostname` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `location` varchar(200) NOT NULL,
  `organization` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `login_date_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `prdid` int(10) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `cat_status` int(11) NOT NULL,
  `product_name` longtext NOT NULL,
  `product_description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `read_status` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`prdid`, `category_id`, `subcategory_id`, `cat_status`, `product_name`, `product_description`, `status`, `read_status`, `created_date`) VALUES
(4, 1, 1, 0, 'High Five', '5x Shirts washed ironed and hung', 1, 0, '2018-04-16 05:31:52'),
(5, 1, 2, 1, 'Hung Shirt', 'Washed, ironed and hung', 1, 0, '2018-04-17 11:32:21'),
(6, 1, 2, 1, 'Folded Shirt', 'Washed, ironed and folded', 1, 0, '2018-04-17 11:36:53'),
(7, 1, 2, 1, 'Silk Shirt', 'Cleaned, ironed and hung', 1, 0, '2018-04-17 11:37:05'),
(8, 1, 2, 1, 'Dinner Shirt', 'Cleaned, ironed and hung', 1, 0, '2018-04-17 11:40:28'),
(10, 1, 2, 2, '25X Hung shirts - Pre-paid', 'Excludes silk and dinner shirts', 1, 0, '2018-04-17 11:42:53'),
(11, 1, 2, 2, '100X Hung Shirts - Pre-paid', 'Excludes silk and dinner shirts', 1, 0, '2018-04-17 11:43:00'),
(12, 1, 2, 3, 'Hung Shirt - Iron Only ', 'You wash, We iron', 1, 0, '0000-00-00 00:00:00'),
(13, 1, 2, 3, 'Hung Shirt - Premium Service', 'Washed, ironed,hand finished with premium care', 1, 0, '0000-00-00 00:00:00'),
(14, 1, 3, 4, 'Blouse', 'Hand-finished, excludes silk and trim', 1, 0, '0000-00-00 00:00:00'),
(15, 1, 3, 4, 'Silk Blouse', 'Hand- finished, includes trim', 1, 0, '0000-00-00 00:00:00'),
(16, 1, 3, 5, '10x Blouses-pre- paid ', 'Excludes silk and trim', 1, 0, '0000-00-00 00:00:00'),
(17, 1, 3, 5, '25x Blouses - Pre - paid ', 'Excludes silk and trim', 1, 0, '0000-00-00 00:00:00'),
(18, 1, 4, 0, 'Hung T-Shirt', 'Includes polo shirts', 1, 0, '0000-00-00 00:00:00'),
(19, 1, 4, 0, 'Folded T-Shirt', 'iIncludes polo shirts', 1, 0, '0000-00-00 00:00:00'),
(20, 2, 1, 0, 'Wash, Tumble Dry & Fold', 'Excludes bedding & towels,-30* wash, tumble dried, not ironed', 1, 0, '0000-00-00 00:00:00'),
(21, 3, 1, 6, 'Single Bed Set', 'Bed Sheet, Duvet Cover, 1 Pillowcase', 1, 0, '0000-00-00 00:00:00'),
(22, 3, 1, 6, 'Double Bed Set', 'Bed Sheet, Duvet Cover, 2 pillowcase', 1, 0, '0000-00-00 00:00:00'),
(23, 3, 1, 6, 'King/Queen Bed Set', 'Bed Sheet, Duvet Cover, 4 Pillowcase', 1, 0, '0000-00-00 00:00:00'),
(24, 3, 1, 7, 'Pillow Case', 'Wash, iron and fold', 1, 0, '0000-00-00 00:00:00'),
(25, 3, 2, 0, 'Pillow Case', 'Wash, iron and fold', 1, 0, '0000-00-00 00:00:00'),
(26, 3, 2, 0, 'Pillow', 'Excludes feather/down pillows', 1, 0, '0000-00-00 00:00:00'),
(27, 3, 2, 0, 'Feather pillow', 'Includes down', 1, 0, '0000-00-00 00:00:00'),
(28, 3, 3, 0, 'Single Bed Sheet', 'Wash, iron and fold', 1, 0, '0000-00-00 00:00:00'),
(29, 3, 3, 0, 'Double Bed Sheet', 'Up to 220cm x 260cm', 1, 0, '0000-00-00 00:00:00'),
(30, 3, 3, 0, 'King/Queen Bed Sheet', 'From 220cm x 260cm and higher', 1, 0, '0000-00-00 00:00:00'),
(31, 3, 4, 8, 'Single Duvet', 'Excludes feather/down duvets', 1, 0, '0000-00-00 00:00:00'),
(32, 3, 4, 8, 'Double Duvet', 'Up to 225cm x 220cm. Excludes feather/down duvets', 1, 0, '0000-00-00 00:00:00'),
(33, 3, 4, 8, 'King/Queen Duvet', 'From 225cm x 220cm and higher. Excludes feather/down duvets', 1, 0, '0000-00-00 00:00:00'),
(34, 3, 4, 9, 'Feather Single Duvet', 'includes down', 1, 0, '0000-00-00 00:00:00'),
(35, 3, 4, 9, 'Feather Double Duvet', 'Up to 225cm x 220cm. Includes down', 1, 0, '0000-00-00 00:00:00'),
(36, 3, 4, 9, 'Feather King/Queen Duvet', 'From 225cm x 220cm and higher. Includes down', 1, 0, '0000-00-00 00:00:00'),
(37, 3, 5, 10, 'Single Duvet Cover', 'Wash, iron and fold', 1, 0, '0000-00-00 00:00:00'),
(38, 3, 5, 10, 'Double Duvet Cover', 'Up to 225cm x 220cm', 1, 0, '0000-00-00 00:00:00'),
(39, 3, 5, 10, 'King/Queen Duvet Cover', 'From 225cm x 220cm and higher', 1, 0, '0000-00-00 00:00:00'),
(40, 3, 6, 0, 'Blanket', 'Includes slankets', 1, 0, '0000-00-00 00:00:00'),
(41, 3, 7, 0, 'Bedspread', 'Any size up to 4m square', 1, 0, '0000-00-00 00:00:00'),
(42, 3, 8, 0, 'Single Sleeping Bag', 'Any season rating', 1, 0, '0000-00-00 00:00:00'),
(43, 3, 8, 0, 'Double Sleeping Bag', 'Any season rating', 1, 0, '0000-00-00 00:00:00'),
(44, 4, 1, 0, 'The Nine to Five', 'A two piece suit and 5x shirts', 1, 0, '0000-00-00 00:00:00'),
(45, 4, 2, 11, 'Two-Piece Suit', 'Blazer and trousers/skirt', 1, 0, '0000-00-00 00:00:00'),
(46, 4, 2, 11, 'Three-Piece Suit', 'Blazer , Waistcoat and trousers/skirt', 1, 0, '0000-00-00 00:00:00'),
(47, 4, 2, 12, '10x Two-Piece Suits - pre-…', 'Blazer and trousers/skirt', 1, 0, '0000-00-00 00:00:00'),
(48, 4, 2, 13, 'Tie', 'Includes bow ties', 1, 0, '0000-00-00 00:00:00'),
(49, 4, 2, 13, 'Waistcoat', 'Ironed and hung', 1, 0, '0000-00-00 00:00:00'),
(50, 4, 2, 13, 'Blazer', 'Excludes fur, leather and velvet', 1, 0, '0000-00-00 00:00:00'),
(51, 4, 2, 13, 'Kilt', 'underwear not included', 1, 0, '0000-00-00 00:00:00'),
(52, 4, 3, 14, 'Dinner Suit', 'Dinner jacket and trousers', 1, 0, '0000-00-00 00:00:00'),
(53, 4, 3, 14, 'Dinner Jacket', 'Excludes bow ties', 1, 0, '0000-00-00 00:00:00'),
(54, 4, 3, 15, 'Two-Piece Morning Suit', 'Tallcoat and trousers', 1, 0, '0000-00-00 00:00:00'),
(55, 4, 3, 15, 'Three-Piece Morning Suit', 'Tallcoat, Waiscoat and trousers', 1, 0, '0000-00-00 00:00:00'),
(56, 5, 1, 0, '3 Knitwear', 'Light and heavy Knitwear items, hung', 1, 0, '0000-00-00 00:00:00'),
(57, 5, 2, 0, 'Light Knitwear', 'Includes cashmere', 1, 0, '0000-00-00 00:00:00'),
(58, 5, 3, 0, 'Jumper', 'Includes cashmere', 1, 0, '0000-00-00 00:00:00'),
(59, 5, 4, 0, 'Folded Jumper', 'Includes cashmere', 1, 0, '0000-00-00 00:00:00'),
(60, 5, 5, 0, 'Heavy Knitwear', 'Includes cable knit', 1, 0, '0000-00-00 00:00:00'),
(61, 5, 6, 0, 'Cardigan', 'Includes cashmere', 1, 0, '0000-00-00 00:00:00'),
(62, 6, 1, 16, 'Trousers', 'Cleaned and ironed', 1, 0, '0000-00-00 00:00:00'),
(63, 6, 1, 16, 'Silk Trousers', 'Includes bead or sequin trim', 1, 0, '0000-00-00 00:00:00'),
(64, 6, 1, 17, '10x Trousers - Pre-paid', 'Excludes silk trousers', 1, 0, '0000-00-00 00:00:00'),
(65, 6, 1, 17, '25x Trousers - Pre-paid', 'Excludes silk trousers', 1, 0, '0000-00-00 00:00:00'),
(66, 6, 2, 0, 'Jeans ', 'Wash and iron', 1, 0, '0000-00-00 00:00:00'),
(67, 6, 3, 0, 'Shorts', 'Wash and iron', 1, 0, '0000-00-00 00:00:00'),
(68, 7, 1, 0, 'Dress 2 Impress', '2x dresses, excludes silk and evening dresses', 1, 0, '0000-00-00 00:00:00'),
(69, 7, 2, 18, 'Dress ', 'Excludes silk and leather', 1, 0, '0000-00-00 00:00:00'),
(70, 7, 2, 18, 'Silk Dress', 'Includes trim', 1, 0, '0000-00-00 00:00:00'),
(71, 7, 2, 18, 'Dress With Trim', 'Includes bead or sequin trim', 1, 0, '0000-00-00 00:00:00'),
(72, 7, 2, 18, 'Evening Dress', 'Excludes silk, fur, leather and velvet', 1, 0, '0000-00-00 00:00:00'),
(73, 7, 2, 19, '10x Dresses - Pre-paid', 'Excludes silk and leather', 1, 0, '0000-00-00 00:00:00'),
(74, 7, 2, 19, '25x Dresses - Pre-paid', 'Excludes silk and leather', 1, 0, '0000-00-00 00:00:00'),
(75, 7, 2, 20, 'Blouse', 'Excludes silk', 1, 0, '0000-00-00 00:00:00'),
(76, 7, 2, 20, 'Silk Blouse', 'Includes trim', 1, 0, '0000-00-00 00:00:00'),
(77, 7, 3, 0, 'Skirt', 'Excludes silk and leather', 1, 0, '0000-00-00 00:00:00'),
(78, 7, 3, 0, 'Silk Skirt', 'Includes bead or sequin trim', 1, 0, '0000-00-00 00:00:00'),
(79, 7, 3, 0, 'Skirt With Trim', 'Includes bead or sequin trim', 1, 0, '0000-00-00 00:00:00'),
(80, 8, 1, 21, 'Overcoat', 'Any length', 1, 0, '0000-00-00 00:00:00'),
(81, 8, 1, 22, 'Scarf', 'Includes silk', 1, 0, '0000-00-00 00:00:00'),
(82, 8, 2, 0, 'Blazer', 'Excludes fur, leather and velvet', 1, 0, '0000-00-00 00:00:00'),
(83, 8, 2, 0, 'Jacket', 'Excludes fur, leather and velvet', 1, 0, '0000-00-00 00:00:00'),
(84, 8, 2, 0, 'Jacket With Trim', 'Includes decorative trim', 1, 0, '0000-00-00 00:00:00'),
(85, 8, 3, 0, 'Fleece', 'Jackets or jumpers', 1, 0, '0000-00-00 00:00:00'),
(86, 9, 1, 0, 'Tie', 'Includes bow ties', 1, 0, '0000-00-00 00:00:00'),
(87, 9, 2, 0, 'Scarf', 'Includes silk', 1, 0, '0000-00-00 00:00:00'),
(88, 9, 3, 0, 'Pashmina', 'Wash and iron', 1, 0, '0000-00-00 00:00:00'),
(89, 9, 4, 0, 'HandKerchief', 'Includes pocket squares', 1, 0, '0000-00-00 00:00:00'),
(90, 10, 1, 0, 'Hand Towel', 'Any size ', 1, 0, '0000-00-00 00:00:00'),
(91, 10, 1, 0, 'Bath Towel', 'Any Size', 1, 0, '0000-00-00 00:00:00'),
(92, 10, 1, 0, 'Bath Mat', 'Includes non-slip backing', 1, 0, '0000-00-00 00:00:00'),
(93, 10, 1, 0, 'Dressing Gown', 'Includes flannel and silk', 1, 0, '0000-00-00 00:00:00'),
(94, 11, 1, 0, 'One Room', '1x bed sheet, 1x duvet cover,4x pillowcases,2x bath towels, 2x hand towels, 1x bath mat', 1, 0, '0000-00-00 00:00:00'),
(95, 11, 1, 0, 'Two Room', '2x bed sheets,2x duvet covers, 8x pillowcases, 4x bath towels, 4x hand towels,2x bath mats', 1, 0, '0000-00-00 00:00:00'),
(96, 11, 2, 0, 'Tea Towel Pack(Up to 6kg)', 'Approx.100 tea towels - washed, tumble dried, folded', 1, 0, '0000-00-00 00:00:00'),
(97, 11, 3, 0, 'Hand Towel Pack(Up to 6kg)', 'Approx. 50 hand towels - washed, tumble dried, folded', 1, 0, '0000-00-00 00:00:00'),
(98, 11, 4, 0, 'Bath Towel Pack (Up to 6kg)', 'Approx. 15 bath towels - washed, tumble dried, folded', 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_categories`
--

CREATE TABLE `tbl_product_categories` (
  `cat_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_ref_id` varchar(10) NOT NULL,
  `catimg` varchar(255) NOT NULL,
  `parent_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_categories`
--

INSERT INTO `tbl_product_categories` (`cat_id`, `category_name`, `category_ref_id`, `catimg`, `parent_category`) VALUES
(1, 'Tops', 'CAT_001', 'tops.png', 0),
(2, 'Laundry', 'CAT_002', 'laundry.png', 0),
(3, 'Bedding', 'CAT_003', 'bedding.png', 0),
(4, 'Suits', 'CAT_004', 'suits.png', 0),
(5, 'Knitwear', 'CAT_005', 'knitwears.png', 0),
(6, 'Trowsers', 'CAT_006', 'trousers.png', 0),
(8, 'Dresses', 'CAT_008', 'dresses.png', 1),
(9, 'Outdoor', 'CAT_009', 'ic_outdoor.png', 2),
(10, 'Accesories', 'CAT_010', 'accessories.png', 1),
(11, 'Home', 'CAT_011', 'home.png', 1),
(12, 'Business', 'CAT_012', 'businiess.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_child_categories`
--

CREATE TABLE `tbl_product_child_categories` (
  `cid` int(11) NOT NULL,
  `childcategory_name` varchar(100) NOT NULL,
  `subcat_description` text NOT NULL,
  `subcatimg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_child_categories`
--

INSERT INTO `tbl_product_child_categories` (`cid`, `childcategory_name`, `subcat_description`, `subcatimg`) VALUES
(1, 'Shirts', 'All the shirts you need for a working week, washed, ironed and hung to ensure you always look your best', 'top_hifive.jpg'),
(2, 'Pre-Paid Shirts', '', ''),
(3, 'Special Services', '', ''),
(4, 'Blouses', '', ''),
(5, 'Pre-Paid Blouses', '', ''),
(6, 'T-Shirts', '', ''),
(8, 'NON-BIO', '', ''),
(9, 'Bed Sets', '', ''),
(10, 'Related Item', '', ''),
(11, 'Pillows', '', ''),
(12, 'Bed Sheets', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_sub_categories`
--

CREATE TABLE `tbl_product_sub_categories` (
  `sid` int(11) NOT NULL,
  `subcategory_name` varchar(100) NOT NULL,
  `subcat_ref_id` varchar(10) NOT NULL,
  `subcat_description` text NOT NULL,
  `subcatimg` varchar(255) NOT NULL,
  `parent_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_sub_categories`
--

INSERT INTO `tbl_product_sub_categories` (`sid`, `subcategory_name`, `subcat_ref_id`, `subcat_description`, `subcatimg`, `parent_category`) VALUES
(1, 'High Five', 'SUBCAT_001', 'All the shirts you need for a working week, washed, ironed and hung to ensure you always look your best', 'top_hifive.jpg', 1),
(2, 'Shirts', 'CAT_002', '', 'top_shirts.jpg', 1),
(3, 'Blouses', 'CAT_003', '', 'top_blouses.jpg', 1),
(4, 'T-Shirts', 'CAT_004', '', 'top_tshirts.jpg', 1),
(5, 'Wash, Tumble Dry & Fold', 'CAT_005', '', 'landry_image.jpg', 2),
(6, 'Bed Sets', 'CAT_006', '', 'be_bedsets.jpg', 3),
(8, 'Pillows', 'CAT_008', '', 'be_pillos.jpg', 3),
(9, 'Bed Sheets', 'CAT_009', '', 'be_sheets.jpg', 3),
(10, 'Duvets', 'CAT_010', '', 'be_duvets.jpg', 3),
(11, 'Duvet Covers', 'CAT_011', '', 'be_duvetcovers.jpg', 3),
(12, 'Blanket', 'CAT_012', '', 'be_blanket.jpg', 3),
(13, 'Bedspread', '', 'Any size up to 4m square', 'be_bedspread.jpg', 3),
(14, 'Sleeping Bags', '', '', 'be_sleepingbag.jpg', 0),
(15, 'The Nine to Five', '', 'A two piece suit and 5X shirts', 'suit_offer.jpg', 4),
(16, 'Suits', '', '', 'suit_suit.jpg', 4),
(17, 'Occasion Suits', '', '', 'suit_occasionsuit.jpg', 4),
(18, '3 Knitewear', '', 'A two piece suit and 5X shirts', 'night_offer.jpg', 5),
(19, 'Light Knitwear', '', '', 'night_lightware.jpg', 5),
(20, 'Jumper', '', '', 'night_jumer.jpg', 5),
(21, 'Folder Jumper', '', '', 'night_foldedjumper.jpg', 5),
(22, 'Heavy Knitwear', '', '', 'night_heavynightware.jpg', 5),
(23, 'Cardigan', '', '', 'night_cardigan.jpg', 5),
(24, 'Trousers', '', '', 'trousers_trousers.jpg', 6),
(25, 'Jeans', '', '', 'trousers_jeans.jpg', 6),
(26, 'Shorts', '', '', 'trousers_shorts.jpg', 6),
(27, 'Dress 2 Impress', '', '', 'dresses_offer.jpg', 8),
(28, 'Dresses', '', '', 'dresses_dresses.jpg', 8),
(29, 'Skirts', '', '', 'dresses_skirts.jpg', 8),
(30, 'Coats', '', '', 'outdoor_coats.jpg', 9),
(31, 'Jackets', '', '', 'outdoor_jackets.jpg', 9),
(32, 'Fleece', '', '', 'outdoor_fleece.jpg', 9),
(33, 'Tie', '', '', 'accessories_tie.jpg', 10),
(34, 'Scraf', '', '', 'accessories_scarf.jpg', 10),
(35, 'Pashmina', '', '', 'accessories_pashmina.jpg', 10),
(36, 'HandKerchief', '', '', 'accessories_handkerchief.jpg', 10),
(37, 'Bathroom', '', '', 'home_bathroom.jpg', 11),
(38, 'Kitchen & Dining', '', '', 'home_kitchen.jpg', 11),
(39, 'B & B Packages', '', '', 'business_bbpackages.jpg', 12),
(40, 'Tea Towel Pack(up to 6 kg)', '', '', 'business_teatowal.jpg', 12),
(41, 'Hand Towel Pack(up to 6 kg)', '', '', 'business_handtowel.jpg', 12),
(42, 'Bath Towel Pack(up to 6 kg)', '', '', 'business_bathtowel.jpg', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_states_master`
--

CREATE TABLE `tbl_states_master` (
  `id` int(5) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_states_master`
--

INSERT INTO `tbl_states_master` (`id`, `state`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Assam'),
(3, 'Bihar'),
(4, 'Chandigarh'),
(5, 'Chhattisgarh'),
(6, 'Delhi'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Jammu and Kashmir'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Mizoram'),
(17, 'Orissa'),
(18, 'Puducherry'),
(19, 'Punjab'),
(20, 'Rajasthan'),
(21, 'Tamil Nadu'),
(22, 'Telangana'),
(23, 'Tripura'),
(24, 'Uttar Pradesh'),
(25, 'Uttarakhand'),
(26, 'West Bengal'),
(27, 'All');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stores_logininfo_master`
--

CREATE TABLE `tbl_stores_logininfo_master` (
  `aid` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `password` varchar(300) NOT NULL,
  `store_token` text NOT NULL,
  `email_verification_key` varchar(200) NOT NULL,
  `sms_verification_key` varchar(100) NOT NULL,
  `authorization_key` varchar(100) NOT NULL,
  `account_status` char(2) NOT NULL,
  `email_activate_status` tinyint(3) NOT NULL,
  `mobile_activate_status` tinyint(2) NOT NULL,
  `disable_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stores_logininfo_master`
--

INSERT INTO `tbl_stores_logininfo_master` (`aid`, `store_id`, `password`, `store_token`, `email_verification_key`, `sms_verification_key`, `authorization_key`, `account_status`, `email_activate_status`, `mobile_activate_status`, `disable_status`) VALUES
(1, 112, '02d6d945639c30a2972625f3120552cd', 'eCSr3yzJZLQ:APA91bEsXipNSWTQWaoTPVwReVdQEq_K8caRrfU3vUFDDdLYMdrX0Vk3QbLUCOPbIk78_nVSZCf05K0ene5MiFJhS4AEX1GpQKPNsElzcKbjCkt-tU9W8GwFqD6Dl7cLVvilH5QSJ0th', 'bdf32f540bc0dad59fd98310e161cac9', 'UCSXR', '2ee1a699b3530836aee2d96ceba1523c', 'I', 1, 1, 0),
(2, 113, '0bf2a1fe20ec8be21f96e2c479600d54', 'eCSr3yzJZLQ:APA91bEsXipNSWTQWaoTPVwReVdQEq_K8caRrfU3vUFDDdLYMdrX0Vk3QbLUCOPbIk78_nVSZCf05K0ene5MiFJhS4AEX1GpQKPNsElzcKbjCkt-tU9W8GwFqD6Dl7cLVvilH5QSJ0th', 'a202b80068827f562559d095fcc98ba5', 'KXKNC', 'e9a6d9dac5082a099be3676d08de1ded', 'I', 1, 1, 0),
(3, 114, '4d6e3bd12f6807e33b9efc103d028aac', 'eCSr3yzJZLQ:APA91bEsXipNSWTQWaoTPVwReVdQEq_K8caRrfU3vUFDDdLYMdrX0Vk3QbLUCOPbIk78_nVSZCf05K0ene5MiFJhS4AEX1GpQKPNsElzcKbjCkt-tU9W8GwFqD6Dl7cLVvilH5QSJ0th', '365655f20cea5831adff7b5c75b20aab', 'YAV3G', '984329f145af5ea254c602df6ef695d3', 'I', 1, 1, 0),
(4, 115, '951b1522a7e1e551e0c985e18a7a4541', 'eCSr3yzJZLQ:APA91bEsXipNSWTQWaoTPVwReVdQEq_K8caRrfU3vUFDDdLYMdrX0Vk3QbLUCOPbIk78_nVSZCf05K0ene5MiFJhS4AEX1GpQKPNsElzcKbjCkt-tU9W8GwFqD6Dl7cLVvilH5QSJ0th', 'f24d6296e537d01941b24c01f9b09c04', 'T5CWV', 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 'I', 1, 1, 0),
(5, 116, '565b132fef80be3565ca89e41122308f', 'eCSr3yzJZLQ:APA91bEsXipNSWTQWaoTPVwReVdQEq_K8caRrfU3vUFDDdLYMdrX0Vk3QbLUCOPbIk78_nVSZCf05K0ene5MiFJhS4AEX1GpQKPNsElzcKbjCkt-tU9W8GwFqD6Dl7cLVvilH5QSJ0th', '5669f67e6b60826bfc3d07d34283b90e', 'TUUMR', 'e0df88cb2c2673cf15b660db5aa117ae', 'I', 1, 1, 0),
(6, 117, '82a399ca80006c9e27c5dfc33d863e80', 'dC9NsnftEwA:APA91bG1p6PqqG94SwbjQUbB19jZnq_rCarnNz7hqzOZEjhFiXKHwYy7xaIch7mt7UdpybUiQuQo5QwHUqvpVNpQ4juCJruwXOdpIAxXuXU2OS6X_jstaifQf1C-6S3iiGlhAvak2mFA', '757156f283431a2506db30a0e42bc9d5', 'RRPM9', '179cff6dc411f329cf408941db2f5942', 'I', 1, 1, 0),
(7, 118, 'c8047fd20f8fa285d771e03299593fd9', 'eCSr3yzJZLQ:APA91bEsXipNSWTQWaoTPVwReVdQEq_K8caRrfU3vUFDDdLYMdrX0Vk3QbLUCOPbIk78_nVSZCf05K0ene5MiFJhS4AEX1GpQKPNsElzcKbjCkt-tU9W8GwFqD6Dl7cLVvilH5QSJ0th', 'e155dd33a1af68a092647265e0e87ea0', 'NEJAV', '3a6d570f4654177520f428c841cf541e', 'I', 1, 1, 0),
(8, 119, 'cdccb864eaff7e761a55d545cf9bc30e', 'eCSr3yzJZLQ:APA91bEsXipNSWTQWaoTPVwReVdQEq_K8caRrfU3vUFDDdLYMdrX0Vk3QbLUCOPbIk78_nVSZCf05K0ene5MiFJhS4AEX1GpQKPNsElzcKbjCkt-tU9W8GwFqD6Dl7cLVvilH5QSJ0th', '9f66184b2a8f8bc203e28faf51e3d1df', 'J3BVP', '0d6f0057acc11d09c8686e9da529f06a', 'I', 1, 1, 0),
(9, 120, 'cdccb864eaff7e761a55d545cf9bc30e', 'cH0BdcspHPk:APA91bEwl1ObcrS9HlGbAmum-DJX--pOBnKaf6_sCgLJoDtNbjnjr888B3nlnmh_q_mTo8RL6utI93zlFa8r0O-JpPyQOqvmRKweBNzYx1N-Z6I78hXhNYbfyzXDIDWUPlj2KrWEiwjY', '3c2eef5d72344cadc192ac6637fee288', 'ND2JR', 'e46f60709f497c74288d68c05877d130', 'I', 1, 1, 0),
(10, 121, 'ab13e230a9dcd552337a6895e20132c7', 'f2kqrsjtbqY:APA91bGkHRHjPQ4iMN0vITF0eUKEDa23qm6KOScM5UKVdY_QC7Liheqk7QgvBQ_WTXn2fuWPA3ILuYDLWWPQs17Wol_Yi0qk2WFxlEs2Apl-qAWJuzhzQYNEYnImqOIpaY0FvHtj1DjK', '55d2e922c9381f4600e02b239f6d8180', 'X6WWJ', 'f71ff81e4fa3b58313e53e60fa25402e', 'I', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stores_master`
--

CREATE TABLE `tbl_stores_master` (
  `id` int(11) NOT NULL,
  `type` char(1) NOT NULL COMMENT 'S-Stores',
  `division_id` int(11) NOT NULL,
  `dealer_id` varchar(50) NOT NULL,
  `store_unique_id` varchar(50) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_owner_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `postcode` varchar(11) NOT NULL,
  `store_latitude` varchar(255) NOT NULL,
  `store_longitude` varchar(255) NOT NULL,
  `store_estb_date` date DEFAULT NULL,
  `store_phoneid` bigint(20) NOT NULL,
  `store_address` text NOT NULL,
  `store_location` varchar(255) NOT NULL,
  `store_person_email` varchar(255) NOT NULL,
  `store_profile_pic` varchar(200) NOT NULL,
  `store_commercial_pic` varchar(200) NOT NULL,
  `pickup_status` int(11) NOT NULL,
  `online_status` int(11) NOT NULL,
  `store_transaction_limit` bigint(20) NOT NULL,
  `pickup_days` varchar(255) NOT NULL,
  `pickup_times` varchar(255) NOT NULL,
  `delivery_days` varchar(255) NOT NULL,
  `delivery_times` varchar(255) NOT NULL,
  `holidays_list` text NOT NULL,
  `normal` varchar(500) NOT NULL,
  `normal_pickup_hours` varchar(255) NOT NULL,
  `normal_delivery_days` varchar(255) NOT NULL,
  `express` varchar(500) NOT NULL,
  `express_minimum_hours` varchar(500) NOT NULL,
  `express_pickup_time` varchar(500) NOT NULL,
  `express_percentage_of_cost` varchar(500) NOT NULL,
  `express_default_cost` varchar(500) NOT NULL,
  `shop_open_time` varchar(255) NOT NULL,
  `shop_close_time` varchar(255) NOT NULL,
  `subscription` tinyint(4) NOT NULL,
  `terms_conditions` tinyint(4) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `modified_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stores_master`
--

INSERT INTO `tbl_stores_master` (`id`, `type`, `division_id`, `dealer_id`, `store_unique_id`, `store_name`, `store_owner_name`, `first_name`, `last_name`, `postcode`, `store_latitude`, `store_longitude`, `store_estb_date`, `store_phoneid`, `store_address`, `store_location`, `store_person_email`, `store_profile_pic`, `store_commercial_pic`, `pickup_status`, `online_status`, `store_transaction_limit`, `pickup_days`, `pickup_times`, `delivery_days`, `delivery_times`, `holidays_list`, `normal`, `normal_pickup_hours`, `normal_delivery_days`, `express`, `express_minimum_hours`, `express_pickup_time`, `express_percentage_of_cost`, `express_default_cost`, `shop_open_time`, `shop_close_time`, `subscription`, `terms_conditions`, `created_by`, `created_date_time`, `modified_date_time`) VALUES
(112, 'V', 0, '', 'LND_STO001', 'St Leonard\'s Dry Cleaners', '', 'ven01', '', 'SW16 6LG', '51.428711199999995', '-0.1312327', NULL, 2086772323, '3b,  , Mitcham Lane, LONDON', '', 'ven01@ventest.com', 'IMG_20171101_200651.jpg', '', 1, 1, 0, '0', '0', '0', '0', '', '0', '4', '3', '0', '8,8', '3,3', '25,69', '12,20', '7-30,7-30-AM', '20-30,8-30-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-22 10:52:40'),
(113, 'V', 0, '', 'LND_STO002', 'Bellevue London', '', 'ven02', '', 'SW11 1NX', '51.460312699999996', '-0.1669453', NULL, 2072289031, '12a,  , Northcote Road, LONDON', '', 'ven02@ventest.com', '', '', 1, 1, 0, '0', '0', '0', '0', '', '0', '6', '2', '0', '6', '2', '20', '10', '9-0,9-00-AM', '18-0,6-00-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-20 21:29:31'),
(114, 'V', 0, '', 'LND_STO003', 'THOMAS CLARK DRY CLEANERS', '', 'ven0303', '', 'SW16 2UH', '51.4303697', '-0.128249', NULL, 2086646100, '48-50,  , Sunnyhill Road, LONDON', '', 'ven03@ventest.com', 'IMG_20171101_203600.jpg', '', 1, 1, 0, '0', '0', '0', '0', '', '0', '5', '2', '0', '6', '3', '25', '15', '8-30,8-30-AM', '18-30,6-30-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-15 10:34:49'),
(115, 'V', 0, '', 'LND_STO004', 'Streatham Cleaners', '', 'ven04', '', 'SW16 2UH', '51.4303697', '-0.128249', NULL, 2084347352, '32 , Sunnyhill Road, LONDON', '', 'ven04@ventest.com', '', '', 1, 1, 0, '0', '0', '0', '0', '22-11-2018', '0', '5', '3', '0', '7,8', '3,4', '25,20', '15,10', '8-0,8-00-AM', '19-0,7-00-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-12 10:37:57'),
(116, 'V', 0, '', 'LND_STO005', 'Kleencare Dry Cleanets', '', 'Ven05', '', 'SW16 6HP', '51.425706', '-0.1312408', NULL, 2087694156, '376 , Streatham High Road, LONDON', '', 'ven05@ventest.com', '', '', 1, 1, 0, '0', '0', '0', '0', '', '0', '5', '2', '0', '6', '2', '25', '15', '7-30,7-30-AM', '19-30,7-30-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-12 10:41:50'),
(117, 'V', 0, '', 'LND_STO006', 'Steeds Dry Cleaners', '', 'ven07', '', 'SW16 6LY', '51.425071599999995', '-0.1400326', NULL, 2086772374, '71 , Mitcham Lane, LONDON', '', 'ven07@ventest.com', '', '', 1, 1, 0, '0', '0', '0', '0', '20-11-2018', '0', '6', '2', '0', '6', '2', '25', '12', '7-30,7-30-AM', '20-30,8-30-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-12 10:50:07'),
(118, 'V', 0, '', 'LND_STO007', 'Krystal Dry Cleaners ', '', 'ven08', '', 'SW16 1EQ', '51.4373467', '-0.127138', NULL, 2087691916, '15 Streatleigh Parade, Streatham High Road, LONDON', '', 'ven08@ventest.com', '', '', 1, 1, 0, '0', '0', '0', '0', '', '0', '5', '3', '0', '6,8', '2,3', '25,20', '20,15', '9-0,9-00-AM', '18-0,6-00-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-12 10:55:22'),
(119, 'V', 0, '', 'LND_STO008', 'A &  S Dry Cleaners ', '', 'ven09', '', 'SW16 5TE', '51.4178473', '-0.13636869999999998', NULL, 2087643345, '2 , Streatham Vale, LONDON', '', 'ven09@ventest.com', '', '', 1, 1, 0, '0', '0', '0', '0', '', '0', '5', '2', '0', '7', '3', '25', '12', '8-30,8-30-AM', '18-30,6-30-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-11-12 10:58:28'),
(120, 'V', 0, '', 'LND_STO009', 'Clean Scene', '', 'vent10', '', 'SW16 5NL', '51.4214373', '-0.1300853', NULL, 2086772992, '4 Sanders Parade, Greyhound Lane, LONDON', '', 'ven10@ventest.com', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '2018-11-12 11:01:25'),
(121, 'V', 0, '', 'LND_STO010', 'Clean Scene', '', 'Ven11', '', 'SW16 5NL', 'null', 'null', NULL, 2086772991, '4 Sanders Parade, Greyhound Lane, LONDON', '', 'ven11@ventest.co', 'IMG_20171101_200651.jpg', '', 1, 1, 0, '0', '0', '0', '0', '29-11-2018,27-11-2018,16-12-2018,02-12-2018', '0', '5', '4', '0', '6,5,5', '3,4,2', '25,15,3', '10,20,25', '8-0,8-00-AM', '22-0,10-00-PM', 0, 0, '', '0000-00-00 00:00:00', '2018-12-14 06:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_item_prices`
--

CREATE TABLE `tbl_store_item_prices` (
  `id` int(11) NOT NULL,
  `vendorid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_store_item_prices`
--

INSERT INTO `tbl_store_item_prices` (`id`, `vendorid`, `item_id`, `item_price`, `created_at`) VALUES
(1991, 'f71ff81e4fa3b58313e53e60fa25402e', 44, '3.2', '2018-12-12 05:43:13'),
(1990, 'f71ff81e4fa3b58313e53e60fa25402e', 59, '8', '2018-12-08 06:54:25'),
(1989, 'f71ff81e4fa3b58313e53e60fa25402e', 20, '3', '2018-12-06 11:10:41'),
(1988, 'f71ff81e4fa3b58313e53e60fa25402e', 21, '2.8', '2018-12-05 13:02:51'),
(1987, 'f71ff81e4fa3b58313e53e60fa25402e', 43, '', '2018-12-03 12:33:32'),
(1986, 'f71ff81e4fa3b58313e53e60fa25402e', 42, '', '2018-12-03 12:33:32'),
(1985, 'f71ff81e4fa3b58313e53e60fa25402e', 41, '', '2018-12-03 12:33:32'),
(1984, 'f71ff81e4fa3b58313e53e60fa25402e', 40, '', '2018-12-03 12:33:32'),
(1983, 'f71ff81e4fa3b58313e53e60fa25402e', 39, '', '2018-12-03 12:33:32'),
(1982, 'e0df88cb2c2673cf15b660db5aa117ae', 21, '3', '2018-11-15 10:24:21'),
(1981, '179cff6dc411f329cf408941db2f5942', 13, '3.5', '2018-11-12 11:27:06'),
(1980, '179cff6dc411f329cf408941db2f5942', 12, '3', '2018-11-12 11:27:06'),
(1979, '179cff6dc411f329cf408941db2f5942', 11, '2', '2018-11-12 11:27:06'),
(1978, '179cff6dc411f329cf408941db2f5942', 10, '1', '2018-11-12 11:27:06'),
(1977, '179cff6dc411f329cf408941db2f5942', 8, '4', '2018-11-12 11:27:06'),
(1976, '179cff6dc411f329cf408941db2f5942', 7, '3.5', '2018-11-12 11:27:06'),
(1975, '179cff6dc411f329cf408941db2f5942', 6, '3.8', '2018-11-12 11:27:06'),
(1974, '179cff6dc411f329cf408941db2f5942', 5, '3', '2018-11-12 11:27:06'),
(1973, '179cff6dc411f329cf408941db2f5942', 4, '2.2', '2018-11-12 11:27:06'),
(1972, 'e0df88cb2c2673cf15b660db5aa117ae', 19, '2.5', '2018-11-12 11:18:39'),
(1971, 'e0df88cb2c2673cf15b660db5aa117ae', 18, '3.5', '2018-11-12 11:18:39'),
(1970, 'e0df88cb2c2673cf15b660db5aa117ae', 17, '4.5', '2018-11-12 11:18:39'),
(1969, 'e0df88cb2c2673cf15b660db5aa117ae', 16, '3.5', '2018-11-12 11:18:39'),
(1968, 'e0df88cb2c2673cf15b660db5aa117ae', 15, '2.8', '2018-11-12 11:18:39'),
(1967, 'e0df88cb2c2673cf15b660db5aa117ae', 14, '5', '2018-11-12 11:18:39'),
(1966, 'e0df88cb2c2673cf15b660db5aa117ae', 13, '4.5', '2018-11-12 11:18:39'),
(1965, 'e0df88cb2c2673cf15b660db5aa117ae', 12, '3', '2018-11-12 11:18:39'),
(1964, 'e0df88cb2c2673cf15b660db5aa117ae', 11, '2.5', '2018-11-12 11:18:39'),
(1963, '984329f145af5ea254c602df6ef695d3', 19, '5', '2018-11-12 11:15:07'),
(1962, '984329f145af5ea254c602df6ef695d3', 17, '2.8', '2018-11-12 11:15:07'),
(1961, '984329f145af5ea254c602df6ef695d3', 16, '1.5', '2018-11-12 11:15:07'),
(1960, '984329f145af5ea254c602df6ef695d3', 15, '3.9', '2018-11-12 11:15:07'),
(1959, '984329f145af5ea254c602df6ef695d3', 14, '3.5', '2018-11-12 11:15:07'),
(1958, '984329f145af5ea254c602df6ef695d3', 13, '2.8', '2018-11-12 11:15:07'),
(1957, '984329f145af5ea254c602df6ef695d3', 12, '3', '2018-11-12 11:15:07'),
(1956, 'f71ff81e4fa3b58313e53e60fa25402e', 19, '3.5', '2018-11-12 11:10:55'),
(1955, 'f71ff81e4fa3b58313e53e60fa25402e', 18, '4', '2018-11-12 11:10:55'),
(1954, 'f71ff81e4fa3b58313e53e60fa25402e', 17, '3', '2018-11-12 11:10:55'),
(1953, 'f71ff81e4fa3b58313e53e60fa25402e', 16, '2', '2018-11-12 11:10:55'),
(1952, 'f71ff81e4fa3b58313e53e60fa25402e', 15, '1.2', '2018-11-12 11:10:55'),
(1951, 'f71ff81e4fa3b58313e53e60fa25402e', 14, '1.6', '2018-11-12 11:10:55'),
(1950, 'f71ff81e4fa3b58313e53e60fa25402e', 13, '1.8', '2018-11-12 11:10:55'),
(1949, 'f71ff81e4fa3b58313e53e60fa25402e', 12, '1.6', '2018-11-12 11:10:55'),
(1948, 'f71ff81e4fa3b58313e53e60fa25402e', 11, '3.6', '2018-11-12 11:10:55'),
(1947, 'f71ff81e4fa3b58313e53e60fa25402e', 10, '2.6', '2018-11-12 11:10:55'),
(1946, 'f71ff81e4fa3b58313e53e60fa25402e', 8, '2.8', '2018-11-12 11:10:55'),
(1945, 'f71ff81e4fa3b58313e53e60fa25402e', 7, '3.2', '2018-11-12 11:10:55'),
(1944, 'f71ff81e4fa3b58313e53e60fa25402e', 6, '3', '2018-11-12 11:10:55'),
(1943, 'f71ff81e4fa3b58313e53e60fa25402e', 5, '2.5', '2018-11-12 11:10:55'),
(1942, 'f71ff81e4fa3b58313e53e60fa25402e', 4, '1.5', '2018-11-12 11:10:55'),
(1941, '0d6f0057acc11d09c8686e9da529f06a', 19, '5.2', '2018-11-12 10:59:12'),
(1940, '0d6f0057acc11d09c8686e9da529f06a', 18, '5', '2018-11-12 10:59:12'),
(1939, '0d6f0057acc11d09c8686e9da529f06a', 17, '6', '2018-11-12 10:59:12'),
(1938, '0d6f0057acc11d09c8686e9da529f06a', 16, '4.8', '2018-11-12 10:59:12'),
(1937, '0d6f0057acc11d09c8686e9da529f06a', 15, '4.5', '2018-11-12 10:59:12'),
(1936, '0d6f0057acc11d09c8686e9da529f06a', 14, '4', '2018-11-12 10:59:12'),
(1935, '0d6f0057acc11d09c8686e9da529f06a', 13, '3.5', '2018-11-12 10:59:12'),
(1934, '0d6f0057acc11d09c8686e9da529f06a', 12, '2.8', '2018-11-12 10:59:12'),
(1933, '0d6f0057acc11d09c8686e9da529f06a', 11, '3.5', '2018-11-12 10:59:12'),
(1932, '0d6f0057acc11d09c8686e9da529f06a', 10, '3', '2018-11-12 10:59:12'),
(1931, '0d6f0057acc11d09c8686e9da529f06a', 8, '2.5', '2018-11-12 10:59:12'),
(1930, '0d6f0057acc11d09c8686e9da529f06a', 7, '2.3', '2018-11-12 10:59:12'),
(1929, '0d6f0057acc11d09c8686e9da529f06a', 6, '2', '2018-11-12 10:59:12'),
(1928, '0d6f0057acc11d09c8686e9da529f06a', 5, '1.5', '2018-11-12 10:59:12'),
(1927, '0d6f0057acc11d09c8686e9da529f06a', 4, '1.8', '2018-11-12 10:59:12'),
(1926, '3a6d570f4654177520f428c841cf541e', 19, '4.8', '2018-11-12 10:54:01'),
(1925, '3a6d570f4654177520f428c841cf541e', 18, '3.8', '2018-11-12 10:54:01'),
(1924, '3a6d570f4654177520f428c841cf541e', 17, '5', '2018-11-12 10:54:01'),
(1923, '3a6d570f4654177520f428c841cf541e', 16, '2', '2018-11-12 10:54:01'),
(1922, '3a6d570f4654177520f428c841cf541e', 15, '2.0', '2018-11-12 10:54:01'),
(1921, '3a6d570f4654177520f428c841cf541e', 14, '3.5', '2018-11-12 10:54:01'),
(1920, '3a6d570f4654177520f428c841cf541e', 13, '5.5', '2018-11-12 10:54:01'),
(1919, '3a6d570f4654177520f428c841cf541e', 12, '4.5', '2018-11-12 10:54:01'),
(1918, '3a6d570f4654177520f428c841cf541e', 11, '3.9', '2018-11-12 10:54:01'),
(1917, '3a6d570f4654177520f428c841cf541e', 10, '3', '2018-11-12 10:54:01'),
(1916, '3a6d570f4654177520f428c841cf541e', 8, '2', '2018-11-12 10:54:01'),
(1915, '3a6d570f4654177520f428c841cf541e', 7, '2.8', '2018-11-12 10:54:01'),
(1914, '3a6d570f4654177520f428c841cf541e', 6, '2.3', '2018-11-12 10:54:01'),
(1913, '3a6d570f4654177520f428c841cf541e', 5, '3', '2018-11-12 10:54:01'),
(1912, '3a6d570f4654177520f428c841cf541e', 4, '1.5', '2018-11-12 10:54:01'),
(1911, '179cff6dc411f329cf408941db2f5942', 19, '5.5', '2018-11-12 10:48:38'),
(1910, '179cff6dc411f329cf408941db2f5942', 18, '4.5', '2018-11-12 10:48:38'),
(1909, '179cff6dc411f329cf408941db2f5942', 17, '2.5', '2018-11-12 10:48:38'),
(1908, '179cff6dc411f329cf408941db2f5942', 16, '4.3', '2018-11-12 10:48:38'),
(1907, '179cff6dc411f329cf408941db2f5942', 15, '3.3', '2018-11-12 10:48:38'),
(1906, '179cff6dc411f329cf408941db2f5942', 14, '2.5', '2018-11-12 10:48:38'),
(1905, 'e0df88cb2c2673cf15b660db5aa117ae', 10, '2.9', '2018-11-12 10:42:43'),
(1904, 'e0df88cb2c2673cf15b660db5aa117ae', 8, '2.6', '2018-11-12 10:42:43'),
(1903, 'e0df88cb2c2673cf15b660db5aa117ae', 7, '1.5', '2018-11-12 10:42:43'),
(1902, 'e0df88cb2c2673cf15b660db5aa117ae', 6, '2.5', '2018-11-12 10:42:43'),
(1901, 'e0df88cb2c2673cf15b660db5aa117ae', 5, '2.6', '2018-11-12 10:42:43'),
(1900, 'e0df88cb2c2673cf15b660db5aa117ae', 4, '3.2', '2018-11-12 10:42:43'),
(1899, 'e0df88cb2c2673cf15b660db5aa117ae', 20, '2.5', '2018-11-12 10:42:18'),
(1898, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 19, '3.5', '2018-11-12 10:36:13'),
(1897, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 18, '2.8', '2018-11-12 10:36:13'),
(1896, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 17, '3', '2018-11-12 10:36:13'),
(1895, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 16, '2.3', '2018-11-12 10:36:13'),
(1894, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 15, '2.8', '2018-11-12 10:36:13'),
(1893, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 14, '1.9', '2018-11-12 10:36:13'),
(1892, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 13, '1.5', '2018-11-12 10:36:13'),
(1891, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 12, '3.5', '2018-11-12 10:36:13'),
(1890, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 11, '2.5', '2018-11-12 10:36:13'),
(1889, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 10, '6.3', '2018-11-12 10:36:13'),
(1888, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 8, '5.5', '2018-11-12 10:36:13'),
(1887, '984329f145af5ea254c602df6ef695d3', 11, '2.5', '2018-11-12 10:32:16'),
(1886, '984329f145af5ea254c602df6ef695d3', 10, '6.6', '2018-11-12 10:32:16'),
(1885, '984329f145af5ea254c602df6ef695d3', 8, '3.5', '2018-11-12 10:32:16'),
(1884, '984329f145af5ea254c602df6ef695d3', 7, '2.9', '2018-11-12 10:32:16'),
(1883, '984329f145af5ea254c602df6ef695d3', 6, '2.3', '2018-11-12 10:32:16'),
(1882, '984329f145af5ea254c602df6ef695d3', 5, '1.8', '2018-11-12 10:32:16'),
(1881, '984329f145af5ea254c602df6ef695d3', 4, '1.5', '2018-11-12 10:32:16'),
(1880, 'e9a6d9dac5082a099be3676d08de1ded', 19, '2.8', '2018-11-12 10:23:28'),
(1879, 'e9a6d9dac5082a099be3676d08de1ded', 18, '2.2', '2018-11-12 10:23:28'),
(1878, 'e9a6d9dac5082a099be3676d08de1ded', 17, '1.3', '2018-11-12 10:23:28'),
(1877, 'e9a6d9dac5082a099be3676d08de1ded', 16, '1.2', '2018-11-12 10:23:28'),
(1876, 'e9a6d9dac5082a099be3676d08de1ded', 15, '4.5', '2018-11-12 10:23:28'),
(1875, 'e9a6d9dac5082a099be3676d08de1ded', 14, '3.5', '2018-11-12 10:23:28'),
(1874, 'e9a6d9dac5082a099be3676d08de1ded', 13, '3.3', '2018-11-12 10:23:28'),
(1873, 'e9a6d9dac5082a099be3676d08de1ded', 12, '2.2', '2018-11-12 10:23:28'),
(1872, 'e9a6d9dac5082a099be3676d08de1ded', 11, '1.5', '2018-11-12 10:23:28'),
(1871, 'e9a6d9dac5082a099be3676d08de1ded', 10, '5', '2018-11-12 10:23:28'),
(1870, 'e9a6d9dac5082a099be3676d08de1ded', 8, '4', '2018-11-12 10:23:28'),
(1869, 'e9a6d9dac5082a099be3676d08de1ded', 7, '3', '2018-11-12 10:23:28'),
(1868, 'e9a6d9dac5082a099be3676d08de1ded', 6, '2.5', '2018-11-12 10:23:28'),
(1867, 'e9a6d9dac5082a099be3676d08de1ded', 5, '1.8', '2018-11-12 10:23:28'),
(1866, 'e9a6d9dac5082a099be3676d08de1ded', 4, '1.5', '2018-11-12 10:23:28'),
(1865, '2ee1a699b3530836aee2d96ceba1523c', 20, '3', '2018-11-12 10:06:00'),
(1864, '2ee1a699b3530836aee2d96ceba1523c', 19, '3.5', '2018-11-12 10:05:46'),
(1863, '2ee1a699b3530836aee2d96ceba1523c', 18, '4.9', '2018-11-12 10:05:46'),
(1862, '2ee1a699b3530836aee2d96ceba1523c', 17, '3.5', '2018-11-12 10:05:46'),
(1861, '2ee1a699b3530836aee2d96ceba1523c', 16, '2.7', '2018-11-12 10:05:46'),
(1860, '2ee1a699b3530836aee2d96ceba1523c', 15, '3.5', '2018-11-12 10:05:46'),
(1859, '2ee1a699b3530836aee2d96ceba1523c', 14, '2.5', '2018-11-12 10:05:46'),
(1858, '2ee1a699b3530836aee2d96ceba1523c', 13, '3.5', '2018-11-12 10:05:46'),
(1857, '2ee1a699b3530836aee2d96ceba1523c', 12, '6', '2018-11-12 10:05:46'),
(1856, '2ee1a699b3530836aee2d96ceba1523c', 11, '3', '2018-11-12 10:05:46'),
(1855, '2ee1a699b3530836aee2d96ceba1523c', 10, '2.8', '2018-11-12 10:05:46'),
(1854, '2ee1a699b3530836aee2d96ceba1523c', 8, '2', '2018-11-12 10:05:46'),
(1853, '2ee1a699b3530836aee2d96ceba1523c', 7, '1.6', '2018-11-12 10:05:46'),
(1852, '2ee1a699b3530836aee2d96ceba1523c', 6, '0.3', '2018-11-12 10:05:46'),
(1851, '2ee1a699b3530836aee2d96ceba1523c', 5, '0.5', '2018-11-12 10:05:46'),
(1850, '2ee1a699b3530836aee2d96ceba1523c', 4, '3.5', '2018-11-12 10:05:46'),
(1849, '5b9b04124a02b83fa95cbe0da73f1e9a', 20, '3', '2018-11-05 06:54:28'),
(1848, 'a60aeb100532a93d1d9b4e614a56eff6', 19, '4', '2018-10-25 15:46:22'),
(1847, 'a60aeb100532a93d1d9b4e614a56eff6', 18, '3', '2018-10-25 15:46:22'),
(1846, 'a60aeb100532a93d1d9b4e614a56eff6', 17, '75', '2018-10-25 15:46:22'),
(1845, 'a60aeb100532a93d1d9b4e614a56eff6', 16, '40', '2018-10-25 15:46:22'),
(1844, 'a60aeb100532a93d1d9b4e614a56eff6', 15, '6', '2018-10-25 15:46:22'),
(1843, 'a60aeb100532a93d1d9b4e614a56eff6', 14, '5', '2018-10-25 15:46:22'),
(1842, 'a60aeb100532a93d1d9b4e614a56eff6', 13, '4', '2018-10-25 15:46:22'),
(1841, 'a60aeb100532a93d1d9b4e614a56eff6', 12, '3', '2018-10-25 15:46:22'),
(1840, 'a60aeb100532a93d1d9b4e614a56eff6', 11, '120', '2018-10-25 15:46:22'),
(1839, 'a60aeb100532a93d1d9b4e614a56eff6', 10, '56', '2018-10-25 15:46:22'),
(1838, 'a60aeb100532a93d1d9b4e614a56eff6', 8, '3', '2018-10-25 15:46:22'),
(1837, 'a60aeb100532a93d1d9b4e614a56eff6', 7, '8', '2018-10-25 15:46:22'),
(1836, 'a60aeb100532a93d1d9b4e614a56eff6', 6, '5', '2018-10-25 15:46:22'),
(1835, 'a60aeb100532a93d1d9b4e614a56eff6', 5, '3.6', '2018-10-25 15:27:43'),
(1834, 'a60aeb100532a93d1d9b4e614a56eff6', 4, '2.5', '2018-10-25 15:27:43'),
(1833, '2e8829282a5a25de2b840323aa914ecb', 19, '2.75', '2018-10-25 13:07:37'),
(1832, '2e8829282a5a25de2b840323aa914ecb', 18, '2.28', '2018-10-25 13:07:37'),
(1831, '2e8829282a5a25de2b840323aa914ecb', 17, '80', '2018-10-25 13:07:37'),
(1830, '2e8829282a5a25de2b840323aa914ecb', 16, '35', '2018-10-25 13:07:37'),
(1829, '2e8829282a5a25de2b840323aa914ecb', 15, '4.5', '2018-10-25 13:07:37'),
(1828, '2e8829282a5a25de2b840323aa914ecb', 14, '4', '2018-10-25 13:07:37'),
(1827, '2e8829282a5a25de2b840323aa914ecb', 13, '2.25', '2018-10-25 13:07:37'),
(1826, '2e8829282a5a25de2b840323aa914ecb', 12, '1', '2018-10-25 13:07:37'),
(1825, '2e8829282a5a25de2b840323aa914ecb', 11, '150', '2018-10-25 13:07:37'),
(1824, '2e8829282a5a25de2b840323aa914ecb', 10, '40', '2018-10-25 13:07:37'),
(1823, '2e8829282a5a25de2b840323aa914ecb', 8, '2.5', '2018-10-25 13:07:37'),
(1822, '2e8829282a5a25de2b840323aa914ecb', 7, '2.25', '2018-10-25 13:07:37'),
(1821, '2e8829282a5a25de2b840323aa914ecb', 6, '2.5', '2018-10-25 13:07:37'),
(1820, '2e8829282a5a25de2b840323aa914ecb', 5, '2', '2018-10-25 13:07:37'),
(1819, '2e8829282a5a25de2b840323aa914ecb', 4, '8', '2018-10-25 13:07:37'),
(1818, '91652d69822e3019739d8d5a525f2bcd', 19, '3', '2018-10-25 13:04:46'),
(1817, '91652d69822e3019739d8d5a525f2bcd', 18, '2.5', '2018-10-25 13:04:46'),
(1816, '91652d69822e3019739d8d5a525f2bcd', 17, '95', '2018-10-25 13:04:46'),
(1815, '91652d69822e3019739d8d5a525f2bcd', 16, '42', '2018-10-25 13:04:46'),
(1814, '91652d69822e3019739d8d5a525f2bcd', 15, '5.25', '2018-10-25 13:04:46'),
(1813, '91652d69822e3019739d8d5a525f2bcd', 14, '4.85', '2018-10-25 13:04:46'),
(1812, '91652d69822e3019739d8d5a525f2bcd', 13, '2.75', '2018-10-25 13:04:46'),
(1811, '91652d69822e3019739d8d5a525f2bcd', 12, '1.2', '2018-10-25 13:04:46'),
(1810, '91652d69822e3019739d8d5a525f2bcd', 11, '150', '2018-10-25 13:04:46'),
(1809, '91652d69822e3019739d8d5a525f2bcd', 10, '42', '2018-10-25 13:04:46'),
(1808, '91652d69822e3019739d8d5a525f2bcd', 8, '2.75', '2018-10-25 13:04:46'),
(1807, '91652d69822e3019739d8d5a525f2bcd', 7, '2.5', '2018-10-25 13:04:46'),
(1806, '91652d69822e3019739d8d5a525f2bcd', 6, '3', '2018-10-25 13:04:46'),
(1805, '91652d69822e3019739d8d5a525f2bcd', 5, '2.25', '2018-10-25 13:04:46'),
(1804, '91652d69822e3019739d8d5a525f2bcd', 4, '8.95', '2018-10-25 13:04:46'),
(1803, 'a025f2f4dd8d489995c1c1ff0d3e3636', 19, '4', '2018-10-25 13:02:02'),
(1802, 'a025f2f4dd8d489995c1c1ff0d3e3636', 18, '3.25', '2018-10-25 13:02:02'),
(1801, 'a025f2f4dd8d489995c1c1ff0d3e3636', 17, '110', '2018-10-25 13:02:02'),
(1800, 'a025f2f4dd8d489995c1c1ff0d3e3636', 16, '50', '2018-10-25 13:02:02'),
(1799, 'a025f2f4dd8d489995c1c1ff0d3e3636', 15, '7.5', '2018-10-25 13:02:02'),
(1798, 'a025f2f4dd8d489995c1c1ff0d3e3636', 14, '6', '2018-10-25 13:02:02'),
(1797, 'a025f2f4dd8d489995c1c1ff0d3e3636', 13, '4', '2018-10-25 13:02:02'),
(1796, 'a025f2f4dd8d489995c1c1ff0d3e3636', 12, '2', '2018-10-25 13:02:02'),
(1795, 'a025f2f4dd8d489995c1c1ff0d3e3636', 11, '220', '2018-10-25 13:02:02'),
(1794, 'a025f2f4dd8d489995c1c1ff0d3e3636', 5, '3', '2018-10-25 13:02:02'),
(1793, 'a025f2f4dd8d489995c1c1ff0d3e3636', 6, '3.75', '2018-10-25 13:02:02'),
(1792, 'a025f2f4dd8d489995c1c1ff0d3e3636', 7, '3.75', '2018-10-25 13:02:02'),
(1791, 'a025f2f4dd8d489995c1c1ff0d3e3636', 8, '3.5', '2018-10-25 13:02:02'),
(1790, 'a025f2f4dd8d489995c1c1ff0d3e3636', 10, '62', '2018-10-25 13:02:02'),
(1789, 'a025f2f4dd8d489995c1c1ff0d3e3636', 4, '12.5', '2018-10-25 13:02:02'),
(1784, '5b9b04124a02b83fa95cbe0da73f1e9a', 4, '2.2', '2018-10-24 05:23:59'),
(1785, '5b9b04124a02b83fa95cbe0da73f1e9a', 5, '3.9', '2018-10-24 05:23:59'),
(1786, '5b9b04124a02b83fa95cbe0da73f1e9a', 6, '2.5', '2018-10-24 05:23:59'),
(1787, 'b364b4cf76002e23f491f7e1e8905c8c', 4, '2.5', '2018-10-24 06:13:55'),
(1788, 'b364b4cf76002e23f491f7e1e8905c8c', 5, '3.5', '2018-10-24 06:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users_master`
--

CREATE TABLE `tbl_users_master` (
  `id` int(11) NOT NULL,
  `type` char(2) NOT NULL COMMENT 'W - Web, G - Gmail, F - Facebook, M - Mobile ',
  `unique_id` varchar(50) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `favourites` varchar(250) NOT NULL,
  `location` varchar(255) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `house_no` varchar(255) NOT NULL,
  `street` varchar(100) NOT NULL,
  `landmark` varchar(150) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `address_full` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `gender` char(1) NOT NULL COMMENT 'M-Male, F- Female',
  `dob` date NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_pic` varchar(500) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `subscription` tinyint(4) NOT NULL,
  `terms` tinyint(4) NOT NULL,
  `alternate_phone_num` varchar(50) NOT NULL,
  `family_phone_num` varchar(50) NOT NULL,
  `alternate_email` varchar(50) NOT NULL,
  `languages_known` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `workadd` text NOT NULL,
  `work_address` varchar(200) NOT NULL,
  `income_group` varchar(100) NOT NULL,
  `family_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users_master`
--

INSERT INTO `tbl_users_master` (`id`, `type`, `unique_id`, `first_name`, `last_name`, `image`, `favourites`, `location`, `phone_num`, `house_no`, `street`, `landmark`, `city`, `state`, `address`, `address_full`, `pincode`, `gender`, `dob`, `age`, `email`, `created_by`, `created_date`, `modified_date`, `profile_pic`, `latitude`, `longitude`, `subscription`, `terms`, `alternate_phone_num`, `family_phone_num`, `alternate_email`, `languages_known`, `qualification`, `website`, `profession`, `workadd`, `work_address`, `income_group`, `family_type`) VALUES
(1, '', '', 'checka', '', '', '', '', '1111', '', '', '', '', '', '3-3a, , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'check1@gmnail.com', 0, '0000-00-00 00:00:00', '2018-09-26 11:33:31', 'Image_11092018_222057.jpg', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(2, '', '', 'Check2', '', '', '', '', '2222', '', '', '', '', '', '102 , Bulstrode Road, HOUNSLOW', '', 0, '', '0000-00-00', 0, 'chech2@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-12 12:42:05', '', '51.4702948', '-0.3731038', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(3, '', '', 'Aaa', '', '', '', '', '111', '', '', '', '', '', '3-3a,  , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'rrr@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-14 09:49:04', '', '51.4288379', '-0.1313425', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(4, '', '', 'Aa', '', '', '', '', '55', '', '', '', '', '', 'Rr', '', 0, '', '0000-00-00', 0, 'tt@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-14 09:58:14', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(5, '', '', 'Check2', 'Aa', '', '', '', '1212', '', '', '', '', '', 'Sr nagar', '', 0, '', '0000-00-00', 0, 'chech3@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-14 10:02:46', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(6, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-09-14 10:06:35', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(7, '', '', 'Lucky', '', '', '', '', '+1916300573638', '', '', '', '', '', 'Sw166lg', '', 0, '', '0000-00-00', 0, 'tulasi279@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-25 15:24:31', '', '51.4287183', '-0.1314459', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(8, '', '', 'Lucky', 'lucky', '', '', '', '6300573638', '', '', '', '', '', 'D-124&125, Vamika Arcade, Madhura Nagar, Hyderabad, Telangana 500038, India', '', 500038, '', '0000-00-00', 0, 'tulasi@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-21 03:47:22', 'sticker_5_icon.png', '17.439892984407933', '78.4346778318286', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(9, '', '', 'Tt', 'Jj', '', '', '', '33', '', '', '', '', '', 'Gggg', '', 0, '', '0000-00-00', 0, 'Ff@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-15 07:50:24', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(10, '', '', 'Check3', '', '', '', '', '6666', '', '', '', '', '', '3-3a,  , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'Check3@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-15 04:58:14', '', '51.4288379', '-0.1313425', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(11, '', '', 'Check4', '', '', '', '', '7777', '', '', '', '', '', 'VINAYAK NAGAR-1, Medchal Rd, Bowenpally, Hyderabad, Telangana 501401, India', '', 501401, '', '0000-00-00', 0, 'Check4@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-15 04:59:05', '', '17.470117637268377', '78.47000755369662', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(12, '', '', 'Aa', '', '', '', '', '333', '', '', '', '', '', 'Sssss', '', 0, '', '0000-00-00', 0, 'Ss@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-15 07:53:06', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(13, '', '', 'mahesh', '', '', '', '', '8885124727', '', '', '', '', '', 'uppal', '', 0, '', '0000-00-00', 0, 'mahesh@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-16 03:23:42', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(14, '', '', 'Sam', '', '', '', '', '9999', '', '', '', '', '', 'NH65, Jal Vayu Vihar, Raji Reddy Nagar, Hyderabad, Telangana 500072, India', '', 500072, '', '0000-00-00', 0, 'Sam@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-20 12:35:41', '', '17.495920083194207', '78.39795436710119', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(15, '', '', 'Chech', '', '', '', '', '1515', '', '', '', '', '', 'Bharath nagar', '', 0, '', '0000-00-00', 0, 'Chech@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-20 12:52:26', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(16, '', '', 'Abcd', '', '', '', '', '1616', '', '', '', '', '', 'Kukatpally', '', 0, '', '0000-00-00', 0, 'Abcd@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-20 12:54:28', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(17, '', '', 'Checkuser1', '', '', '', '', '3636', '', '', '', '', '', 'Panjagutta', '', 0, '', '0000-00-00', 0, 'Checkuser1@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-21 04:04:31', '', '17.426497899999998', '78.4511322', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(18, '', '', 'Checkuser2', '', '', '', '', '6363', '', '', '', '', '', 'Erramanjil', '', 0, '', '0000-00-00', 0, 'Checkuser2@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-21 04:21:35', '', '17.418152799999998', '78.4545907', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(19, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, 'naga@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-21 09:38:51', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(20, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, 'naga123@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-21 09:39:11', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(21, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, 'naga12366@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-21 09:40:36', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(22, '', '', 'kumar', '', '', '', '', '9642071234', '', '', '', '', '', 'null', '', 0, '', '0000-00-00', 0, 'kumar@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-21 12:26:53', '', '51.526239399999994', '-0.3074821', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(23, '', '', 'hhhhhhh', '', '', '', '', '6589', '', '', '', '', '', 'null', '', 0, '', '0000-00-00', 0, 'htfhii', 0, '0000-00-00 00:00:00', '2018-09-21 12:29:59', '', '51.4371961', '-0.1341084', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(24, '', '', 'devuxm', '', '', '', '', '7777777', '', '', '', '', '', '7a-7b, , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'dev.fb.mm@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-23 11:15:55', '', '51.4286153', '-0.1316052', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(25, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, 'formyteama@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-22 14:12:21', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(26, '', '', 'lernin', '', '', '', '', '66666', '', '', '', '', '', 'sr nagar', '', 0, '', '0000-00-00', 0, 'learnin.co@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-22 15:55:47', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(27, '', '', 'Rama', '', '', '', '', '9493', '', '', '', '', '', '3-3a, , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'ramatulasib@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-25 15:22:06', '', '51.4288379', '-0.1313425', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(28, '', '', 'Llllll', '', '', '', '', '41555555', '', '', '', '', '', 'sr nagr', '', 0, '', '0000-00-00', 0, 'visionaryworks20@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-23 12:49:53', '', 'null', 'null', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(29, '', '', 'rrrrrr', '', '', '', '', '9898', '', '', '', '', '', '3-3a, , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'ramatulasi.1899@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-23 12:24:58', '', '51.4288379', '-0.1313425', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(30, '', '', 'yyyy', '', '', '', '', '5454', '', '', '', '', '', '30 , Woodfield Avenue, LONDON', '', 0, '', '0000-00-00', 0, 'yyy', 0, '0000-00-00 00:00:00', '2018-09-23 13:18:41', '', '51.4365764', '-0.1341818', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(31, '', '', 'Vamsi', '', '', '', '', '9553341143', '', '', '', '', '', '9b, , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'vamsikrishna.javvadi@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-24 05:18:01', '', '51.428593799999994', '-0.1315663', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(32, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, 'null', 0, '0000-00-00 00:00:00', '2018-09-24 05:14:59', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(33, '', '', 'Purushotham', '', '', '', '', '969696', '', '', '', '', '', 'null', '', 0, '', '0000-00-00', 0, 'ppppp@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-24 09:22:19', '', '51.428898800000006', '-0.1312862', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(34, '', '', 'Prasad', '', '', '', '', '07550851606', '', '', '', '', '', 'null', '', 0, '', '0000-00-00', 0, 'rvp1506@gmail.com', 0, '0000-00-00 00:00:00', '2018-09-25 16:01:03', '', '51.434996299999995', '-0.12793069999999998', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(35, '', '', 'purushotham', '', '', '', '', '9642896450', '', '', '', '', '', 'sr nafgary', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-09-28 04:48:11', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(36, '', '', 'ppppppp', '', '', '', '', '9645555555', '', '', '', '', '', '0', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-09-28 09:35:02', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(37, '', '', 'null', '', '', '', '', '99999', '', '', '', '', '', '3-3a,  , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-12 06:00:41', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(38, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, 'sandeep.doodigama@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-13 04:16:36', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(39, '', '', 'null', '', '', '', '', '99', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-13 09:45:36', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(40, '', '', 'null', '', '', '', '', '1234', '', '', '', '', '', '3-3a,  , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-13 09:48:03', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(41, '', '', 'Purushotham', '', '', '', '', '33333', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-13 10:08:16', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(42, '', '', 'Hhhhhh', '', '', '', '', '22222', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-13 10:28:43', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(43, '', '', 'Uuuuuu', '', '', '', '', '9696969696', '', '', '', '', '', '5 , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-13 11:20:49', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(44, '', '', 'Rama Tulasi', '', '', '', '', '+19493962511', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-13 14:45:10', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(45, '', '', 'prasaduk', '', '', '', '', '7550851606', '', '', '', '', '', 'null', '', 0, '', '0000-00-00', 0, 'prasaduk@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-15 01:37:17', '', '51.4377658', '-0.127414', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(46, '', '', 'prasadukuk', '', '', '', '', '7550851707', '', '', '', '', '', '100 , Bulstrode Road, HOUNSLOW', '', 0, '', '0000-00-00', 0, 'prasadukuk@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-16 06:20:00', '', '51.470189', '-0.3730648', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(47, '', '', 'Purushothamrr', '', '', '', '', '9000287226', '', '', '', '', '', 'null', '', 0, '', '0000-00-00', 0, 'purushotham444@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-15 06:13:57', '', '51.470447099999994', '-0.3730399', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(48, '', '', 'Nanna', '', '', '', '', '9581830258', '', '', '', '', '', '94 , Bulstrode Road, HOUNSLOW', '', 0, '', '0000-00-00', 0, 'nanna@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-15 07:03:20', '', '51.470033799999996', '-0.3730998', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(49, '', '', 'lakshmi tulasi', '', '', '', '', '888888', '', '', '', '', '', 'cutxyf uf', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-15 08:06:11', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(50, '', '', 'Ggjgh', '', '', '', '', '82842', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-15 12:44:27', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(51, '', '', 'Purushotham', '', '', '', '', '11111', '', '', '', '', '', '3-3a, , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'HDhdjdiieid@gmail.com', 0, '0000-00-00 00:00:00', '2018-10-27 10:39:36', '', '51.4288379', '-0.1313425', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(52, '', '', 'Prasanna', '', '', '', '', '07450207789', '', '', '', '', '', '6 Streatham Green, Streatham High Road, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-16 21:27:41', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(53, '', '', 'Aaaaaaaa', '', '', '', '', '1224', '', '', '', '', '', '3-3a,  , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-17 04:21:37', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(54, '', '', 'abcd', '', '', '', '', '1234567', '', '', '', '', '', '6 Streatham Green, Streatham High Road, LONDON', '', 0, '', '0000-00-00', 0, 'ghhh@gggh.com', 0, '0000-00-00 00:00:00', '2018-10-17 09:39:15', '', '51.428341599999996', '-0.1316432', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(55, '', '', 'hfjcjfj', '', '', '', '', '12', '', '', '', '', '', '112 , Bulstrode Road, HOUNSLOW', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-17 14:59:41', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(56, '', '', 'Arun', '', '', '', '', '12345', '', '', '', '', '', '3b,  , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-23 05:22:00', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(57, '', '', 'Kiran', '', '', '', '', '121212', '', '', '', '', '', '106 , Bulstrode Road, HOUNSLOW', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-23 06:04:58', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(58, '', '', 'Ghjjk', '', '', '', '', '5525', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-23 10:32:45', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(59, '', '', 'Uuuuu', '', '', '', '', '85858585', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-10-23 10:37:56', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(60, '', '', 'Prasad', '', '', '', '', '0111111111', '', '', '', '', '', '6 Streatham Green, Streatham High Road, LONDON', '', 0, '', '0000-00-00', 0, 'prasad@usertest.com', 0, '0000-00-00 00:00:00', '2018-10-25 13:27:48', '', '51.428341599999996', '-0.1316432', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(61, '', '', 'Ajju', '', '', '', '', '0700000001', '', '', '', '', '', '6 Streatham Green, Streatham High Road, LONDON', '', 0, '', '0000-00-00', 0, 'ajju@usertest.com', 0, '0000-00-00 00:00:00', '2018-10-25 15:36:32', '', '51.428341599999996', '-0.1316432', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(62, '', '', 'prasanna', '', '', '', '', '0712345678', '', '', '', '', '', '75 , Richmond Road, THORNTON HEATH', '', 0, '', '0000-00-00', 0, 'prasu@usertest.com', 0, '0000-00-00 00:00:00', '2018-10-25 17:12:07', '', '51.4001904', '-0.1079392', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(63, '', '', 'Cust01', '', '', '', '', '07123456701', '', '', '', '', '', '6 Streatham Green, Streatham High Road, LONDON', '', 0, '', '0000-00-00', 0, 'cust01@custtest.com', 0, '0000-00-00 00:00:00', '2018-11-12 12:02:35', '', '51.428341599999996', '-0.1316432', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(64, '', '', 'Cust02', '', '', '', '', '07123456702', '', '', '', '', '', '12 , Sunnyhill Road, LONDON', '', 0, '', '0000-00-00', 0, 'cust02@custtest.com', 0, '0000-00-00 00:00:00', '2018-11-12 12:06:51', '', '51.430504899999995', '-0.12851900000000002', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(65, '', '', 'Cust03', '', '', '', '', '07123456703', '', '', '', '', '', '12 , Northcote Road, LONDON', '', 0, '', '0000-00-00', 0, 'cust03@custtest.com', 0, '0000-00-00 00:00:00', '2018-11-12 12:12:32', '', '51.460242699999995', '-0.1669669', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(66, '', '', 'Cust04', '', '', '', '', '07123456704', '', '', '', '', '', '382 , Streatham High Road, LONDON', '', 0, '', '0000-00-00', 0, 'cust04@custtest.com', 0, '0000-00-00 00:00:00', '2018-11-12 12:15:57', '', '51.4253486', '-0.1308581', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(67, '', '', 'Cust05', '', '', '', '', '07123456705', '', '', '', '', '', '73 , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, 'cust05@custtext.com', 0, '0000-00-00 00:00:00', '2018-11-12 12:18:05', '', '51.4250304', '-0.140124', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(68, '', '', 'Prakash', '', '', '', '', '9701090297', '', '', '', '', '', '104 , Bulstrode Road, HOUNSLOW', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-11-19 05:33:08', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(69, '', '', 'bbbb', '', '', '', '', '1237', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-11-21 08:41:50', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(70, '', '', 'asdfgf', '', '', '', '', '21111', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-11-21 22:15:49', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(71, '', '', 'vvvvv', '', '', '', '', '777777', '', '', '', '', '', '5 , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-11-28 07:51:14', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(72, '', '', 'vvvv', '', '', '', '', '8888', '', '', '', '', '', '5 , Mitcham Lane, LONDON', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-11-28 08:06:30', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(73, '', '', 'Aaaaaaa', '', '', '', '', '44444', '', '', '', '', '', '100 , Bulstrode Road, HOUNSLOW', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-11-29 06:36:24', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', ''),
(74, '', '', 'yyyy', '', '', '', '', '9494', '', '', '', '', '', '', '', 0, '', '0000-00-00', 0, '', 0, '0000-00-00 00:00:00', '2018-11-29 13:16:08', '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_addresses`
--

CREATE TABLE `tbl_user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `house_no` varchar(255) NOT NULL,
  `street` varchar(100) NOT NULL,
  `landmark` varchar(150) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pincode` varchar(25) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_addresses`
--

INSERT INTO `tbl_user_addresses` (`id`, `user_id`, `firstname`, `lastname`, `house_no`, `street`, `landmark`, `state`, `city`, `pincode`, `phone`, `latitude`, `address`, `longitude`, `created_at`) VALUES
(15, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '500032', 0, '17.4449', 'begumpet', '78.4669', '2018-09-08 10:54:26'),
(2, 'c206d1b6d31d136ea6bd0659df86475d', '', '', '', '', '', '', '', '0', 0, '76576577', '756765767', '76576657', '2018-09-08 10:37:16'),
(3, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.4447', '0', '78.4664', '2018-09-08 10:43:51'),
(4, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.4447', '0', '78.4664', '2018-09-08 10:46:37'),
(5, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.4447', '0', '78.4664', '2018-09-08 10:46:55'),
(6, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.4447', 'sr nagsar', '78.4664', '2018-09-08 10:47:29'),
(7, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.4447', 'sr nagsar', '78.4664', '2018-09-08 10:47:44'),
(9, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '11111111', 'sr nagsar', '22222222', '2018-09-08 10:48:21'),
(16, '', '', '', '', '', '', '', '', '0', 0, '51.428593799999994', '9b, , Mitcham Lane, LONDON', '-0.1315663', '2018-09-10 06:05:32'),
(17, '', '', '', '', '', '', '', '', '0', 0, '17.440817799999998', '', '78.4733677', '2018-09-10 06:07:28'),
(13, 'c206d1b6d31d136ea6bd0659df86475d', '', '', '', '', '', '', '', '0', 0, '5555', '7777', '6666', '2018-09-08 10:49:51'),
(18, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '51.428593799999994', '9b, , Mitcham Lane, LONDON', '-0.1315663', '2018-09-10 06:10:07'),
(19, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.440663999999998', '', '78.4732082', '2018-09-10 06:13:33'),
(20, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '51.4702962', '104 , Bulstrode Road, HOUNSLOW', '-0.3730107', '2018-09-10 06:15:25'),
(21, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.440663999999998', '', '78.4732082', '2018-09-10 06:16:59'),
(22, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.420405799999997', '11-3-59, Warasiguda Rd, Mahmoodguda, Seethaphalmandi, Padmarao Nagar, Secunderabad, Telangana 500061, India', '78.51102039999999', '2018-09-10 06:19:38'),
(23, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.440663999999998', '', '78.4732082', '2018-09-10 06:21:26'),
(24, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.440663999999998', '', '78.4732082', '2018-09-10 06:24:57'),
(25, '05961df611f0ea5e8b460aff68038fdf', '', '', '', '', '', '', '', '0', 0, '17.440663999999998', '1-8-344/1, Patigadda, Begumpet, Hyderabad, Telangana 500016, India', '78.4732082', '2018-09-10 06:26:55'),
(26, '', '', '', '', '', '', '', '', '0', 0, '17.440663999999998', '1-8-344/1, Patigadda, Begumpet, Hyderabad, Telangana 500016, India', '78.4732082', '2018-09-10 08:03:59'),
(66, 'e37c6b6c59cad040513557ef6db345ff', '', '', '', '', '', '', '', 'null', 0, '17.418152799999998', 'Erramanjil', '78.4545907', '2018-09-21 04:21:20'),
(41, '9c2c5aef0cacded9f4849d48b9f766dc', '', '', '', '', '', '', '', '0', 0, '51.428593799999994', '9b, , Mitcham Lane, LONDON', '-0.1315663', '2018-09-14 05:29:51'),
(65, '59b730896feb792b9fdbcf3fd1b2e0e0', '', '', '', '', '', '', '', 'null', 0, '17.426497899999998', 'Panjagutta', '78.4511322', '2018-09-21 04:03:38'),
(43, 'edd1905e03e71b9a7b949126b9682277', '', '', '', '', '', '', '', '0', 0, '17.440663999999998', '1-8-344/1, Patigadda, Begumpet, Hyderabad, Telangana 500016, India', '78.4732082', '2018-09-14 10:01:00'),
(38, 'f39adc7bcb8c0d1830cbb901ba5c304e', '', '', '', '', '', '', '', '0', 0, '51.428593799999994', '9b, , Mitcham Lane, LONDON', '-0.1315663', '2018-09-10 12:54:35'),
(39, 'f39adc7bcb8c0d1830cbb901ba5c304e', '', '', '', '', '', '', '', '0', 0, '51.4288379', '3-3a, , Mitcham Lane, LONDON', '-0.1313425', '2018-09-10 12:54:58'),
(44, 'edd1905e03e71b9a7b949126b9682277', '', '', '', '', '', '', '', '0', 0, '18.6884446', 'Unnamed Road, Ambedkar Colony, Nizamabad, Telangana 503001, India', '78.0948094', '2018-09-14 10:03:56'),
(45, '59b730896feb792b9fdbcf3fd1b2e0e0', '', '', '', '', '', '', '', '0', 0, '17.443649699999998', '', '78.4458259', '2018-09-14 10:10:03'),
(118, 'c929b21a0afca672424a64357d8f1753', '', '', '', '', '', '', '', 'SW16 6NA', 0, '51.4288379', '3-3a, , Mitcham Lane, LONDON', '-0.1313425', '2018-10-22 05:43:16'),
(90, 'adc7b666517c7822974de930f2a017da', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4699251', '90 , Bulstrode Road, HOUNSLOW', '-0.3732141', '2018-09-25 11:49:50'),
(117, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4699521', '92 , Bulstrode Road, HOUNSLOW', '-0.373116', '2018-10-17 15:43:31'),
(106, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'W5 2NT', 0, '51.5146702', '1a-1b, , The Broadway, LONDON', '-0.30229439999999996', '2018-10-13 05:17:15'),
(88, 'adc7b666517c7822974de930f2a017da', '', '', '', '', '', '', '', '500038', 0, '17.443649699999998', 'sr nagar', '78.4458259', '2018-09-25 11:48:48'),
(55, '447db8d794c78c71e6d3cbb4922a8072', '', '', '', '', '', '', '', '500016', 0, '17.440663999999998', '1-8-344/1, Patigadda, Begumpet, Hyderabad, Telangana 500016, India', '78.4732082', '2018-09-15 09:09:42'),
(89, 'adc7b666517c7822974de930f2a017da', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428341599999996', '11 Streatham Green, Streatham High Road, LONDON', '-0.1316432', '2018-09-25 11:49:17'),
(68, 'a94f8281f978522e22b1330350d8ea58', '', '', '', '', '', '', '', 'null', 0, '17.426497899999998', 'Panjagutta', '78.4511322', '2018-09-21 06:14:31'),
(62, '447db8d794c78c71e6d3cbb4922a8072', '', '', '', '', '', '', '', 'TW3 3AJ', 0, '51.4702962', '104 , Bulstrode Road, HOUNSLOW', '-0.3730107', '2018-09-15 10:40:36'),
(67, 'a94f8281f978522e22b1330350d8ea58', '', '', '', '', '', '', '', 'null', 0, '17.418152799999998', 'Erramanjil', '78.4545907', '2018-09-21 06:06:41'),
(113, 'df2a015e1d16dc2b3bb766a45c8e7185', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428711199999995', '3b, , Mitcham Lane, LONDON', '-0.1312327', '2018-10-16 07:45:11'),
(111, 'a976de26180d4af694520b6397c32e2a', '', '', '', '', '', '', '', 'TW3 3AJ', 0, '51.470189', '100 , Bulstrode Road, HOUNSLOW', '-0.3730648', '2018-10-16 06:12:30'),
(112, 'c929b21a0afca672424a64357d8f1753', '', '', '', '', '', '', '', 'TW3', 0, '51.4703756', '106 , Bulstrode Road, HOUNSLOW', '-0.3730606', '2018-10-16 06:45:40'),
(110, '0a43867a4af55a22a149c7152986e4bf', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4705714', '112 , Bulstrode Road, HOUNSLOW', '-0.3730559', '2018-10-15 06:33:57'),
(109, 'c929b21a0afca672424a64357d8f1753', '', '', '', '', '', '', '', 'SW16 6AB', 0, '51.427037899999995', 'Pankhurst House 1k (Flat 12), , Gleneagle Road, LONDON', '-0.131898', '2018-10-13 10:00:10'),
(103, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'CR7 7QF', 0, '51.4011305', '103 , Richmond Road, THORNTON HEATH', '-0.1094709', '2018-10-13 04:46:11'),
(77, '87b0a1920402bf465db33db4643964ce', '', '', '', '', '', '', '', 'null', 0, 'null', '', 'null', '2018-09-22 16:30:53'),
(108, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4699521', '92 , Bulstrode Road, HOUNSLOW', '-0.373116', '2018-10-13 07:46:05'),
(107, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428341599999996', '6 Streatham Green, Streatham High Road, LONDON', '-0.1316432', '2018-10-13 07:45:31'),
(80, '097e0016af8a1ab0b3a155f044f83a64', '', '', '', '', '', '', '', '500038', 0, '17.443649699999998', 'sr nagar', '78.4458259', '2018-09-23 11:16:49'),
(102, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4696961', '44 , Bulstrode Road, HOUNSLOW', '-0.37103280000000005', '2018-10-12 12:42:05'),
(82, '44ec047edd511a296a4177c735fe73b5', '', '', '', '', '', '', '', 'W5 1PA', 0, '51.526117799999994', '14 , Woodfield Avenue, LONDON', '-0.30748139999999996', '2018-09-23 12:44:40'),
(83, '097e0016af8a1ab0b3a155f044f83a64', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428593799999994', '9b, , Mitcham Lane, LONDON', '-0.1315663', '2018-09-24 04:24:33'),
(84, '2061a4ebe949699f26bb97781ff8f371', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4702948', '102 , Bulstrode Road, HOUNSLOW', '-0.3731038', '2018-09-24 05:18:37'),
(101, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4702948', '102 , Bulstrode Road, HOUNSLOW', '-0.3731038', '2018-10-12 11:11:36'),
(100, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428593799999994', '9b, , Mitcham Lane, LONDON', '-0.1315663', '2018-10-12 10:48:53'),
(99, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428593799999994', '9b, , Mitcham Lane, LONDON', '-0.1315663', '2018-10-12 10:33:21'),
(116, 'c929b21a0afca672424a64357d8f1753', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4702948', '102 , Bulstrode Road, HOUNSLOW', '-0.3731038', '2018-10-16 10:54:09'),
(115, 'df2a015e1d16dc2b3bb766a45c8e7185', '', '', '', '', '', '', '', 'TW3 3AL', 0, 'null', '110 , Bulstrode Road, HOUNSLOW', 'null', '2018-10-16 07:46:43'),
(119, '9f26032e14cd9387f171156e5680f621', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.4287056', '5 , Mitcham Lane, LONDON', '-0.1314904', '2018-10-22 13:29:54'),
(120, 'df2a015e1d16dc2b3bb766a45c8e7185', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428898800000006', '1a, , Mitcham Lane, LONDON', '-0.1312862', '2018-10-23 11:57:07'),
(121, 'df2a015e1d16dc2b3bb766a45c8e7185', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428898800000006', '1a, , Mitcham Lane, LONDON', '-0.1312862', '2018-10-23 12:01:46'),
(122, 'df2a015e1d16dc2b3bb766a45c8e7185', '', '', '', '', '', '', '', 'SW16 6LG', 0, '51.428660799999996', '5a-5b, , Mitcham Lane, LONDON', '-0.13147409999999998', '2018-11-05 07:02:59'),
(123, 'dd6a847baaaff26087729db5ec012359', '', '', '', '', '', '', '', 'TW3 3AJ', 0, '51.4702962', '104 , Bulstrode Road, HOUNSLOW', '-0.3730107', '2018-11-15 11:19:50'),
(124, 'dd6a847baaaff26087729db5ec012359', '', '', '', '', '', '', '', 'SW16 6NY', 0, '51.4182629', '234 , Streatham Road, LONDON', '-0.1494218', '2018-11-15 11:23:15'),
(125, 'dd6a847baaaff26087729db5ec012359', '', '', '', '', '', '', '', 'SW16 6NA', 0, '51.4288379', '3-3a, , Mitcham Lane, LONDON', '-0.1313425', '2018-11-26 11:09:41'),
(126, 'dd6a847baaaff26087729db5ec012359', '', '', '', '', '', '', '', 'SW16 6NY', 0, '51.4182629', '234 , Streatham Road, LONDON', '-0.1494218', '2018-12-03 09:25:39'),
(127, 'dd6a847baaaff26087729db5ec012359', '', '', '', '', '', '', '', 'TW3 3AL', 0, '51.4696947', '52 , Bulstrode Road, HOUNSLOW', '-0.3714477', '2018-12-03 10:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_login_accessinfo`
--

CREATE TABLE `tbl_user_login_accessinfo` (
  `aid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `oauth_provider` varchar(200) NOT NULL,
  `oauth_uid` text NOT NULL,
  `user_type` char(3) NOT NULL,
  `password` varchar(300) NOT NULL,
  `user_token` varchar(255) NOT NULL,
  `email_verification_key` varchar(200) NOT NULL,
  `sms_verification_key` varchar(100) NOT NULL,
  `rest_verification_key` varchar(200) NOT NULL,
  `account_status` char(2) NOT NULL,
  `email_activate_status` tinyint(3) NOT NULL,
  `mobile_activate_status` tinyint(2) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_login_accessinfo`
--

INSERT INTO `tbl_user_login_accessinfo` (`aid`, `userid`, `oauth_provider`, `oauth_uid`, `user_type`, `password`, `user_token`, `email_verification_key`, `sms_verification_key`, `rest_verification_key`, `account_status`, `email_activate_status`, `mobile_activate_status`, `updated_at`) VALUES
(1, 1, '', '', 'N', 'b59c67bf196a4758191e42f76670ceba', 'ds0H45tWg2E:APA91bFYfto3Q9Ep3sLCL4gj5iaoCKHSLRfBMVOhBFrOg2agNePcBk2ANIfos2SHn4mZ8rE_1GVCMm83Cg4XlaS7KibaIv4ZD0JQ7QkPWdeOZ5XVV4At98Pm_WXaRMPH5WqI1dlJWbBJ', '501fcb1e60e65b51f967390bcb4a1e25', '', '9f26032e14cd9387f171156e5680f621', 'I', 1, 1, '0000-00-00 00:00:00'),
(2, 2, '', '', 'N', '934b535800b1cba8f96a5d72f72f1611', '', '7f9df948eaca52ecd1f287177b0740bb', '', '9c2c5aef0cacded9f4849d48b9f766dc', 'I', 1, 1, '0000-00-00 00:00:00'),
(3, 3, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'a05b733fbc1a2e6f02c53fb149c3f9dc', '', 'b847b57e3ca0c477dea6a6a748b77fff', 'I', 1, 1, '0000-00-00 00:00:00'),
(4, 4, '', '', 'N', '6512bd43d9caa6e02c990b0a82652dca', '', 'bea5518158a0f267dc4cbf3c3c02c5c2', '', '6b0521df3b4c58ae4b2360b811a0bdfb', 'I', 1, 1, '0000-00-00 00:00:00'),
(5, 5, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'bfc3c8cd3d0754760a8d9d891f3b9338', '', 'edd1905e03e71b9a7b949126b9682277', 'I', 1, 1, '0000-00-00 00:00:00'),
(6, 6, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', '', 'e97a373582b948a5c15f4e4ef4b084b2', '', '6a4c2726e4e953eb56795a040063dd1d', 'I', 1, 1, '0000-00-00 00:00:00'),
(7, 7, '', '', 'N', '339a65e93299ad8d72c42b263aa23117', '', '96cef59c36476a183b4cf4d73abd04ab', '', '44ec047edd511a296a4177c735fe73b5', 'I', 1, 1, '0000-00-00 00:00:00'),
(8, 8, '', '', 'N', 'e10adc3949ba59abbe56e057f20f883e', '', 'fbc32e261d43edc76aacdf5929a0a92c', '', '59b730896feb792b9fdbcf3fd1b2e0e0', 'I', 1, 1, '0000-00-00 00:00:00'),
(9, 9, '', '', 'N', '182be0c5cdcd5072bb1864cdee4d3d6e', 'eK5RpS6apBw:APA91bGUPBCpn9aUHsBubAG_kr49Vo95h63DgEpoStLIihUDypqxxhl0eAmNSrZznTEqBZZBywpskKuD-HdPNfDosUX0zhgYGRWwnRpDe3CNdcuUGEMOH55vMaljDyk8D_Tk-nJKcj5H', '81bd684a3fcdc91fbd37322014dc1f79', '', '447db8d794c78c71e6d3cbb4922a8072', 'I', 1, 1, '0000-00-00 00:00:00'),
(10, 10, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '7fcd9a71ecdc22bb10f01d2a0a8bc50a', '', 'c295f8c2036a7a635b8116c914e228b7', 'I', 1, 1, '0000-00-00 00:00:00'),
(11, 11, '', '', 'N', 'd79c8788088c2193f0244d8f1f36d2db', '', '7c4034d084ee085e48b2d49a63700aa1', '', '1cf1c91fe870152d6c9a635e570c97d2', 'I', 1, 1, '0000-00-00 00:00:00'),
(12, 12, '', '', 'N', '310dcbbf4cce62f762a2aaa148d556bd', '', '3b048accf67ea13c1530ce23b63f4fcc', '', '478a753556d18361d05a0591e7925a6d', 'I', 1, 1, '0000-00-00 00:00:00'),
(13, 13, '', '', 'N', '81dc9bdb52d04dc20036dbd8313ed055', '', '5f37588eb8d490f0c97281391e546665', '', '84825f45c01a856212a87fc4bb981da2', 'I', 1, 1, '0000-00-00 00:00:00'),
(14, 14, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '1f36e8f1c086f31eb6b54b1d1c739bcb', '', 'c423d3af9e21017d183204acd1319bd4', 'I', 1, 1, '0000-00-00 00:00:00'),
(15, 15, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'bdb7aeeae0f86aabc842d4609104352f', '', 'f5398a2bbec39ebcd5efbda1b1fd46a7', 'I', 1, 1, '0000-00-00 00:00:00'),
(16, 16, '', '', 'N', '962e56a8a0b0420d87272a682bfd1e53', 'null', '892dd8d98fa1ebcc8bf5df03cbd3c280', '', '1e04e32c25a92a3e30e3a34a41598861', 'I', 1, 1, '0000-00-00 00:00:00'),
(17, 17, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '0fa916c0e5015a4bce0d5a998428945f', '', 'e37c6b6c59cad040513557ef6db345ff', 'I', 1, 1, '0000-00-00 00:00:00'),
(18, 18, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '9e249723aa55d6d94042b5cd4c944c2d', '', 'a94f8281f978522e22b1330350d8ea58', 'I', 1, 1, '0000-00-00 00:00:00'),
(19, 19, '', '', 'G', '', '0', '4e0c6a9c2abad709027021b917dfc17f', '', '4f45561490b9176279db3eb067120d3c', 'A', 1, 1, '0000-00-00 00:00:00'),
(20, 20, '', '', 'G', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '1e4f7aef3c0748988f2703865a984ae2', '', '0e0f4f8384f4a6f12be2b23c2d141a94', 'A', 1, 1, '0000-00-00 00:00:00'),
(21, 21, '', '', 'G', '', 'fdsfdsfsdf', '4a6c9433f1337de650a80e1799efc8c8', '', '4c1775b72b34266028f14070746eb45f', 'A', 1, 1, '0000-00-00 00:00:00'),
(22, 22, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '6c8277a29a79a6fb75ac069e35767905', '', 'b5127cc547faf490d7c2d2b66444bc5c', 'I', 1, 1, '0000-00-00 00:00:00'),
(23, 23, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'f6c93903b6b420766755de7854d57a72', '', 'b6134c2cc39de8062150bbb88de2e3aa', 'I', 1, 1, '0000-00-00 00:00:00'),
(24, 24, '', '', 'G', '', 'dJYv59DR0G4:APA91bE4QafQcGGJ8pJtHrvk-qe8C8s1sTMiKC6_Yo6KDzWKt9cZujZ6NbrWcq4M3Jctg6MZR7tBxamM2D6pfDbUoGsYBxbsD-heZs-qyMRZ6wjesT2W4lAyzcWx2ttiQ4hIjxTL8kVn', '8c72a57ce7cab993756b53ee0f20d667', '', '097e0016af8a1ab0b3a155f044f83a64', 'A', 1, 1, '0000-00-00 00:00:00'),
(25, 25, '', '', 'G', '', 'c6MW90OJZi8:APA91bEemytkPhL8M0dAkPUWmcevSzC5bNv3GXvlnaMae9kJmrifU59Y0jaGTH5feI3Kf9ZE8sy3WWOpGdv7N9gpED1qYq2mzwmpmXuapT4db5czRq23G8PsVesnJDYw2fbmpZ5DuvNT', '820fa3acb17a45de266d400b626eb933', '', '87b0a1920402bf465db33db4643964ce', 'A', 1, 1, '0000-00-00 00:00:00'),
(26, 26, '', '', 'G', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'dd1996cbd79969c5133b7a071149fc86', '', 'eb8af565fcdd418b4d0acdb831bab19e', 'A', 1, 1, '0000-00-00 00:00:00'),
(27, 27, '', '', 'G', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'f4cdbc98bf3494b3516d57ec6ee2549e', '', 'c929b21a0afca672424a64357d8f1753', 'A', 1, 1, '0000-00-00 00:00:00'),
(28, 28, '', '', 'G', '', 'dEQ1Nqs5Qco:APA91bFbHpU8aE9qOGuBkuKlGMn1U_gu4GGT5tZeuIjLGd0VTfuxz5ameHyEb1PluXUz__Uy5zhY4ydg9gAKrqlSdpYVNkiblzwPiKGoeu-dK6f6kCjT_-Ah-bMpGgyUD-dwHr1ciZJR', '507cfefe31b15fdf23a53a91164d4117', '', '608a4aa855dcc716452b2abd6a703229', 'A', 1, 1, '0000-00-00 00:00:00'),
(29, 29, '', '', 'G', '', 'eY6y4L75GwY:APA91bGdMnN5Gv9aqCJf94LpSGpDPgNVjuXJ8XtKbOhkimPigYGgSLf_SFLqOOII8qnjiLRSh06MmtScIdAVtlMv3-LtD9R2UdLnsrOn7xlaG_lo60YSUVsZRFfv_hBTcjOz3AK1ODZL', 'abdd25c731b3b065ae8cbf5053b24837', '', '01cfb7cb50c2798c487fc8cc0a15a34f', 'A', 1, 1, '0000-00-00 00:00:00'),
(30, 30, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'a3dd92212ad658f5fe8da2871a3a62a1', '', 'adc7b666517c7822974de930f2a017da', 'I', 1, 1, '0000-00-00 00:00:00'),
(31, 31, '', '', 'G', '', 'fKpXA4t03Us:APA91bHm37AfG8pNG_mgz5kOe2MDrjmdJm_vC_BSPoml4zroGmcJ5CjGCctbgIvn5jWqTjI1GRqAXMHrSIbY3uyWagZQ5x9wrsnI8jUDVEgMU_Llm3NXDkn1KQKt0m5hWGyhyiMiLTqK', 'fae2ac07bd6472f5ec717cccf4903872', '', '2061a4ebe949699f26bb97781ff8f371', 'A', 1, 1, '0000-00-00 00:00:00'),
(32, 32, '', '', 'G', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '1ce026bf64260e17d0deb8af957edb82', '', 'ffe815d7afa5167d504707c34c29eeba', 'A', 1, 1, '0000-00-00 00:00:00'),
(33, 33, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '1de64906324f311d751a22f551049a54', '', 'd354c11adf8c425ad5e05589526abf87', 'I', 1, 1, '0000-00-00 00:00:00'),
(34, 34, '', '', 'N', 'a039dc98d877db12416fa4989507205c', 'cO7F3k4oJ0U:APA91bFHFbh2sq_FaqG9yjxEZIx1zsfxM1Waq4S4KpTWGFECApRei44wYr7ISDS3Vf5k1E37bsx3gGZlmPwLFx-uqDpnMZTOWay8h2k4v-MvEXLfcdykQjDINRLalhTOyhwLiIPZS2OY', 'fe993d0cd8864d6c854a767021248ed8', '', '3e50801473d4c11767530dae37e6be07', 'I', 1, 1, '0000-00-00 00:00:00'),
(35, 35, '', '', 'N', 'c2f315e571bb51fbbfd905cb98d7e654', '', '1c34da9938cc9dcb7e7e82fb065c01f1', '', '07c29f8a726fa4015b639e3500333c8d', 'I', 1, 1, '0000-00-00 00:00:00'),
(36, 36, '', '', 'N', '4c477661dbc28a96f8d965efa9409e20', '', '5b69fb86854266cc70576526666713f8', '', '1d68b6853051357e0309ae8f0f60d3e1', 'I', 1, 1, '0000-00-00 00:00:00'),
(37, 37, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'a10fa84f331666b7b761e78138298d29', '', 'cbc7340a4d58915fedd63fbcf303703b', 'I', 1, 1, '0000-00-00 00:00:00'),
(38, 38, '', '', 'G', '', 'eqGhnn3y4XM:APA91bEjKNzrX065rYMSJsdaojFwGMmOlTeuqlla8J8BH03SZH7BInSMEzWYFfvyqWN_WxwW63ICtYjr1CQKxQ_KayKRuqKqW9hZ-SxMQUMyiEu44SGkCvzOEelq7lRdqoDYZOw8uTDF', 'e9dac2d2fa8b9a00da0a86a8688d165d', '', '455746a783929d82d49a93a04dec5bbc', 'A', 1, 1, '0000-00-00 00:00:00'),
(39, 39, '', '', 'N', 'ac627ab1ccbdb62ec96e702f07f6425b', '', '1a8f71a9728f4327cdc9acc31d069ab3', '', '94cccf52a644fbc6a70ff0afb9bd9af8', 'I', 1, 1, '0000-00-00 00:00:00'),
(40, 40, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '82f1da52926e53155fb5823ea95c0815', '', 'd89a38c5d6401be68941856f21e77431', 'I', 1, 1, '0000-00-00 00:00:00'),
(41, 41, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '8fe17ab16cf7c1845abeda2b28db3aa1', '', 'f5d86213868d6df4af830d038e57245a', 'I', 1, 1, '0000-00-00 00:00:00'),
(42, 42, '', '', 'N', '3d2172418ce305c7d16d4b05597c6a59', '', '488274a1f0da64f3c6260a6e6dc91f14', '', '20eb68d14df8e063947117713cacde6d', 'I', 1, 1, '0000-00-00 00:00:00'),
(43, 43, '', '', 'N', '3dd51a604bede08bca00db933f2ec9b6', '', 'b4bc6f61f23a127a9479d0fe90a11561', '', '75d3ee4544db4a9674d169d4141eb50f', 'I', 1, 1, '0000-00-00 00:00:00'),
(44, 44, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'e0acf39ab8d00ce159487e3dab8dc822', '', 'cf66eeb03bdf92d9efd70ab4d33502a3', 'I', 1, 1, '0000-00-00 00:00:00'),
(45, 45, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'a9609ce18ba55e5f68f0ab1c681d451c', '', 'a976de26180d4af694520b6397c32e2a', 'I', 1, 1, '0000-00-00 00:00:00'),
(46, 46, '', '', 'N', '16d7a4fca7442dda3ad93c9a726597e4', 'e67J1YAo_8w:APA91bFM2INXknvv9N2uckzQ-lQT58wcfQOAbI5DvmFLM9vmIpLOCuQdJKm7d_sTdPqD9kcTDIzEe5w5x3O4DpbXaMKsQ9hx3iFATI7bC-rlVaa420siQxIUSCiXKS4WCxuKtv7GQUJa', '72ec520e19d8a6df6971067047e3c8f6', '', '4e9ead22d9b45b4ce246ed643a0aa57c', 'I', 1, 1, '0000-00-00 00:00:00'),
(47, 47, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '4c5817bcabc0e6a5b67d024e50ab4a00', '', '0a43867a4af55a22a149c7152986e4bf', 'I', 1, 1, '0000-00-00 00:00:00'),
(48, 48, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '0aeba66e01b2fced6e180fedc297e564', '', 'a68f4dae582623ff6fca92ac2c0d639f', 'I', 1, 1, '0000-00-00 00:00:00'),
(49, 49, '', '', 'N', '21218cca77804d2ba1922c33e0151105', '', 'b66f37201f687f5ce92ef11bb79d15dc', '', '79eae9cc9b8541e50d088436a0e5048f', 'I', 1, 1, '0000-00-00 00:00:00'),
(50, 50, '', '', 'N', 'd41d8cd98f00b204e9800998ecf8427e', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'd74ca7c8d4a78f142aa457a5ebc27358', '', 'e1d00a7453d9a4300f9da0b9b7797c2a', 'I', 1, 1, '0000-00-00 00:00:00'),
(51, 51, '', '', 'N', 'b59c67bf196a4758191e42f76670ceba', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '61103df1d538020f77bef574bc699ea5', '', 'df2a015e1d16dc2b3bb766a45c8e7185', 'I', 1, 1, '0000-00-00 00:00:00'),
(52, 52, '', '', 'N', '69af8c641182447027cbee19f2557693', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '608cfe8447f2fcf81ab56736f404314d', '', 'ed206c77745efcd11c804434a8084ba0', 'I', 1, 1, '0000-00-00 00:00:00'),
(53, 53, '', '', 'N', '68d13cf26c4b4f4f932e3eff990093ba', '', '890d627be13e580298cda68ac938d7e4', '', '1e93a53ef5edabfa510f89634a098935', 'I', 1, 1, '0000-00-00 00:00:00'),
(54, 54, '', '', 'N', 'fcea920f7412b5da7be0cf42b8c93759', 'e2gnUI5XrKI:APA91bFVRJriU2mfDkeBrYcvBd_TmAYntnBLFHhOG89R6JUCIh1M3NCv3nnDWbVdq_JKwRsXkvVaqihUjjpvLoAUBVVKQyX8TvaDLW1db_58gtZEonxNdklpq23MWwkZqG5p2NTmYVro', '465770c3c90da068e47cd999c3b41cf6', '', '5cfdd847be8c081fe82370ea1861c037', 'I', 1, 1, '0000-00-00 00:00:00'),
(55, 55, '', '', 'N', 'c20ad4d76fe97759aa27a0c99bff6710', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '27c88185a2bb1d4c9dd659877c6b0702', '', 'de05fb074e57824b4520ef40acd69bea', 'I', 1, 1, '0000-00-00 00:00:00'),
(56, 56, '', '', 'N', '827ccb0eea8a706c4c34a16891f84e7b', '', 'b7160dabcc83b2ecd1ba5045c48996f3', '', '848d0476318eab32cfed4b06030790be', 'I', 1, 1, '0000-00-00 00:00:00'),
(57, 57, '', '', 'N', '93279e3308bdbbeed946fc965017f67a', '', 'ba1a085ce8a787471c7dad1f2575d0f3', '', '8749d112989e4345e73030df2d0ef2a5', 'I', 1, 1, '0000-00-00 00:00:00'),
(58, 58, '', '', 'N', '4b17d3264fd9070a5be706c853ccd720', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '6b24072d1664a460c4a52a920b7a1f91', '', 'c4ebeb3fa20abf03a4f461d21e191e0c', 'I', 1, 1, '0000-00-00 00:00:00'),
(59, 59, '', '', 'N', 'a9d39ae016c9a7238a95c877758784c4', '', '36d6cd66e46b12d28d62caaa57b2dee6', '', '1c95da8b385bc127bbb3ae6d457a30c4', 'I', 1, 1, '0000-00-00 00:00:00'),
(60, 60, '', '', 'N', 'e227a8e33031158173beb537363c5d41', 'cSuXJu3WSRA:APA91bHgemtJ416TPxldOFTbncEYrctLJnAhUBm2G50ILtznAIi6JeyQF5q8yI94kG4-mUmZ1rnsBLupk9jnTeAGJ4bnI_ZWnNkH-SxGnqrWORqyGVgxiTuKZOq163YzvbC-K8_hdfPY', 'ca1b7d98080be61e39257c72e7c186d0', '', '7b8bab601f3c923f146d28a5212cce0c', 'I', 1, 1, '0000-00-00 00:00:00'),
(61, 61, '', '', 'N', '28a30d56901da746c2d03c0c30d61e2d', 'dhn1WlqFOXo:APA91bEk2E67lUHPFqP71BjAjm--Rw9UdMG4qsLaL5eND6UG8blK_AzLUpuc1Ro1i8TiIKjAMQBIurC6k8x7o4o8bjPUYkTwRDiGJrcnZpcr7HkmHYFPMAyuUanoeulQ6OgLi7ht5kp-', '108e9b5cfc7aa5daaaa48832cd495258', '', '9e74a6bf71d97786559d944fd39713b1', 'I', 1, 1, '0000-00-00 00:00:00'),
(62, 62, '', '', 'N', '648dc8f75ead31d1fe1c91b9840278e4', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '634043860174067d7c57025120aca09b', '', 'd5781c7124786a213714bb6e2c9cfa23', 'I', 1, 1, '0000-00-00 00:00:00'),
(63, 63, '', '', 'N', '97b200a04e76393edc0c2594eed4c97d', 'eANzfpI3X5s:APA91bFFkDyoHtXPFHQFTrld9jFR6cZwVAqOYSgyhOWk8s0-UpfDnwHT3AOnjvdpzFnZuQGZpUc3HNbZlUJhou_V3-SzeOmXCOhLbsL85aJjptEJxgUWmk-1vqjhZ0Sb6LtVdDPKg2La', 'ea7e3038c40cb888f8abeac3290891a8', '', '54a4d9a3a2c6023ff7b3c227a651d651', 'I', 1, 1, '0000-00-00 00:00:00'),
(64, 64, '', '', 'N', 'a348c4a36a900d152248c06dded50580', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '2f69643d8a39ff634e2e5561ddc64a8a', '', 'dd6a847baaaff26087729db5ec012359', 'I', 1, 1, '0000-00-00 00:00:00'),
(65, 65, '', '', 'N', '48c534b165aaa78a0ee69d4d943da39a', 'eANzfpI3X5s:APA91bFFkDyoHtXPFHQFTrld9jFR6cZwVAqOYSgyhOWk8s0-UpfDnwHT3AOnjvdpzFnZuQGZpUc3HNbZlUJhou_V3-SzeOmXCOhLbsL85aJjptEJxgUWmk-1vqjhZ0Sb6LtVdDPKg2La', 'a01e91da093e53aea2c6c8f9d34403f6', '', '50957449ac6ee1b95b50073d8c70157a', 'I', 1, 1, '0000-00-00 00:00:00'),
(66, 66, '', '', 'N', '5b0ca6fa42bff7ba4928f7f22113c42e', 'eANzfpI3X5s:APA91bFFkDyoHtXPFHQFTrld9jFR6cZwVAqOYSgyhOWk8s0-UpfDnwHT3AOnjvdpzFnZuQGZpUc3HNbZlUJhou_V3-SzeOmXCOhLbsL85aJjptEJxgUWmk-1vqjhZ0Sb6LtVdDPKg2La', 'e3b661bc56212fcefadc3e40a4b351fb', '', '4aa6f992ba801bb26ddf421e4ee561cc', 'I', 1, 1, '0000-00-00 00:00:00'),
(67, 67, '', '', 'N', 'f5668cf7e8c379a7abee7cd03f1c6ed2', 'eANzfpI3X5s:APA91bFFkDyoHtXPFHQFTrld9jFR6cZwVAqOYSgyhOWk8s0-UpfDnwHT3AOnjvdpzFnZuQGZpUc3HNbZlUJhou_V3-SzeOmXCOhLbsL85aJjptEJxgUWmk-1vqjhZ0Sb6LtVdDPKg2La', '8f35edda6b4a2bd115c261e9d00098bb', '', '6c7f90605843e754498d7445a287603c', 'I', 1, 1, '0000-00-00 00:00:00'),
(68, 68, '', '', 'N', 'a9dbf68c3f1202dc90783276553ee602', '', 'cb8d6b6facfba0f2003b8641b6b96f25', '', '680731bbdc285fe93f5aa5492a44a16a', 'I', 1, 1, '0000-00-00 00:00:00'),
(69, 69, '', '', 'N', 'a9eb812238f753132652ae09963a05e9', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', '77cacd240efb617b0e6c517f5ce0a267', '', 'e6a2f04e2bb57f74e865bb065360eb97', 'I', 1, 1, '0000-00-00 00:00:00'),
(70, 70, '', '', 'N', '71ecf3a12729ba438d057df53c82a1ca', 'f1GNruJfhtc:APA91bFVWACRHe5FxKs4uR_qdmXyNk3kcLGZO2HdCueVQ4IeSQwwDV8g7WdCC9wat2zrG8vgLvkZWjSUTjKD-Zu26-P6ggKdnngxn5LayHWvt5K9fgbg6A0Af-9LWYRKUvK-f4vnIKi7', 'c8fcde0fdbbf0c1bb94019e2b6f66e8e', '', 'e0f6c145b8529f7a7a970b482329458a', 'I', 1, 1, '0000-00-00 00:00:00'),
(71, 71, '', '', 'N', 'f63f4fbc9f8c85d409f2f59f2b9e12d5', '', '225bb77efe5e7f801215e5afd9d96e47', '', '81a9dfe6ab5ed388672712f740baf4c2', 'I', 1, 1, '0000-00-00 00:00:00'),
(72, 72, '', '', 'N', 'cf79ae6addba60ad018347359bd144d2', '', '862cc8dd885163143ee187b0d3078add', '', '85cc3701a5c4762b4c70fb1773998d09', 'I', 1, 1, '0000-00-00 00:00:00'),
(73, 73, '', '', 'N', '79b7cdcd14db14e9cb498f1793817d69', '', '6357a1e265bbcad6569513d0cac48211', '', '85c42da4cf4d5ffdd64177a88a564ccd', 'I', 1, 1, '0000-00-00 00:00:00'),
(74, 74, '', '', 'N', '35613dde17e11caa281c2e7bc2ac7acc', '', '183e6078d734d89dc0edb4c97b313f31', '', '538fb93e6223508d52e2fd11e540a7c5', 'I', 1, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_order_confirmations`
--

CREATE TABLE `tbl_user_order_confirmations` (
  `cfid` int(11) NOT NULL,
  `vendor_id` varchar(255) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `driverid` varchar(255) NOT NULL,
  `return_driverid` varchar(255) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `order_confirm_status` varchar(5) NOT NULL,
  `driver_confirm_status` int(11) NOT NULL,
  `order_confirm_otp` int(11) NOT NULL,
  `order_address` text NOT NULL,
  `pickup_time` varchar(255) NOT NULL,
  `pickup_date` varchar(255) NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `delivery_date` varchar(255) NOT NULL,
  `express_cost` varchar(25) NOT NULL,
  `cleaninig_instruction` text NOT NULL,
  `offline_order` int(11) NOT NULL DEFAULT '0',
  `created_date_time` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_date_time` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_order_confirmations`
--

INSERT INTO `tbl_user_order_confirmations` (`cfid`, `vendor_id`, `userid`, `driverid`, `return_driverid`, `transaction_id`, `order_confirm_status`, `driver_confirm_status`, `order_confirm_otp`, `order_address`, `pickup_time`, `pickup_date`, `delivery_time`, `delivery_date`, `express_cost`, `cleaninig_instruction`, `offline_order`, `created_date_time`, `updated_at`, `delivery_date_time`) VALUES
(1, 'f71ff81e4fa3b58313e53e60fa25402e', 'd89a38c5d6401be68941856f21e77431', '', '', '70912455', 'DL', 0, 0, '3-3a,  , Mitcham Lane, LONDON', '', '', '', 'Tuesday 13 November 2018', '10.5', '', 1, '2018-11-13 11:50:44', '2018-11-19 03:44:48', '0000-00-00'),
(2, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '36433176', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Wednesday 14 November 2018', '0.0', '', 1, '2018-11-13 12:02:45', '2018-11-23 12:30:47', '0000-00-00'),
(3, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '1234567', 'DL', 7, 0, 'Mitcham Lane, London, SW16 6LG', '12:00 - 02:00', 'Sunday 18 November 2018', '12:30', '0', '10', 'do well', 0, '2018-11-14 03:15:13', '2018-11-14 04:56:52', '0000-00-00'),
(4, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '12345678', 'DL', 7, 0, 'Mitcham Lane, London, SW16 6LG', '12:00 - 02:00', 'Sunday 18 November 2018', '12:30', '0', '10', 'do well', 0, '2018-11-14 04:53:00', '2018-11-19 11:24:14', '0000-00-00'),
(6, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '21148003', 'DL', 7, 0, '12 , Sunnyhill Road, LONDON', '09:00 PM - 10:00 PM', 'Friday 16 November 2018', '01:00 PM - 02:00 PM', 'Saturday 17 November 2018', '20.0', '', 0, '2018-11-16 04:33:51', '2018-11-19 04:21:12', '0000-00-00'),
(5, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '12345678', 'DL', 7, 0, 'Mitcham Lane, London, SW16 6LG', '12:00 - 02:00', 'Sunday 18 November 2018', '12:30 - 02:00', '0', '10', 'do well', 0, '2018-11-15 11:16:25', '2018-11-19 11:24:14', '0000-00-00'),
(7, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '77947884', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Tuesday 20 November 2018', '20.0', '', 1, '2018-11-19 11:03:08', '2018-11-23 12:30:41', '0000-00-00'),
(8, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '8fde0a2fad28ce25f9d3c30d6e2c36f1', '45601821', 'DL', 7, 0, '12 , Sunnyhill Road, LONDON', '03:00 PM - 04:00 PM', 'Monday 19 November 2018', '08:00 AM - 09:00 AM', 'Tuesday 20 November 2018', '20.0', '', 0, '2018-11-19 11:26:10', '2018-11-19 03:44:13', '0000-00-00'),
(9, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '48674227', 'DL', 0, 0, '3-3a,  , Mitcham Lane, LONDON', '', '', '', 'Tuesday 20 November 2018', '20.0', '', 1, '2018-11-19 01:25:40', '2018-11-23 12:30:31', '0000-00-00'),
(10, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '2ad8b695fc00981cf7e9d7220ef075b0', '2ad8b695fc00981cf7e9d7220ef075b0', '66495678', 'DL', 7, 0, '12 , Sunnyhill Road, LONDON', '08:00 AM - 09:00 AM', 'Wednesday 21 November 2018', '09:00 AM - 10:00 AM', 'Thursday 22 November 2018', '20.0', '', 0, '2018-11-19 04:04:45', '2018-12-05 04:53:19', '0000-00-00'),
(11, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '71812560', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Tuesday 20 November 2018', '20.0', '', 1, '2018-11-19 04:09:56', '2018-11-23 12:30:37', '0000-00-00'),
(12, '0d6f0057acc11d09c8686e9da529f06a', '9f26032e14cd9387f171156e5680f621', '2ad8b695fc00981cf7e9d7220ef075b0', '', '60313457', 'A', 1, 0, '3-3a, , Mitcham Lane, LONDON', '01:00 PM - 03:00 PM', 'Wednesday, November 21, 2018', '09:00 AM - 11:00 AM', 'Thursday, November 22, 2018', '0.0', '', 0, '2018-11-20 04:52:20', '2018-12-05 03:37:30', '0000-00-00'),
(13, '0d6f0057acc11d09c8686e9da529f06a', '9f26032e14cd9387f171156e5680f621', '', '', '88723517', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '01:00 PM - 03:00 PM', 'Friday, November 23, 2018', '03:00 PM - 05:00 PM', 'Saturday, November 24, 2018', '0.0', '', 0, '2018-11-20 05:01:44', '2018-11-20 05:31:44', '0000-00-00'),
(14, '0d6f0057acc11d09c8686e9da529f06a', '9e74a6bf71d97786559d944fd39713b1', '', '', '19109295', 'CA', 0, 0, '6 Streatham Green, Streatham High Road, LONDON', '09:00 AM - 11:00 AM', 'Wednesday, 21 November 2018', '09:00 AM - 11:00 AM', 'Thursday, 22 November 2018', '0.0', '', 0, '2018-11-21 03:27:36', '2018-11-20 15:57:37', '0000-00-00'),
(15, '179cff6dc411f329cf408941db2f5942', '9f26032e14cd9387f171156e5680f621', '', '', '89976934', 'RJ', 0, 0, '3-3a, , Mitcham Lane, LONDON', '05:00 PM - 07:00 PM', 'Wednesday, November 21, 2018', '11:00 AM- 01:00 PM', 'Thursday, November 22, 2018', '0.0', '', 0, '2018-11-21 11:32:44', '2018-12-05 03:23:57', '0000-00-00'),
(16, '2ee1a699b3530836aee2d96ceba1523c', '9f26032e14cd9387f171156e5680f621', '9600f2b93bea100c6e32bbd24872699e', '9600f2b93bea100c6e32bbd24872699e', '93848732', 'ID', 6, 0, '3-3a, , Mitcham Lane, LONDON', '05:00 PM - 07:00 PM', 'Wednesday, November 21, 2018', '09:00 AM - 11:00 AM', 'Thursday, November 22, 2018', '0.0', '', 0, '2018-11-21 11:35:21', '2018-11-21 12:33:04', '0000-00-00'),
(17, 'e9a6d9dac5082a099be3676d08de1ded', '9f26032e14cd9387f171156e5680f621', '', '', '82710459', 'A', 0, 0, '9b,  , Mitcham Lane, LONDON', '', '', '', 'Thursday, 22 November 2018', '0.0', '', 1, '2018-11-21 02:10:04', '2018-11-21 02:40:04', '0000-00-00'),
(18, 'e9a6d9dac5082a099be3676d08de1ded', 'e6a2f04e2bb57f74e865bb065360eb97', '', '', '46854896', 'A', 0, 0, '', '', '', '', 'Friday, 23 November 2018', '0.0', '', 1, '2018-11-21 02:11:50', '2018-11-21 02:41:50', '0000-00-00'),
(19, 'e9a6d9dac5082a099be3676d08de1ded', '20eb68d14df8e063947117713cacde6d', '', '', '94722025', 'A', 0, 0, '', '', '', '', 'Thursday, 22 November 2018', '0.0', '', 1, '2018-11-21 02:13:08', '2018-11-21 02:43:08', '0000-00-00'),
(20, 'e9a6d9dac5082a099be3676d08de1ded', '3e50801473d4c11767530dae37e6be07', '', '', '48639296', 'A', 0, 0, '', '', '', '', 'Friday, 23 November 2018', '0.0', '', 1, '2018-11-21 02:14:28', '2018-11-21 02:44:28', '0000-00-00'),
(21, 'e9a6d9dac5082a099be3676d08de1ded', '9f26032e14cd9387f171156e5680f621', '', '', '26947611', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Thursday, 22 November 2018', '0.0', '', 1, '2018-11-21 02:25:23', '2018-11-21 02:55:23', '0000-00-00'),
(22, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '', '', '67638155', 'DL', 0, 0, '12 , Sunnyhill Road, LONDON', '', '', '', 'Friday 23 November 2018', '0.0', '', 1, '2018-11-21 05:32:10', '2018-11-23 12:30:34', '0000-00-00'),
(23, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '79118441', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Thursday 22 November 2018', '20.0', '', 1, '2018-11-21 05:32:34', '2018-11-23 12:29:33', '0000-00-00'),
(24, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '30118977', 'DL', 0, 0, 'null', '', '', '', 'Wednesday 21 November 2018', '10.0', '', 1, '2018-11-21 05:32:57', '2018-11-23 12:30:29', '0000-00-00'),
(25, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '20245624', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Saturday 24 November 2018', '0.0', '', 1, '2018-11-21 05:33:22', '2018-11-23 12:30:44', '0000-00-00'),
(26, '2ee1a699b3530836aee2d96ceba1523c', 'e0f6c145b8529f7a7a970b482329458a', '', '', '61453234', 'DL', 0, 0, '', '', '', '', 'Saturday, 24 November 2018', '0.0', '', 1, '2018-11-22 03:45:49', '2018-11-22 04:10:05', '0000-00-00'),
(27, '2ee1a699b3530836aee2d96ceba1523c', '9f26032e14cd9387f171156e5680f621', '', '', '51336339', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '05:00 PM - 07:00 PM', 'Thursday, November 22, 2018', '7:00 AM - 09:00 AM', 'Friday, November 23, 2018', '0.0', '', 0, '2018-11-22 10:45:43', '2018-11-21 23:15:43', '0000-00-00'),
(28, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '1210145', 'DL', 0, 0, 'null', '', '', '', 'Friday 23 November 2018', '20.0', '', 1, '2018-11-22 11:00:40', '2018-11-23 12:30:26', '0000-00-00'),
(29, '2ee1a699b3530836aee2d96ceba1523c', '9f26032e14cd9387f171156e5680f621', '9600f2b93bea100c6e32bbd24872699e', '9600f2b93bea100c6e32bbd24872699e', '99369497', 'ID', 7, 0, '3-3a, , Mitcham Lane, LONDON', '07:00 AM - 08:00 AM', 'Friday, November 23, 2018', '03:00 PM - 04:00 PM', 'Friday, November 23, 2018', '12.0', '', 0, '2018-11-22 11:13:06', '2018-11-22 11:41:35', '0000-00-00'),
(30, '2ee1a699b3530836aee2d96ceba1523c', 'c929b21a0afca672424a64357d8f1753', '', '', '24536443', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '09:00 AM - 11:00 AM', 'Friday, November 23, 2018', '11:00 AM- 01:00 PM', 'Saturday, November 24, 2018', '0.0', '', 0, '2018-11-22 11:55:39', '2018-11-22 00:25:39', '0000-00-00'),
(31, '2ee1a699b3530836aee2d96ceba1523c', '9f26032e14cd9387f171156e5680f621', '', '', '36681933', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '11:00 AM - 12:00 PM', 'Sunday, November 25, 2018', '07:00 PM - 08:00 PM', 'Sunday, November 25, 2018', '12.0', '', 0, '2018-11-22 11:59:00', '2018-11-22 00:29:00', '0000-00-00'),
(32, '2ee1a699b3530836aee2d96ceba1523c', '9f26032e14cd9387f171156e5680f621', '', '', '47986166', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '11:00 AM- 01:00 PM', 'Friday, November 23, 2018', '11:00 AM- 01:00 PM', 'Saturday, November 24, 2018', '0.0', '', 0, '2018-11-22 12:03:58', '2018-11-22 00:33:58', '0000-00-00'),
(33, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '39476271', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '08:00 AM - 09:00 AM', 'Friday 23 November 2018', '09:00 AM - 10:00 AM', 'Saturday 24 November 2018', '20.0', '', 0, '2018-11-22 12:05:54', '2018-11-22 00:35:54', '0000-00-00'),
(34, '2ee1a699b3530836aee2d96ceba1523c', '9f26032e14cd9387f171156e5680f621', '9600f2b93bea100c6e32bbd24872699e', '9600f2b93bea100c6e32bbd24872699e', '48356016', 'ID', 7, 0, '3-3a, , Mitcham Lane, LONDON', '05:00 PM - 07:00 PM', 'Thursday, November 22, 2018', '11:00 AM- 01:00 PM', 'Saturday, November 24, 2018', '0.0', '', 0, '2018-11-22 12:15:25', '2018-11-22 12:18:12', '0000-00-00'),
(35, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210942', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Saturday 24 November 2018', '0.0', '', 1, '2018-11-22 12:56:00', '2018-11-23 12:30:39', '0000-00-00'),
(36, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '23237026', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '08:00 AM - 09:00 AM', 'Friday 23 November 2018', '02:00 PM - 03:00 PM', 'Friday 23 November 2018', '10.0', '', 0, '2018-11-22 01:21:54', '2018-11-22 01:51:54', '0000-00-00'),
(37, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '17674327', 'CA', 0, 0, '3-3a, , Mitcham Lane, LONDON', '09:00 AM - 10:00 AM', 'Saturday 24 November 2018', '07:00 PM - 08:00 PM', 'Saturday 24 November 2018', '10.0', '', 0, '2018-11-22 01:22:45', '2018-11-22 01:52:45', '0000-00-00'),
(38, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '9600f2b93bea100c6e32bbd24872699e', '2ad8b695fc00981cf7e9d7220ef075b0', '13979378', 'ID', 5, 0, '12 , Sunnyhill Road, LONDON', '06:00 PM - 07:00 PM', 'Thursday 22 November 2018', '10:00 AM - 11:00 AM', 'Friday 23 November 2018', '20.0', '', 0, '2018-11-22 01:24:54', '2018-12-05 04:53:11', '0000-00-00'),
(39, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '9600f2b93bea100c6e32bbd24872699e', '9600f2b93bea100c6e32bbd24872699e', '85365110', 'DL', 7, 0, '12 , Sunnyhill Road, LONDON', '03:00 PM - 04:00 PM', 'Thursday 22 November 2018', '08:00 AM - 09:00 AM', 'Saturday 24 November 2018', '50.0', '', 0, '2018-11-22 01:54:44', '2018-11-22 02:25:05', '0000-00-00'),
(40, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210538', 'DL', 0, 0, 'sr nafgary', '', '', '', 'null', '0.0', '', 1, '2018-11-23 01:11:25', '2018-11-23 03:20:48', '0000-00-00'),
(41, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210543', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Saturday 24 November 2018', '20.0', '', 1, '2018-11-23 03:02:50', '2018-11-23 03:27:39', '0000-00-00'),
(42, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '1210721', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Monday 26 November 2018', '0.0', '', 1, '2018-11-23 03:11:29', '2018-11-23 03:25:59', '0000-00-00'),
(43, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210465', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 26 November 2018', '0.0', '', 1, '2018-11-23 03:36:14', '2018-11-23 03:36:39', '0000-00-00'),
(44, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210577', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 26 November 2018', '0.0', '', 1, '2018-11-23 03:50:33', '2018-11-23 05:57:56', '0000-00-00'),
(45, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '1210775', 'DL', 0, 0, 'null', '', '', '', 'Monday 26 November 2018', '0.0', '', 1, '2018-11-23 04:09:05', '2018-11-23 05:37:18', '0000-00-00'),
(46, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210590', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 26 November 2018', '0.0', '', 1, '2018-11-23 04:14:51', '2018-11-23 05:49:27', '0000-00-00'),
(47, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '1210656', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Monday 26 November 2018', '0.0', '', 1, '2018-11-23 04:22:55', '2018-11-23 05:44:54', '0000-00-00'),
(48, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210178', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 26 November 2018', '0.0', '', 1, '2018-11-23 05:34:20', '2018-11-23 05:41:39', '0000-00-00'),
(49, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210329', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Tuesday 27 November 2018', '0.0', '', 1, '2018-11-24 02:26:25', '2018-11-26 03:39:16', '0000-00-00'),
(50, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210725', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Friday 30 November 2018', '0.0', '', 1, '2018-11-26 03:33:36', '2018-11-28 04:56:00', '0000-00-00'),
(51, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '', '', '17542054', 'CA', 0, 0, '12 , Sunnyhill Road, LONDON', '09:00 PM - 10:00 PM', 'Wednesday 28 November 2018', '04:00 PM - 05:00 PM', 'Friday 30 November 2018', '25.0', '', 0, '2018-11-26 05:27:42', '2018-11-26 05:30:06', '0000-00-00'),
(52, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '479279073df7398af0068b553b655ed0', '', '37880302', 'A', 1, 0, '12 , Sunnyhill Road, LONDON', '07:00 PM - 08:00 PM', 'Wednesday 28 November 2018', '11:00 AM - 12:00 PM', 'Friday 30 November 2018', '25.0', '', 0, '2018-11-26 05:32:25', '2018-11-26 05:32:36', '0000-00-00'),
(53, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '1210496', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Friday 30 November 2018', '0.0', '', 1, '2018-11-27 05:25:44', '2018-11-28 04:55:47', '0000-00-00'),
(54, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '1210462', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 11:09:53', '2018-11-28 04:54:25', '0000-00-00'),
(55, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210976', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 11:25:18', '2018-11-28 04:43:57', '0000-00-00'),
(56, '3a6d570f4654177520f428c841cf541e', '848d0476318eab32cfed4b06030790be', '', '', '01180404', 'A', 0, 0, 't w33al', '', '', '', 'Friday 30 November 2018', '0.0', '', 1, '2018-11-28 11:32:03', '2018-11-28 00:02:03', '0000-00-00'),
(57, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210880', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Friday 30 November 2018', '25.0', '', 1, '2018-11-28 01:03:21', '2018-11-28 04:58:17', '0000-00-00'),
(58, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '', '', '1956,1955,1954,1953,1952,1951,1950,1949,1948,1947,1946,1945,1944,1943,19421163', 'RJ', 0, 0, '12 , Sunnyhill Road, LONDON', '12:00 PM - 01:00 PM', 'Friday 30 November 2018', '12:00 PM - 01:00 PM', 'Saturday 1 December 2018', '20.0', '', 0, '2018-11-28 01:15:25', '2018-11-28 03:02:15', '0000-00-00'),
(59, '2ee1a699b3530836aee2d96ceba1523c', '9f26032e14cd9387f171156e5680f621', '', '', '01120572', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Friday, November 30, 2018', '0.0', '', 1, '2018-11-28 01:19:14', '2018-11-28 01:49:14', '0000-00-00'),
(60, '2ee1a699b3530836aee2d96ceba1523c', '81a9dfe6ab5ed388672712f740baf4c2', '', '', '01120891', 'A', 0, 0, '5 , Mitcham Lane, LONDON', '', '', '', 'Thursday, November 29, 2018', '20.0', '', 1, '2018-11-28 01:21:14', '2018-11-28 01:51:14', '0000-00-00'),
(61, 'e9a6d9dac5082a099be3676d08de1ded', '85cc3701a5c4762b4c70fb1773998d09', '', '', '01130713', 'DL', 0, 0, '5 , Mitcham Lane, LONDON', '', '', '', 'Thursday, November 29, 2018', '0.0', '', 1, '2018-11-28 01:36:30', '2018-11-28 01:36:54', '0000-00-00'),
(62, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '479279073df7398af0068b553b655ed0', '', '01211168', 'A', 1, 0, '12 , Sunnyhill Road, LONDON', '08:00 PM - 09:00 PM', 'Friday 30 November 2018', '04:00 PM - 05:00 PM', 'Saturday 1 December 2018', '20.0', '', 0, '2018-11-28 03:01:27', '2018-11-28 03:01:55', '0000-00-00'),
(63, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210300', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 05:12:37', '2018-11-28 05:33:52', '0000-00-00'),
(64, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '01210784', 'DL', 0, 0, 'null', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 05:18:46', '2018-11-28 05:31:53', '0000-00-00'),
(65, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210229', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 05:19:07', '2018-11-28 05:28:52', '0000-00-00'),
(66, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210576', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 05:20:18', '2018-11-28 05:31:46', '0000-00-00'),
(67, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210188', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 05:26:40', '2018-11-28 05:28:44', '0000-00-00'),
(68, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210469', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 05:30:06', '2018-11-28 05:33:58', '0000-00-00'),
(69, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210833', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Saturday 1 December 2018', '0.0', '', 1, '2018-11-28 05:30:38', '2018-11-28 05:30:55', '0000-00-00'),
(70, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210644', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Monday 3 December 2018', '0.0', '', 1, '2018-11-29 11:12:12', '2018-11-29 11:13:52', '0000-00-00'),
(71, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210747', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Friday 30 November 2018', '20.0', '', 1, '2018-11-29 11:13:00', '2018-11-29 12:02:41', '0000-00-00'),
(72, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210944', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 3 December 2018', '0.0', '', 1, '2018-11-29 11:13:34', '2018-11-29 11:50:45', '0000-00-00'),
(73, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210877', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 3 December 2018', '0.0', '', 1, '2018-11-29 12:03:25', '2018-11-29 12:08:16', '0000-00-00'),
(74, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '01210572', 'DL', 0, 0, 'null', '', '', '', 'Saturday 1 December 2018', '25.0', '', 1, '2018-11-29 12:03:54', '2018-11-29 12:08:56', '0000-00-00'),
(75, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '01210292', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Saturday 1 December 2018', '25.0', '', 1, '2018-11-29 12:05:27', '2018-11-29 12:08:02', '0000-00-00'),
(76, 'f71ff81e4fa3b58313e53e60fa25402e', '85c42da4cf4d5ffdd64177a88a564ccd', '', '', '01210373', 'DL', 0, 0, '100 , Bulstrode Road, HOUNSLOW', '', '', '', 'Monday 3 December 2018', '0.0', '', 1, '2018-11-29 12:06:24', '2018-11-29 12:08:39', '0000-00-00'),
(77, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210886', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday, 3 December 2018', '0.0', '', 1, '2018-11-29 01:41:52', '2018-11-29 03:58:02', '0000-00-00'),
(78, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210878', 'DL', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 1 December 2018', '25.0', '', 1, '2018-11-29 03:59:12', '2018-11-29 04:02:29', '0000-00-00'),
(79, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210829', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 3 December 2018', '0.0', '', 1, '2018-11-29 04:00:01', '2018-11-29 04:01:34', '0000-00-00'),
(80, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '01210538', 'DL', 0, 0, 'null', '', '', '', 'Saturday 1 December 2018', '25.0', '', 1, '2018-11-29 04:00:38', '2018-11-29 04:01:19', '0000-00-00'),
(81, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '01210126', 'DL', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Monday 3 December 2018', '0.0', '', 1, '2018-11-29 04:01:02', '2018-11-29 04:01:45', '0000-00-00'),
(82, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210273', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Monday 3 December 2018', '0.0', '', 1, '2018-11-29 04:05:25', '2018-11-29 04:05:37', '0000-00-00'),
(83, '984329f145af5ea254c602df6ef695d3', '538fb93e6223508d52e2fd11e540a7c5', '', '', '01140269', 'DL', 0, 0, '', '', '', '', 'Friday, November 30, 2018', '0.0', '', 1, '2018-11-29 06:46:08', '2018-11-29 06:46:36', '0000-00-00'),
(84, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210905', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Thursday 6 December 2018', '0.0', '', 1, '2018-12-03 04:10:15', '2018-12-03 04:10:27', '0000-00-00'),
(85, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210231', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Tuesday 4 December 2018', '20.0', '', 1, '2018-12-03 04:10:46', '2018-12-03 04:40:46', '0000-00-00'),
(86, '2ee1a699b3530836aee2d96ceba1523c', '54a4d9a3a2c6023ff7b3c227a651d651', '2ad8b695fc00981cf7e9d7220ef075b0', '', '85926645', 'RJ', 3, 0, '6 Streatham Green, Streatham High Road, LONDON', '05:00 PM - 07:00 PM', 'Monday, 3 December 2018', '09:00 AM - 11:00 AM', 'Wednesday, 5 December 2018', '0.0', '', 0, '2018-12-03 07:00:12', '2018-12-03 07:14:36', '0000-00-00'),
(87, '3a6d570f4654177520f428c841cf541e', '54a4d9a3a2c6023ff7b3c227a651d651', '', '', '60024658', 'P', 0, 0, '6 Streatham Green, Streatham High Road, LONDON', '09:00 AM - 10:00 AM', 'Tuesday, 4 December 2018', '09:00 AM - 10:00 AM', 'Wednesday, 5 December 2018', '15.0', '', 0, '2018-12-03 08:28:12', '2018-12-03 08:58:12', '0000-00-00'),
(88, '2ee1a699b3530836aee2d96ceba1523c', '50957449ac6ee1b95b50073d8c70157a', '', '', '01120539', 'A', 0, 0, '', '', '', '', 'Thursday, 6 December 2018', '0.0', '', 1, '2018-12-04 11:02:03', '2018-12-04 11:32:03', '0000-00-00'),
(89, '984329f145af5ea254c602df6ef695d3', '50957449ac6ee1b95b50073d8c70157a', '2ad8b695fc00981cf7e9d7220ef075b0', '', '01141286', 'A', 4, 0, '12 , Northcote Road, LONDON', '09:00 AM - 11:00 AM', 'Wednesday, 5 December 2018', '09:00 AM - 11:00 AM', 'Thursday, 6 December 2018', '0.0', '', 0, '2018-12-05 01:27:52', '2018-12-05 01:30:20', '0000-00-00'),
(90, '179cff6dc411f329cf408941db2f5942', '50957449ac6ee1b95b50073d8c70157a', '', '', '01171237', 'RJ', 0, 0, '12 , Northcote Road, LONDON', '7:00 AM - 09:00 AM', 'Wednesday, 5 December 2018', '09:00 AM - 11:00 AM', 'Thursday, 6 December 2018', '0.0', '', 0, '2018-12-05 03:22:07', '2018-12-05 03:29:48', '0000-00-00'),
(91, '0d6f0057acc11d09c8686e9da529f06a', '4aa6f992ba801bb26ddf421e4ee561cc', '2ad8b695fc00981cf7e9d7220ef075b0', '2ad8b695fc00981cf7e9d7220ef075b0', '01191725', 'ID', 7, 0, '382 , Streatham High Road, LONDON', '09:00 AM - 11:00 AM', 'Wednesday, 5 December 2018', '11:00 AM- 01:00 PM', 'Thursday, 6 December 2018', '0.0', '', 0, '2018-12-05 03:33:24', '2018-12-05 03:44:22', '0000-00-00'),
(92, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '9d8a09e3acfb75f3d05ef251ba591c31', '', '01211678', 'A', 1, 0, '3-3a, , Mitcham Lane, LONDON', '09:00 PM - 10:00 PM', 'Thursday, December 6, 2018', '02:00 PM - 03:00 PM', 'Friday, December 7, 2018', '20.0', '', 0, '2018-12-05 10:13:54', '2018-12-05 10:14:50', '0000-00-00'),
(93, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '479279073df7398af0068b553b655ed0', '', '01211890', 'A', 1, 0, '12 , Sunnyhill Road, LONDON', '07:00 PM - 08:00 PM', 'Friday 7 December 2018', '11:00 AM - 12:00 PM', 'Saturday 8 December 2018', '20.0', '', 0, '2018-12-05 10:46:52', '2018-12-05 10:47:04', '0000-00-00'),
(94, '179cff6dc411f329cf408941db2f5942', '9f26032e14cd9387f171156e5680f621', '479279073df7398af0068b553b655ed0', '479279073df7398af0068b553b655ed0', '01171897', 'DL', 7, 0, '3-3a, , Mitcham Lane, LONDON', '01:00 PM - 02:00 PM', 'Wednesday, December 5, 2018', '07:00 PM - 08:00 PM', 'Wednesday, December 5, 2018', '12.0', '', 0, '2018-12-05 11:07:37', '2018-12-05 11:14:51', '0000-00-00'),
(95, 'f71ff81e4fa3b58313e53e60fa25402e', '6c7f90605843e754498d7445a287603c', '479279073df7398af0068b553b655ed0', '479279073df7398af0068b553b655ed0', '01211132', 'DL', 7, 0, '73 , Mitcham Lane, LONDON', '08:00 PM - 09:00 PM', 'Thursday, December 6, 2018', '03:00 PM - 04:00 PM', 'Friday, December 7, 2018', '20.0', '', 0, '2018-12-05 11:38:25', '2018-12-05 05:06:11', '0000-00-00'),
(96, 'f71ff81e4fa3b58313e53e60fa25402e', '6c7f90605843e754498d7445a287603c', 'd19982b4e7576afab6eb6d730036b175', '', '01211311', 'A', 1, 0, '73 , Mitcham Lane, LONDON', '10:00 AM - 11:00 AM', 'Thursday, December 6, 2018', '10:00 AM - 11:00 AM', 'Friday, December 7, 2018', '20.0', '', 0, '2018-12-05 04:47:44', '2018-12-05 04:47:47', '0000-00-00'),
(97, 'f71ff81e4fa3b58313e53e60fa25402e', '6c7f90605843e754498d7445a287603c', 'd19982b4e7576afab6eb6d730036b175', 'd19982b4e7576afab6eb6d730036b175', '01211700', 'DL', 7, 0, '73 , Mitcham Lane, LONDON', '09:00 PM - 10:00 PM', 'Thursday, December 6, 2018', '09:00 PM - 10:00 PM', 'Friday, December 7, 2018', '20.0', '', 0, '2018-12-05 06:08:33', '2018-12-05 06:20:55', '0000-00-00'),
(98, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '479279073df7398af0068b553b655ed0', '', '01211382', 'A', 1, 0, '12 , Sunnyhill Road, LONDON', '09:00 AM - 10:00 AM', 'Friday 7 December 2018', '10:00 AM - 11:00 AM', 'Saturday 8 December 2018', '20.0', '', 0, '2018-12-06 05:03:47', '2018-12-06 05:03:58', '0000-00-00'),
(99, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '479279073df7398af0068b553b655ed0', '', '01211483', 'A', 1, 0, '12 , Sunnyhill Road, LONDON', '08:00 AM - 09:00 AM', 'Sunday 9 December 2018', '08:00 PM - 09:00 PM', 'Sunday 9 December 2018', '10.0', '', 0, '2018-12-06 05:04:36', '2018-12-06 05:04:43', '0000-00-00'),
(100, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '479279073df7398af0068b553b655ed0', '479279073df7398af0068b553b655ed0', '01211271', 'ID', 5, 0, '12 , Sunnyhill Road, LONDON', '08:00 AM - 09:00 AM', 'Saturday 8 December 2018', '03:00 PM - 04:00 PM', 'Saturday 8 December 2018', '10.0', '', 0, '2018-12-06 05:05:32', '2018-12-06 05:13:27', '0000-00-00'),
(101, 'f71ff81e4fa3b58313e53e60fa25402e', 'dd6a847baaaff26087729db5ec012359', '479279073df7398af0068b553b655ed0', '479279073df7398af0068b553b655ed0', '01211293', 'ID', 5, 0, '12 , Sunnyhill Road, LONDON', '08:00 AM - 09:00 AM', 'Friday 7 December 2018', '10:00 AM - 11:00 AM', 'Saturday 8 December 2018', '20.0', '', 0, '2018-12-06 05:06:29', '2018-12-06 05:13:14', '0000-00-00'),
(102, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210481', 'A', 0, 0, 'sr nafgary', '', '', '', 'Tuesday 11 December 2018', '0.0', '', 1, '2018-12-08 10:40:12', '2018-12-07 23:10:12', '0000-00-00'),
(103, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210660', 'A', 0, 0, 'sr nafgary', '', '', '', 'Tuesday 11 December 2018', '0.0', '', 1, '2018-12-08 05:30:06', '2018-12-08 06:00:06', '0000-00-00'),
(104, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210967', 'A', 0, 0, 'sr nafgary', '', '', '', 'Tuesday 11 December 2018', '0.0', '', 1, '2018-12-08 05:34:04', '2018-12-08 06:04:04', '0000-00-00'),
(105, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210997', 'A', 0, 0, 'sr nafgary', '', '', '', 'Tuesday 11 December 2018', '0.0', '', 1, '2018-12-08 05:41:35', '2018-12-08 06:11:35', '0000-00-00'),
(106, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19440165', 'A', 0, 0, 'sr nafgary', '', '', '', 'Tuesday 11 December 2018', 'null', '', 1, '2018-12-08 05:41:41', '2018-12-08 06:11:41', '0000-00-00'),
(107, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '01210901', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Tuesday 11 December 2018', '0.0', '', 1, '2018-12-08 05:48:43', '2018-12-08 06:18:43', '0000-00-00'),
(108, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '19440536', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Tuesday 11 December 2018', 'null', '', 1, '2018-12-08 05:48:46', '2018-12-08 06:18:46', '0000-00-00'),
(109, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '01210374', 'A', 0, 0, 'sr nafgary', '', '', '', 'Thursday 13 December 2018', '0.0', '', 1, '2018-12-10 11:35:53', '2018-12-10 00:05:53', '0000-00-00'),
(110, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19440630', 'A', 0, 0, 'sr nafgary', '', '', '', 'Thursday 13 December 2018', 'null', '', 1, '2018-12-10 11:36:17', '2018-12-10 00:06:17', '0000-00-00'),
(111, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420479', 'A', 0, 0, 'sr nafgary', '', '', '', 'Thursday 13 December 2018', 'null', '', 1, '2018-12-10 05:24:19', '2018-12-10 05:54:19', '0000-00-00'),
(112, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420898', 'A', 0, 0, 'sr nafgary', '', '', '', 'Thursday 13 December 2018', 'null', '', 1, '2018-12-10 05:31:45', '2018-12-10 06:01:45', '0000-00-00'),
(113, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19430963', 'A', 0, 0, 'sr nafgary', '', '', '', 'Tuesday 11 December 2018', 'null', '', 1, '2018-12-10 05:38:30', '2018-12-10 06:08:30', '0000-00-00'),
(114, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420176', 'A', 0, 0, 'sr nafgary', '', '', '', 'Friday 14 December 2018', 'null', '', 1, '2018-12-11 04:44:03', '2018-12-11 05:14:03', '0000-00-00'),
(115, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19460374', 'A', 0, 0, 'sr nafgary', '', '', '', 'Wednesday 12 December 2018', 'null', '', 1, '2018-12-11 05:12:47', '2018-12-11 05:42:47', '0000-00-00'),
(116, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19460562', 'A', 0, 0, 'sr nafgary', '', '', '', 'Wednesday 12 December 2018', 'null', '', 1, '2018-12-11 05:47:14', '2018-12-11 06:17:14', '0000-00-00'),
(117, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '19420719', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Friday 14 December 2018', 'null', '', 1, '2018-12-11 05:58:37', '2018-12-11 06:28:37', '0000-00-00'),
(118, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420986', 'A', 0, 0, 'sr nafgary', '', '', '', 'Friday 14 December 2018', 'null', '', 1, '2018-12-11 06:11:09', '2018-12-11 06:41:09', '0000-00-00'),
(119, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19440598', 'A', 0, 0, 'sr nafgary', '', '', '', 'Wednesday 12 December 2018', 'null', '', 1, '2018-12-11 06:12:04', '2018-12-11 06:42:04', '0000-00-00'),
(120, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420268', 'DL', 0, 0, 'sr nafgary', '', '', '', 'Saturday 15 December 2018', 'null', '', 1, '2018-12-12 10:09:05', '2018-12-12 11:29:29', '0000-00-00'),
(121, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420941', 'A', 0, 0, 'sr nafgary', '', '', '', 'Saturday 15 December 2018', 'null', '', 1, '2018-12-12 11:27:52', '2018-12-11 23:57:52', '0000-00-00'),
(122, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19450628', 'A', 0, 0, 'sr nafgary', '', '', '', 'Thursday 13 December 2018', 'null', '', 1, '2018-12-12 11:48:25', '2018-12-12 00:18:25', '0000-00-00'),
(123, 'f71ff81e4fa3b58313e53e60fa25402e', '0a43867a4af55a22a149c7152986e4bf', '', '', '19440603', 'A', 0, 0, 'null', '', '', '', 'Wednesday 12 December 2018', 'null', '', 1, '2018-12-12 11:49:08', '2018-12-12 00:19:08', '0000-00-00'),
(124, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '19430891', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 15 December 2018', 'null', '', 1, '2018-12-12 11:52:22', '2018-12-12 00:22:22', '0000-00-00'),
(125, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '19430419', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Saturday 15 December 2018', 'null', '', 1, '2018-12-12 11:54:18', '2018-12-12 00:24:18', '0000-00-00'),
(126, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19430879', 'A', 0, 0, 'sr nafgary', '', '', '', 'Wednesday 12 December 2018', 'null', '', 1, '2018-12-12 12:01:08', '2018-12-12 00:31:08', '0000-00-00'),
(127, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19430173', 'A', 0, 0, 'sr nafgary', '', '', '', 'Thursday 13 December 2018', 'null', '', 1, '2018-12-12 12:07:35', '2018-12-12 00:37:35', '0000-00-00'),
(128, 'f71ff81e4fa3b58313e53e60fa25402e', '680731bbdc285fe93f5aa5492a44a16a', '', '', '19450912', 'A', 0, 0, '104 , Bulstrode Road, HOUNSLOW', '', '', '', 'Thursday 13 December 2018', 'null', '', 1, '2018-12-12 12:10:23', '2018-12-12 00:40:23', '0000-00-00'),
(129, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19440558', 'A', 0, 0, 'sr nafgary', '', '', '', 'Wednesday 12 December 2018', 'null', '', 1, '2018-12-12 12:10:48', '2018-12-12 00:40:48', '0000-00-00'),
(130, '984329f145af5ea254c602df6ef695d3', '538fb93e6223508d52e2fd11e540a7c5', '', '', '18810691', 'DL', 0, 0, '', '', '', '', 'Wednesday, December 12, 2018', 'null', '', 1, '2018-12-12 12:35:17', '2018-12-12 12:36:24', '0000-00-00'),
(131, '984329f145af5ea254c602df6ef695d3', '50957449ac6ee1b95b50073d8c70157a', '', '', '18810755', 'DL', 0, 0, '12 , Northcote Road, LONDON', '', '', '', 'Thursday, December 13, 2018', 'null', '', 1, '2018-12-12 12:37:49', '2018-12-12 12:39:02', '0000-00-00'),
(132, '984329f145af5ea254c602df6ef695d3', '50957449ac6ee1b95b50073d8c70157a', '', '', '18820812', 'A', 0, 0, '12 , Northcote Road, LONDON', '', '', '', 'Wednesday, December 12, 2018', 'null', '', 1, '2018-12-12 12:38:34', '2018-12-12 01:08:34', '0000-00-00'),
(133, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420628', 'A', 0, 0, 'sr nafgary', '', '', '', 'Saturday 15 December 2018', 'null', '', 1, '2018-12-12 12:43:19', '2018-12-12 01:13:19', '0000-00-00'),
(134, '984329f145af5ea254c602df6ef695d3', '50957449ac6ee1b95b50073d8c70157a', '', '', '18810162', 'A', 0, 0, '12 , Northcote Road, LONDON', '', '', '', 'Thursday, December 13, 2018', 'null', '', 1, '2018-12-12 02:11:09', '2018-12-12 02:41:09', '0000-00-00'),
(135, 'f71ff81e4fa3b58313e53e60fa25402e', '9f26032e14cd9387f171156e5680f621', '', '', '19420258', 'A', 0, 0, '3-3a, , Mitcham Lane, LONDON', '', '', '', 'Thursday 13 December 2018', 'null', '', 1, '2018-12-12 02:42:05', '2018-12-12 03:12:05', '0000-00-00'),
(136, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19420856', 'A', 0, 0, 'sr nafgary', '', '', '', 'Saturday 15 December 2018', '0.0', '', 1, '2018-12-12 02:50:53', '2018-12-12 03:20:53', '0000-00-00'),
(137, 'f71ff81e4fa3b58313e53e60fa25402e', '07c29f8a726fa4015b639e3500333c8d', '', '', '19430659', 'A', 0, 0, 'sr nafgary', '', '', '', 'Monday 17 December 2018', '0.0', '', 1, '2018-12-14 11:48:09', '2018-12-14 00:18:09', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_purchase_orders`
--

CREATE TABLE `tbl_user_purchase_orders` (
  `orid` int(11) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `vendor_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `m_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` float NOT NULL,
  `total_amount` float NOT NULL,
  `weight` varchar(20) NOT NULL,
  `order_date_time` datetime NOT NULL,
  `order_status` char(2) NOT NULL,
  `order_transaction_id` varchar(155) NOT NULL,
  `read_status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_purchase_orders`
--

INSERT INTO `tbl_user_purchase_orders` (`orid`, `userid`, `vendor_id`, `product_id`, `m_product_id`, `quantity`, `amount`, `total_amount`, `weight`, `order_date_time`, `order_status`, `order_transaction_id`, `read_status`, `created_at`, `updated_at`) VALUES
(1, 'd89a38c5d6401be68941856f21e77431', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 10, 12, 52.5, '', '2018-11-13 11:50:44', 'DL', '70912455', 0, '2018-11-13 17:50:44', '2018-11-13 00:20:44'),
(2, 'd89a38c5d6401be68941856f21e77431', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 10, 52.5, '', '2018-11-13 11:50:44', 'DL', '70912455', 0, '2018-11-13 17:50:44', '2018-11-13 00:20:44'),
(3, 'd89a38c5d6401be68941856f21e77431', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 6, 52.5, '', '2018-11-13 11:50:44', 'DL', '70912455', 0, '2018-11-13 17:50:44', '2018-11-13 00:20:44'),
(4, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 4.5, '', '2018-11-13 12:02:45', 'DL', '36433176', 0, '2018-11-13 18:02:45', '2018-11-13 00:32:45'),
(5, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-14 03:11:31', 'DL', '1234567', 0, '2018-11-14 09:11:31', '2018-11-14 03:41:31'),
(6, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-14 03:12:14', 'DL', '1234567', 0, '2018-11-14 09:12:14', '2018-11-14 03:42:14'),
(7, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-14 03:13:13', 'DL', '1234567', 0, '2018-11-14 09:13:13', '2018-11-14 03:43:13'),
(8, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-14 03:13:27', 'DL', '1234567', 0, '2018-11-14 09:13:27', '2018-11-14 03:43:27'),
(9, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-14 03:13:48', 'DL', '1234567', 0, '2018-11-14 09:13:48', '2018-11-14 03:43:48'),
(10, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-14 03:15:13', 'DL', '1234567', 0, '2018-11-14 09:15:13', '2018-11-14 03:45:13'),
(11, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 5, 16.8, 25.8, '', '2018-11-14 03:15:13', 'DL', '1234567', 0, '2018-11-14 09:15:13', '2018-11-14 03:45:13'),
(12, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-14 04:53:00', 'DL', '12345678', 0, '2018-11-14 10:53:00', '2018-11-14 05:23:00'),
(13, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 5, 16.8, 25.8, '', '2018-11-14 04:53:00', 'DL', '12345678', 0, '2018-11-14 10:53:00', '2018-11-14 05:23:00'),
(14, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 25.8, '', '2018-11-15 11:16:25', 'DL', '12345678', 0, '2018-11-15 17:16:25', '2018-11-14 23:46:25'),
(15, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 5, 16.8, 25.8, '', '2018-11-15 11:16:25', 'DL', '12345678', 0, '2018-11-15 17:16:25', '2018-11-14 23:46:25'),
(16, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 9, 14.4, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(17, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 10.8, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(18, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 7.8, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(19, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 3, 8.4, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(20, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 3, 9.6, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(21, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 10, 0, 1, 3, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(22, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 11, 0, 1, 2.5, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(23, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 12, 0, 5, 7.8, 84.3, '', '2018-11-16 04:33:51', 'DL', '21148003', 0, '2018-11-16 10:33:51', '2018-11-16 05:03:51'),
(24, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 12.8, 51.3, '', '2018-11-19 11:03:08', 'DL', '77947884', 0, '2018-11-19 17:03:08', '2018-11-18 23:33:08'),
(25, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 12, 51.3, '', '2018-11-19 11:03:08', 'DL', '77947884', 0, '2018-11-19 17:03:08', '2018-11-18 23:33:08'),
(26, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 10, 51.3, '', '2018-11-19 11:03:08', 'DL', '77947884', 0, '2018-11-19 17:03:08', '2018-11-18 23:33:08'),
(27, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 3, 6, 51.3, '', '2018-11-19 11:03:08', 'DL', '77947884', 0, '2018-11-19 17:03:08', '2018-11-18 23:33:08'),
(28, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 11.2, 56.3, '', '2018-11-19 11:26:10', 'DL', '45601821', 0, '2018-11-19 17:26:10', '2018-11-18 23:56:10'),
(29, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 9.6, 56.3, '', '2018-11-19 11:26:10', 'DL', '45601821', 0, '2018-11-19 17:26:10', '2018-11-18 23:56:10'),
(30, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 6, 56.3, '', '2018-11-19 11:26:10', 'DL', '45601821', 0, '2018-11-19 17:26:10', '2018-11-18 23:56:10'),
(31, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 5, 56.3, '', '2018-11-19 11:26:10', 'DL', '45601821', 0, '2018-11-19 17:26:10', '2018-11-18 23:56:10'),
(32, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 3, 4.5, 56.3, '', '2018-11-19 11:26:10', 'DL', '45601821', 0, '2018-11-19 17:26:10', '2018-11-18 23:56:10'),
(33, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 41, '', '2018-11-19 01:25:40', 'DL', '48674227', 0, '2018-11-19 07:25:40', '2018-11-19 01:55:40'),
(34, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 41, '', '2018-11-19 01:25:40', 'DL', '48674227', 0, '2018-11-19 07:25:40', '2018-11-19 01:55:40'),
(35, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 41, '', '2018-11-19 01:25:40', 'DL', '48674227', 0, '2018-11-19 07:25:40', '2018-11-19 01:55:40'),
(36, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 6, 9, 29, '', '2018-11-19 04:04:45', 'DL', '66495678', 0, '2018-11-19 10:04:45', '2018-11-19 04:34:45'),
(37, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 3.2, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(38, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.2, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(39, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 5.2, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(40, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 5.6, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(41, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 2, 6.4, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(42, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 10, 0, 2, 6, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(43, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 11, 0, 2, 5, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(44, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 12, 0, 2, 3, 65.2, '', '2018-11-19 04:09:56', 'DL', '71812560', 0, '2018-11-19 10:09:56', '2018-11-19 04:39:56'),
(45, '9f26032e14cd9387f171156e5680f621', '0d6f0057acc11d09c8686e9da529f06a', 4, 0, 1, 1.8, 1.8, '', '2018-11-20 04:52:20', 'A', '60313457', 0, '2018-11-20 10:52:20', '2018-11-20 05:22:20'),
(46, '9f26032e14cd9387f171156e5680f621', '0d6f0057acc11d09c8686e9da529f06a', 4, 0, 1, 1.8, 1.8, '', '2018-11-20 05:01:44', 'CA', '88723517', 0, '2018-11-20 11:01:44', '2018-11-20 05:31:44'),
(47, '9e74a6bf71d97786559d944fd39713b1', '0d6f0057acc11d09c8686e9da529f06a', 4, 0, 1, 1.5, 3.3, '', '2018-11-21 03:27:36', 'CA', '19109295', 0, '2018-11-21 09:27:36', '2018-11-20 15:57:37'),
(48, '9e74a6bf71d97786559d944fd39713b1', '0d6f0057acc11d09c8686e9da529f06a', 5, 0, 1, 1.8, 3.3, '', '2018-11-21 03:27:36', 'CA', '19109295', 0, '2018-11-21 09:27:36', '2018-11-20 15:57:37'),
(49, '9f26032e14cd9387f171156e5680f621', '179cff6dc411f329cf408941db2f5942', 4, 0, 3, 6.6, 6.6, '', '2018-11-21 11:32:44', 'RJ', '89976934', 0, '2018-11-21 17:32:44', '2018-11-21 00:02:44'),
(50, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 3, 1.5, 12, '', '2018-11-21 11:35:21', 'ID', '93848732', 0, '2018-11-21 17:35:21', '2018-11-21 00:05:21'),
(51, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 3, 10.5, 12, '', '2018-11-21 11:35:21', 'ID', '93848732', 0, '2018-11-21 17:35:21', '2018-11-21 00:05:21'),
(52, '9f26032e14cd9387f171156e5680f621', 'e9a6d9dac5082a099be3676d08de1ded', 4, 0, 1, 2.5, 5.8, '', '2018-11-21 02:10:04', 'P', '82710459', 0, '2018-11-21 08:10:04', '2018-11-21 02:40:04'),
(53, '9f26032e14cd9387f171156e5680f621', 'e9a6d9dac5082a099be3676d08de1ded', 5, 0, 1, 1.8, 5.8, '', '2018-11-21 02:10:04', 'P', '82710459', 0, '2018-11-21 08:10:04', '2018-11-21 02:40:04'),
(54, '9f26032e14cd9387f171156e5680f621', 'e9a6d9dac5082a099be3676d08de1ded', 6, 0, 1, 1.5, 5.8, '', '2018-11-21 02:10:04', 'P', '82710459', 0, '2018-11-21 08:10:04', '2018-11-21 02:40:04'),
(55, 'e6a2f04e2bb57f74e865bb065360eb97', 'e9a6d9dac5082a099be3676d08de1ded', 4, 0, 1, 2.5, 5.8, '', '2018-11-21 02:11:50', 'P', '46854896', 0, '2018-11-21 08:11:50', '2018-11-21 02:41:50'),
(56, 'e6a2f04e2bb57f74e865bb065360eb97', 'e9a6d9dac5082a099be3676d08de1ded', 5, 0, 1, 1.8, 5.8, '', '2018-11-21 02:11:50', 'P', '46854896', 0, '2018-11-21 08:11:50', '2018-11-21 02:41:50'),
(57, 'e6a2f04e2bb57f74e865bb065360eb97', 'e9a6d9dac5082a099be3676d08de1ded', 6, 0, 1, 1.5, 5.8, '', '2018-11-21 02:11:50', 'P', '46854896', 0, '2018-11-21 08:11:50', '2018-11-21 02:41:50'),
(58, '20eb68d14df8e063947117713cacde6d', 'e9a6d9dac5082a099be3676d08de1ded', 4, 0, 1, 1.8, 3.3, '', '2018-11-21 02:13:08', 'P', '94722025', 0, '2018-11-21 08:13:08', '2018-11-21 02:43:08'),
(59, '20eb68d14df8e063947117713cacde6d', 'e9a6d9dac5082a099be3676d08de1ded', 5, 0, 1, 1.5, 3.3, '', '2018-11-21 02:13:08', 'P', '94722025', 0, '2018-11-21 08:13:08', '2018-11-21 02:43:08'),
(60, '3e50801473d4c11767530dae37e6be07', 'e9a6d9dac5082a099be3676d08de1ded', 5, 0, 1, 2.5, 4.3, '', '2018-11-21 02:14:28', 'P', '48639296', 0, '2018-11-21 08:14:28', '2018-11-21 02:44:28'),
(61, '3e50801473d4c11767530dae37e6be07', 'e9a6d9dac5082a099be3676d08de1ded', 6, 0, 1, 1.8, 4.3, '', '2018-11-21 02:14:28', 'P', '48639296', 0, '2018-11-21 08:14:28', '2018-11-21 02:44:28'),
(62, '9f26032e14cd9387f171156e5680f621', 'e9a6d9dac5082a099be3676d08de1ded', 4, 0, 1, 1.5, 1.5, '', '2018-11-21 02:25:23', 'P', '26947611', 0, '2018-11-21 08:25:23', '2018-11-21 02:55:23'),
(63, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 19.5, '', '2018-11-21 05:32:10', 'DL', '67638155', 0, '2018-11-21 11:32:10', '2018-11-21 06:02:10'),
(64, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 19.5, '', '2018-11-21 05:32:10', 'DL', '67638155', 0, '2018-11-21 11:32:10', '2018-11-21 06:02:10'),
(65, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 19.5, '', '2018-11-21 05:32:10', 'DL', '67638155', 0, '2018-11-21 11:32:10', '2018-11-21 06:02:10'),
(66, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 7.5, 33.5, '', '2018-11-21 05:32:34', 'DL', '79118441', 0, '2018-11-21 11:32:34', '2018-11-21 06:02:34'),
(67, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 4.5, 33.5, '', '2018-11-21 05:32:34', 'DL', '79118441', 0, '2018-11-21 11:32:34', '2018-11-21 06:02:34'),
(68, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 7, 10.5, 20.5, '', '2018-11-21 05:32:57', 'DL', '30118977', 0, '2018-11-21 11:32:57', '2018-11-21 06:02:57'),
(69, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 12.8, 33.8, '', '2018-11-21 05:33:22', 'DL', '20245624', 0, '2018-11-21 11:33:22', '2018-11-21 06:03:22'),
(70, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 12, 33.8, '', '2018-11-21 05:33:22', 'DL', '20245624', 0, '2018-11-21 11:33:22', '2018-11-21 06:03:22'),
(71, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 10, 33.8, '', '2018-11-21 05:33:22', 'DL', '20245624', 0, '2018-11-21 11:33:22', '2018-11-21 06:03:22'),
(72, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 3, 6, 33.8, '', '2018-11-21 05:33:22', 'DL', '20245624', 0, '2018-11-21 11:33:22', '2018-11-21 06:03:22'),
(73, 'e0f6c145b8529f7a7a970b482329458a', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 1, 0.3, 4.3, '', '2018-11-22 03:45:49', 'DL', '61453234', 0, '2018-11-22 09:45:49', '2018-11-21 16:15:49'),
(74, 'e0f6c145b8529f7a7a970b482329458a', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 1, 0.5, 4.3, '', '2018-11-22 03:45:49', 'DL', '61453234', 0, '2018-11-22 09:45:49', '2018-11-21 16:15:49'),
(75, 'e0f6c145b8529f7a7a970b482329458a', '2ee1a699b3530836aee2d96ceba1523c', 6, 0, 1, 3.5, 4.3, '', '2018-11-22 03:45:49', 'DL', '61453234', 0, '2018-11-22 09:45:49', '2018-11-21 16:15:49'),
(76, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 4, 2, 9, '', '2018-11-22 10:45:43', 'CA', '51336339', 0, '2018-11-22 16:45:43', '2018-11-21 23:15:43'),
(77, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 2, 7, 9, '', '2018-11-22 10:45:43', 'CA', '51336339', 0, '2018-11-22 16:45:43', '2018-11-21 23:15:43'),
(78, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 41, '', '2018-11-22 11:00:40', 'DL', '1210145', 0, '2018-11-22 17:00:40', '2018-11-21 23:30:40'),
(79, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 41, '', '2018-11-22 11:00:40', 'DL', '1210145', 0, '2018-11-22 17:00:40', '2018-11-21 23:30:40'),
(80, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 41, '', '2018-11-22 11:00:40', 'DL', '1210145', 0, '2018-11-22 17:00:40', '2018-11-21 23:30:40'),
(81, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 4, 2, 21, '', '2018-11-22 11:13:06', 'ID', '99369497', 0, '2018-11-22 17:13:06', '2018-11-21 23:43:06'),
(82, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 2, 7, 21, '', '2018-11-22 11:13:06', 'ID', '99369497', 0, '2018-11-22 17:13:06', '2018-11-21 23:43:06'),
(83, 'c929b21a0afca672424a64357d8f1753', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 3, 10.5, 10.5, '', '2018-11-22 11:55:39', 'CA', '24536443', 0, '2018-11-22 17:55:39', '2018-11-22 00:25:39'),
(84, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 4, 14, 26, '', '2018-11-22 11:59:00', 'CA', '36681933', 0, '2018-11-22 17:59:00', '2018-11-22 00:29:00'),
(85, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 2, 1, 11.5, '', '2018-11-22 12:03:58', 'CA', '47986166', 0, '2018-11-22 18:03:58', '2018-11-22 00:33:58'),
(86, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 3, 10.5, 11.5, '', '2018-11-22 12:03:58', 'CA', '47986166', 0, '2018-11-22 18:03:58', '2018-11-22 00:33:58'),
(87, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 10, 34.5, '', '2018-11-22 12:05:54', 'CA', '39476271', 0, '2018-11-22 18:05:54', '2018-11-22 00:35:54'),
(88, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 4.5, 34.5, '', '2018-11-22 12:05:54', 'CA', '39476271', 0, '2018-11-22 18:05:54', '2018-11-22 00:35:54'),
(89, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 3, 1.5, 12, '', '2018-11-22 12:15:25', 'ID', '48356016', 0, '2018-11-22 18:15:25', '2018-11-22 00:45:25'),
(90, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 3, 10.5, 12, '', '2018-11-22 12:15:25', 'ID', '48356016', 0, '2018-11-22 18:15:25', '2018-11-22 00:45:25'),
(91, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 6, '', '2018-11-22 12:56:00', 'DL', '1210942', 0, '2018-11-22 18:56:00', '2018-11-22 01:26:00'),
(92, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 16, '', '2018-11-22 01:21:54', 'CA', '23237026', 0, '2018-11-22 07:21:54', '2018-11-22 01:51:54'),
(93, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 7.5, 22, '', '2018-11-22 01:22:45', 'CA', '17674327', 0, '2018-11-22 07:22:45', '2018-11-22 01:52:45'),
(94, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 4.5, 22, '', '2018-11-22 01:22:45', 'CA', '17674327', 0, '2018-11-22 07:22:45', '2018-11-22 01:52:45'),
(95, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 26, '', '2018-11-22 01:24:54', 'ID', '13979378', 0, '2018-11-22 07:24:54', '2018-11-22 01:54:54'),
(96, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 1, 2.8, 68.5, '', '2018-11-22 01:54:44', 'DL', '85365110', 0, '2018-11-22 07:54:44', '2018-11-22 02:24:44'),
(97, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 1, 3.2, 68.5, '', '2018-11-22 01:54:44', 'DL', '85365110', 0, '2018-11-22 07:54:44', '2018-11-22 02:24:44'),
(98, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 6, 68.5, '', '2018-11-22 01:54:44', 'DL', '85365110', 0, '2018-11-22 07:54:44', '2018-11-22 02:24:44'),
(99, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 5, 68.5, '', '2018-11-22 01:54:44', 'DL', '85365110', 0, '2018-11-22 07:54:44', '2018-11-22 02:24:44'),
(100, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 1, 1.5, 68.5, '', '2018-11-22 01:54:44', 'DL', '85365110', 0, '2018-11-22 07:54:44', '2018-11-22 02:24:44'),
(101, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 16, 40, 43, '', '2018-11-23 01:11:25', 'DL', '1210538', 0, '2018-11-23 07:11:25', '2018-11-23 01:41:25'),
(102, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 24, 43, '', '2018-11-23 01:11:25', 'DL', '1210538', 0, '2018-11-23 07:11:25', '2018-11-23 01:41:25'),
(103, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 7.5, 32, '', '2018-11-23 03:02:50', 'DL', '1210543', 0, '2018-11-23 09:02:50', '2018-11-23 03:32:50'),
(104, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 4.5, 32, '', '2018-11-23 03:02:50', 'DL', '1210543', 0, '2018-11-23 09:02:50', '2018-11-23 03:32:50'),
(105, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 24, '', '2018-11-23 03:11:29', 'DL', '1210721', 0, '2018-11-23 09:11:29', '2018-11-23 03:41:29'),
(106, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 24, '', '2018-11-23 03:11:29', 'DL', '1210721', 0, '2018-11-23 09:11:29', '2018-11-23 03:41:29'),
(107, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 5, 4.5, 24, '', '2018-11-23 03:11:29', 'DL', '1210721', 0, '2018-11-23 09:11:29', '2018-11-23 03:41:29'),
(108, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 1, 6, 7, '', '2018-11-23 03:36:14', 'DL', '1210465', 0, '2018-11-23 09:36:14', '2018-11-23 04:06:14'),
(109, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 1, 5, 7, '', '2018-11-23 03:36:14', 'DL', '1210465', 0, '2018-11-23 09:36:14', '2018-11-23 04:06:14'),
(110, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 1, 3, 7, '', '2018-11-23 03:36:14', 'DL', '1210465', 0, '2018-11-23 09:36:14', '2018-11-23 04:06:14'),
(111, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 1, 4, 4, '', '2018-11-23 03:50:33', 'DL', '1210577', 0, '2018-11-23 09:50:33', '2018-11-23 04:20:33'),
(112, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 1, 9, 4, '', '2018-11-23 03:50:33', 'DL', '1210577', 0, '2018-11-23 09:50:33', '2018-11-23 04:20:33'),
(113, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 1, 3, 7, '', '2018-11-23 04:09:05', 'DL', '1210775', 0, '2018-11-23 10:09:05', '2018-11-23 04:39:05'),
(114, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 1, 5, 7, '', '2018-11-23 04:09:05', 'DL', '1210775', 0, '2018-11-23 10:09:05', '2018-11-23 04:39:05'),
(115, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 1, 0, 7, '', '2018-11-23 04:09:05', 'DL', '1210775', 0, '2018-11-23 10:09:05', '2018-11-23 04:39:05'),
(116, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 17, '', '2018-11-23 04:14:51', 'DL', '1210590', 0, '2018-11-23 10:14:51', '2018-11-23 04:44:51'),
(117, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 2.5, 17, '', '2018-11-23 04:14:51', 'DL', '1210590', 0, '2018-11-23 10:14:51', '2018-11-23 04:44:51'),
(118, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 17, '', '2018-11-23 04:14:51', 'DL', '1210590', 0, '2018-11-23 10:14:51', '2018-11-23 04:44:51'),
(119, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 14.5, '', '2018-11-23 04:22:55', 'DL', '1210656', 0, '2018-11-23 10:22:55', '2018-11-23 04:52:55'),
(120, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 1, 5, 14.5, '', '2018-11-23 04:22:55', 'DL', '1210656', 0, '2018-11-23 10:22:55', '2018-11-23 04:52:55'),
(121, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 14.5, '', '2018-11-23 04:22:55', 'DL', '1210656', 0, '2018-11-23 10:22:55', '2018-11-23 04:52:55'),
(122, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 3, 22.9, '', '2018-11-23 05:34:20', 'DL', '1210178', 0, '2018-11-23 11:34:20', '2018-11-23 06:04:20'),
(123, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 22.9, '', '2018-11-23 05:34:20', 'DL', '1210178', 0, '2018-11-23 11:34:20', '2018-11-23 06:04:20'),
(124, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 6, 22.9, '', '2018-11-23 05:34:20', 'DL', '1210178', 0, '2018-11-23 11:34:20', '2018-11-23 06:04:20'),
(125, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 6.4, 22.9, '', '2018-11-23 05:34:20', 'DL', '1210178', 0, '2018-11-23 11:34:20', '2018-11-23 06:04:20'),
(126, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 1, 3.2, 14.7, '', '2018-11-24 02:26:25', 'DL', '1210329', 0, '2018-11-24 08:26:25', '2018-11-24 02:56:25'),
(127, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 6, 14.7, '', '2018-11-24 02:26:25', 'DL', '1210329', 0, '2018-11-24 08:26:25', '2018-11-24 02:56:25'),
(128, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 1, 2.5, 14.7, '', '2018-11-24 02:26:25', 'DL', '1210329', 0, '2018-11-24 08:26:25', '2018-11-24 02:56:25'),
(129, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 3, 14.7, '', '2018-11-24 02:26:25', 'DL', '1210329', 0, '2018-11-24 08:26:25', '2018-11-24 02:56:25'),
(130, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 1, 2.8, 6, '', '2018-11-26 03:33:36', 'DL', '1210725', 0, '2018-11-26 09:33:36', '2018-11-26 04:03:36'),
(131, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 1, 3.2, 6, '', '2018-11-26 03:33:36', 'DL', '1210725', 0, '2018-11-26 09:33:36', '2018-11-26 04:03:36'),
(132, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 32.5, '', '2018-11-26 05:27:42', 'CA', '17542054', 0, '2018-11-26 11:27:42', '2018-11-26 05:57:42'),
(133, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 6.4, 48.4, '', '2018-11-26 05:32:25', 'A', '37880302', 0, '2018-11-26 11:32:25', '2018-11-26 06:02:25'),
(134, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 9, 48.4, '', '2018-11-26 05:32:25', 'A', '37880302', 0, '2018-11-26 11:32:25', '2018-11-26 06:02:25'),
(135, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 5, 48.4, '', '2018-11-26 05:32:25', 'A', '37880302', 0, '2018-11-26 11:32:25', '2018-11-26 06:02:25'),
(136, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 3, 48.4, '', '2018-11-26 05:32:25', 'A', '37880302', 0, '2018-11-26 11:32:25', '2018-11-26 06:02:25'),
(137, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(138, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 6, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(139, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 2.4, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(140, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 3, 3.2, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(141, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 2, 3.6, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(142, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 10, 0, 2, 3.2, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(143, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 11, 0, 2, 7.2, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(144, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 12, 0, 2, 5.2, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(145, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 13, 0, 2, 5.6, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(146, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 14, 0, 2, 9.6, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(147, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 15, 0, 2, 9, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(148, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 16, 0, 3, 5, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(149, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 17, 0, 3, 4.5, 73.5, '', '2018-11-27 05:25:44', 'DL', '1210496', 0, '2018-11-27 11:25:44', '2018-11-27 05:55:44'),
(150, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 6, '', '2018-11-28 11:09:53', 'DL', '1210462', 0, '2018-11-28 17:09:53', '2018-11-27 23:39:53'),
(151, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 5, 9.5, '', '2018-11-28 11:25:18', 'DL', '01210976', 0, '2018-11-28 17:25:18', '2018-11-27 23:55:18'),
(152, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 4.5, 9.5, '', '2018-11-28 11:25:18', 'DL', '01210976', 0, '2018-11-28 17:25:18', '2018-11-27 23:55:18'),
(153, '848d0476318eab32cfed4b06030790be', '3a6d570f4654177520f428c841cf541e', 4, 0, 2, 3, 3, '', '2018-11-28 11:32:03', 'P', '01180404', 0, '2018-11-28 17:32:03', '2018-11-28 00:02:03'),
(154, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 5, 34.5, '', '2018-11-28 01:03:21', 'DL', '01210880', 0, '2018-11-28 07:03:21', '2018-11-28 01:33:21'),
(155, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 4.5, 34.5, '', '2018-11-28 01:03:21', 'DL', '01210880', 0, '2018-11-28 07:03:21', '2018-11-28 01:33:21'),
(156, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 24.5, '', '2018-11-28 01:15:25', 'RJ', '1956,1955,1954,1953,1952,1951,1950,1949,1948,1947,1946,1945,1944,1943,19421163', 0, '2018-11-28 07:15:25', '2018-11-28 01:45:25'),
(157, '9f26032e14cd9387f171156e5680f621', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 7, 24.5, 24.5, '', '2018-11-28 01:19:14', 'P', '01120572', 0, '2018-11-28 07:19:14', '2018-11-28 01:49:14'),
(158, '81a9dfe6ab5ed388672712f740baf4c2', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 3, 10.5, 30.5, '', '2018-11-28 01:21:14', 'P', '01120891', 0, '2018-11-28 07:21:14', '2018-11-28 01:51:14'),
(159, '85cc3701a5c4762b4c70fb1773998d09', 'e9a6d9dac5082a099be3676d08de1ded', 4, 0, 3, 4.5, 4.5, '', '2018-11-28 01:36:30', 'DL', '01130713', 0, '2018-11-28 07:36:30', '2018-11-28 02:06:30'),
(160, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 5, 29.5, '', '2018-11-28 03:01:27', 'A', '01211168', 0, '2018-11-28 09:01:27', '2018-11-28 03:31:27'),
(161, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 4.5, 29.5, '', '2018-11-28 03:01:27', 'A', '01211168', 0, '2018-11-28 09:01:27', '2018-11-28 03:31:27'),
(162, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 5, 8, '', '2018-11-28 05:12:37', 'DL', '01210300', 0, '2018-11-28 11:12:37', '2018-11-28 05:42:37'),
(163, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 3, 8, '', '2018-11-28 05:12:37', 'DL', '01210300', 0, '2018-11-28 11:12:37', '2018-11-28 05:42:37'),
(164, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 18.5, '', '2018-11-28 05:18:46', 'DL', '01210784', 0, '2018-11-28 11:18:46', '2018-11-28 05:48:46'),
(165, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 5, 18.5, '', '2018-11-28 05:18:46', 'DL', '01210784', 0, '2018-11-28 11:18:46', '2018-11-28 05:48:46'),
(166, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 18.5, '', '2018-11-28 05:18:46', 'DL', '01210784', 0, '2018-11-28 11:18:46', '2018-11-28 05:48:46'),
(167, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 6, 9, 9, '', '2018-11-28 05:19:07', 'DL', '01210229', 0, '2018-11-28 11:19:07', '2018-11-28 05:49:07'),
(168, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 21, '', '2018-11-28 05:20:18', 'DL', '01210576', 0, '2018-11-28 11:20:18', '2018-11-28 05:50:18'),
(169, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 21, '', '2018-11-28 05:20:18', 'DL', '01210576', 0, '2018-11-28 11:20:18', '2018-11-28 05:50:18'),
(170, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 21, '', '2018-11-28 05:20:18', 'DL', '01210576', 0, '2018-11-28 11:20:18', '2018-11-28 05:50:18'),
(171, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 5, 8, '', '2018-11-28 05:26:40', 'DL', '01210188', 0, '2018-11-28 11:26:40', '2018-11-28 05:56:40'),
(172, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 3, 8, '', '2018-11-28 05:26:40', 'DL', '01210188', 0, '2018-11-28 11:26:40', '2018-11-28 05:56:40'),
(173, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 6, '', '2018-11-28 05:30:06', 'DL', '01210469', 0, '2018-11-28 11:30:06', '2018-11-28 06:00:06'),
(174, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 5, 10, 17.5, '', '2018-11-28 05:30:38', 'DL', '01210833', 0, '2018-11-28 11:30:38', '2018-11-28 06:00:38'),
(175, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 7.5, 17.5, '', '2018-11-28 05:30:38', 'DL', '01210833', 0, '2018-11-28 11:30:38', '2018-11-28 06:00:38'),
(176, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 6, '', '2018-11-29 11:12:12', 'DL', '01210644', 0, '2018-11-29 17:12:12', '2018-11-28 23:42:12'),
(177, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 5, 12.5, 32.5, '', '2018-11-29 11:13:00', 'DL', '01210747', 0, '2018-11-29 17:13:00', '2018-11-28 23:43:00'),
(178, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 5, 8, '', '2018-11-29 11:13:34', 'DL', '01210944', 0, '2018-11-29 17:13:34', '2018-11-28 23:43:34'),
(179, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 3, 8, '', '2018-11-29 11:13:34', 'DL', '01210944', 0, '2018-11-29 17:13:34', '2018-11-28 23:43:34'),
(180, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 7.5, '', '2018-11-29 12:03:25', 'DL', '01210877', 0, '2018-11-29 18:03:25', '2018-11-29 00:33:25'),
(181, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 46, '', '2018-11-29 12:03:54', 'DL', '01210572', 0, '2018-11-29 18:03:54', '2018-11-29 00:33:54'),
(182, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 46, '', '2018-11-29 12:03:54', 'DL', '01210572', 0, '2018-11-29 18:03:54', '2018-11-29 00:33:54'),
(183, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 46, '', '2018-11-29 12:03:54', 'DL', '01210572', 0, '2018-11-29 18:03:54', '2018-11-29 00:33:54'),
(184, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 5, 7.5, 32.5, '', '2018-11-29 12:05:27', 'DL', '01210292', 0, '2018-11-29 18:05:27', '2018-11-29 00:35:27'),
(185, '85c42da4cf4d5ffdd64177a88a564ccd', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 7.5, 12, '', '2018-11-29 12:06:24', 'DL', '01210373', 0, '2018-11-29 18:06:24', '2018-11-29 00:36:24'),
(186, '85c42da4cf4d5ffdd64177a88a564ccd', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 4.5, 12, '', '2018-11-29 12:06:24', 'DL', '01210373', 0, '2018-11-29 18:06:24', '2018-11-29 00:36:24'),
(187, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 4.5, '', '2018-11-29 01:41:52', 'DL', '01210886', 0, '2018-11-29 07:41:52', '2018-11-29 02:11:52'),
(188, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 5, 34.5, '', '2018-11-29 03:59:12', 'DL', '01210878', 0, '2018-11-29 09:59:12', '2018-11-29 04:29:12'),
(189, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 4.5, 34.5, '', '2018-11-29 03:59:12', 'DL', '01210878', 0, '2018-11-29 09:59:12', '2018-11-29 04:29:12'),
(190, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 6.4, 20.4, '', '2018-11-29 04:00:01', 'DL', '01210829', 0, '2018-11-29 10:00:01', '2018-11-29 04:30:01'),
(191, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 6, 20.4, '', '2018-11-29 04:00:01', 'DL', '01210829', 0, '2018-11-29 10:00:01', '2018-11-29 04:30:01'),
(192, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 5, 20.4, '', '2018-11-29 04:00:01', 'DL', '01210829', 0, '2018-11-29 10:00:01', '2018-11-29 04:30:01'),
(193, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 3, 20.4, '', '2018-11-29 04:00:01', 'DL', '01210829', 0, '2018-11-29 10:00:01', '2018-11-29 04:30:01'),
(194, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 5, 9, 46.5, '', '2018-11-29 04:00:38', 'DL', '01210538', 0, '2018-11-29 10:00:38', '2018-11-29 04:30:38'),
(195, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 12.5, 46.5, '', '2018-11-29 04:00:38', 'DL', '01210538', 0, '2018-11-29 10:00:38', '2018-11-29 04:30:38'),
(196, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 13.5, '', '2018-11-29 04:01:02', 'DL', '01210126', 0, '2018-11-29 10:01:02', '2018-11-29 04:31:02'),
(197, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 13.5, '', '2018-11-29 04:01:02', 'DL', '01210126', 0, '2018-11-29 10:01:02', '2018-11-29 04:31:02'),
(198, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 6, '', '2018-11-29 04:05:25', 'DL', '01210273', 0, '2018-11-29 10:05:25', '2018-11-29 04:35:25'),
(199, '538fb93e6223508d52e2fd11e540a7c5', '984329f145af5ea254c602df6ef695d3', 4, 0, 4, 6, 6, '', '2018-11-29 06:46:08', 'DL', '01140269', 0, '2018-11-29 12:46:08', '2018-11-29 07:16:08'),
(200, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 4.5, '', '2018-12-03 04:10:15', 'DL', '01210905', 0, '2018-12-03 10:10:15', '2018-12-03 04:40:15'),
(201, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 5, 28, '', '2018-12-03 04:10:46', 'P', '01210231', 0, '2018-12-03 10:10:46', '2018-12-03 04:40:46'),
(202, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 3, 28, '', '2018-12-03 04:10:46', 'P', '01210231', 0, '2018-12-03 10:10:46', '2018-12-03 04:40:46'),
(203, '54a4d9a3a2c6023ff7b3c227a651d651', '2ee1a699b3530836aee2d96ceba1523c', 4, 0, 1, 0.3, 4.3, '', '2018-12-03 07:00:12', 'RJ', '85926645', 0, '2018-12-03 13:00:12', '2018-12-03 07:30:12'),
(204, '54a4d9a3a2c6023ff7b3c227a651d651', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 1, 0.5, 4.3, '', '2018-12-03 07:00:12', 'RJ', '85926645', 0, '2018-12-03 13:00:12', '2018-12-03 07:30:12'),
(205, '54a4d9a3a2c6023ff7b3c227a651d651', '2ee1a699b3530836aee2d96ceba1523c', 6, 0, 1, 3.5, 4.3, '', '2018-12-03 07:00:12', 'RJ', '85926645', 0, '2018-12-03 13:00:12', '2018-12-03 07:30:12'),
(206, '54a4d9a3a2c6023ff7b3c227a651d651', '3a6d570f4654177520f428c841cf541e', 4, 0, 1, 3, 19.5, '', '2018-12-03 08:28:12', 'P', '60024658', 0, '2018-12-03 14:28:12', '2018-12-03 08:58:12'),
(207, '54a4d9a3a2c6023ff7b3c227a651d651', '3a6d570f4654177520f428c841cf541e', 5, 0, 1, 1.5, 19.5, '', '2018-12-03 08:28:12', 'P', '60024658', 0, '2018-12-03 14:28:12', '2018-12-03 08:58:12'),
(208, '50957449ac6ee1b95b50073d8c70157a', '2ee1a699b3530836aee2d96ceba1523c', 5, 0, 1, 2.8, 4.9, '', '2018-12-04 11:02:03', 'P', '01120539', 0, '2018-12-04 17:02:03', '2018-12-04 11:32:03'),
(209, '50957449ac6ee1b95b50073d8c70157a', '2ee1a699b3530836aee2d96ceba1523c', 7, 0, 1, 1.6, 4.9, '', '2018-12-04 11:02:03', 'P', '01120539', 0, '2018-12-04 17:02:03', '2018-12-04 11:32:03'),
(210, '50957449ac6ee1b95b50073d8c70157a', '2ee1a699b3530836aee2d96ceba1523c', 10, 0, 1, 0.5, 4.9, '', '2018-12-04 11:02:03', 'P', '01120539', 0, '2018-12-04 17:02:03', '2018-12-04 11:32:03'),
(211, '50957449ac6ee1b95b50073d8c70157a', '984329f145af5ea254c602df6ef695d3', 4, 0, 1, 1.8, 3.3, '', '2018-12-05 01:27:52', 'A', '01141286', 0, '2018-12-05 07:27:52', '2018-12-04 13:57:52'),
(212, '50957449ac6ee1b95b50073d8c70157a', '984329f145af5ea254c602df6ef695d3', 5, 0, 1, 1.5, 3.3, '', '2018-12-05 01:27:52', 'A', '01141286', 0, '2018-12-05 07:27:52', '2018-12-04 13:57:52'),
(213, '50957449ac6ee1b95b50073d8c70157a', '179cff6dc411f329cf408941db2f5942', 4, 0, 1, 3.8, 9, '', '2018-12-05 03:22:07', 'RJ', '01171237', 0, '2018-12-05 09:22:07', '2018-12-04 15:52:07'),
(214, '50957449ac6ee1b95b50073d8c70157a', '179cff6dc411f329cf408941db2f5942', 5, 0, 1, 3, 9, '', '2018-12-05 03:22:07', 'RJ', '01171237', 0, '2018-12-05 09:22:07', '2018-12-04 15:52:07'),
(215, '50957449ac6ee1b95b50073d8c70157a', '179cff6dc411f329cf408941db2f5942', 6, 0, 1, 2.2, 9, '', '2018-12-05 03:22:07', 'RJ', '01171237', 0, '2018-12-05 09:22:07', '2018-12-04 15:52:07'),
(216, '4aa6f992ba801bb26ddf421e4ee561cc', '0d6f0057acc11d09c8686e9da529f06a', 4, 0, 1, 2.3, 7.6, '', '2018-12-05 03:33:24', 'ID', '01191725', 0, '2018-12-05 09:33:24', '2018-12-04 16:03:24'),
(217, '4aa6f992ba801bb26ddf421e4ee561cc', '0d6f0057acc11d09c8686e9da529f06a', 5, 0, 1, 2, 7.6, '', '2018-12-05 03:33:24', 'ID', '01191725', 0, '2018-12-05 09:33:24', '2018-12-04 16:03:24'),
(218, '4aa6f992ba801bb26ddf421e4ee561cc', '0d6f0057acc11d09c8686e9da529f06a', 6, 0, 1, 1.5, 7.6, '', '2018-12-05 03:33:24', 'ID', '01191725', 0, '2018-12-05 09:33:24', '2018-12-04 16:03:24'),
(219, '4aa6f992ba801bb26ddf421e4ee561cc', '0d6f0057acc11d09c8686e9da529f06a', 7, 0, 1, 1.8, 7.6, '', '2018-12-05 03:33:24', 'ID', '01191725', 0, '2018-12-05 09:33:24', '2018-12-04 16:03:24'),
(220, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 6, 9, 29, '', '2018-12-05 10:13:54', 'A', '01211678', 0, '2018-12-05 16:13:54', '2018-12-04 22:43:54'),
(221, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 5, 14, 70.2, '', '2018-12-05 10:46:52', 'A', '01211890', 0, '2018-12-05 16:46:52', '2018-12-04 23:16:52'),
(222, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 6, 19.2, 70.2, '', '2018-12-05 10:46:52', 'A', '01211890', 0, '2018-12-05 16:46:52', '2018-12-04 23:16:52'),
(223, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 9, 70.2, '', '2018-12-05 10:46:52', 'A', '01211890', 0, '2018-12-05 16:46:52', '2018-12-04 23:16:52'),
(224, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 2, 5, 70.2, '', '2018-12-05 10:46:52', 'A', '01211890', 0, '2018-12-05 16:46:52', '2018-12-04 23:16:52'),
(225, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 2, 3, 70.2, '', '2018-12-05 10:46:52', 'A', '01211890', 0, '2018-12-05 16:46:52', '2018-12-04 23:16:52'),
(226, '9f26032e14cd9387f171156e5680f621', '179cff6dc411f329cf408941db2f5942', 4, 0, 3, 9, 29.8, '', '2018-12-05 11:07:37', 'DL', '01171897', 0, '2018-12-05 17:07:37', '2018-12-04 23:37:37'),
(227, '9f26032e14cd9387f171156e5680f621', '179cff6dc411f329cf408941db2f5942', 5, 0, 4, 8.8, 29.8, '', '2018-12-05 11:07:37', 'DL', '01171897', 0, '2018-12-05 17:07:37', '2018-12-04 23:37:37'),
(228, '6c7f90605843e754498d7445a287603c', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 7.5, 33.5, '', '2018-12-05 11:38:25', 'DL', '01211132', 0, '2018-12-05 17:38:25', '2018-12-05 00:08:25'),
(229, '6c7f90605843e754498d7445a287603c', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 6, 33.5, '', '2018-12-05 11:38:25', 'DL', '01211132', 0, '2018-12-05 17:38:25', '2018-12-05 00:08:25'),
(230, '6c7f90605843e754498d7445a287603c', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 26, '', '2018-12-05 04:47:44', 'A', '01211311', 0, '2018-12-05 10:47:44', '2018-12-05 05:17:44'),
(231, '6c7f90605843e754498d7445a287603c', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 26, '', '2018-12-05 06:08:33', 'DL', '01211700', 0, '2018-12-05 12:08:33', '2018-12-05 06:38:33'),
(232, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 26, '', '2018-12-06 05:03:47', 'A', '01211382', 0, '2018-12-06 11:03:47', '2018-12-06 05:33:47'),
(233, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 7.5, 25, '', '2018-12-06 05:04:36', 'A', '01211483', 0, '2018-12-06 11:04:36', '2018-12-06 05:34:36'),
(234, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 5, 7.5, 25, '', '2018-12-06 05:04:36', 'A', '01211483', 0, '2018-12-06 11:04:36', '2018-12-06 05:34:36'),
(235, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 7.5, 19, '', '2018-12-06 05:05:32', 'ID', '01211271', 0, '2018-12-06 11:05:32', '2018-12-06 05:35:32'),
(236, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 1, 1.5, 19, '', '2018-12-06 05:05:32', 'ID', '01211271', 0, '2018-12-06 11:05:32', '2018-12-06 05:35:32'),
(237, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 8.4, 42.5, '', '2018-12-06 05:06:29', 'ID', '01211293', 0, '2018-12-06 11:06:29', '2018-12-06 05:36:29'),
(238, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 3, 9.6, 42.5, '', '2018-12-06 05:06:29', 'ID', '01211293', 0, '2018-12-06 11:06:29', '2018-12-06 05:36:29'),
(239, 'dd6a847baaaff26087729db5ec012359', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 3, 4.5, 42.5, '', '2018-12-06 05:06:29', 'ID', '01211293', 0, '2018-12-06 11:06:29', '2018-12-06 05:36:29'),
(240, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-08 10:40:12', 'P', '01210481', 0, '2018-12-08 16:40:12', '2018-12-07 23:10:12'),
(241, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-08 10:40:12', 'P', '01210481', 0, '2018-12-08 16:40:12', '2018-12-07 23:10:12'),
(242, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-08 10:40:12', 'P', '01210481', 0, '2018-12-08 16:40:12', '2018-12-07 23:10:12'),
(243, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-08 05:30:06', 'P', '01210660', 0, '2018-12-08 11:30:06', '2018-12-08 06:00:06'),
(244, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-08 05:30:06', 'P', '01210660', 0, '2018-12-08 11:30:06', '2018-12-08 06:00:06'),
(245, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-08 05:30:06', 'P', '01210660', 0, '2018-12-08 11:30:06', '2018-12-08 06:00:06'),
(246, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-08 05:34:04', 'P', '01210967', 0, '2018-12-08 11:34:04', '2018-12-08 06:04:04'),
(247, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-08 05:34:04', 'P', '01210967', 0, '2018-12-08 11:34:04', '2018-12-08 06:04:04'),
(248, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-08 05:34:04', 'P', '01210967', 0, '2018-12-08 11:34:04', '2018-12-08 06:04:04'),
(249, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-08 05:41:35', 'P', '01210997', 0, '2018-12-08 11:41:35', '2018-12-08 06:11:35'),
(250, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-08 05:41:35', 'P', '01210997', 0, '2018-12-08 11:41:35', '2018-12-08 06:11:35'),
(251, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-08 05:41:35', 'P', '01210997', 0, '2018-12-08 11:41:35', '2018-12-08 06:11:35'),
(252, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-08 05:41:41', 'P', '19440165', 0, '2018-12-08 11:41:41', '2018-12-08 06:11:41'),
(253, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-08 05:41:41', 'P', '19440165', 0, '2018-12-08 11:41:41', '2018-12-08 06:11:41'),
(254, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-08 05:41:41', 'P', '19440165', 0, '2018-12-08 11:41:41', '2018-12-08 06:11:41'),
(255, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-08 05:48:43', 'P', '01210901', 0, '2018-12-08 11:48:43', '2018-12-08 06:18:43'),
(256, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-08 05:48:43', 'P', '01210901', 0, '2018-12-08 11:48:43', '2018-12-08 06:18:43'),
(257, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-08 05:48:43', 'P', '01210901', 0, '2018-12-08 11:48:43', '2018-12-08 06:18:43'),
(258, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-08 05:48:46', 'P', '19440536', 0, '2018-12-08 11:48:46', '2018-12-08 06:18:46'),
(259, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-08 05:48:46', 'P', '19440536', 0, '2018-12-08 11:48:46', '2018-12-08 06:18:46'),
(260, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-08 05:48:46', 'P', '19440536', 0, '2018-12-08 11:48:46', '2018-12-08 06:18:46'),
(261, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-10 11:35:53', 'P', '01210374', 0, '2018-12-10 17:35:53', '2018-12-10 00:05:53'),
(262, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-10 11:35:53', 'P', '01210374', 0, '2018-12-10 17:35:53', '2018-12-10 00:05:53'),
(263, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-10 11:35:53', 'P', '01210374', 0, '2018-12-10 17:35:53', '2018-12-10 00:05:53');
INSERT INTO `tbl_user_purchase_orders` (`orid`, `userid`, `vendor_id`, `product_id`, `m_product_id`, `quantity`, `amount`, `total_amount`, `weight`, `order_date_time`, `order_status`, `order_transaction_id`, `read_status`, `created_at`, `updated_at`) VALUES
(264, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 6, 18, '', '2018-12-10 11:36:17', 'P', '19440630', 0, '2018-12-10 17:36:17', '2018-12-10 00:06:17'),
(265, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 18, '', '2018-12-10 11:36:17', 'P', '19440630', 0, '2018-12-10 17:36:17', '2018-12-10 00:06:17'),
(266, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 2, 4.5, 18, '', '2018-12-10 11:36:17', 'P', '19440630', 0, '2018-12-10 17:36:17', '2018-12-10 00:06:17'),
(267, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 4.5, '', '2018-12-10 05:24:19', 'P', '19420479', 0, '2018-12-10 11:24:19', '2018-12-10 05:54:19'),
(268, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 1, 1.5, 1.5, '', '2018-12-10 05:31:45', 'P', '19420898', 0, '2018-12-10 11:31:45', '2018-12-10 06:01:45'),
(269, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 5, 28, '', '2018-12-10 05:38:30', 'P', '19430963', 0, '2018-12-10 11:38:30', '2018-12-10 06:08:30'),
(270, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 3, 28, '', '2018-12-10 05:38:30', 'P', '19430963', 0, '2018-12-10 11:38:30', '2018-12-10 06:08:30'),
(271, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 4.5, '', '2018-12-11 04:44:03', 'P', '19420176', 0, '2018-12-11 10:44:03', '2018-12-11 05:14:03'),
(272, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 11.2, 128.4, '', '2018-12-11 05:12:47', 'P', '19460374', 0, '2018-12-11 11:12:47', '2018-12-11 05:42:47'),
(273, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 10, 51.2, 128.4, '', '2018-12-11 05:12:47', 'P', '19460374', 0, '2018-12-11 11:12:47', '2018-12-11 05:42:47'),
(274, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 6, 18, 128.4, '', '2018-12-11 05:12:47', 'P', '19460374', 0, '2018-12-11 11:12:47', '2018-12-11 05:42:47'),
(275, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 16, 25, 128.4, '', '2018-12-11 05:12:47', 'P', '19460374', 0, '2018-12-11 11:12:47', '2018-12-11 05:42:47'),
(276, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 4, 3, 128.4, '', '2018-12-11 05:12:47', 'P', '19460374', 0, '2018-12-11 11:12:47', '2018-12-11 05:42:47'),
(277, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 11.2, 128.4, '', '2018-12-11 05:47:14', 'P', '19460562', 0, '2018-12-11 11:47:14', '2018-12-11 06:17:14'),
(278, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 10, 51.2, 128.4, '', '2018-12-11 05:47:14', 'P', '19460562', 0, '2018-12-11 11:47:14', '2018-12-11 06:17:14'),
(279, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 6, 18, 128.4, '', '2018-12-11 05:47:14', 'P', '19460562', 0, '2018-12-11 11:47:14', '2018-12-11 06:17:14'),
(280, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 16, 25, 128.4, '', '2018-12-11 05:47:14', 'P', '19460562', 0, '2018-12-11 11:47:14', '2018-12-11 06:17:14'),
(281, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 8, 0, 4, 3, 128.4, '', '2018-12-11 05:47:14', 'P', '19460562', 0, '2018-12-11 11:47:14', '2018-12-11 06:17:14'),
(282, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 6, '', '2018-12-11 05:58:37', 'P', '19420719', 0, '2018-12-11 11:58:37', '2018-12-11 06:28:37'),
(283, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 4.5, '', '2018-12-11 06:11:09', 'P', '19420986', 0, '2018-12-11 12:11:09', '2018-12-11 06:41:09'),
(284, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 41, '', '2018-12-11 06:12:04', 'P', '19440598', 0, '2018-12-11 12:12:04', '2018-12-11 06:42:04'),
(285, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 41, '', '2018-12-11 06:12:04', 'P', '19440598', 0, '2018-12-11 12:12:04', '2018-12-11 06:42:04'),
(286, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 41, '', '2018-12-11 06:12:04', 'P', '19440598', 0, '2018-12-11 12:12:04', '2018-12-11 06:42:04'),
(287, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 5, 7.5, 7.5, '', '2018-12-12 10:09:05', 'DL', '19420268', 0, '2018-12-12 16:09:05', '2018-12-11 22:39:05'),
(288, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 6, 6, '', '2018-12-12 11:27:52', 'P', '19420941', 0, '2018-12-12 17:27:52', '2018-12-11 23:57:52'),
(289, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 9.6, 49.1, '', '2018-12-12 11:48:25', 'P', '19450628', 0, '2018-12-12 17:48:25', '2018-12-12 00:18:25'),
(290, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 9, 49.1, '', '2018-12-12 11:48:25', 'P', '19450628', 0, '2018-12-12 17:48:25', '2018-12-12 00:18:25'),
(291, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 7.5, 49.1, '', '2018-12-12 11:48:25', 'P', '19450628', 0, '2018-12-12 17:48:25', '2018-12-12 00:18:25'),
(292, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 3, 3, 49.1, '', '2018-12-12 11:48:25', 'P', '19450628', 0, '2018-12-12 17:48:25', '2018-12-12 00:18:25'),
(293, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 12, 34, '', '2018-12-12 11:49:08', 'P', '19440603', 0, '2018-12-12 17:49:08', '2018-12-12 00:19:08'),
(294, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 7.5, 34, '', '2018-12-12 11:49:08', 'P', '19440603', 0, '2018-12-12 17:49:08', '2018-12-12 00:19:08'),
(295, '0a43867a4af55a22a149c7152986e4bf', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 4, 4.5, 34, '', '2018-12-12 11:49:08', 'P', '19440603', 0, '2018-12-12 17:49:08', '2018-12-12 00:19:08'),
(296, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 10, 16, '', '2018-12-12 11:52:22', 'P', '19430891', 0, '2018-12-12 17:52:22', '2018-12-12 00:22:22'),
(297, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 6, 16, '', '2018-12-12 11:52:22', 'P', '19430891', 0, '2018-12-12 17:52:22', '2018-12-12 00:22:22'),
(298, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 10, 16, '', '2018-12-12 11:54:18', 'P', '19430419', 0, '2018-12-12 17:54:18', '2018-12-12 00:24:18'),
(299, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 6, 16, '', '2018-12-12 11:54:18', 'P', '19430419', 0, '2018-12-12 17:54:18', '2018-12-12 00:24:18'),
(300, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 10, 26, '', '2018-12-12 12:01:08', 'P', '19430879', 0, '2018-12-12 18:01:08', '2018-12-12 00:31:08'),
(301, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 6, 26, '', '2018-12-12 12:01:08', 'P', '19430879', 0, '2018-12-12 18:01:08', '2018-12-12 00:31:08'),
(302, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 4, 10, 36, '', '2018-12-12 12:07:35', 'P', '19430173', 0, '2018-12-12 18:07:35', '2018-12-12 00:37:35'),
(303, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 6, 36, '', '2018-12-12 12:07:35', 'P', '19430173', 0, '2018-12-12 18:07:35', '2018-12-12 00:37:35'),
(304, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 9.6, 51.6, '', '2018-12-12 12:10:23', 'P', '19450912', 0, '2018-12-12 18:10:23', '2018-12-12 00:40:23'),
(305, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 4, 9, 51.6, '', '2018-12-12 12:10:23', 'P', '19450912', 0, '2018-12-12 18:10:23', '2018-12-12 00:40:23'),
(306, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 10, 51.6, '', '2018-12-12 12:10:23', 'P', '19450912', 0, '2018-12-12 18:10:23', '2018-12-12 00:40:23'),
(307, '680731bbdc285fe93f5aa5492a44a16a', 'f71ff81e4fa3b58313e53e60fa25402e', 7, 0, 3, 3, 51.6, '', '2018-12-12 12:10:23', 'P', '19450912', 0, '2018-12-12 18:10:23', '2018-12-12 00:40:23'),
(308, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 9, 28.5, '', '2018-12-12 12:10:48', 'P', '19440558', 0, '2018-12-12 18:10:48', '2018-12-12 00:40:48'),
(309, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 2, 5, 28.5, '', '2018-12-12 12:10:48', 'P', '19440558', 0, '2018-12-12 18:10:48', '2018-12-12 00:40:48'),
(310, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 6, 0, 3, 4.5, 28.5, '', '2018-12-12 12:10:48', 'P', '19440558', 0, '2018-12-12 18:10:48', '2018-12-12 00:40:48'),
(311, '538fb93e6223508d52e2fd11e540a7c5', '984329f145af5ea254c602df6ef695d3', 4, 0, 3, 4.5, 19.5, '', '2018-12-12 12:35:17', 'DL', '18810691', 0, '2018-12-12 18:35:17', '2018-12-12 01:05:17'),
(312, '50957449ac6ee1b95b50073d8c70157a', '984329f145af5ea254c602df6ef695d3', 4, 0, 1, 1.5, 1.5, '', '2018-12-12 12:37:49', 'DL', '18810755', 0, '2018-12-12 18:37:49', '2018-12-12 01:07:49'),
(313, '50957449ac6ee1b95b50073d8c70157a', '984329f145af5ea254c602df6ef695d3', 4, 0, 3, 3.6, 23.1, '', '2018-12-12 12:38:34', 'P', '18820812', 0, '2018-12-12 18:38:34', '2018-12-12 01:08:34'),
(314, '50957449ac6ee1b95b50073d8c70157a', '984329f145af5ea254c602df6ef695d3', 5, 0, 2, 4.5, 23.1, '', '2018-12-12 12:38:34', 'P', '18820812', 0, '2018-12-12 18:38:34', '2018-12-12 01:08:34'),
(315, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 10, 15, 15, '', '2018-12-12 12:43:19', 'P', '19420628', 0, '2018-12-12 18:43:19', '2018-12-12 01:13:19'),
(316, '50957449ac6ee1b95b50073d8c70157a', '984329f145af5ea254c602df6ef695d3', 4, 0, 2, 3, 3, '', '2018-12-12 02:11:09', 'P', '18810162', 0, '2018-12-12 08:11:09', '2018-12-12 02:41:09'),
(317, '9f26032e14cd9387f171156e5680f621', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 24.5, '', '2018-12-12 02:42:05', 'P', '19420258', 0, '2018-12-12 08:42:05', '2018-12-12 03:12:05'),
(318, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 3, 4.5, 4.5, '', '2018-12-12 02:50:53', 'P', '19420856', 0, '2018-12-12 08:50:53', '2018-12-12 03:20:53'),
(319, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 4, 0, 2, 7.5, 10.5, '', '2018-12-14 11:48:09', 'P', '19430659', 0, '2018-12-14 17:48:09', '2018-12-14 00:18:09'),
(320, '07c29f8a726fa4015b639e3500333c8d', 'f71ff81e4fa3b58313e53e60fa25402e', 5, 0, 3, 3, 10.5, '', '2018-12-14 11:48:09', 'P', '19430659', 0, '2018-12-14 17:48:09', '2018-12-14 00:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor_drivers`
--

CREATE TABLE `tbl_vendor_drivers` (
  `id` int(11) NOT NULL,
  `vendor_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `driver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_vendor_drivers`
--

INSERT INTO `tbl_vendor_drivers` (`id`, `vendor_id`, `driver_id`, `status`, `created_at`) VALUES
(2, 'f71ff81e4fa3b58313e53e60fa25402e', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-11-14 10:29:08'),
(3, 'f71ff81e4fa3b58313e53e60fa25402e', '90723f1964798f812dd04651e599923c', 1, '2018-11-20 12:45:29'),
(4, '2ee1a699b3530836aee2d96ceba1523c', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-11-21 05:32:35'),
(5, 'f71ff81e4fa3b58313e53e60fa25402e', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-11-22 07:50:03'),
(6, 'f71ff81e4fa3b58313e53e60fa25402e', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-11-22 09:09:54'),
(7, 'e9a6d9dac5082a099be3676d08de1ded', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-03 13:33:10'),
(8, 'e9a6d9dac5082a099be3676d08de1ded', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-03 13:33:43'),
(9, '2ee1a699b3530836aee2d96ceba1523c', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-03 13:40:27'),
(10, '2ee1a699b3530836aee2d96ceba1523c', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 20:26:37'),
(11, '2ee1a699b3530836aee2d96ceba1523c', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 20:26:54'),
(12, '2ee1a699b3530836aee2d96ceba1523c', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 20:27:44'),
(13, '2ee1a699b3530836aee2d96ceba1523c', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 20:28:15'),
(14, '2ee1a699b3530836aee2d96ceba1523c', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 20:28:32'),
(15, '2ee1a699b3530836aee2d96ceba1523c', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 20:28:43'),
(16, '2ee1a699b3530836aee2d96ceba1523c', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 20:28:52'),
(17, '2ee1a699b3530836aee2d96ceba1523c', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-04 20:30:06'),
(18, '2ee1a699b3530836aee2d96ceba1523c', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 20:33:03'),
(19, 'e9a6d9dac5082a099be3676d08de1ded', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 20:33:57'),
(20, 'e9a6d9dac5082a099be3676d08de1ded', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-12-04 20:34:16'),
(21, 'e9a6d9dac5082a099be3676d08de1ded', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 20:34:30'),
(22, 'e9a6d9dac5082a099be3676d08de1ded', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 20:34:39'),
(23, 'e9a6d9dac5082a099be3676d08de1ded', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 20:34:48'),
(24, 'e9a6d9dac5082a099be3676d08de1ded', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 20:34:56'),
(25, 'e9a6d9dac5082a099be3676d08de1ded', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 20:35:04'),
(26, 'e9a6d9dac5082a099be3676d08de1ded', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 20:35:12'),
(27, 'e9a6d9dac5082a099be3676d08de1ded', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 20:35:21'),
(28, '984329f145af5ea254c602df6ef695d3', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-04 20:38:24'),
(29, '984329f145af5ea254c602df6ef695d3', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 20:38:31'),
(30, '984329f145af5ea254c602df6ef695d3', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-12-04 21:02:56'),
(31, '984329f145af5ea254c602df6ef695d3', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 21:03:05'),
(32, '984329f145af5ea254c602df6ef695d3', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 21:03:13'),
(33, '984329f145af5ea254c602df6ef695d3', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 21:03:23'),
(34, '984329f145af5ea254c602df6ef695d3', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 21:03:31'),
(35, '984329f145af5ea254c602df6ef695d3', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 21:03:43'),
(36, '984329f145af5ea254c602df6ef695d3', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 21:03:51'),
(37, '984329f145af5ea254c602df6ef695d3', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-04 21:03:58'),
(38, '984329f145af5ea254c602df6ef695d3', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 21:04:07'),
(39, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-04 21:05:10'),
(40, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 21:05:22'),
(41, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-12-04 21:05:45'),
(42, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 21:06:05'),
(43, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 21:06:16'),
(44, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 21:06:29'),
(45, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 21:06:40'),
(46, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 21:06:51'),
(47, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 21:07:01'),
(48, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-04 21:07:11'),
(49, 'e7f4cb3378c6a98caa3a4e2fa6c39de8', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 21:07:20'),
(50, 'e0df88cb2c2673cf15b660db5aa117ae', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-04 21:08:22'),
(51, 'e0df88cb2c2673cf15b660db5aa117ae', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 21:08:32'),
(52, 'e0df88cb2c2673cf15b660db5aa117ae', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-12-04 21:08:43'),
(53, 'e0df88cb2c2673cf15b660db5aa117ae', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 21:08:52'),
(54, 'e0df88cb2c2673cf15b660db5aa117ae', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 21:09:01'),
(55, 'e0df88cb2c2673cf15b660db5aa117ae', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 21:09:12'),
(56, 'e0df88cb2c2673cf15b660db5aa117ae', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 21:09:22'),
(57, 'e0df88cb2c2673cf15b660db5aa117ae', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 21:09:34'),
(58, 'e0df88cb2c2673cf15b660db5aa117ae', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 21:09:43'),
(59, 'e0df88cb2c2673cf15b660db5aa117ae', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-04 21:09:57'),
(60, 'e0df88cb2c2673cf15b660db5aa117ae', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 21:10:07'),
(61, '179cff6dc411f329cf408941db2f5942', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-04 21:11:58'),
(62, '179cff6dc411f329cf408941db2f5942', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 21:12:13'),
(63, '179cff6dc411f329cf408941db2f5942', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-12-04 21:12:28'),
(64, '179cff6dc411f329cf408941db2f5942', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 21:12:44'),
(65, '179cff6dc411f329cf408941db2f5942', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 21:12:59'),
(66, '179cff6dc411f329cf408941db2f5942', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 21:13:15'),
(67, '179cff6dc411f329cf408941db2f5942', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 21:13:34'),
(68, '179cff6dc411f329cf408941db2f5942', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 21:13:50'),
(69, '179cff6dc411f329cf408941db2f5942', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 21:14:06'),
(70, '179cff6dc411f329cf408941db2f5942', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-04 21:14:20'),
(71, '179cff6dc411f329cf408941db2f5942', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 21:14:35'),
(72, '3a6d570f4654177520f428c841cf541e', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-04 21:16:16'),
(73, '3a6d570f4654177520f428c841cf541e', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 21:16:38'),
(74, '3a6d570f4654177520f428c841cf541e', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-12-04 21:17:04'),
(75, '3a6d570f4654177520f428c841cf541e', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 21:17:45'),
(76, '3a6d570f4654177520f428c841cf541e', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 21:18:22'),
(77, '3a6d570f4654177520f428c841cf541e', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 21:18:46'),
(78, '3a6d570f4654177520f428c841cf541e', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 21:18:55'),
(79, '3a6d570f4654177520f428c841cf541e', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 21:19:09'),
(80, '3a6d570f4654177520f428c841cf541e', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 21:19:17'),
(81, '3a6d570f4654177520f428c841cf541e', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-04 21:19:45'),
(82, '3a6d570f4654177520f428c841cf541e', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 21:19:53'),
(83, '0d6f0057acc11d09c8686e9da529f06a', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-04 21:20:57'),
(84, '0d6f0057acc11d09c8686e9da529f06a', 'b1cb8f769d940144621a60e09163a4b2', 1, '2018-12-04 21:21:09'),
(85, '0d6f0057acc11d09c8686e9da529f06a', '9600f2b93bea100c6e32bbd24872699e', 1, '2018-12-04 21:21:19'),
(86, '0d6f0057acc11d09c8686e9da529f06a', '3256e1b52563601416739bc0a85a0381', 1, '2018-12-04 21:21:38'),
(87, '0d6f0057acc11d09c8686e9da529f06a', '479279073df7398af0068b553b655ed0', 1, '2018-12-04 21:21:56'),
(88, '0d6f0057acc11d09c8686e9da529f06a', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-04 21:22:04'),
(89, '0d6f0057acc11d09c8686e9da529f06a', '90723f1964798f812dd04651e599923c', 1, '2018-12-04 21:22:14'),
(90, '0d6f0057acc11d09c8686e9da529f06a', '2df780685e384a2eb4eba9abddd8cb59', 1, '2018-12-04 21:22:21'),
(91, '0d6f0057acc11d09c8686e9da529f06a', '9a0f2fd6bb0d06506e7ab5be3077612c', 1, '2018-12-04 21:22:29'),
(92, '0d6f0057acc11d09c8686e9da529f06a', '20d3bb4aecfc0f25efa05cd990322d42', 1, '2018-12-04 21:22:37'),
(93, '0d6f0057acc11d09c8686e9da529f06a', '8fde0a2fad28ce25f9d3c30d6e2c36f1', 1, '2018-12-04 21:22:48'),
(94, 'f71ff81e4fa3b58313e53e60fa25402e', '2ad8b695fc00981cf7e9d7220ef075b0', 1, '2018-12-05 04:42:32'),
(96, 'f71ff81e4fa3b58313e53e60fa25402e', '479279073df7398af0068b553b655ed0', 1, '2018-12-05 05:15:27'),
(97, '5b9b04124a02b83fa95cbe0da73f1e9a', '479279073df7398af0068b553b655ed0', 1, '2018-12-05 05:35:30'),
(98, 'f71ff81e4fa3b58313e53e60fa25402e', 'd19982b4e7576afab6eb6d730036b175', 1, '2018-12-05 06:09:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin_logininfo_master`
--
ALTER TABLE `tbl_admin_logininfo_master`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `tbl_admin_users_master`
--
ALTER TABLE `tbl_admin_users_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_communications`
--
ALTER TABLE `tbl_communications`
  ADD PRIMARY KEY (`commid`);

--
-- Indexes for table `tbl_drivers_master`
--
ALTER TABLE `tbl_drivers_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login_history`
--
ALTER TABLE `tbl_login_history`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`prdid`);

--
-- Indexes for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_product_child_categories`
--
ALTER TABLE `tbl_product_child_categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_product_sub_categories`
--
ALTER TABLE `tbl_product_sub_categories`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `tbl_states_master`
--
ALTER TABLE `tbl_states_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_stores_logininfo_master`
--
ALTER TABLE `tbl_stores_logininfo_master`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tbl_stores_master`
--
ALTER TABLE `tbl_stores_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_store_item_prices`
--
ALTER TABLE `tbl_store_item_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users_master`
--
ALTER TABLE `tbl_users_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `phone_num` (`phone_num`);

--
-- Indexes for table `tbl_user_addresses`
--
ALTER TABLE `tbl_user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_login_accessinfo`
--
ALTER TABLE `tbl_user_login_accessinfo`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `tbl_user_order_confirmations`
--
ALTER TABLE `tbl_user_order_confirmations`
  ADD PRIMARY KEY (`cfid`);

--
-- Indexes for table `tbl_user_purchase_orders`
--
ALTER TABLE `tbl_user_purchase_orders`
  ADD PRIMARY KEY (`orid`);

--
-- Indexes for table `tbl_vendor_drivers`
--
ALTER TABLE `tbl_vendor_drivers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin_logininfo_master`
--
ALTER TABLE `tbl_admin_logininfo_master`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin_users_master`
--
ALTER TABLE `tbl_admin_users_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_communications`
--
ALTER TABLE `tbl_communications`
  MODIFY `commid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_drivers_master`
--
ALTER TABLE `tbl_drivers_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_login_history`
--
ALTER TABLE `tbl_login_history`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `prdid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_product_child_categories`
--
ALTER TABLE `tbl_product_child_categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_product_sub_categories`
--
ALTER TABLE `tbl_product_sub_categories`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_states_master`
--
ALTER TABLE `tbl_states_master`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_stores_logininfo_master`
--
ALTER TABLE `tbl_stores_logininfo_master`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_stores_master`
--
ALTER TABLE `tbl_stores_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `tbl_store_item_prices`
--
ALTER TABLE `tbl_store_item_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1992;

--
-- AUTO_INCREMENT for table `tbl_users_master`
--
ALTER TABLE `tbl_users_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `tbl_user_addresses`
--
ALTER TABLE `tbl_user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `tbl_user_login_accessinfo`
--
ALTER TABLE `tbl_user_login_accessinfo`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `tbl_user_order_confirmations`
--
ALTER TABLE `tbl_user_order_confirmations`
  MODIFY `cfid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `tbl_user_purchase_orders`
--
ALTER TABLE `tbl_user_purchase_orders`
  MODIFY `orid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `tbl_vendor_drivers`
--
ALTER TABLE `tbl_vendor_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_stores_logininfo_master`
--
ALTER TABLE `tbl_stores_logininfo_master`
  ADD CONSTRAINT `tbl_stores_logininfo_master_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `tbl_stores_master` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
