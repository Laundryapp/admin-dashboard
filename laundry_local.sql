/*
SQLyog Community v13.1.1 (32 bit)
MySQL - 5.6.17 : Database - laundry_prod
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laundry_prod` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `laundry_prod`;

/*Table structure for table `tbl_admin_logininfo_master` */

DROP TABLE IF EXISTS `tbl_admin_logininfo_master`;

CREATE TABLE `tbl_admin_logininfo_master` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `verification_key` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tbl_admin_logininfo_master` */

/*Table structure for table `tbl_admin_users_master` */

DROP TABLE IF EXISTS `tbl_admin_users_master`;

CREATE TABLE `tbl_admin_users_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A-Acctive, I - Inactive',
  `otp` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_admin_users_master` */

insert  into `tbl_admin_users_master`(`id`,`name`,`username`,`email`,`mobile`,`password`,`user_role`,`status`,`otp`,`date_created`) values 
(1,'Admin','admin','admin@gmail.com','','b59c67bf196a4758191e42f76670ceba','','A',0,'2019-02-25 00:40:05');

/*Table structure for table `tbl_communications` */

DROP TABLE IF EXISTS `tbl_communications`;

CREATE TABLE `tbl_communications` (
  `commid` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_communications` */

insert  into `tbl_communications`(`commid`,`category_name`,`subject`,`message`,`created_date_time`) values 
(1,'activation_mail_m','Account Activation','<img class=\"img-responsive\" src=\"logo.png\" width=\"30%\"><br>\r\n<p style=\"color:#777;font-family:helvetica;font-style:italic;font-size:28px\";>Now, Always Get Sales > Your Ad Spends</p>\r\n <div style=\"color:#4da4af;font-family:Calibri;\">\r\n<h2 style=\"color:#4da4af;font-size:20px;\">Account Activation</h2>\r\n<p style=\"margin-top:-20px;\">Hello, FULLNAME</p>\r\n		<p>Thank you for registering with our website. To complete the process of sign-up please follow the below steps:</p>\r\n		\r\n		</p>\r\n		<p><strong>Step 1</strong> : Click the activation button provided below to verify your email address.</p>\r\n		\r\n		<p style=\"\"><a href=\"ACTIVATION_LINK\" class=\"button-0\">Click to Activate</a></p>\r\n		<p>Your Pay India account is subjected to following Terms & Conditions. \r\n		<a href=\"https://piscore.in/application/views/terms-conditions.php\">Read here</a><br>\r\n		For any issues feel free to contact <a href=\"mailto:customercare@piscore.in\">Customer Care</a></p>\r\n		<p><strong>Regards,</strong> <br> Laundry Team</p>','2018-11-15 07:09:20'),
(2,'Forgot Password','Forgot Password','<img class=\"img-responsive\" src=\"logo.png\" width=\"30%\"><br>\r\n<p style=\"color:#777;font-family:helvetica;font-style:italic;font-size:28px\";>Now, Always Get Sales > Your Ad Spends</p>\r\n <div style=\"color:#4da4af;font-family:Calibri;\">\r\n<h2 style=\"color:#4da4af;font-size:20px;\">Forgot Password</h2><br>\r\n<p style=\"margin-top:-20px;\">Hi,</p>\r\n		<p style=\"text-align:justify;font-size:15px;margin-top:-10px;;\">  Click the link below to reset you account password:</p> <p>Activation Link: <a href=\"ACTIVATION_LINK\">ACTIVATION_LINK</a></p> <p>Regards, <br> Laundry Team</p>\r\n		</div>','2018-11-15 07:10:01'),
(9,'activation_mail_m','Account Activation','<img class=\"img-responsive\" src=\"logo.png\" width=\"30%\"><br>\r\n<p style=\"color:#777;font-family:helvetica;font-style:italic;font-size:28px\";>Now, Always Get Sales > Your Ad Spends</p>\r\n <div style=\"color:#4da4af;font-family:Calibri;\">\r\n<h2 style=\"color:#4da4af;font-size:20px;\">Account Activation</h2>\r\n<p style=\"margin-top:-20px;\">Hello, FULLNAME</p>\r\n		<p>Thank you for registering with our website. To complete the process of sign-up please follow the below steps:</p>\r\n		<p><strong>Step 1</strong> : SMS the given OTP via your registered mobile number to 9030423457.</p>\r\n		<p>Your OTP: <span  style=\"font-size:20px;font-weight:800;\">MOBILE_ACTIVATION_CODE</span></p>\r\n		Example: OTP to 9030423457<br><br>\r\n		\r\n		</p>\r\n		<p><strong>Step 2</strong> : Click the activation button provided below to verify your email address.</p>\r\n		\r\n		<p style=\"\"><a href=\"ACTIVATION_LINK\" class=\"button-0\">Click to Activate</a></p>\r\n		<p>Your Pay India account is subjected to following Terms & Conditions. \r\n		<a href=\"https://piscore.in/application/views/terms-conditions.php\">Read here</a><br>\r\n		For any issues feel free to contact <a href=\"mailto:customercare@piscore.in\">Customer Care</a></p>\r\n		<p><strong>Regards,</strong> <br> Laundry Team</p>','2018-11-15 07:10:44');

/*Table structure for table `tbl_driver_available_timings` */

DROP TABLE IF EXISTS `tbl_driver_available_timings`;

CREATE TABLE `tbl_driver_available_timings` (
  `dat_id` int(11) NOT NULL AUTO_INCREMENT,
  `dat_driver_id` int(11) DEFAULT NULL,
  `dat_sunday_available` tinyint(4) DEFAULT NULL,
  `dat_sunday_time` varchar(50) DEFAULT NULL,
  `dat_monday_available` tinyint(4) DEFAULT NULL,
  `dat_monday_time` varchar(50) DEFAULT NULL,
  `dat_tuesday_available` tinyint(4) DEFAULT NULL,
  `dat_tuesday_time` varchar(50) DEFAULT NULL,
  `dat_wednesday_available` tinyint(4) DEFAULT NULL,
  `dat_wednesday_time` varchar(50) DEFAULT NULL,
  `dat_thrusday_available` tinyint(4) DEFAULT NULL,
  `dat_thrusday_time` varchar(50) DEFAULT NULL,
  `dat_friday_available` tinyint(4) DEFAULT NULL,
  `dat_friday_time` varchar(50) DEFAULT NULL,
  `dat_saturday_available` tinyint(4) DEFAULT NULL,
  `dat_saturday_time` varchar(50) DEFAULT NULL,
  `dat_created_at` datetime DEFAULT NULL,
  `dat_updated_at` datetime DEFAULT NULL,
  `dat_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`dat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_driver_available_timings` */

insert  into `tbl_driver_available_timings`(`dat_id`,`dat_driver_id`,`dat_sunday_available`,`dat_sunday_time`,`dat_monday_available`,`dat_monday_time`,`dat_tuesday_available`,`dat_tuesday_time`,`dat_wednesday_available`,`dat_wednesday_time`,`dat_thrusday_available`,`dat_thrusday_time`,`dat_friday_available`,`dat_friday_time`,`dat_saturday_available`,`dat_saturday_time`,`dat_created_at`,`dat_updated_at`,`dat_status`) values 
(7,6,1,'01:00',1,'03:00',1,'02:00',1,'09:00',1,'02:30',1,'05:00',1,'10:00','2019-08-15 14:59:44','2019-08-15 14:59:44',1);

/*Table structure for table `tbl_drivers_master` */

DROP TABLE IF EXISTS `tbl_drivers_master`;

CREATE TABLE `tbl_drivers_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(10) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `pancard` varchar(255) NOT NULL,
  `driving_license` varchar(255) NOT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_drivers_master` */

insert  into `tbl_drivers_master`(`id`,`unique_id`,`name`,`email`,`password`,`postcode`,`pancard`,`driving_license`,`address`,`mobile`,`alternate_mobile`,`timeframes`,`cab_type`,`cab_number`,`car_model`,`car_color`,`sms_verification_key`,`rest_verification_key`,`driver_token`,`profile_pic`,`driver_status`,`online_status`,`available_days`,`available_timeframes`,`created_at`) values 
(1,'MM_DR001','rama','rama@gmail.com','698d51a19d8a121ce581499d7b701668',NULL,'','hdhd','1 , Mitcham Lane, LONDON',1111,'','','','ghd','','','','54454f50fd24cd4e6c50e7c56431ce67','null','',0,0,'','','2019-05-29 23:13:23'),
(2,'MM_DR002','info','infosmartapps7@gmail.com','934b535800b1cba8f96a5d72f72f1611',NULL,'','vshsh','1 Mitcham Lane, , , , , London, ',2222,'','','','fagag','','','','950dba48b260b5b83a487b15c7e67cd2','eUbPBX3ShQo:APA91bGOaxKIFYlBTVBdqUYu6460tpw3YaCK0L-wKoMIf7wOzs9Qj8WNri5iGkBu0U3XkD7l8UsHdmmYx2DftBkfpz7VlEUBUYi5gpIfJAV-nT68SfKhhXq2gGSz2vVr10F4AJiE4KMd','',0,0,'','','2019-05-29 23:26:18'),
(3,'MM_DR003','driver3','driver3@gmail.com','2be9bd7a3434f7038ca27d1918de58bd',NULL,'','yegh','20a Ellora Road, , , , , London, ',3333,'','','','8664748','','','','be4f6f602d4f1911139fc02c692fdecc','e2HzeBeVQmM:APA91bHNXmR36M_nyXPak1i8EvL_6hdSbWbmP8-tUYr5JDpK8nxn9BrWae4kaxVOXJjpkZKOa6KA1MEoM37UIKXo41pMY2l5Kz1PRnqnY301S3H_2rFiIK8AGUx58YQwznNYFx6SN34c','',0,0,'','','2019-07-10 23:12:41'),
(4,'MM_DR004','driver4','driver4@gmail.com','dbc4d84bfcfe2284ba11beffb853a8c4',NULL,'','ysuus','sw166lg',4444,'','','','44467','','','','df8ac1a549de92a145cd260087eb2ca3','null','',1,0,'','','2019-07-14 04:42:35'),
(5,'MM_DR005','Leela','admin@gmail.com','1d14cd6506fbbc1393422f75a2ba144f',NULL,'','','fdssd',435345,'3454353','','2','35423534','DFFSD','ASDFSFS','','c96e058e3fa8ea7f699f229e7f7f5636','','',1,0,'','','2019-08-14 07:02:47'),
(6,'MM_DR006','leela naveen','test@gmail.com','1d14cd6506fbbc1393422f75a2ba144f','GU5 0BD','140820192328382Penguins.jpg','140820192328383Lighthouse.jpg','Kukataplly',9160721727,'9160721727','','1','345435','rtg','dfgdsfs','','73a691e5b73ade78f6a7a23ca71bb243','','140820192328381Jellyfish.jpg',1,0,'sunday,monday,tuesday,wednesday,thrusday,friday,saturday','01:00,03:00,02:00,09:00,02:30,05:00,10:00','2019-08-14 22:02:36');

/*Table structure for table `tbl_login_history` */

DROP TABLE IF EXISTS `tbl_login_history`;

CREATE TABLE `tbl_login_history` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(100) NOT NULL,
  `hostname` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `location` varchar(200) NOT NULL,
  `organization` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `login_date_time` datetime NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tbl_login_history` */

/*Table structure for table `tbl_product_categories` */

DROP TABLE IF EXISTS `tbl_product_categories`;

CREATE TABLE `tbl_product_categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_ref_id` varchar(10) NOT NULL,
  `catimg` varchar(255) NOT NULL,
  `parent_category` int(11) NOT NULL,
  `catthumbimg` varchar(255) DEFAULT NULL,
  `cat_offer_type` smallint(4) DEFAULT NULL,
  `cat_discount_per` int(11) DEFAULT '0',
  `cat_dis_fixed_amt` float DEFAULT '0',
  `cat_status` int(11) DEFAULT NULL,
  `cat_createdat` datetime DEFAULT NULL,
  `cat_updatedat` datetime DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_product_categories` */

insert  into `tbl_product_categories`(`cat_id`,`category_name`,`category_ref_id`,`catimg`,`parent_category`,`catthumbimg`,`cat_offer_type`,`cat_discount_per`,`cat_dis_fixed_amt`,`cat_status`,`cat_createdat`,`cat_updatedat`) values 
(1,'Tops','CAT_001','22072019015155tops.png',0,'22072019015155ic_knitware.png',0,0,0,1,NULL,'2019-07-22 01:57:38'),
(2,'Laundry','CAT_002','laundry.png',0,NULL,0,0,0,1,NULL,NULL),
(3,'Bedding','CAT_003','bedding.png',0,NULL,0,0,0,1,NULL,NULL),
(4,'Suits','CAT_004','suits.png',0,NULL,0,0,0,1,NULL,NULL),
(5,'Knitwear','CAT_005','knitwears.png',0,NULL,0,0,0,1,NULL,NULL),
(6,'Trowsers','CAT_006','trousers.png',0,NULL,0,0,0,1,NULL,NULL),
(8,'Dresses','CAT_008','dresses.png',1,NULL,0,0,0,1,NULL,NULL),
(9,'Outdoor','CAT_009','ic_outdoor.png',2,NULL,0,0,0,1,NULL,NULL),
(10,'Accesories','CAT_010','accessories.png',1,NULL,0,0,0,1,NULL,NULL),
(11,'Home','CAT_011','home.png',1,NULL,0,0,0,1,NULL,NULL),
(12,'Business','CAT_012','businiess.png',1,NULL,0,0,0,1,NULL,NULL);

/*Table structure for table `tbl_product_child_categories` */

DROP TABLE IF EXISTS `tbl_product_child_categories`;

CREATE TABLE `tbl_product_child_categories` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `childcategory_name` varchar(100) NOT NULL,
  `subcat_description` text NOT NULL,
  `subcatimg` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_product_child_categories` */

insert  into `tbl_product_child_categories`(`cid`,`childcategory_name`,`subcat_description`,`subcatimg`) values 
(1,'Shirts','All the shirts you need for a working week, washed, ironed and hung to ensure you always look your best','top_hifive.jpg'),
(2,'Pre-Paid Shirts','',''),
(3,'Special Services','',''),
(4,'Blouses','',''),
(5,'Pre-Paid Blouses','',''),
(6,'T-Shirts','',''),
(8,'NON-BIO','',''),
(9,'Bed Sets','',''),
(10,'Related Item','',''),
(11,'Pillows','',''),
(12,'Bed Sheets','','');

/*Table structure for table `tbl_product_images` */

DROP TABLE IF EXISTS `tbl_product_images`;

CREATE TABLE `tbl_product_images` (
  `pi_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `pi_image` varchar(100) DEFAULT NULL,
  `pi_thumb_image` varchar(100) DEFAULT NULL,
  `pi_status` smallint(2) DEFAULT NULL,
  `pi_created_at` datetime DEFAULT NULL,
  `pi_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`pi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_product_images` */

insert  into `tbl_product_images`(`pi_id`,`product_id`,`pi_image`,`pi_thumb_image`,`pi_status`,`pi_created_at`,`pi_updated_at`) values 
(6,102,'22072019082532home_bathroom.jpg','22072019082532ic_bedding.png',1,'2019-07-22 08:25:32','2019-07-22 08:25:32'),
(5,103,'22072019082516bedding.png','22072019082516business_handtowel.jpg',1,'2019-07-22 08:25:16','2019-07-22 08:25:16'),
(7,4,NULL,NULL,1,'2019-07-22 11:18:55','2019-07-22 11:18:55');

/*Table structure for table `tbl_product_sub_categories` */

DROP TABLE IF EXISTS `tbl_product_sub_categories`;

CREATE TABLE `tbl_product_sub_categories` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(100) NOT NULL,
  `subcat_ref_id` varchar(10) NOT NULL,
  `subcat_description` text NOT NULL,
  `subcatimg` varchar(255) NOT NULL,
  `parent_category` int(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_product_sub_categories` */

insert  into `tbl_product_sub_categories`(`sid`,`subcategory_name`,`subcat_ref_id`,`subcat_description`,`subcatimg`,`parent_category`) values 
(1,'High Five','SUBCAT_001','All the shirts you need for a working week, washed, ironed and hung to ensure you always look your best','top_hifive.jpg',1),
(2,'Shirts','CAT_002','','top_shirts.jpg',1),
(3,'Blouses','CAT_003','','top_blouses.jpg',1),
(4,'T-Shirts','CAT_004','','top_tshirts.jpg',1),
(5,'Wash, Tumble Dry & Fold','CAT_005','','landry_image.jpg',2),
(6,'Bed Sets','CAT_006','','be_bedsets.jpg',3),
(8,'Pillows','CAT_008','','be_pillos.jpg',3),
(9,'Bed Sheets','CAT_009','','be_sheets.jpg',3),
(10,'Duvets','CAT_010','','be_duvets.jpg',3),
(11,'Duvet Covers','CAT_011','','be_duvetcovers.jpg',3),
(12,'Blanket','CAT_012','','be_blanket.jpg',3),
(13,'Bedspread','','Any size up to 4m square','be_bedspread.jpg',3),
(14,'Sleeping Bags','','','be_sleepingbag.jpg',0),
(15,'The Nine to Five','','A two piece suit and 5X shirts','suit_offer.jpg',4),
(16,'Suits','','','suit_suit.jpg',4),
(17,'Occasion Suits','','','suit_occasionsuit.jpg',4),
(18,'3 Knitewear','','A two piece suit and 5X shirts','night_offer.jpg',5),
(19,'Light Knitwear','','','night_lightware.jpg',5),
(20,'Jumper','','','night_jumer.jpg',5),
(21,'Folder Jumper','','','night_foldedjumper.jpg',5),
(22,'Heavy Knitwear','','','night_heavynightware.jpg',5),
(23,'Cardigan','','','night_cardigan.jpg',5),
(24,'Trousers','','','trousers_trousers.jpg',6),
(25,'Jeans','','','trousers_jeans.jpg',6),
(26,'Shorts','','','trousers_shorts.jpg',6),
(27,'Dress 2 Impress','','','dresses_offer.jpg',8),
(28,'Dresses','','','dresses_dresses.jpg',8),
(29,'Skirts','','','dresses_skirts.jpg',8),
(30,'Coats','','','outdoor_coats.jpg',9),
(31,'Jackets','','','outdoor_jackets.jpg',9),
(32,'Fleece','','','outdoor_fleece.jpg',9),
(33,'Tie','','','accessories_tie.jpg',10),
(34,'Scraf','','','accessories_scarf.jpg',10),
(35,'Pashmina','','','accessories_pashmina.jpg',10),
(36,'HandKerchief','','','accessories_handkerchief.jpg',10),
(37,'Bathroom','','','home_bathroom.jpg',11),
(38,'Kitchen & Dining','','','home_kitchen.jpg',11),
(39,'B & B Packages','','','business_bbpackages.jpg',12),
(40,'Tea Towel Pack(up to 6 kg)','','','business_teatowal.jpg',12),
(41,'Hand Towel Pack(up to 6 kg)','','','business_handtowel.jpg',12),
(42,'Bath Towel Pack(up to 6 kg)','','','business_bathtowel.jpg',12);

/*Table structure for table `tbl_products` */

DROP TABLE IF EXISTS `tbl_products`;

CREATE TABLE `tbl_products` (
  `prdid` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `cat_status` int(11) DEFAULT NULL,
  `product_name` longtext NOT NULL,
  `product_description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `read_status` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `product_discount_type` smallint(4) DEFAULT '0',
  `product_discount_per` int(11) DEFAULT '0',
  `product_discount_fixed` float DEFAULT '0',
  `product_image` varchar(250) DEFAULT NULL,
  `product_thumb_image` varchar(250) DEFAULT NULL,
  `product_price` float DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`prdid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_products` */

insert  into `tbl_products`(`prdid`,`category_id`,`subcategory_id`,`cat_status`,`product_name`,`product_description`,`status`,`read_status`,`created_date`,`product_discount_type`,`product_discount_per`,`product_discount_fixed`,`product_image`,`product_thumb_image`,`product_price`,`updated_at`) values 
(14,1,3,4,'Blouse','Hand-finished, excludes silk and trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(15,1,3,4,'Silk Blouse','Hand- finished, includes trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(16,1,3,5,'10x Blouses-pre- paid ','Excludes silk and trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(17,1,3,5,'25x Blouses - Pre - paid ','Excludes silk and trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(18,1,4,0,'Hung T-Shirt','Includes polo shirts',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(19,1,4,0,'Folded T-Shirt','iIncludes polo shirts',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(20,2,1,0,'Wash, Tumble Dry & Fold','Excludes bedding & towels,-30* wash, tumble dried, not ironed',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(21,3,1,6,'Single Bed Set','Bed Sheet, Duvet Cover, 1 Pillowcase',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(22,3,1,6,'Double Bed Set','Bed Sheet, Duvet Cover, 2 pillowcase',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(23,3,1,6,'King/Queen Bed Set','Bed Sheet, Duvet Cover, 4 Pillowcase',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(24,3,1,7,'Pillow Case','Wash, iron and fold',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(25,3,2,0,'Pillow Case','Wash, iron and fold',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(26,3,2,0,'Pillow','Excludes feather/down pillows',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(27,3,2,0,'Feather pillow','Includes down',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(28,3,3,0,'Single Bed Sheet','Wash, iron and fold',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(29,3,3,0,'Double Bed Sheet','Up to 220cm x 260cm',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(30,3,3,0,'King/Queen Bed Sheet','From 220cm x 260cm and higher',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(31,3,4,8,'Single Duvet','Excludes feather/down duvets',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(32,3,4,8,'Double Duvet','Up to 225cm x 220cm. Excludes feather/down duvets',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(33,3,4,8,'King/Queen Duvet','From 225cm x 220cm and higher. Excludes feather/down duvets',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(34,3,4,9,'Feather Single Duvet','includes down',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(35,3,4,9,'Feather Double Duvet','Up to 225cm x 220cm. Includes down',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(41,3,7,0,'Bedspread','Any size up to 4m square',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(42,3,8,0,'Single Sleeping Bag','Any season rating',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(43,3,8,0,'Double Sleeping Bag','Any season rating',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(44,4,1,0,'The Nine to Five','A two piece suit and 5x shirts',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(45,4,2,11,'Two-Piece Suit','Blazer and trousers/skirt',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(46,4,2,11,'Three-Piece Suit','Blazer , Waistcoat and trousers/skirt',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(47,4,2,12,'10x Two-Piece Suits - pre-…','Blazer and trousers/skirt',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(48,4,2,13,'Tie','Includes bow ties',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(49,4,2,13,'Waistcoat','Ironed and hung',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(50,4,2,13,'Blazer','Excludes fur, leather and velvet',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(51,4,2,13,'Kilt','underwear not included',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(52,4,3,14,'Dinner Suit','Dinner jacket and trousers',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(53,4,3,14,'Dinner Jacket','Excludes bow ties',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(54,4,3,15,'Two-Piece Morning Suit','Tallcoat and trousers',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(55,4,3,15,'Three-Piece Morning Suit','Tallcoat, Waiscoat and trousers',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(56,5,1,0,'3 Knitwear','Light and heavy Knitwear items, hung',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(57,5,2,0,'Light Knitwear','Includes cashmere',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(58,5,3,0,'Jumper','Includes cashmere',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(59,5,4,0,'Folded Jumper','Includes cashmere',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(60,5,5,0,'Heavy Knitwear','Includes cable knit',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(61,5,6,0,'Cardigan','Includes cashmere',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(62,6,1,16,'Trousers','Cleaned and ironed',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(63,6,1,16,'Silk Trousers','Includes bead or sequin trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(64,6,1,17,'10x Trousers - Pre-paid','Excludes silk trousers',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(65,6,1,17,'25x Trousers - Pre-paid','Excludes silk trousers',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(66,6,2,0,'Jeans ','Wash and iron',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(67,6,3,0,'Shorts','Wash and iron',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(68,7,1,0,'Dress 2 Impress','2x dresses, excludes silk and evening dresses',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(69,7,2,18,'Dress ','Excludes silk and leather',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(70,7,2,18,'Silk Dress','Includes trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(71,7,2,18,'Dress With Trim','Includes bead or sequin trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(72,7,2,18,'Evening Dress','Excludes silk, fur, leather and velvet',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(73,7,2,19,'10x Dresses - Pre-paid','Excludes silk and leather',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(74,7,2,19,'25x Dresses - Pre-paid','Excludes silk and leather',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(75,7,2,20,'Blouse','Excludes silk',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(76,7,2,20,'Silk Blouse','Includes trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(77,7,3,0,'Skirt','Excludes silk and leather',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(78,7,3,0,'Silk Skirt','Includes bead or sequin trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(79,7,3,0,'Skirt With Trim','Includes bead or sequin trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(80,8,1,21,'Overcoat','Any length',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(81,8,1,22,'Scarf','Includes silk',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(82,8,2,0,'Blazer','Excludes fur, leather and velvet',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(83,8,2,0,'Jacket','Excludes fur, leather and velvet',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(84,8,2,0,'Jacket With Trim','Includes decorative trim',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(85,8,3,0,'Fleece','Jackets or jumpers',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(86,9,1,0,'Tie','Includes bow ties',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(87,9,2,0,'Scarf','Includes silk',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(88,9,3,0,'Pashmina','Wash and iron',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(89,9,4,0,'HandKerchief','Includes pocket squares',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(90,10,1,0,'Hand Towel','Any size ',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(91,10,1,0,'Bath Towel','Any Size',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(92,10,1,0,'Bath Mat','Includes non-slip backing',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(93,10,1,0,'Dressing Gown','Includes flannel and silk',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(94,11,1,0,'One Room','1x bed sheet, 1x duvet cover,4x pillowcases,2x bath towels, 2x hand towels, 1x bath mat',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(95,11,1,0,'Two Room','2x bed sheets,2x duvet covers, 8x pillowcases, 4x bath towels, 4x hand towels,2x bath mats',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(96,11,2,0,'Tea Towel Pack(Up to 6kg)','Approx.100 tea towels - washed, tumble dried, folded',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(97,11,3,0,'Hand Towel Pack(Up to 6kg)','Approx. 50 hand towels - washed, tumble dried, folded',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(98,11,4,0,'Bath Towel Pack (Up to 6kg)','Approx. 15 bath towels - washed, tumble dried, folded',1,0,'0000-00-00 00:00:00',0,0,0,NULL,NULL,0,NULL),
(102,12,0,NULL,'prBus','sasasaxasdasd',0,0,'2019-07-22 07:46:16',0,12,0,'22072019082532home_bathroom.jpg','22072019082532ic_bedding.png',12,'2019-07-22 08:25:32'),
(103,12,0,NULL,'prBuss','testing',1,0,'2019-07-22 07:50:35',0,12,0,'22072019082516bedding.png','22072019082516business_handtowel.jpg',12,'2019-07-22 08:25:16');

/*Table structure for table `tbl_states_master` */

DROP TABLE IF EXISTS `tbl_states_master`;

CREATE TABLE `tbl_states_master` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_states_master` */

insert  into `tbl_states_master`(`id`,`state`) values 
(1,'Andhra Pradesh'),
(2,'Assam'),
(3,'Bihar'),
(4,'Chandigarh'),
(5,'Chhattisgarh'),
(6,'Delhi'),
(7,'Gujarat'),
(8,'Haryana'),
(9,'Jammu and Kashmir'),
(10,'Jharkhand'),
(11,'Karnataka'),
(12,'Kerala'),
(13,'Madhya Pradesh'),
(14,'Maharashtra'),
(15,'Manipur'),
(16,'Mizoram'),
(17,'Orissa'),
(18,'Puducherry'),
(19,'Punjab'),
(20,'Rajasthan'),
(21,'Tamil Nadu'),
(22,'Telangana'),
(23,'Tripura'),
(24,'Uttar Pradesh'),
(25,'Uttarakhand'),
(26,'West Bengal'),
(27,'All');

/*Table structure for table `tbl_store_express_timings` */

DROP TABLE IF EXISTS `tbl_store_express_timings`;

CREATE TABLE `tbl_store_express_timings` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `set_store_id` int(11) DEFAULT NULL,
  `set_pickup_hour` varchar(50) DEFAULT NULL,
  `set_delivery_hour` varchar(50) DEFAULT NULL,
  `set_type_of_cost` tinyint(4) DEFAULT NULL,
  `set_percentage_of_cost` varchar(50) DEFAULT NULL,
  `set_default_cost` varchar(50) DEFAULT NULL,
  `set_created_at` datetime DEFAULT NULL,
  `set_updated_at` datetime DEFAULT NULL,
  `set_status` tinyint(4) DEFAULT NULL COMMENT '0- in active, 1 - active',
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_store_express_timings` */

insert  into `tbl_store_express_timings`(`set_id`,`set_store_id`,`set_pickup_hour`,`set_delivery_hour`,`set_type_of_cost`,`set_percentage_of_cost`,`set_default_cost`,`set_created_at`,`set_updated_at`,`set_status`) values 
(7,41,'3','3',1,'3','0','2019-08-13 06:54:05','2019-08-13 06:54:05',1),
(8,41,'2','2',2,'0','2','2019-08-13 06:54:05','2019-08-13 06:54:05',1),
(15,43,'1','1',2,'0','11','2019-08-15 14:59:33','2019-08-15 14:59:33',1),
(16,43,'1','1',1,'11','0','2019-08-15 14:59:33','2019-08-15 14:59:33',1);

/*Table structure for table `tbl_store_holidays_list` */

DROP TABLE IF EXISTS `tbl_store_holidays_list`;

CREATE TABLE `tbl_store_holidays_list` (
  `shl_id` int(11) NOT NULL AUTO_INCREMENT,
  `shl_store_id` int(11) DEFAULT NULL,
  `shl_holiday_date` date DEFAULT NULL,
  `shl_holiday_reason` text,
  `shl_created_at` datetime DEFAULT NULL,
  `shl_updated_at` datetime DEFAULT NULL,
  `shl_status` tinyint(4) DEFAULT NULL COMMENT '0- in active, 1 - active',
  PRIMARY KEY (`shl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_store_holidays_list` */

insert  into `tbl_store_holidays_list`(`shl_id`,`shl_store_id`,`shl_holiday_date`,`shl_holiday_reason`,`shl_created_at`,`shl_updated_at`,`shl_status`) values 
(9,41,'2019-08-09','bakride','2019-08-13 06:54:04','2019-08-13 06:54:04',1),
(10,41,'2019-08-13','sunday','2019-08-13 06:54:05','2019-08-13 06:54:05',1),
(11,41,'2019-08-13','Test holiday','2019-08-13 06:54:05','2019-08-13 06:54:05',1),
(18,43,'2019-08-16','independence day1','2019-08-15 14:59:33','2019-08-15 14:59:33',1),
(19,43,'2019-08-17','sunday1','2019-08-15 14:59:33','2019-08-15 14:59:33',1);

/*Table structure for table `tbl_store_item_prices` */

DROP TABLE IF EXISTS `tbl_store_item_prices`;

CREATE TABLE `tbl_store_item_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_store_item_prices` */

insert  into `tbl_store_item_prices`(`id`,`vendorid`,`item_id`,`item_price`,`created_at`) values 
(1,'7c1206aa442cde35a4439609eb2597a5',4,'8.95','2019-05-05 14:24:49'),
(2,'7c1206aa442cde35a4439609eb2597a5',5,'2.5','2019-05-05 14:24:49'),
(3,'7c1206aa442cde35a4439609eb2597a5',6,'3','2019-05-05 14:24:49'),
(4,'7c1206aa442cde35a4439609eb2597a5',7,'3.5','2019-05-05 14:24:49'),
(5,'7c1206aa442cde35a4439609eb2597a5',8,'3.25','2019-05-05 14:24:49'),
(6,'7c1206aa442cde35a4439609eb2597a5',10,'48','2019-05-05 14:24:49'),
(7,'7c1206aa442cde35a4439609eb2597a5',11,'160','2019-05-05 14:24:49'),
(8,'7c1206aa442cde35a4439609eb2597a5',12,'1.5','2019-05-05 14:24:49'),
(9,'7c1206aa442cde35a4439609eb2597a5',13,'3','2019-05-05 14:24:49'),
(10,'7c1206aa442cde35a4439609eb2597a5',14,'5','2019-05-05 14:24:49'),
(11,'7c1206aa442cde35a4439609eb2597a5',15,'6','2019-05-05 14:24:49'),
(12,'7c1206aa442cde35a4439609eb2597a5',16,'50','2019-05-05 14:24:49'),
(13,'7c1206aa442cde35a4439609eb2597a5',17,'100','2019-05-05 14:24:49'),
(14,'c52a41a05f536d51d109a1fdf515b059',4,'10','2019-05-05 14:29:34'),
(15,'c52a41a05f536d51d109a1fdf515b059',5,'2.5','2019-05-05 14:29:34'),
(16,'c52a41a05f536d51d109a1fdf515b059',6,'3.25','2019-05-05 14:29:34'),
(17,'c52a41a05f536d51d109a1fdf515b059',7,'4.5','2019-05-05 14:29:34'),
(18,'c52a41a05f536d51d109a1fdf515b059',8,'3.5','2019-05-05 14:29:34'),
(19,'c52a41a05f536d51d109a1fdf515b059',10,'50','2019-05-05 14:29:34'),
(20,'c52a41a05f536d51d109a1fdf515b059',11,'190','2019-05-05 14:29:34'),
(21,'c52a41a05f536d51d109a1fdf515b059',12,'2','2019-05-05 14:29:34'),
(22,'c52a41a05f536d51d109a1fdf515b059',13,'4','2019-05-05 14:29:34'),
(23,'c52a41a05f536d51d109a1fdf515b059',14,'5.5','2019-05-05 14:29:34'),
(24,'c52a41a05f536d51d109a1fdf515b059',15,'6.5','2019-05-05 14:29:34'),
(25,'c52a41a05f536d51d109a1fdf515b059',16,'50','2019-05-05 14:29:34'),
(26,'c52a41a05f536d51d109a1fdf515b059',17,'110','2019-05-05 14:29:34'),
(27,'c52a41a05f536d51d109a1fdf515b059',18,'3','2019-05-05 14:29:34'),
(28,'c52a41a05f536d51d109a1fdf515b059',19,'3.5','2019-05-05 14:29:34'),
(29,'6ba2ae180d228fb5af1c29e32bfb72ef',4,'10','2019-05-05 14:42:47'),
(30,'6ba2ae180d228fb5af1c29e32bfb72ef',5,'3','2019-05-05 14:42:47'),
(31,'6ba2ae180d228fb5af1c29e32bfb72ef',6,'3.5','2019-05-05 14:42:47'),
(32,'6ba2ae180d228fb5af1c29e32bfb72ef',7,'5','2019-05-05 14:42:47'),
(33,'6ba2ae180d228fb5af1c29e32bfb72ef',8,'4','2019-05-05 14:42:47'),
(34,'6ba2ae180d228fb5af1c29e32bfb72ef',10,'50','2019-05-05 14:42:47'),
(35,'6ba2ae180d228fb5af1c29e32bfb72ef',11,'180','2019-05-05 14:42:47'),
(36,'51956935ab76367a6318808275078ca2',4,'15','2019-05-05 14:53:01'),
(37,'51956935ab76367a6318808275078ca2',5,'3.5','2019-05-05 14:53:01'),
(38,'51956935ab76367a6318808275078ca2',6,'4','2019-05-05 14:53:01'),
(39,'51956935ab76367a6318808275078ca2',7,'6','2019-05-05 14:53:01'),
(40,'51956935ab76367a6318808275078ca2',8,'5','2019-05-05 14:53:01'),
(41,'51956935ab76367a6318808275078ca2',10,'60','2019-05-05 14:53:01'),
(42,'51956935ab76367a6318808275078ca2',11,'200','2019-05-05 14:53:01'),
(43,'51956935ab76367a6318808275078ca2',12,'2','2019-05-05 14:53:01'),
(44,'51956935ab76367a6318808275078ca2',13,'4','2019-05-05 14:53:01'),
(45,'51956935ab76367a6318808275078ca2',14,'6','2019-05-05 14:53:01'),
(46,'51956935ab76367a6318808275078ca2',15,'7','2019-05-05 14:53:01'),
(47,'51956935ab76367a6318808275078ca2',16,'50','2019-05-05 14:53:01'),
(48,'51956935ab76367a6318808275078ca2',17,'100','2019-05-05 14:53:01'),
(49,'51956935ab76367a6318808275078ca2',18,'3','2019-05-05 14:53:01'),
(50,'51956935ab76367a6318808275078ca2',19,'4','2019-05-05 14:53:01'),
(51,'1517ca862f03d56fc8676c11dd43fcec',4,'20','2019-05-29 20:58:42'),
(52,'1517ca862f03d56fc8676c11dd43fcec',5,'50','2019-05-29 20:58:42'),
(53,'15d58065615789b2e983be86d54f62fd',4,'12','2019-07-08 03:26:07'),
(54,'15d58065615789b2e983be86d54f62fd',5,'5','2019-07-08 03:26:07'),
(55,'33e59cfa62649da6c498a18ba3cccfbc',4,'3','2019-07-08 04:27:45'),
(56,'33e59cfa62649da6c498a18ba3cccfbc',5,'6','2019-07-08 04:27:45'),
(57,'2a72296509f2b869dce3755a226b6182',4,'2','2019-07-10 23:02:11'),
(58,'2a72296509f2b869dce3755a226b6182',5,'3','2019-07-10 23:02:11'),
(59,'2a72296509f2b869dce3755a226b6182',6,'6','2019-07-10 23:02:11'),
(60,'33e59cfa62649da6c498a18ba3cccfbc',14,'2','2019-07-30 02:28:06'),
(61,'33e59cfa62649da6c498a18ba3cccfbc',15,'3','2019-07-30 02:28:06'),
(62,'33e59cfa62649da6c498a18ba3cccfbc',17,'2','2019-07-30 02:28:06'),
(63,'33e59cfa62649da6c498a18ba3cccfbc',16,'1','2019-07-30 02:28:06');

/*Table structure for table `tbl_store_shop_timings` */

DROP TABLE IF EXISTS `tbl_store_shop_timings`;

CREATE TABLE `tbl_store_shop_timings` (
  `sst_id` int(11) NOT NULL AUTO_INCREMENT,
  `sst_store_id` int(11) DEFAULT NULL,
  `sst_open_time` varchar(50) DEFAULT NULL,
  `sst_close_time` varchar(50) DEFAULT NULL,
  `sst_sunday_open_time` varchar(50) DEFAULT NULL,
  `sst_sunday_close_time` varchar(50) DEFAULT NULL,
  `sst_sunday_holiday` tinyint(4) DEFAULT NULL COMMENT '0-not holiday, 1- holiday',
  `sst_monday_open_time` varchar(50) DEFAULT NULL,
  `sst_monday_close_time` varchar(50) DEFAULT NULL,
  `sst_monday_holiday` tinyint(4) DEFAULT NULL COMMENT '0-not holiday, 1- holiday',
  `sst_tuesday_open_time` varchar(50) DEFAULT NULL,
  `sst_tuesday_close_time` varchar(50) DEFAULT NULL,
  `sst_tuesday_holiday` tinyint(4) DEFAULT NULL COMMENT '0-not holiday, 1- holiday',
  `sst_wednesday_open_time` varchar(50) DEFAULT NULL,
  `sst_wednesday_close_time` varchar(50) DEFAULT NULL,
  `sst_wednesday_holiday` tinyint(4) DEFAULT NULL COMMENT '0-not holiday, 1- holiday',
  `sst_thrusday_open_time` varchar(50) DEFAULT NULL,
  `sst_thrusday_close_time` varchar(50) DEFAULT NULL,
  `sst_thrusday_holiday` tinyint(4) DEFAULT NULL COMMENT '0-not holiday, 1- holiday',
  `sst_friday_open_time` varchar(50) DEFAULT NULL,
  `sst_friday_close_time` varchar(50) DEFAULT NULL,
  `sst_friday_holiday` tinyint(4) DEFAULT NULL COMMENT '0-not holiday, 1- holiday',
  `sst_saturday_open_time` varchar(50) DEFAULT NULL,
  `sst_saturday_close_time` varchar(50) DEFAULT NULL,
  `sst_saturday_holiday` tinyint(4) DEFAULT NULL COMMENT '0-not holiday, 1- holiday',
  `sst_created_at` datetime DEFAULT NULL,
  `sst_updated_at` datetime DEFAULT NULL,
  `sst_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`sst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_store_shop_timings` */

insert  into `tbl_store_shop_timings`(`sst_id`,`sst_store_id`,`sst_open_time`,`sst_close_time`,`sst_sunday_open_time`,`sst_sunday_close_time`,`sst_sunday_holiday`,`sst_monday_open_time`,`sst_monday_close_time`,`sst_monday_holiday`,`sst_tuesday_open_time`,`sst_tuesday_close_time`,`sst_tuesday_holiday`,`sst_wednesday_open_time`,`sst_wednesday_close_time`,`sst_wednesday_holiday`,`sst_thrusday_open_time`,`sst_thrusday_close_time`,`sst_thrusday_holiday`,`sst_friday_open_time`,`sst_friday_close_time`,`sst_friday_holiday`,`sst_saturday_open_time`,`sst_saturday_close_time`,`sst_saturday_holiday`,`sst_created_at`,`sst_updated_at`,`sst_status`) values 
(4,41,'06:00','09:00','07:30','12:30',1,'08:00','12:00',1,'08:30','13:30',1,'08:30','17:30',1,'09:00','19:30',1,'09:30','20:00',1,'10:30','21:00',1,'2019-08-13 06:54:04','2019-08-13 06:54:04',1),
(8,43,'07:00','20:00','07:00','07:00',1,'07:00','20:00',0,'07:00','20:00',0,'07:00','20:00',0,'07:00','20:00',0,'07:00','20:00',0,'07:00','20:00',1,'2019-08-15 14:59:33','2019-08-15 14:59:33',1);

/*Table structure for table `tbl_stores_logininfo_master` */

DROP TABLE IF EXISTS `tbl_stores_logininfo_master`;

CREATE TABLE `tbl_stores_logininfo_master` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `password` varchar(300) NOT NULL,
  `store_token` text NOT NULL,
  `email_verification_key` varchar(200) NOT NULL,
  `sms_verification_key` varchar(100) NOT NULL,
  `authorization_key` varchar(100) NOT NULL,
  `account_status` char(2) NOT NULL,
  `email_activate_status` tinyint(3) NOT NULL,
  `mobile_activate_status` tinyint(2) NOT NULL,
  `disable_status` int(11) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `tbl_stores_logininfo_master_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `tbl_stores_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_stores_logininfo_master` */

insert  into `tbl_stores_logininfo_master`(`aid`,`store_id`,`password`,`store_token`,`email_verification_key`,`sms_verification_key`,`authorization_key`,`account_status`,`email_activate_status`,`mobile_activate_status`,`disable_status`) values 
(1,15,'d962b6c1a19d8609c52dabc89048a5cf','cVojYxcQwsU:APA91bHE98NdUUw_OSwOVIc00pZtazsc3ajyEp5FcFAzjUJyKCMJhqViID3h_9AswuZGriRB-WlpgdtrGLTC7LEALUxWFJ-t6s3VWHEni_F4hv8IOvgYZrnOaO0T59WipADks6_JaXoH','ae04d2a160927587df1f6b8fbbb5f386','ZFBQG','7c1206aa442cde35a4439609eb2597a5','I',1,1,0),
(2,16,'d183f299667b8134d6ded641a21d645b','dh7wwuLyW_I:APA91bEN3CoWEZg7_6Fc7ZKFgVuFdug7rjYe2N1STrUSiiQtIZYcn6t9QYNoI5hUtUXI1X03_rIS3bXrlMAkc5ra7YsZ3WWOrMmNkkPv7LQM8olOeSbVM6wqiePCvCF26hAzmYYxxQ39','acbdc0bbd88ae8fbfaddff4706b9c36b','YG96K','c52a41a05f536d51d109a1fdf515b059','I',1,1,0),
(3,17,'8d4f1ac2c0e75225200311e5d4738fd1','dh7wwuLyW_I:APA91bEN3CoWEZg7_6Fc7ZKFgVuFdug7rjYe2N1STrUSiiQtIZYcn6t9QYNoI5hUtUXI1X03_rIS3bXrlMAkc5ra7YsZ3WWOrMmNkkPv7LQM8olOeSbVM6wqiePCvCF26hAzmYYxxQ39','5700143b80f9cec6d2ad4047b2809ddf','Q4AB1','6ba2ae180d228fb5af1c29e32bfb72ef','I',1,1,0),
(4,18,'1577398bcc22aa1eab1ce69aa0c320f4','dh7wwuLyW_I:APA91bEN3CoWEZg7_6Fc7ZKFgVuFdug7rjYe2N1STrUSiiQtIZYcn6t9QYNoI5hUtUXI1X03_rIS3bXrlMAkc5ra7YsZ3WWOrMmNkkPv7LQM8olOeSbVM6wqiePCvCF26hAzmYYxxQ39','ace403616738890c5da9684cf8fdbd69','TP4MY','51956935ab76367a6318808275078ca2','I',1,1,0),
(5,19,'267057150e34eca5c6af39ec9b30864e','e0LmQ8pxjXU:APA91bGNtZxZBFcSTsGJu-dkKKHMs8rEIKtaDYL4vqWHpKi-vepRx5ubvMTm0LIUddYEUWyihB60NiJwa2IrXE_NWm1motDkyHtO-1dzfG4XCAvoQH4XNjyKaOVEMhXnCv7xzuUbsyNH','f12217aeaff1f75abb8281e0ce040ca3','X672Q','81898dc73cbe208c5056553405c177d1','I',1,1,0),
(6,20,'d9a20869f6a064584e2b38f6d39b167a','dhrlGzBlZq0:APA91bEB-QVskajW3CR9EWJgUr7Dpbv64JijW7KgFccVulsWoYAXUCAzCJ7xNeTuvqzIW3YCGz_aPh2gI9j8UadetQpeX8VHv30nI50zGY5ehQ6EPePnE8bIfHh6bFceMiANyBwRNQGF','9c82a208479f85ddc6682aa4018eba4b','UT3RW','8efa29e22703e83f6c83c74c90f4f3d1','I',1,1,0),
(7,21,'b59c67bf196a4758191e42f76670ceba','f3CYDCdC66M:APA91bGRiRudlucwJlnINpSoMJdjUhBxJDYbQ45VY77WS3dSrGfnIvClFg5p2tt7GfGrY2uNjsxtjUKo_GQLAS5o20R_JbAKMTXSJoFj_v-1McC_2TLj2KBsEG7EfbEnBGDNQcPqzXrm','c311a69c8ca920159b89a8009db6b5c0','C26ZW','1517ca862f03d56fc8676c11dd43fcec','I',1,1,0),
(8,22,'934b535800b1cba8f96a5d72f72f1611','eccIViFbcW8:APA91bEN285bheeH6XkqVI99SY-4lCVBiW-AClsvB6bA1v5-OB-FxBBGJrl4-mc1OLYIYgXiXrW7qBSZscpKe5mwjfy8DdmU96DrgExUtLwkU7qBFoKvgMicOM4b-0PQrDvaot6c4Lcg','24f104af71fb1f7c1a9e51b6d85b8705','QP41Z','f21f59f25849e83c9444b5acc27cb3c4','I',1,1,0),
(9,23,'25f9e794323b453885f5181f1b624d0b','asasasasa','bc099197d2787b4655125f866abee731','ECF4G','d14ea04c6803b7e8b75da59881147a70','I',1,1,0),
(10,24,'','0','e4da6ceebf73808ccf4bb13e6f1d15d0','','ff46aa8e6e046d4f725bb40934d252ba','A',1,1,0),
(11,25,'','dVRfdRHjaHI:APA91bEDN3ihWbj9e_Y_tCpRDMNQJl6YE1y_K_TtkTWtpJCL2gqh51r9sMdd9h60HjRbFs8H3h_ADwhd2v0EKFSkzsvF3V6enZE222dd8URCBYDJbsveApiYdBWRTUR9m5jylgdnYx3F','3dae9d7d1fb8986e2746d705aadb415d','','371fc33ae09ad94898c5af6e2acfcfbf','A',1,1,0),
(12,26,'0acf03f408f90ea0dcba786d300620db','cdmxuU9soZo:APA91bFzNDaqU1S1tK9woXSCXxi3MreQagtN9Ci6kdfRDMIZZFZUfWnUSQ7vK3uLSsYRvs7mCm2H5yH6abbFQ34JmMMRb-_2XkQ5Nqjoi5wlMzoNeaXUMmm7nGYhNU9cygXzrQc18Y78','cb290f7b3a770cef39f244ba8358abd7','UJF3F','33e59cfa62649da6c498a18ba3cccfbc','I',1,1,0),
(13,27,'738dcda4f94e14f7987518a1f667a116','eMjNPukBO3c:APA91bHzIb1XSARC1ownGUjx9_oS0Y00fbc5Y5i6DbnNlcHb5pMSl6JROuX3b43LQhsyQ2dGaAs-AV9-U0g__4s74SffI9iF5Z0ISiQH5gMFuUgwnnmvHNZQieXSXVUtytTFWTHQJKxG','9d9d29e0e00f79015a3e012460b7320f','3QHNA','15d58065615789b2e983be86d54f62fd','I',1,1,0),
(14,28,'','0','95e5dc64084bb49d919f50682837edae','','990100b155275282fcf89930bd962e85','A',1,1,0),
(15,29,'48042b1dae4950fef2bd2aafa0b971a1','f3CYDCdC66M:APA91bGRiRudlucwJlnINpSoMJdjUhBxJDYbQ45VY77WS3dSrGfnIvClFg5p2tt7GfGrY2uNjsxtjUKo_GQLAS5o20R_JbAKMTXSJoFj_v-1McC_2TLj2KBsEG7EfbEnBGDNQcPqzXrm','c37b37a87a2aa74c0273f0458d9fd3b3','1AV27','27c8305dfc6066018abbd0c8900ac418','I',1,1,0),
(16,30,'6512bd43d9caa6e02c990b0a82652dca','cdmxuU9soZo:APA91bFzNDaqU1S1tK9woXSCXxi3MreQagtN9Ci6kdfRDMIZZFZUfWnUSQ7vK3uLSsYRvs7mCm2H5yH6abbFQ34JmMMRb-_2XkQ5Nqjoi5wlMzoNeaXUMmm7nGYhNU9cygXzrQc18Y78','f068e0e2b9a2d3da3a735b94a1f6843a','Q4WYR','7ddd8627ab7b3c0019c7fe5f55c7ef2c','I',1,1,0),
(17,33,'9407c826d8e3c07ad37cb2d13d1cb641','cdmxuU9soZo:APA91bFzNDaqU1S1tK9woXSCXxi3MreQagtN9Ci6kdfRDMIZZFZUfWnUSQ7vK3uLSsYRvs7mCm2H5yH6abbFQ34JmMMRb-_2XkQ5Nqjoi5wlMzoNeaXUMmm7nGYhNU9cygXzrQc18Y78','66a6eada62fc64731c1d59d00e4da5fc','SBSHD','2a72296509f2b869dce3755a226b6182','I',1,1,0),
(18,32,'','frzQx5sQB_I:APA91bGOL2BcpJAda3Y20DBKUR51Fxlb3cTmiuygPueP_edqYa9RhKcgyozO-a4rySx0xDM1A6KUbgEGmrwsZIt4_qqFY77KLZT_owgRP9gWU1tQv-q_kC72Q9ad0Fq7TXqk6_RHqzBg','6b79d63e1c60438116a17fb83b41c5b0','','b6c5ee8e80d9eec0abda94d093e84727','A',1,1,0),
(19,31,'9cc6198fb4c03375b93bdcec0bd1cd22','fkKlAa6mclQ:APA91bG_Iisqd52YMZeM7ED98Axp_8QtQDbVgioj7mZyvN9Z9_vLmJSIikm4FXjyhQlFhSQwkc1mZQfnYhbmAFmcw90YoZTdybadJ_dXF2Xh4er5Cr7SQnzkYSLao6xJxzaCJ5utwnpM','c16a5320fa475530d9583c34fd356ef5','','dbc4b27b36dc033e60d72aa527a483b2','A',1,1,0),
(22,43,'9cc6198fb4c03375b93bdcec0bd1cd22','','96356c9de6bafc711b634298f7c66aaf','','','A',0,0,0);

/*Table structure for table `tbl_stores_master` */

DROP TABLE IF EXISTS `tbl_stores_master`;

CREATE TABLE `tbl_stores_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `store_des` text,
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
  `normal_type_of_cost` tinyint(4) DEFAULT NULL,
  `percentage_of_cost` int(11) DEFAULT NULL,
  `default_cost` int(11) DEFAULT NULL,
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
  `modified_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_stores_master` */

insert  into `tbl_stores_master`(`id`,`type`,`division_id`,`dealer_id`,`store_unique_id`,`store_name`,`store_owner_name`,`first_name`,`last_name`,`postcode`,`store_latitude`,`store_longitude`,`store_estb_date`,`store_phoneid`,`store_des`,`store_address`,`store_location`,`store_person_email`,`store_profile_pic`,`store_commercial_pic`,`pickup_status`,`online_status`,`store_transaction_limit`,`pickup_days`,`pickup_times`,`delivery_days`,`delivery_times`,`holidays_list`,`normal`,`normal_pickup_hours`,`normal_delivery_days`,`normal_type_of_cost`,`percentage_of_cost`,`default_cost`,`express`,`express_minimum_hours`,`express_pickup_time`,`express_percentage_of_cost`,`express_default_cost`,`shop_open_time`,`shop_close_time`,`subscription`,`terms_conditions`,`created_by`,`created_date_time`,`modified_date_time`) values 
(15,'V',0,'','LND_STO001','St Leonards Dry Cleaners','','Prasanna','','SW11 4LR','51.4724939999999975270839058794081211090087890625','-0.1636587',NULL,2086772323,NULL,'3b,LONDON','','prasanna@vclean4u.uk','','',1,1,0,'0','0','0','0','','0','2','2',NULL,NULL,NULL,'0','4','2','20','10','4-30,4-30-AM','20-00,11-00-PM',0,0,'','0000-00-00 00:00:00','2019-07-27 21:53:28'),
(16,'V',0,'','LND_STO002','0','','0','','0','0','0',NULL,0,NULL,'0','','0','cartoon1.jpg','',0,0,0,'0','0','0','0','0','0','0','0',NULL,NULL,NULL,'0','0','0','0','0','0','0',0,0,'','0000-00-00 00:00:00','2019-06-22 04:20:32'),
(17,'V',0,'','LND_STO003','Chalfont Dry Cleaners','','Ranven1','','null','null','null',NULL,2085779001,NULL,'tw3','','ranven1@vclean4u.uk','','',0,1,0,'0','0','0','0','','0','','2',NULL,NULL,NULL,'0','4','4','25','20','8-0,8-00-AM','18-0,6-00-PM',0,0,'','0000-00-00 00:00:00','2019-05-05 14:41:26'),
(18,'V',0,'','LND_STO004','Klean4you','','ranven2','','null','null','null',NULL,1274532926,NULL,',SHIPLEY','','ranven2@vclean4u.uk','','',1,1,0,'0','0','0','0','','0','2','3',NULL,NULL,NULL,'0','3,8','2,4','28,18','25,10','9-0,9-00-AM','18-0,6-00-PM',0,0,'','0000-00-00 00:00:00','2019-05-05 14:51:11'),
(19,'V',0,'','LND_STO005','rajesh','','raji','','null','null','null',NULL,7286061460,NULL,'50000000','','raji@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-05-06 10:55:02'),
(20,'V',0,'','LND_STO006','abc','','sree','','null','null','null',NULL,9553550369,NULL,'W12','','sree.donthula15@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-05-07 00:10:00'),
(21,'V',0,'','LND_STO007','checking','','checking','','SW16 6LG','51.428660799999996','-0.13147409999999998',NULL,1111,NULL,'5a-5b Mitcham Lane, , , , , London, ','','checking@gmail.com','','',1,1,0,'0','0','0','0','15-08-2019,20-08-2019','0','3','3',NULL,NULL,NULL,'0','4,6,0','2,2,0','10,5,0','26,5,0','9-00,9-00-AM','23-00,11-00-PM',0,0,'','0000-00-00 00:00:00','2019-07-27 13:52:10'),
(22,'V',0,'','LND_STO008','rama','','rama','','SW16 6LG','51.428898800000006','-0.1312862',NULL,2222,NULL,'1a,  , Mitcham Lane, LONDON','','rrr@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-05-30 02:54:05'),
(23,'V',0,'','LND_STO009','mystorevendor1','','abcdefga','','0','0','0',NULL,123456789,NULL,'begumpet','','abcdefgaaaaaaa@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-06-22 03:48:42'),
(24,'',0,'','','','','','','','','',NULL,0,NULL,'','','dileepkumarkonda@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-07-02 12:49:44'),
(25,'',0,'','','','','','','','','',NULL,0,NULL,'','','ramatulasib@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-07-03 01:44:59'),
(26,'V',0,'','LND_STO010','mystorevendor2','','vendorsample','','SW16 6NA','51.428898000000004','-0.1312852',NULL,12123,NULL,'1 Mitcham Lane, , , , , London, ','','sample13@gmail.com','','',1,1,0,'0','0','0','0','12-12-2019,11-11-2020','0','2','4',NULL,NULL,NULL,'0','4,6,7,0,4,6,7,0,4,6,7,0','2,3,3,0,2,3,3,0,2,3,3,0','10,12,15,0,10,12,15,0,10,12,15,0','10,12,15,0,10,12,15,0,10,12,15,0','6-00,6-00-AM','22-00,10-00-PM',0,0,'','0000-00-00 00:00:00','2019-07-27 13:52:13'),
(27,'V',0,'','LND_STO011','mystorevendor1','','samplevendor','','SW16 6LG','51.4287056','-0.1314904',NULL,1212123,NULL,'Foreplan Travel & Property Services, 5 Mitcham Lane, , , , London, ','','sample31@gmail.com','','',1,1,0,'0','0','0','0','','0','2','3',NULL,NULL,NULL,'0','5,6,0','2,3,0','10,7,0','5,3,0','7-00,7-00-AM','23-00,11-00-PM',0,0,'','0000-00-00 00:00:00','2019-07-27 13:52:08'),
(28,'',0,'','','','','','','','','',NULL,0,NULL,'','','rrrr@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-07-08 06:07:49'),
(29,'V',0,'','LND_STO012','vendors4','','dileep vendor','','SW16 6HF','51.4285061','-0.1312775',NULL,3636,NULL,'sw166hf','','vendors4@gmail.com','','',1,1,0,'0','0','0','0','15-08-2019,18-08-2019','0','3','4',NULL,NULL,NULL,'0','5,6,7,0','2,3,4,0','4,3,2,0','6,5,3,0','7-00,7-00-AM','23-00,11-00-PM',0,0,'','0000-00-00 00:00:00','2019-07-27 13:52:15'),
(30,'V',0,'','LND_STO013','11','','11','','SW16 6HE','51.428689999999996','-0.13136',NULL,11,NULL,'null','','11','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-07-10 22:51:20'),
(31,'V',0,'','LND_STO014','vendors5','','vendors5','','GU5 0BD','51.4285703','-0.1315334',NULL,2525,NULL,'9a Mitcham Lane, , , , , London, ','','vendors5@gmail.com','','',1,1,0,'0','0','0','0','','0','3','3',NULL,NULL,NULL,'0','6,7,0','2,2,0','5,4,0','15,10,0','6-00,6-00-AM','23-00,11-00-PM',0,0,'','0000-00-00 00:00:00','2019-08-15 09:10:23'),
(32,'V',0,'','LND_ST0032','Lakmi1 store1','','jamili','','GU5 0BD','','',NULL,0,NULL,'','','purushothamrasineni444@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-08-15 08:56:15'),
(33,'V',0,'','LND_ST0033','Lakmi1 store2','','naveen','','GU5 0BD','','',NULL,0,NULL,'','','yeshwanth.athmakuri@gmail.com','','',0,0,0,'','','','','','','','',NULL,NULL,NULL,'','','','','','','',0,0,'','0000-00-00 00:00:00','2019-08-15 08:56:17'),
(41,'V',0,'','LND_ST0034','Lakmi1 store','','leela1','Naveen1','GU5 0BD','51.195498','-0.560776',NULL,91607217271,' Kumatpally1, Hydrbad','Flat 19,The Beeches,Horsham Road, Bramley,Flat 19, The Beeches','Bramley','test@gmail1.com','120820190720141Tulips.jpg','120820190720142Jellyfish.jpg',0,0,0,'','','','','2019-08-09,2019-08-13,2019-08-13','','1','1',2,0,4,'','2','2','0','2','06:00','09:00',0,0,'','2019-08-09 06:11:21','2019-08-15 08:55:25'),
(43,'V',0,'','LND_STO0042','Leela Store1','','Jamlili1','Leela Naveen1','ID1 1QD','51.489948839056','-0.20864436276637',NULL,9160721721,' This is best store for business 1','ID Consulting Limited,59 Barons Court Road,59','Hyderbad1','naveen1@gmail.com','150820191345321Tulips.jpg','150820191345322Jellyfish.jpg',0,0,0,'','','','','2019-08-16,2019-08-17','','21','21',2,0,11,'','1,1','1,1','0,11','11,0','07:00','20:00',0,0,'','2019-08-15 13:37:13','2019-08-15 14:59:33');

/*Table structure for table `tbl_terms_conditions` */

DROP TABLE IF EXISTS `tbl_terms_conditions`;

CREATE TABLE `tbl_terms_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` text NOT NULL,
  `privacy_policies` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_terms_conditions` */

/*Table structure for table `tbl_user_addresses` */

DROP TABLE IF EXISTS `tbl_user_addresses`;

CREATE TABLE `tbl_user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user_addresses` */

insert  into `tbl_user_addresses`(`id`,`user_id`,`firstname`,`lastname`,`house_no`,`street`,`landmark`,`state`,`city`,`pincode`,`phone`,`latitude`,`address`,`longitude`,`created_at`) values 
(2,'6ca053062d158c1253f32336f68f80f6','','','','','','','','SW16 6LG',0,'51.428341599999996','10 Streatham Green, Streatham High Road, LONDON','-0.1316432','2019-05-29 08:14:24'),
(3,'6ca053062d158c1253f32336f68f80f6','','','','','','','','SW16 6LG',0,'51.428660799999996','5a-5b Mitcham Lane, , , , , London, ','-0.13147409999999998','2019-06-13 00:43:29'),
(4,'ad1a62b603be8654c7700d38012fad4d','','','','','','','','SW16 6HE',0,'51.428689999999996','10 Streatham Green, Streatham High Road, , , , London, ','-0.13136','2019-07-08 03:12:09'),
(5,'ad1a62b603be8654c7700d38012fad4d','','','','','','','','SW16 6LG',0,'51.428660799999996','5a-5b Mitcham Lane, , , , , London, ','-0.13147409999999998','2019-07-08 04:25:22');

/*Table structure for table `tbl_user_login_accessinfo` */

DROP TABLE IF EXISTS `tbl_user_login_accessinfo`;

CREATE TABLE `tbl_user_login_accessinfo` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime NOT NULL,
  `created_from` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user_login_accessinfo` */

insert  into `tbl_user_login_accessinfo`(`aid`,`userid`,`oauth_provider`,`oauth_uid`,`user_type`,`password`,`user_token`,`email_verification_key`,`sms_verification_key`,`rest_verification_key`,`account_status`,`email_activate_status`,`mobile_activate_status`,`updated_at`,`created_from`) values 
(1,1,'','','N','cc03e747a6afbbcbf8be7668acfebee5','dRXWo76PZQA:APA91bFLWb3Bngx8Fs9vlp5CI9K9HWufHkkznx3zZSmIKGwlHfBTHKhKiHWjqrHW_Z1a5jic_c5KQTbni6W9ZeGkXRM7xCszc89E8T_mK9VbSWnG336bMSnGRycvhOjke-mgkamHdBA-','a574cbf73cc9606b8f850bdaeed6f67d','','5ff41cdd52af01a2271ec9a6a43e775b','I',1,1,'0000-00-00 00:00:00',NULL),
(2,2,'','','N','cc03e747a6afbbcbf8be7668acfebee5','dRXWo76PZQA:APA91bFLWb3Bngx8Fs9vlp5CI9K9HWufHkkznx3zZSmIKGwlHfBTHKhKiHWjqrHW_Z1a5jic_c5KQTbni6W9ZeGkXRM7xCszc89E8T_mK9VbSWnG336bMSnGRycvhOjke-mgkamHdBA-','c5f52d9d1e471d5a700d6b58651ae8a4','','8da340804814b911abb2f07e4dea367d','I',1,1,'0000-00-00 00:00:00',NULL),
(3,3,'','','N','d41d8cd98f00b204e9800998ecf8427e','','74d66b1b53e08e25529c0e08bb8a81fe','','636455c2c8f475c160384faa596beda2','A',1,1,'0000-00-00 00:00:00',NULL),
(4,4,'','','N','f925916e2754e5e03f75dd58a5733251','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','74394af6d37588d661c59991a7d98024','','e42b8f6f16d478c7711b2849a24e82ed','I',1,1,'0000-00-00 00:00:00',NULL),
(5,5,'','','N','d9a20869f6a064584e2b38f6d39b167a','fb6UoWLP2gY:APA91bFPs3lv5Ocj72HL0BJfnKZiBd5i05ZmoDX_ClmkgGHay-wdUYqLqvQ2nCmB27A_HRaW72nENgpncMSlzBBMMIA642jI6Syv85EO7fWCnWrcWN3yhNjZ1-xa5TgN-h2Y_gNy8aRH','27feeb413b585e8096d8a7b3db6dfcaa','','4868f7edaea6496bc30425eafbf27bba','I',1,1,'0000-00-00 00:00:00',NULL),
(6,6,'','','N','b59c67bf196a4758191e42f76670ceba','fx3sC2t4i4s:APA91bGfem49sb_UjVVpchXEYRlAdpQtEoC-UwGe6y382ALlJN3VJMxFfV1ungyXP3KhIXM-qDUkFiIh9rdEDy1F-O4C_6QyGECFsImfbkEMBBCiZZwBb0YJ91cfZBcGceCoq3rNdeok','10d5710e0a7d982fe6841365d62b9c15','','6ca053062d158c1253f32336f68f80f6','I',1,1,'0000-00-00 00:00:00',NULL),
(7,7,'','','N','934b535800b1cba8f96a5d72f72f1611','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','d4478fa16442ea070503dac86d641e85','','d14e661f4d995a3dcdc780250400d5b5','I',1,1,'0000-00-00 00:00:00',NULL),
(8,8,'','','N','2be9bd7a3434f7038ca27d1918de58bd','fTLQltJLLC4:APA91bHQm2hZk-wWUYqbHrsWxr1O8h4toyRYDSV_PGwzBwZY-LUGGKFmqo6ijP8G-1xKgKtsaCaz1GdNRkgni6bHaDWV78dQjBTISZSIlHA6vXmPoZhd9HZecuDUWinSfG7D72mE7Zv_','7cde1865b2a4890cb0d6bd94e30f8d76','','9486fdf4452d8a467297afa767a61afd','I',1,1,'0000-00-00 00:00:00',NULL),
(9,9,'','','N','cc03e747a6afbbcbf8be7668acfebee5','dfKtw3nLoPs:APA91bEqthxe0-Pngmf7Pw7R6aZHkV5joi-N5w3h6JB8Ux4A04MbeGQsWrtijiIpqpHb8RR28S18um5PRlHNvEfuDKIotnhDGarIVhVy_O5_Ik8NatNETuhIUquzlWevCqXdOmdreFbW','06337699257f25ee67bd13249372e9f7','','40fe774c14b7f1d6e5b4f15a7b1e2cff','I',1,1,'0000-00-00 00:00:00',NULL),
(10,10,'','','N','202cb962ac59075b964b07152d234b70','dfKtw3nLoPs:APA91bEqthxe0-Pngmf7Pw7R6aZHkV5joi-N5w3h6JB8Ux4A04MbeGQsWrtijiIpqpHb8RR28S18um5PRlHNvEfuDKIotnhDGarIVhVy_O5_Ik8NatNETuhIUquzlWevCqXdOmdreFbW','ff139de6c4c8e48be66074c600fc4607','','6865ed6f330ea22db4b299ca61b1ada4','I',1,1,'0000-00-00 00:00:00',NULL),
(11,11,'','','N','0e2d5004f3fdb311f2832aa0e08031a2','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','dc9f2d4231d8affcff06db8bc3f4cc10','','a262599ab9fbe4ca5e9fb734b0e2f395','I',1,1,'0000-00-00 00:00:00',NULL),
(12,12,'','','N','b6d767d2f8ed5d21a44b0e5886680cb9','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','19b4bac1e7481384e2b826d23b1e690f','','ded52daac5079b7c32b6885cd611d72c','I',1,1,'0000-00-00 00:00:00','from_online'),
(13,13,'','','N','c4ca4238a0b923820dcc509a6f75849b','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','5d9813ef0d72ce9a2ef9577058bd1b8d','','fd99fcbe443b4c06de5b72b698761db9','I',1,1,'0000-00-00 00:00:00',NULL),
(14,15,'','','N','0152720d790e53a35c18fce36c0c6ba0','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','b5d60eef1dc769098f2bb640cdf10ec4','','0a0a7f1c8656d66f45de32018c0a3f10','I',1,1,'0000-00-00 00:00:00','from_offline'),
(16,17,'','','N','0152720d790e53a35c18fce36c0c6ba0','','40ebc2768fdb39f1423bdb3f662d6360','','1d5300c10af2d77d8a492056e8cd9427','I',1,1,'0000-00-00 00:00:00','from_offline'),
(17,18,'','','N','e10adc3949ba59abbe56e057f20f883e','','2bcb0faa3e482cd2419374d8efcdb51c','','3e377cbef8c616f026d0c85c82a9da32','I',1,1,'0000-00-00 00:00:00','from_offline'),
(18,19,'','','N','37ef75f90de22501d1453eff1d132c94','','6d9e7aa83ade758abc4d8d8cfafd1eec','','22c39f18a6504ecedd2f986db7158ff5','I',1,1,'0000-00-00 00:00:00','from_offline'),
(19,20,'','','N','d4c2e4a3297fe25a71d030b67eb83bfc','','8268216cb14d193dcfee0e9eed3ae571','','4f77dc559980cf78be82b04b12ff7e77','I',1,1,'0000-00-00 00:00:00','from_offline'),
(20,21,'','','N','827ccb0eea8a706c4c34a16891f84e7b','','bab9c8a777e7a1463fb8945f2114f030','','31b0b426421f1997858f1ca735fe3eee','I',1,1,'0000-00-00 00:00:00','from_offline'),
(21,22,'','','N','fcea920f7412b5da7be0cf42b8c93759','','d987a121c0fa9e96171843a3c3f887f6','','7819524bfb5869792a1589e831d4d29d','I',1,1,'0000-00-00 00:00:00','from_offline'),
(22,23,'','','N','97e8527feaf77a97fc38f34216141515','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','e550f7e05b963f64acc049c4ea427cb7','','f21d4c072094278117ede291dd48e6e5','I',1,1,'0000-00-00 00:00:00','from_offline'),
(23,24,'','','N','9c3b1830513cc3b8fc4b76635d32e692','','e1c69f7d0de43fdaba10371a51b966be','','2a7e8591e276f85efafcee844b16eaff','I',1,1,'0000-00-00 00:00:00','from_offline'),
(24,25,'','','N','7bddc0dacc19a278be589a5ada3e2e46','','9729451cddb8116631eb79717b1ca1b6','','739f7a435751ba7eccb56111b1e9e1dd','I',1,1,'0000-00-00 00:00:00','from_offline'),
(25,26,'','','N','0acf03f408f90ea0dcba786d300620db','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','547a17b749951d1c3d1734fb56eba095','','ad1a62b603be8654c7700d38012fad4d','I',1,1,'0000-00-00 00:00:00',NULL),
(26,27,'','','N','7a674153c63cff1ad7f0e261c369ab2c','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','2f189756708a5065149350fa3e0cbb5f','','0aba4a56e18ccdeca5af09f647d16b11','I',1,1,'0000-00-00 00:00:00',NULL),
(27,28,'','','N','099b3b060154898840f0ebdfb46ec78f','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','631caefae37ae8e93a06e804f9534d67','','adf204b08191c5ab56bc058665cfce8e','I',1,1,'0000-00-00 00:00:00',NULL),
(28,29,'','','N','b4b147bc522828731f1a016bfa72c073','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','2699a9cb0f2987e4435a9b3a43a2f7b3','','c4f861d45f78b0f08bdef7c4f0ebafdd','I',1,1,'0000-00-00 00:00:00',NULL),
(29,30,'','','N','6dd9aa0b0606270d0875acb21546bedb','dHgXB4cigW4:APA91bFCBfqTcQgr-OAjL-khgvoOTzvLDxuC7sW0SyqLiPJ9pBsd9hvpCMLHL6Db3ytm72U1KkXjtHYYzCEzDiKeErEaU-GQc3QDkqMr37CGiSvWsLeu8mRxq8VnilvLQ7nOpuqdB_AO','a4682137ac2be48e59fc13d36ddd3396','','97ca5d54a0f81f3f63dbd932e621fefa','I',1,1,'0000-00-00 00:00:00',NULL),
(30,31,'','','N','017889e2b7e38062a246c0c180aafcce','ftUL6TdRIbQ:APA91bFbnfm8ibIYDkBEi4ejLTuVoUjSyfDMPOkFQOxiCzJV4PI4qu1Abp7BojqrsSX2Ys3By6hbySrIJmIqw6s0l93uKdkN_-xduDiPK7u0K4A5lHNBRhYY9qiBcc8mRAp6NGxGNmYp','c2a3f8ffce236f141813c43a45fe5727','','86f6df6ebf46a2bc75d8784234bb8111','I',1,1,'0000-00-00 00:00:00',NULL),
(31,32,'','','N','4c56ff4ce4aaf9573aa5dff913df997a','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','6ef54f7e9e579c4bd8c3900ff58e6b05','','b1175828637b947477bc699a6ed491fc','I',1,1,'0000-00-00 00:00:00','from_offline'),
(32,33,'','','N','698d51a19d8a121ce581499d7b701668','','0ff69a3f87a4f31640635a8734d1eca7','','33cc18f84050e0110b8fdf4525212ff6','I',1,1,'0000-00-00 00:00:00','from_offline'),
(33,34,'','','N','95e62984b87e90645a5cf77037395959','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','0c65491c563624ef3edaa95e8d1df383','','a870f977cb26475a2da75123b632855e','I',1,1,'0000-00-00 00:00:00','from_offline'),
(34,35,'','','N','4822034c13db89c03c16fad74c549a3e','cvxNU-UbEiQ:APA91bGbrw-dRzeREMyUXIYKJ9AAdUTSLgKVb6ZhoFFQxtrixxXnt67RJCILG9ALuU1D8R3O7uRligeqT9aBnBBt-BkWwiGSi677c1TC22TsCCqsmNsxQ4dZy4oOjhK8_0VwBzXIMBPU','7bb74ec144ff3b53d85ed73feea0c375','','e43adcdff1031113bb25d10f84777339','I',1,1,'0000-00-00 00:00:00','from_offline');

/*Table structure for table `tbl_user_order_confirmations` */

DROP TABLE IF EXISTS `tbl_user_order_confirmations`;

CREATE TABLE `tbl_user_order_confirmations` (
  `cfid` int(11) NOT NULL AUTO_INCREMENT,
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
  `delivery_date_time` date NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `payable_amount` float DEFAULT '0',
  `order_tot_amount` float DEFAULT '0',
  `discount_per` float DEFAULT '0',
  `fixed_discount` float DEFAULT '0',
  `sub_total` float DEFAULT '0',
  `grand_total` float DEFAULT '0',
  `saving_amount` float DEFAULT '0',
  `account_credit_amount` float DEFAULT '0',
  `card_amount` float DEFAULT '0',
  `cash_amount` float DEFAULT '0',
  `orderMode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cfid`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user_order_confirmations` */

insert  into `tbl_user_order_confirmations`(`cfid`,`vendor_id`,`userid`,`driverid`,`return_driverid`,`transaction_id`,`order_confirm_status`,`driver_confirm_status`,`order_confirm_otp`,`order_address`,`pickup_time`,`pickup_date`,`delivery_time`,`delivery_date`,`express_cost`,`cleaninig_instruction`,`offline_order`,`created_date_time`,`updated_at`,`delivery_date_time`,`payment_type`,`payable_amount`,`order_tot_amount`,`discount_per`,`fixed_discount`,`sub_total`,`grand_total`,`saving_amount`,`account_credit_amount`,`card_amount`,`cash_amount`,`orderMode`) values 
(1,'c52a41a05f536d51d109a1fdf515b059','636455c2c8f475c160384faa596beda2','','','00160407','A',0,0,'','','','','Tuesday, 7 May 2019','0.0','',1,'2019-05-06 02:34:36','2019-05-06 02:04:36','0000-00-00','Account Credit',0,0,0,0,0,0,0,0,0,0,NULL),
(2,'c52a41a05f536d51d109a1fdf515b059','636455c2c8f475c160384faa596beda2','','','00160686','A',0,0,'','','','','Tuesday, 7 May 2019','0.0','',1,'2019-05-06 02:52:01','2019-05-06 02:22:01','0000-00-00','Account Credit',0,0,0,0,0,0,0,0,0,0,NULL),
(3,'c52a41a05f536d51d109a1fdf515b059','636455c2c8f475c160384faa596beda2','','','00160633','A',0,0,'','','','','Tuesday, 7 May 2019','0.0','',1,'2019-05-06 02:52:39','2019-05-06 02:22:39','0000-00-00','Account Credit',0,0,0,0,0,0,0,0,0,0,NULL),
(15,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','0123456','DL',0,0,'sew16xfgj','12','12/12/219','12','1/1/0uid}}1','20','no',1,'2019-06-28 12:12:19','2019-06-30 04:02:28','0001-01-00','Account Credit',100,120,0,20,80,100,20,0,0,0,NULL),
(16,'0','22c39f18a6504ecedd2f986db7158ff5','','','0','A',0,0,'1 Mitcham Lane, , , , , London, ','','','','Saturday, June 29, 2019','11.0','',1,'2019-06-28 12:28:56','2019-06-27 23:58:56','0000-00-00','0',0,0,0,0,0,0,0,0,0,0,NULL),
(14,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','0123456','DL',0,0,'sew16xfgj','12','12/12/219','12','1/1/0uid}}1','20','no',1,'2019-06-28 12:10:03','2019-06-30 04:02:28','0001-01-00','Account Credit',100,120,0,20,80,100,20,0,0,0,'online'),
(13,'c52a41a05f536d51d109a1fdf515b059','1d5300c10af2d77d8a492056e8cd9427','','','00162252','A',0,0,'10 Streatham Green, Streatham High Road, LONDON','11:16','Tuesday, 7 May 2019','11:16','Tuesday, 8 May 2019','0.00','Tesing dsadas dfsdf',1,'2019-06-28 11:49:00','2019-06-27 23:19:00','0000-00-00','Account Credit',5,10,2,0,8,8,12,0,0,0,'online'),
(17,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510990','A',0,0,'sew16xfgj','','','','Saturday, June 29, 2019','11.0','',1,'2019-06-28 01:59:36','2019-07-14 03:15:41','0000-00-00','cash',0,131,0,0,0,0,0,0,0,0,'online'),
(18,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510897','A',0,0,'sew16xfgj','','','','Sunday, June 30, 2019','0.0','',1,'2019-06-28 02:14:22','2019-06-28 01:44:22','0000-00-00','cash',0,220,0,0,0,0,0,0,0,0,'online'),
(19,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510593','A',0,0,'sew16xfgj','','','','Saturday, June 29, 2019','13.5','',1,'2019-06-28 02:19:56','2019-06-28 01:49:56','0000-00-00','cash',0,283.5,0,0,0,0,0,0,0,0,'online'),
(20,'1517ca862f03d56fc8676c11dd43fcec','22c39f18a6504ecedd2f986db7158ff5','','','00510175','A',0,0,'','','','','Saturday, June 29, 2019','12.0','',1,'2019-06-28 02:25:35','2019-06-28 01:55:35','0000-00-00','cash',0,252,0,0,0,0,0,0,0,0,'online'),
(21,'1517ca862f03d56fc8676c11dd43fcec','22c39f18a6504ecedd2f986db7158ff5','','','00510373','DL',0,0,'','','','','Sunday, June 30, 2019','0.0','',1,'2019-06-28 02:36:02','2019-06-28 02:48:52','0000-00-00','cash',0,270,0,0,0,0,0,0,0,0,'online'),
(22,'1517ca862f03d56fc8676c11dd43fcec','22c39f18a6504ecedd2f986db7158ff5','','','00510761','A',0,0,'','','','','Sunday, June 30, 2019','0.0','',1,'2019-06-28 02:46:12','2019-06-28 02:16:12','0000-00-00','cash',0,100,0,0,0,0,0,0,0,0,'online'),
(23,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510367','A',0,0,'sew16xfgj','','','','Monday, July 1, 2019','0.0','',1,'2019-06-29 02:10:20','2019-06-29 01:40:20','0000-00-00','AccountCredit',0,40,0,0,0,0,0,0,0,0,'online'),
(24,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510138','RJ',0,0,'sew16xfgj','','','','Monday, July 1, 2019','0.0','',1,'2019-06-29 02:18:47','2019-07-08 03:36:21','0000-00-00','AccountCredit',0,60,0,0,60,60,0,0,0,0,'online'),
(25,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510580','RJ',0,0,'sew16xfgj','','','','Monday, July 1, 2019','0.0','',1,'2019-06-29 02:43:50','2019-07-08 03:35:53','0000-00-00','AccountCredit',0,80,0,0,80,80,0,0,0,0,'online'),
(26,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','0123456','DL',0,0,'sew16xfgj','12','12/12/219','12','1/1/0uid}}1','20','no',1,'2019-06-29 02:46:01','2019-06-30 04:02:28','0001-01-00','Account Credit',100,120,0,20,80,100,20,0,0,0,'online'),
(27,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510147','A',0,0,'sew16xfgj','','','','Monday, July 1, 2019','0.0','',1,'2019-06-29 02:48:51','2019-06-29 02:18:51','0000-00-00','AccountCredit',0,40,0,0,40,40,0,0,0,0,'offline'),
(28,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510164','A',0,0,'sew16xfgj','','','','Monday, July 1, 2019','0.0','',1,'2019-06-29 05:57:11','2019-06-29 05:27:11','0000-00-00','AccountCredit',0,40,0,0,40,40,0,0,0,0,'offline'),
(29,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510251','A',0,0,'sew16xfgj','','','','Monday, July 1, 2019','0.0','',1,'2019-06-29 05:57:36','2019-06-29 05:27:36','0000-00-00','AccountCredit',0,60,0,0,60,60,0,0,0,0,'offline'),
(30,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510198','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 01:06:28','2019-06-30 00:36:28','0000-00-00','AccountCredit',30,40,0,0,40,40,0,0,0,0,'offline'),
(31,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510631','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 01:08:01','2019-06-30 00:38:01','0000-00-00','cash,',40,40,0,0,40,40,0,0,0,0,'offline'),
(32,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510772','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 01:08:26','2019-06-30 00:38:26','0000-00-00','cash,card,',60,60,0,0,60,60,0,0,0,0,'offline'),
(33,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510573','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 01:12:55','2019-06-30 00:42:55','0000-00-00','AccountCredit',0,60,0,0,60,60,0,0,0,0,'offline'),
(34,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510234','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 01:49:58','2019-06-30 01:19:58','0000-00-00','card,',60,60,0,0,60,60,0,0,0,0,'offline'),
(35,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510561','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 02:00:40','2019-06-30 01:30:40','0000-00-00','card,',60,60,0,0,60,60,0,0,0,0,'offline'),
(36,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510213','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 02:01:14','2019-06-30 01:31:14','0000-00-00','AccountCredit',0,60,0,0,60,60,0,0,0,0,'offline'),
(37,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510653','A',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 02:01:45','2019-06-30 01:31:45','0000-00-00','cash,card,AccountCredit',30,60,0,0,60,60,0,0,0,0,'offline'),
(38,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510783','DL',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 02:02:56','2019-06-30 04:02:49','0000-00-00','AccountCredit',0,60,0,0,60,60,0,0,0,0,'offline'),
(39,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510361','DL',0,0,'sew16xfgj','','','','Tuesday 2 July 2019','0.0','',1,'2019-06-30 02:03:22','2019-06-30 02:08:43','0000-00-00','cash,card,',60,60,0,0,60,60,0,0,0,0,'offline'),
(40,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','0123456','DL',0,0,'sew16xfgj','12','12/12/219','12','1/1/0uid}}1','20','no',1,'2019-06-30 02:17:33','2019-06-30 04:02:28','0001-01-00','Account Credit',100,120,0,20,80,100,20,0,0,0,'offline'),
(41,'1517ca862f03d56fc8676c11dd43fcec','22c39f18a6504ecedd2f986db7158ff5','','','00510400','A',0,0,'','','','','Tuesday, July 2, 2019','0.0','',1,'2019-06-30 06:42:33','2019-06-30 06:12:33','0000-00-00','AccountCredit',0,140,0,0,140,140,0,140,0,0,'offline'),
(42,'1517ca862f03d56fc8676c11dd43fcec','3e377cbef8c616f026d0c85c82a9da32','','','00510571','A',0,0,'sew16xfgj','','','','Tuesday, July 2, 2019','0.0','',1,'2019-06-30 06:55:39','2019-06-30 06:25:39','0000-00-00','cash,',140,140,0,0,140,140,0,0,0,140,'offline'),
(43,'1517ca862f03d56fc8676c11dd43fcec','4f77dc559980cf78be82b04b12ff7e77','','','00510300','DL',0,0,'','','','','Wednesday 3 July 2019','0.0','',1,'2019-07-01 10:49:06','2019-07-12 03:49:30','0000-00-00','',0,60,0,0,60,60,0,0,0,0,'offline'),
(44,'1517ca862f03d56fc8676c11dd43fcec','4f77dc559980cf78be82b04b12ff7e77','','','00510799','A',0,0,'','','','','Wednesday 3 July 2019','0.0','',1,'2019-07-01 10:52:59','2019-06-30 22:22:59','0000-00-00','cash,card,AccountCredit',80,140,0,0,140,140,0,60,30,50,'offline'),
(45,'1517ca862f03d56fc8676c11dd43fcec','31b0b426421f1997858f1ca735fe3eee','','','00510619','A',0,0,'','','','','Wednesday, July 3, 2019','0.0','',1,'2019-07-01 12:04:12','2019-06-30 23:34:12','0000-00-00','AccountCredit',0,140,0,0,140,140,0,140,0,0,'offline'),
(46,'1517ca862f03d56fc8676c11dd43fcec','31b0b426421f1997858f1ca735fe3eee','','','00510652','DL',0,0,'','','','','Wednesday, July 3, 2019','0.0','',1,'2019-07-01 12:05:16','2019-07-01 01:28:14','0000-00-00','',70,70,0,0,70,70,0,0,0,0,'offline'),
(47,'1517ca862f03d56fc8676c11dd43fcec','7819524bfb5869792a1589e831d4d29d','','','00510823','A',0,0,'','','','','Wednesday, July 3, 2019','0.0','',1,'2019-07-01 12:09:01','2019-06-30 23:39:01','0000-00-00','AccountCredit',0,90,0,0,90,90,0,90,0,0,'offline'),
(48,'1517ca862f03d56fc8676c11dd43fcec','7819524bfb5869792a1589e831d4d29d','','','00510766','DL',0,0,'','','','','Wednesday, July 3, 2019','0.0','',1,'2019-07-01 12:09:59','2019-07-01 02:23:40','0000-00-00','',60,70,0,0,70,70,0,-10,0,10,'offline'),
(49,'1517ca862f03d56fc8676c11dd43fcec','7819524bfb5869792a1589e831d4d29d','','','00520760','A',0,0,'','','','','Wednesday, July 3, 2019','0.0','',1,'2019-07-01 12:10:31','2019-06-30 23:40:31','0000-00-00','cash,',50,50,0,0,50,50,0,0,0,50,'offline'),
(51,'c52a41a05f536d51d109a1fdf515b059','636455c2c8f475c160384faa596beda2','','','001614343','A',0,0,'10 Streatham Green, Streatham High Road, LONDON','11:16','Tuesday, 7 May 2019','11:16','Tuesday, 8 May 2019','0.00','Tesing dsadas dfsdf',1,'2019-07-03 12:09:11','2019-07-02 23:39:11','0000-00-00','Card',5,10,2,0,8,8,12,0,0,0,'online'),
(52,'1517ca862f03d56fc8676c11dd43fcec','6ca053062d158c1253f32336f68f80f6','','','gs','RJ',0,0,'asf','1','12','12','12','12','at',1,'2019-07-03 02:13:01','2019-07-08 03:35:43','0000-00-00','sdg',13,0,12,1,1,123,234,12,1,12,'online'),
(53,'1517ca862f03d56fc8676c11dd43fcec','6ca053062d158c1253f32336f68f80f6','','','gs','RJ',0,0,'asf','1','12','12','12','12','at',1,'2019-07-08 11:23:41','2019-07-08 03:35:43','0000-00-00','sdg',13,0,12,1,1,123,234,12,1,12,'online'),
(54,'1517ca862f03d56fc8676c11dd43fcec','6ca053062d158c1253f32336f68f80f6','','','gs','RJ',0,0,'asf','1','12','12','12','12','at',1,'2019-07-08 11:25:56','2019-07-08 03:35:43','0000-00-00','sdg',13,0,12,1,1,123,234,12,1,12,'online'),
(55,'1517ca862f03d56fc8676c11dd43fcec','f21d4c072094278117ede291dd48e6e5','','','00510940','P',0,0,'','','','','Wednesday, July 10, 2019','0.0','',0,'2019-07-08 11:26:46','2019-07-07 22:56:46','0000-00-00','AccountCredit',0,40,0,0,40,40,0,40,0,0,'offline'),
(56,'1517ca862f03d56fc8676c11dd43fcec','2a7e8591e276f85efafcee844b16eaff','','','00510721','A',0,0,'','','','','Wednesday, July 10, 2019','0.0','',0,'2019-07-08 11:38:52','2019-07-07 23:08:52','0000-00-00','AccountCredit',0,40,0,0,40,40,0,40,0,0,'offline'),
(57,'1517ca862f03d56fc8676c11dd43fcec','739f7a435751ba7eccb56111b1e9e1dd','','','00510705','A',0,0,'','','','','Wednesday, July 10, 2019','0.0','',0,'2019-07-08 11:39:45','2019-07-07 23:09:45','0000-00-00','cash,card,',190,190,0,0,190,190,0,0,185,5,'offline'),
(81,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','','','00311650','A',0,0,'sw166hf','03:00 PM - 04:00 PM','Sunday, July 14, 2019','09:00 PM - 10:00 PM','Sunday, July 14, 2019','15.0','',1,'2019-07-14 01:33:47','2019-07-20 02:40:29','0000-00-00','card',19,19,0,0,0,19,0,0,19,0,'online'),
(58,'1517ca862f03d56fc8676c11dd43fcec','ad1a62b603be8654c7700d38012fad4d','','','gs','P',0,0,'asf','1','12','12','12','12','at',1,'2019-07-08 01:07:51','2019-07-08 00:37:51','0000-00-00','sdg',13,0,12,1,1,123,234,12,1,12,'online'),
(59,'1517ca862f03d56fc8676c11dd43fcec','ad1a62b603be8654c7700d38012fad4d','','','00510333','A',0,0,'sw166hf','1','12','12','12','12','at',1,'2019-07-08 03:48:14','2019-07-14 03:25:37','0000-00-00','cash',120,120,12,1,1,123,234,12,1,12,'online'),
(60,'15d58065615789b2e983be86d54f62fd','ad1a62b603be8654c7700d38012fad4d','','','00510999','P',0,0,'sw166hf','1','12','12','12','12','at',1,'2019-07-08 03:58:51','2019-07-08 03:28:51','0000-00-00','cash',120,120,12,1,1,123,234,12,1,12,'online'),
(61,'15d58065615789b2e983be86d54f62fd','ad1a62b603be8654c7700d38012fad4d','','','00510998','P',0,0,'sw166hf','1','12','12','12','12','at',1,'2019-07-08 04:25:35','2019-07-08 03:55:35','0000-00-00','cash',120,120,12,1,1,123,234,12,1,12,'online'),
(62,'15d58065615789b2e983be86d54f62fd','ad1a62b603be8654c7700d38012fad4d','','','00271730','P',0,0,'sw166hf','07:00 PM - 09:00 PM','Monday, July 8, 2019','03:00 PM - 05:00 PM','Wednesday, July 10, 2019','0.0','',1,'2019-07-08 04:43:53','2019-07-08 04:13:53','0000-00-00','card',34,34,0,0,0,34,0,0,34,0,'online'),
(63,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261933','P',0,0,'sw166hf','07:00 PM - 08:00 PM','Monday, July 8, 2019','07:00 AM - 08:00 AM','Tuesday, July 9, 2019','12.0','',1,'2019-07-08 04:58:14','2019-07-08 04:28:15','0000-00-00','card',30,30,0,0,0,30,0,0,30,0,'online'),
(64,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261930','P',0,0,'sw166hf','08:00 PM - 09:00 PM','Monday, July 8, 2019','09:00 AM - 10:00 AM','Tuesday, July 9, 2019','12.0','',1,'2019-07-08 05:02:37','2019-07-08 04:32:37','0000-00-00','card',24,24,0,0,0,24,0,0,24,0,'online'),
(65,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261384','P',0,0,'sw166hf','08:00 PM - 09:00 PM','Monday, July 8, 2019','09:00 AM - 10:00 AM','Tuesday, July 9, 2019','12.0','',1,'2019-07-08 05:06:48','2019-07-08 04:36:48','0000-00-00','card',24,24,0,0,0,24,0,0,24,0,'online'),
(66,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261230','P',0,0,'sw166hf','09:00 PM - 10:00 PM','Monday 8 July 2019','10:00 AM - 11:00 AM','Wednesday 10 July 2019','15.0','',1,'2019-07-08 06:15:34','2019-07-08 05:45:34','0000-00-00','card',27,27,0,0,0,27,0,0,27,0,'online'),
(67,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261950','P',0,0,'sw166hf','09:00 PM - 10:00 PM','Monday 8 July 2019','09:00 AM - 10:00 AM','Tuesday 9 July 2019','12.0','',1,'2019-07-08 06:17:50','2019-07-08 05:47:50','0000-00-00','card',24,24,0,0,0,24,0,0,24,0,'online'),
(68,'15d58065615789b2e983be86d54f62fd','ad1a62b603be8654c7700d38012fad4d','','','00271772','P',0,0,'sw166hf','07:00 AM - 08:00 AM','Tuesday 9 July 2019','12:00 PM - 01:00 PM','Tuesday 9 July 2019','5.0','',1,'2019-07-08 06:19:56','2019-07-08 05:49:56','0000-00-00','card',34,34,0,0,0,34,0,0,34,0,'online'),
(69,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261364','P',0,0,'sw166hf','09:00 PM - 10:00 PM','Monday 8 July 2019','08:00 AM - 09:00 AM','Wednesday 10 July 2019','15.0','',1,'2019-07-08 06:34:10','2019-07-08 06:04:10','0000-00-00','card',33,33,0,0,0,33,0,0,33,0,'online'),
(70,'c52a41a05f536d51d109a1fdf515b059','636455c2c8f475c160384faa596beda2','','','143143','P',0,0,'10 Streatham Green, Streatham High Road, LONDON','11:16','Tuesday, 7 May 2019','11:16','Tuesday, 8 May 2019','0.00','Tesing dsadas dfsdf',1,'2019-07-09 08:29:36','2019-07-08 19:59:36','0000-00-00','Card',5,10,2,0,10,8,2,0,10,0,'online'),
(71,'0','b1175828637b947477bc699a6ed491fc','','','0','A',0,0,'','','','','Sunday, July 14, 2019','0.0','',0,'2019-07-11 01:04:19','2019-07-10 12:34:19','0000-00-00','0',0,0,0,0,0,0,0,0,0,0,'offline'),
(72,'33e59cfa62649da6c498a18ba3cccfbc','33cc18f84050e0110b8fdf4525212ff6','','','00550390','A',0,0,'','','','','Sunday 14 July 2019','0.0','',0,'2019-07-11 01:05:28','2019-07-10 12:35:28','0000-00-00','cash,',9,9,0,0,9,9,0,0,0,9,'offline'),
(73,'33e59cfa62649da6c498a18ba3cccfbc','33cc18f84050e0110b8fdf4525212ff6','','','00550324','A',0,0,'','','','','Sunday 14 July 2019','0.0','',0,'2019-07-11 01:08:14','2019-07-14 01:50:42','0000-00-00','cash,',18,18,0,0,18,18,0,0,0,18,'offline'),
(74,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261625','P',0,0,'sw166hf','07:00 AM - 08:00 AM','Thursday, July 11, 2019','08:00 AM - 09:00 AM','Friday, July 12, 2019','12.0','',1,'2019-07-11 01:10:19','2019-07-10 12:40:19','0000-00-00','card',18,18,0,0,0,18,0,0,18,0,'online'),
(75,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261352','P',0,0,'sw166hf','07:00 AM - 08:00 AM','Thursday, July 11, 2019','09:00 AM - 10:00 AM','Friday, July 12, 2019','12.0','',1,'2019-07-11 01:15:39','2019-07-10 12:45:39','0000-00-00','card',30,30,0,0,0,30,0,0,30,0,'online'),
(76,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261690','P',0,0,'sw166hf','09:00 AM - 10:00 AM','Thursday, July 11, 2019','01:00 PM - 02:00 PM','Thursday, July 11, 2019','10.0','',1,'2019-07-11 01:18:50','2019-07-10 12:48:50','0000-00-00','card',22,22,0,0,0,22,0,0,22,0,'online'),
(77,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','005109900','P',0,0,'sw166hf','1','12','12','12','12','at',1,'2019-07-11 01:24:24','2019-07-10 12:54:24','0000-00-00','cash',120,120,12,1,1,123,234,12,1,12,'online'),
(78,'33e59cfa62649da6c498a18ba3cccfbc','ad1a62b603be8654c7700d38012fad4d','','','00261733','A',0,0,'sw166hf','12:00 PM - 01:00 PM','Thursday 11 July 2019','04:00 PM - 05:00 PM','Thursday 11 July 2019','10.0','',1,'2019-07-11 10:56:30','2019-07-25 06:30:53','0000-00-00','card',19,19,0,0,0,19,0,0,19,0,'online'),
(79,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','','','00311928','A',0,0,'sw166hf','01:00 PM - 02:00 PM','Thursday 11 July 2019','07:00 PM - 08:00 PM','Thursday 11 July 2019','15.0','',1,'2019-07-11 11:34:08','2019-07-19 07:47:16','0000-00-00','card',27,27,0,0,0,27,0,0,27,0,'online'),
(80,'2a72296509f2b869dce3755a226b6182','a870f977cb26475a2da75123b632855e','','','00580958','A',0,0,'','','','','Saturday 13 July 2019','0.0','',0,'2019-07-11 11:36:00','2019-07-10 23:06:00','0000-00-00','AccountCredit',0,6,0,0,6,6,0,6,0,0,'offline'),
(82,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','','00311959','ID',4,0,'sw166hf','05:00 PM - 06:00 PM','Sunday 14 July 2019','07:00 AM - 08:00 AM','Monday 15 July 2019','10.0','',1,'2019-07-14 03:34:11','2019-07-19 07:48:00','0000-00-00','card',14,14,0,0,0,14,0,0,14,0,'online'),
(83,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','','00311600','A',1,0,'sw166hf','08:00 PM - 09:00 PM','Sunday 14 July 2019','04:00 PM - 05:00 PM','Monday 15 July 2019','10.0','',1,'2019-07-14 04:03:08','2019-07-19 04:28:25','0000-00-00','card',16,16,0,0,0,16,0,0,16,0,'online'),
(84,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','','00311322','A',1,0,'sw166hf','10:00 AM - 11:00 AM','Monday 15 July 2019','11:00 AM - 12:00 PM','Tuesday 16 July 2019','10.0','',1,'2019-07-14 04:03:48','2019-07-14 05:13:44','0000-00-00','card',19,19,0,0,0,19,0,0,19,0,'online'),
(85,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','','00311521','A',2,0,'sw166hf','10:00 AM - 11:00 AM','Wednesday 17 July 2019','04:00 PM - 05:00 PM','Wednesday 17 July 2019','15.0','',1,'2019-07-14 04:04:15','2019-07-14 04:04:54','0000-00-00','card',20,20,0,0,0,20,0,0,20,0,'online'),
(86,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','be4f6f602d4f1911139fc02c692fdecc','00311908','DL',7,0,'sw166hf','04:00 PM - 05:00 PM','Wednesday 17 July 2019','10:00 PM - 11:00 PM','Wednesday 17 July 2019','15.0','rama',1,'2019-07-17 02:20:22','2019-07-17 02:29:21','0000-00-00','',32,32,0,0,0,32,0,0,0,0,'online'),
(87,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','be4f6f602d4f1911139fc02c692fdecc','00311370','DL',7,0,'sw166hf','04:00 PM - 05:00 PM','Wednesday 17 July 2019','10:00 PM - 11:00 PM','Wednesday 17 July 2019','15.0','',1,'2019-07-17 02:36:17','2019-07-17 02:48:45','0000-00-00','',27,27,0,0,0,27,0,0,0,0,'online'),
(88,'2a72296509f2b869dce3755a226b6182','e43adcdff1031113bb25d10f84777339','','','00570737','DL',0,0,'sw166lg','','','','Friday 19 July 2019','0.0','',0,'2019-07-17 02:58:24','2019-07-17 02:59:17','0000-00-00','',0,18,10,0,28,18,10,-18,8,10,'offline'),
(89,'2a72296509f2b869dce3755a226b6182','e43adcdff1031113bb25d10f84777339','','','00570669','DL',0,0,'sw166lg','','','','Friday 19 July 2019','0.0','',0,'2019-07-17 03:00:01','2019-07-17 03:00:25','0000-00-00','',5,25,0,0,25,25,0,-20,20,0,'offline'),
(90,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','','00311575','A',1,0,'sw166hf','04:00 PM - 05:00 PM','Friday 19 July 2019','10:00 PM - 11:00 PM','Friday 19 July 2019','15.0','',1,'2019-07-19 02:27:09','2019-07-19 05:41:36','0000-00-00','card',29,29,0,0,0,29,0,0,29,0,'online'),
(91,'2a72296509f2b869dce3755a226b6182','ad1a62b603be8654c7700d38012fad4d','be4f6f602d4f1911139fc02c692fdecc','be4f6f602d4f1911139fc02c692fdecc','00311926','ID',5,0,'sw166hf','7:00 AM - 09:00 AM','Sunday 21 July 2019','05:00 PM - 07:00 PM','Tuesday 23 July 2019','0.0','',1,'2019-07-20 02:41:32','2019-07-20 02:59:06','0000-00-00','card',2,2,0,0,0,2,0,0,2,0,'online'),
(92,'1517ca862f03d56fc8676c11dd43fcec','1d5300c10af2d77d8a492056e8cd9427','','','00510392','A',0,0,'uk','','','','Thursday, 25 July 2019','0.0','',0,'2019-07-23 11:24:08','2019-07-23 10:54:08','0000-00-00','',0,0,0,0,0,0,0,0,0,0,'offline');

/*Table structure for table `tbl_user_purchase_orders` */

DROP TABLE IF EXISTS `tbl_user_purchase_orders`;

CREATE TABLE `tbl_user_purchase_orders` (
  `orid` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orid`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user_purchase_orders` */

insert  into `tbl_user_purchase_orders`(`orid`,`userid`,`vendor_id`,`product_id`,`m_product_id`,`quantity`,`amount`,`total_amount`,`weight`,`order_date_time`,`order_status`,`order_transaction_id`,`read_status`,`created_at`,`updated_at`) values 
(1,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',6,0,1,3.25,6.75,'','2019-05-06 02:34:36','P','00160407',0,'2019-05-06 02:34:36','2019-05-06 02:04:36'),
(2,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',8,0,1,3.5,6.75,'','2019-05-06 02:34:36','P','00160407',0,'2019-05-06 02:34:36','2019-05-06 02:04:36'),
(3,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',6,0,1,3.25,7.75,'','2019-05-06 02:52:01','P','00160686',0,'2019-05-06 02:52:01','2019-05-06 02:22:01'),
(4,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',7,0,1,4.5,7.75,'','2019-05-06 02:52:01','P','00160686',0,'2019-05-06 02:52:01','2019-05-06 02:22:01'),
(5,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',6,0,1,3.25,12.25,'','2019-05-06 02:52:39','P','00160633',0,'2019-05-06 02:52:39','2019-05-06 02:22:39'),
(6,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',7,0,2,9,12.25,'','2019-05-06 02:52:39','P','00160633',0,'2019-05-06 02:52:39','2019-05-06 02:22:39'),
(7,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',4,0,5,100,100,'','2019-06-05 01:59:18','P','00510114',0,'2019-06-05 01:59:18','2019-06-05 01:29:18'),
(8,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',4,0,5,100,100,'','2019-06-05 02:03:19','P','00510583',0,'2019-06-05 02:03:19','2019-06-05 01:33:19'),
(9,'8da340804814b911abb2f07e4dea367d','1517ca862f03d56fc8676c11dd43fcec',4,0,5,100,100,'','2019-06-05 02:05:50','P','00510667',0,'2019-06-05 02:05:50','2019-06-05 01:35:50'),
(10,'5ff41cdd52af01a2271ec9a6a43e775b','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-06-07 11:13:32','P','00510758',0,'2019-06-07 11:13:32','2019-06-06 22:43:32'),
(11,'8da340804814b911abb2f07e4dea367d','7c1206aa442cde35a4439609eb2597a5',4,0,1,8.95,11.45,'','2019-06-14 01:22:18','P','00010774',0,'2019-06-14 01:22:18','2019-06-14 00:52:18'),
(12,'8da340804814b911abb2f07e4dea367d','7c1206aa442cde35a4439609eb2597a5',5,0,1,2.5,11.45,'','2019-06-14 01:22:18','P','00010774',0,'2019-06-14 01:22:18','2019-06-14 00:52:18'),
(13,'8da340804814b911abb2f07e4dea367d','7c1206aa442cde35a4439609eb2597a5',4,0,1,8.95,11.45,'','2019-06-14 01:22:26','P','00010422',0,'2019-06-14 01:22:26','2019-06-14 00:52:26'),
(14,'8da340804814b911abb2f07e4dea367d','7c1206aa442cde35a4439609eb2597a5',5,0,1,2.5,11.45,'','2019-06-14 01:22:26','P','00010422',0,'2019-06-14 01:22:26','2019-06-14 00:52:26'),
(15,'a262599ab9fbe4ca5e9fb734b0e2f395','7c1206aa442cde35a4439609eb2597a5',4,0,1,8.95,11.45,'','2019-06-14 01:24:55','P','00010950',0,'2019-06-14 01:24:55','2019-06-14 00:54:55'),
(16,'a262599ab9fbe4ca5e9fb734b0e2f395','7c1206aa442cde35a4439609eb2597a5',5,0,1,2.5,11.45,'','2019-06-14 01:24:55','P','00010950',0,'2019-06-14 01:24:55','2019-06-14 00:54:55'),
(17,'fd99fcbe443b4c06de5b72b698761db9','1517ca862f03d56fc8676c11dd43fcec',4,0,5,110,110,'','2019-06-22 01:35:52','P','00510785',0,'2019-06-22 01:35:52','2019-06-22 01:05:52'),
(32,'1d5300c10af2d77d8a492056e8cd9427','c52a41a05f536d51d109a1fdf515b059',6,0,2,3.5,10,'','2019-06-28 11:49:00','P','00162252',0,'2019-06-28 11:49:00','2019-06-27 23:19:00'),
(33,'1d5300c10af2d77d8a492056e8cd9427','c52a41a05f536d51d109a1fdf515b059',6,0,2,3.5,10,'','2019-06-28 11:49:00','P','00162252',0,'2019-06-28 11:49:00','2019-06-27 23:19:00'),
(34,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',2,0,1,250,120,'','2019-06-28 12:10:03','DL','0123456',0,'2019-06-28 12:10:03','2019-06-27 23:40:03'),
(35,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,900,120,'','2019-06-28 12:10:03','DL','0123456',0,'2019-06-28 12:10:03','2019-06-27 23:40:03'),
(36,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',2,0,1,250,120,'','2019-06-28 12:12:19','DL','0123456',0,'2019-06-28 12:12:19','2019-06-27 23:42:19'),
(37,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,900,120,'','2019-06-28 12:12:19','DL','0123456',0,'2019-06-28 12:12:19','2019-06-27 23:42:19'),
(38,'22c39f18a6504ecedd2f986db7158ff5','0',4,0,6,120,0,'','2019-06-28 12:28:56','P','0',0,'2019-06-28 12:28:56','2019-06-27 23:58:56'),
(39,'22c39f18a6504ecedd2f986db7158ff5','0',5,0,2,100,0,'','2019-06-28 12:28:56','P','0',0,'2019-06-28 12:28:56','2019-06-27 23:58:56'),
(40,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,6,120,131,'','2019-06-28 01:59:36','A','00510990',0,'2019-06-28 01:59:36','2019-06-28 01:29:36'),
(41,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',5,0,2,100,131,'','2019-06-28 01:59:36','A','00510990',0,'2019-06-28 01:59:36','2019-06-28 01:29:36'),
(42,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,6,120,220,'','2019-06-28 02:14:22','P','00510897',0,'2019-06-28 02:14:22','2019-06-28 01:44:22'),
(43,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',5,0,2,100,220,'','2019-06-28 02:14:22','P','00510897',0,'2019-06-28 02:14:22','2019-06-28 01:44:22'),
(44,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,6,120,283.5,'','2019-06-28 02:19:56','P','00510593',0,'2019-06-28 02:19:56','2019-06-28 01:49:56'),
(45,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',5,0,3,150,283.5,'','2019-06-28 02:19:56','P','00510593',0,'2019-06-28 02:19:56','2019-06-28 01:49:56'),
(46,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',4,0,6,120,252,'','2019-06-28 02:25:35','P','00510175',0,'2019-06-28 02:25:35','2019-06-28 01:55:35'),
(47,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',5,0,3,120,252,'','2019-06-28 02:25:35','P','00510175',0,'2019-06-28 02:25:35','2019-06-28 01:55:35'),
(48,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',4,0,6,120,270,'','2019-06-28 02:36:02','DL','00510373',0,'2019-06-28 02:36:02','2019-06-28 02:06:02'),
(49,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',5,0,3,150,270,'','2019-06-28 02:36:02','DL','00510373',0,'2019-06-28 02:36:02','2019-06-28 02:06:02'),
(50,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',4,0,6,120,100,'','2019-06-28 02:46:12','P','00510761',0,'2019-06-28 02:46:12','2019-06-28 02:16:12'),
(51,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',5,0,2,80,100,'','2019-06-28 02:46:12','P','00510761',0,'2019-06-28 02:46:12','2019-06-28 02:16:12'),
(52,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-06-29 02:10:20','P','00510367',0,'2019-06-29 02:10:20','2019-06-29 01:40:20'),
(53,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-29 02:18:47','RJ','00510138',0,'2019-06-29 02:18:47','2019-06-29 01:48:47'),
(54,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,4,80,80,'','2019-06-29 02:43:50','RJ','00510580',0,'2019-06-29 02:43:50','2019-06-29 02:13:50'),
(55,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',2,0,1,250,120,'','2019-06-29 02:46:01','DL','0123456',0,'2019-06-29 02:46:01','2019-06-29 02:16:01'),
(56,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,900,120,'','2019-06-29 02:46:01','DL','0123456',0,'2019-06-29 02:46:01','2019-06-29 02:16:01'),
(57,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-06-29 02:48:51','P','00510147',0,'2019-06-29 02:48:51','2019-06-29 02:18:51'),
(58,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-06-29 05:57:11','P','00510164',0,'2019-06-29 05:57:11','2019-06-29 05:27:11'),
(59,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-29 05:57:36','P','00510251',0,'2019-06-29 05:57:36','2019-06-29 05:27:36'),
(60,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-06-30 01:06:28','P','00510198',0,'2019-06-30 01:06:28','2019-06-30 00:36:28'),
(61,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-06-30 01:08:01','P','00510631',0,'2019-06-30 01:08:01','2019-06-30 00:38:01'),
(62,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 01:08:26','P','00510772',0,'2019-06-30 01:08:26','2019-06-30 00:38:26'),
(63,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 01:12:55','P','00510573',0,'2019-06-30 01:12:55','2019-06-30 00:42:55'),
(64,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 01:49:58','P','00510234',0,'2019-06-30 01:49:58','2019-06-30 01:19:58'),
(65,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 02:00:40','P','00510561',0,'2019-06-30 02:00:40','2019-06-30 01:30:40'),
(66,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 02:01:14','P','00510213',0,'2019-06-30 02:01:14','2019-06-30 01:31:14'),
(67,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 02:01:45','P','00510653',0,'2019-06-30 02:01:45','2019-06-30 01:31:45'),
(68,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 02:02:56','DL','00510783',0,'2019-06-30 02:02:56','2019-06-30 01:32:56'),
(69,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-06-30 02:03:22','DL','00510361',0,'2019-06-30 02:03:22','2019-06-30 01:33:22'),
(70,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',2,0,1,250,120,'','2019-06-30 02:17:33','DL','0123456',0,'2019-06-30 02:17:33','2019-06-30 01:47:33'),
(71,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,900,120,'','2019-06-30 02:17:33','DL','0123456',0,'2019-06-30 02:17:33','2019-06-30 01:47:33'),
(72,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,140,'','2019-06-30 06:42:33','P','00510400',0,'2019-06-30 06:42:33','2019-06-30 06:12:33'),
(73,'22c39f18a6504ecedd2f986db7158ff5','1517ca862f03d56fc8676c11dd43fcec',5,0,2,100,140,'','2019-06-30 06:42:33','P','00510400',0,'2019-06-30 06:42:33','2019-06-30 06:12:33'),
(74,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,140,'','2019-06-30 06:55:39','P','00510571',0,'2019-06-30 06:55:39','2019-06-30 06:25:39'),
(75,'3e377cbef8c616f026d0c85c82a9da32','1517ca862f03d56fc8676c11dd43fcec',5,0,2,100,140,'','2019-06-30 06:55:39','P','00510571',0,'2019-06-30 06:55:39','2019-06-30 06:25:39'),
(76,'4f77dc559980cf78be82b04b12ff7e77','1517ca862f03d56fc8676c11dd43fcec',4,0,3,60,60,'','2019-07-01 10:49:06','DL','00510300',0,'2019-07-01 10:49:06','2019-06-30 22:19:06'),
(77,'4f77dc559980cf78be82b04b12ff7e77','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,140,'','2019-07-01 10:52:59','P','00510799',0,'2019-07-01 10:52:59','2019-06-30 22:22:59'),
(78,'4f77dc559980cf78be82b04b12ff7e77','1517ca862f03d56fc8676c11dd43fcec',5,0,2,100,140,'','2019-07-01 10:52:59','P','00510799',0,'2019-07-01 10:52:59','2019-06-30 22:22:59'),
(79,'31b0b426421f1997858f1ca735fe3eee','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,140,'','2019-07-01 12:04:12','P','00510619',0,'2019-07-01 12:04:12','2019-06-30 23:34:12'),
(80,'31b0b426421f1997858f1ca735fe3eee','1517ca862f03d56fc8676c11dd43fcec',5,0,2,100,140,'','2019-07-01 12:04:12','P','00510619',0,'2019-07-01 12:04:12','2019-06-30 23:34:12'),
(81,'31b0b426421f1997858f1ca735fe3eee','1517ca862f03d56fc8676c11dd43fcec',4,0,1,20,70,'','2019-07-01 12:05:16','DL','00510652',0,'2019-07-01 12:05:16','2019-06-30 23:35:16'),
(82,'31b0b426421f1997858f1ca735fe3eee','1517ca862f03d56fc8676c11dd43fcec',5,0,1,50,70,'','2019-07-01 12:05:16','DL','00510652',0,'2019-07-01 12:05:16','2019-06-30 23:35:16'),
(83,'7819524bfb5869792a1589e831d4d29d','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,90,'','2019-07-01 12:09:01','P','00510823',0,'2019-07-01 12:09:01','2019-06-30 23:39:01'),
(84,'7819524bfb5869792a1589e831d4d29d','1517ca862f03d56fc8676c11dd43fcec',5,0,1,50,90,'','2019-07-01 12:09:01','P','00510823',0,'2019-07-01 12:09:01','2019-06-30 23:39:01'),
(85,'7819524bfb5869792a1589e831d4d29d','1517ca862f03d56fc8676c11dd43fcec',4,0,1,20,70,'','2019-07-01 12:09:59','DL','00510766',0,'2019-07-01 12:09:59','2019-06-30 23:39:59'),
(86,'7819524bfb5869792a1589e831d4d29d','1517ca862f03d56fc8676c11dd43fcec',5,0,1,50,70,'','2019-07-01 12:09:59','DL','00510766',0,'2019-07-01 12:09:59','2019-06-30 23:39:59'),
(87,'7819524bfb5869792a1589e831d4d29d','1517ca862f03d56fc8676c11dd43fcec',5,0,1,50,50,'','2019-07-01 12:10:31','P','00520760',0,'2019-07-01 12:10:31','2019-06-30 23:40:31'),
(90,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',6,0,2,3.5,10,'','2019-07-03 12:09:11','P','001614343',0,'2019-07-03 12:09:11','2019-07-02 23:39:11'),
(91,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',6,0,2,3.5,10,'','2019-07-03 12:09:11','P','001614343',0,'2019-07-03 12:09:11','2019-07-02 23:39:11'),
(92,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-03 02:13:01','RJ','gs',0,'2019-07-03 02:13:01','2019-07-03 01:43:01'),
(93,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-03 02:13:01','RJ','gs',0,'2019-07-03 02:13:01','2019-07-03 01:43:01'),
(94,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-08 11:23:41','RJ','gs',0,'2019-07-08 11:23:41','2019-07-07 22:53:41'),
(95,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-08 11:23:41','RJ','gs',0,'2019-07-08 11:23:41','2019-07-07 22:53:41'),
(96,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-08 11:25:56','RJ','gs',0,'2019-07-08 11:25:56','2019-07-07 22:55:56'),
(97,'6ca053062d158c1253f32336f68f80f6','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-08 11:25:56','RJ','gs',0,'2019-07-08 11:25:56','2019-07-07 22:55:56'),
(98,'f21d4c072094278117ede291dd48e6e5','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-07-08 11:26:46','P','00510940',0,'2019-07-08 11:26:46','2019-07-07 22:56:46'),
(99,'2a7e8591e276f85efafcee844b16eaff','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,40,'','2019-07-08 11:38:52','P','00510721',0,'2019-07-08 11:38:52','2019-07-07 23:08:52'),
(100,'739f7a435751ba7eccb56111b1e9e1dd','1517ca862f03d56fc8676c11dd43fcec',4,0,2,40,190,'','2019-07-08 11:39:45','P','00510705',0,'2019-07-08 11:39:45','2019-07-07 23:09:45'),
(101,'739f7a435751ba7eccb56111b1e9e1dd','1517ca862f03d56fc8676c11dd43fcec',5,0,3,150,190,'','2019-07-08 11:39:45','P','00510705',0,'2019-07-08 11:39:45','2019-07-07 23:09:45'),
(102,'ad1a62b603be8654c7700d38012fad4d','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-08 01:07:51','P','gs',0,'2019-07-08 01:07:51','2019-07-08 00:37:51'),
(103,'ad1a62b603be8654c7700d38012fad4d','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,0,'','2019-07-08 01:07:51','P','gs',0,'2019-07-08 01:07:51','2019-07-08 00:37:51'),
(104,'ad1a62b603be8654c7700d38012fad4d','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,120,'','2019-07-08 03:48:14','A','00510333',0,'2019-07-08 03:48:14','2019-07-08 03:18:14'),
(105,'ad1a62b603be8654c7700d38012fad4d','1517ca862f03d56fc8676c11dd43fcec',6,0,2,3.5,120,'','2019-07-08 03:48:14','A','00510333',0,'2019-07-08 03:48:14','2019-07-08 03:18:14'),
(106,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',6,0,2,3.5,120,'','2019-07-08 03:58:51','P','00510999',0,'2019-07-08 03:58:51','2019-07-08 03:28:51'),
(107,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',6,0,2,3.5,120,'','2019-07-08 03:58:51','P','00510999',0,'2019-07-08 03:58:51','2019-07-08 03:28:51'),
(108,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',6,0,2,3.5,120,'','2019-07-08 04:25:35','P','00510998',0,'2019-07-08 04:25:35','2019-07-08 03:55:35'),
(109,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',6,0,2,3.5,120,'','2019-07-08 04:25:35','P','00510998',0,'2019-07-08 04:25:35','2019-07-08 03:55:35'),
(110,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',4,0,2,24,34,'','2019-07-08 04:43:53','P','00271730',0,'2019-07-08 04:43:53','2019-07-08 04:13:53'),
(111,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',5,0,2,10,34,'','2019-07-08 04:43:53','P','00271730',0,'2019-07-08 04:43:53','2019-07-08 04:13:53'),
(112,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,30,'','2019-07-08 04:58:14','P','00261933',0,'2019-07-08 04:58:14','2019-07-08 04:28:14'),
(113,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,2,12,30,'','2019-07-08 04:58:14','P','00261933',0,'2019-07-08 04:58:14','2019-07-08 04:28:14'),
(114,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,24,'','2019-07-08 05:02:37','P','00261930',0,'2019-07-08 05:02:37','2019-07-08 04:32:37'),
(115,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,1,6,24,'','2019-07-08 05:02:37','P','00261930',0,'2019-07-08 05:02:37','2019-07-08 04:32:37'),
(116,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,24,'','2019-07-08 05:06:48','P','00261384',0,'2019-07-08 05:06:48','2019-07-08 04:36:48'),
(117,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,1,6,24,'','2019-07-08 05:06:48','P','00261384',0,'2019-07-08 05:06:48','2019-07-08 04:36:48'),
(118,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,27,'','2019-07-08 06:15:34','P','00261230',0,'2019-07-08 06:15:34','2019-07-08 05:45:34'),
(119,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,1,6,27,'','2019-07-08 06:15:34','P','00261230',0,'2019-07-08 06:15:34','2019-07-08 05:45:34'),
(120,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,24,'','2019-07-08 06:17:50','P','00261950',0,'2019-07-08 06:17:50','2019-07-08 05:47:50'),
(121,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,1,6,24,'','2019-07-08 06:17:50','P','00261950',0,'2019-07-08 06:17:50','2019-07-08 05:47:50'),
(122,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',4,0,2,24,34,'','2019-07-08 06:19:56','P','00271772',0,'2019-07-08 06:19:56','2019-07-08 05:49:56'),
(123,'ad1a62b603be8654c7700d38012fad4d','15d58065615789b2e983be86d54f62fd',5,0,1,5,34,'','2019-07-08 06:19:56','P','00271772',0,'2019-07-08 06:19:56','2019-07-08 05:49:56'),
(124,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,4,12,33,'','2019-07-08 06:34:10','P','00261364',0,'2019-07-08 06:34:10','2019-07-08 06:04:10'),
(125,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,1,6,33,'','2019-07-08 06:34:10','P','00261364',0,'2019-07-08 06:34:10','2019-07-08 06:04:10'),
(126,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',6,0,2,3.5,10,'','2019-07-09 08:29:36','P','143143',0,'2019-07-09 08:29:36','2019-07-08 19:59:36'),
(127,'636455c2c8f475c160384faa596beda2','c52a41a05f536d51d109a1fdf515b059',6,0,2,3.5,10,'','2019-07-09 08:29:36','P','143143',0,'2019-07-09 08:29:36','2019-07-08 19:59:36'),
(128,'b1175828637b947477bc699a6ed491fc','0',4,0,2,6,0,'','2019-07-11 01:04:19','P','0',0,'2019-07-11 01:04:19','2019-07-10 12:34:19'),
(129,'33cc18f84050e0110b8fdf4525212ff6','33e59cfa62649da6c498a18ba3cccfbc',4,0,3,9,9,'','2019-07-11 01:05:28','P','00550390',0,'2019-07-11 01:05:28','2019-07-10 12:35:28'),
(130,'33cc18f84050e0110b8fdf4525212ff6','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,18,'','2019-07-11 01:08:14','A','00550324',0,'2019-07-11 01:08:14','2019-07-10 12:38:14'),
(131,'33cc18f84050e0110b8fdf4525212ff6','33e59cfa62649da6c498a18ba3cccfbc',5,0,2,12,18,'','2019-07-11 01:08:14','A','00550324',0,'2019-07-11 01:08:14','2019-07-10 12:38:14'),
(132,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,18,'','2019-07-11 01:10:19','P','00261625',0,'2019-07-11 01:10:19','2019-07-10 12:40:19'),
(133,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,30,'','2019-07-11 01:15:39','P','00261352',0,'2019-07-11 01:15:39','2019-07-10 12:45:39'),
(134,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,2,12,30,'','2019-07-11 01:15:39','P','00261352',0,'2019-07-11 01:15:39','2019-07-10 12:45:39'),
(135,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,2,6,22,'','2019-07-11 01:18:50','P','00261690',0,'2019-07-11 01:18:50','2019-07-10 12:48:50'),
(136,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',5,0,1,6,22,'','2019-07-11 01:18:50','P','00261690',0,'2019-07-11 01:18:50','2019-07-10 12:48:50'),
(137,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',6,0,2,3.5,120,'','2019-07-11 01:24:24','P','005109900',0,'2019-07-11 01:24:24','2019-07-10 12:54:24'),
(138,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',6,0,2,3.5,120,'','2019-07-11 01:24:24','P','005109900',0,'2019-07-11 01:24:24','2019-07-10 12:54:24'),
(139,'ad1a62b603be8654c7700d38012fad4d','33e59cfa62649da6c498a18ba3cccfbc',4,0,3,9,19,'','2019-07-11 10:56:30','A','00261733',0,'2019-07-11 10:56:30','2019-07-10 22:26:30'),
(140,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,3,6,27,'','2019-07-11 11:34:08','A','00311928',0,'2019-07-11 11:34:08','2019-07-10 23:04:08'),
(141,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',6,0,1,6,27,'','2019-07-11 11:34:08','A','00311928',0,'2019-07-11 11:34:08','2019-07-10 23:04:08'),
(142,'a870f977cb26475a2da75123b632855e','2a72296509f2b869dce3755a226b6182',5,0,2,6,6,'','2019-07-11 11:36:00','P','00580958',0,'2019-07-11 11:36:00','2019-07-10 23:06:00'),
(143,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,2,4,19,'','2019-07-14 01:33:47','A','00311650',0,'2019-07-14 01:33:47','2019-07-14 01:03:47'),
(144,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,2,4,14,'','2019-07-14 03:34:11','ID','00311959',0,'2019-07-14 03:34:11','2019-07-14 03:04:11'),
(145,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,3,6,16,'','2019-07-14 04:03:08','A','00311600',0,'2019-07-14 04:03:08','2019-07-14 03:33:08'),
(146,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',5,0,3,9,19,'','2019-07-14 04:03:48','A','00311322',0,'2019-07-14 04:03:48','2019-07-14 03:33:48'),
(147,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,1,2,20,'','2019-07-14 04:04:15','A','00311521',0,'2019-07-14 04:04:15','2019-07-14 03:34:15'),
(148,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',5,0,1,3,20,'','2019-07-14 04:04:15','A','00311521',0,'2019-07-14 04:04:15','2019-07-14 03:34:15'),
(149,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,4,8,32,'','2019-07-17 02:20:22','DL','00311908',0,'2019-07-17 02:20:22','2019-07-17 01:50:22'),
(150,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',5,0,3,9,32,'','2019-07-17 02:20:22','DL','00311908',0,'2019-07-17 02:20:22','2019-07-17 01:50:22'),
(151,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,3,6,27,'','2019-07-17 02:36:17','DL','00311370',0,'2019-07-17 02:36:17','2019-07-17 02:06:17'),
(152,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',5,0,2,6,27,'','2019-07-17 02:36:17','DL','00311370',0,'2019-07-17 02:36:17','2019-07-17 02:06:17'),
(153,'e43adcdff1031113bb25d10f84777339','2a72296509f2b869dce3755a226b6182',4,0,2,10,18,'','2019-07-17 02:58:24','DL','00570737',0,'2019-07-17 02:58:24','2019-07-17 02:28:24'),
(154,'e43adcdff1031113bb25d10f84777339','2a72296509f2b869dce3755a226b6182',5,0,6,18,18,'','2019-07-17 02:58:24','DL','00570737',0,'2019-07-17 02:58:24','2019-07-17 02:28:24'),
(155,'e43adcdff1031113bb25d10f84777339','2a72296509f2b869dce3755a226b6182',4,0,2,4,25,'','2019-07-17 03:00:01','DL','00570669',0,'2019-07-17 03:00:01','2019-07-17 02:30:01'),
(156,'e43adcdff1031113bb25d10f84777339','2a72296509f2b869dce3755a226b6182',5,0,7,21,25,'','2019-07-17 03:00:01','DL','00570669',0,'2019-07-17 03:00:01','2019-07-17 02:30:01'),
(157,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,4,8,29,'','2019-07-19 02:27:09','A','00311575',0,'2019-07-19 02:27:09','2019-07-19 01:57:09'),
(158,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',5,0,2,6,29,'','2019-07-19 02:27:09','A','00311575',0,'2019-07-19 02:27:09','2019-07-19 01:57:09'),
(159,'ad1a62b603be8654c7700d38012fad4d','2a72296509f2b869dce3755a226b6182',4,0,1,2,2,'','2019-07-20 02:41:32','ID','00311926',0,'2019-07-20 02:41:32','2019-07-20 02:11:32');

/*Table structure for table `tbl_users_master` */

DROP TABLE IF EXISTS `tbl_users_master`;

CREATE TABLE `tbl_users_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `family_type` varchar(50) NOT NULL,
  `maxCreditValue` float DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `phone_num` (`phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_users_master` */

insert  into `tbl_users_master`(`id`,`type`,`unique_id`,`first_name`,`last_name`,`image`,`favourites`,`location`,`phone_num`,`house_no`,`street`,`landmark`,`city`,`state`,`address`,`address_full`,`pincode`,`gender`,`dob`,`age`,`email`,`created_by`,`created_date`,`modified_date`,`profile_pic`,`latitude`,`longitude`,`subscription`,`terms`,`alternate_phone_num`,`family_phone_num`,`alternate_email`,`languages_known`,`qualification`,`website`,`profession`,`workadd`,`work_address`,`income_group`,`family_type`,`maxCreditValue`) values 
(1,'','','Varaprasad','','','','','07550851606','','','','','','6 Streatham Green, Streatham High Road, LONDON','',0,'','0000-00-00',0,'rvp1506@gmail.com',0,'0000-00-00 00:00:00','2019-05-05 12:52:04','','51.428341599999996','-0.1316432',0,0,'','','','','','','','','','','',0),
(2,'','','Prasanna','','','','','07450207789','','','','','','6 Streatham Green, Streatham High Road, LONDON','',0,'','0000-00-00',0,'prasanna@vclean4u.uk',0,'0000-00-00 00:00:00','2019-05-05 14:10:19','','51.428341599999996','-0.1316432',0,0,'','','','','','','','','','','',0),
(3,'','','Dileep','','','','','07438382699','','','','','','10 Streatham Green, Streatham High Road, LONDON','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-02 23:39:11','','','',0,0,'','','','','','','','','','','',0),
(4,'','','sree','','','','','9523550369','','','','','','W12','',0,'','0000-00-00',0,'sree.donthula15@gmail.com',0,'0000-00-00 00:00:00','2019-05-06 22:33:16','','null','null',0,0,'','','','','','','','','','','',0),
(5,'','','srikanth','','','','','9553550369','','','','','','W12','',0,'','0000-00-00',0,'sreekanth@fovea.in',0,'0000-00-00 00:00:00','2019-05-06 23:04:54','','null','null',0,0,'','','','','','','','','','','',0),
(6,'','','userchecking1','','','','','1111','','','','','','11 Streatham Green, Streatham High Road LONDON ','',0,'','0000-00-00',0,'userchecking@gmail.com',0,'0000-00-00 00:00:00','2019-07-09 07:06:08','08072019125424cartoon3.jpg','51.428689999999996','-0.13136',0,0,'','','','','','','','','','','',12),
(7,'','','sample','','','','','2222','','','','','','11 Streatham Green, Streatham High Road, LONDON','',0,'','0000-00-00',0,'sample@gmail.com',0,'0000-00-00 00:00:00','2019-05-30 23:16:50','','51.428341599999996','-0.1316432',0,0,'','','','','','','','','','','',0),
(8,'','','check','','','','','3333','','','','','','sw166lg','',0,'','0000-00-00',0,'check@gmail.com',0,'0000-00-00 00:00:00','2019-06-11 02:31:27','','null','null',0,0,'','','','','','','','','','','',0),
(9,'','','test','','','','','333','','','','','','SW16 6LG ','',0,'','0000-00-00',0,'test',0,'0000-00-00 00:00:00','2019-06-11 02:49:44','','null','null',0,0,'','','','','','','','','','','',0),
(10,'','','test2','','','','','123','','','','','','123','',0,'','0000-00-00',0,'test2',0,'0000-00-00 00:00:00','2019-06-11 02:50:54','','null','null',0,0,'','','','','','','','','','','',0),
(11,'','','TestUser1','','','','','01111111111','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-06-14 00:54:55','','','',0,0,'','','','','','','','','','','',0),
(12,'','','11','','','','','11','','','','','','22','',0,'','0000-00-00',0,'11',0,'0000-00-00 00:00:00','2019-06-14 22:24:51','','null','null',0,0,'','','','','','','','','','','',0),
(13,'','','rc','','','','','1','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-06-22 01:05:52','','','',0,0,'','','','','','','','','','','',0),
(17,'','','Dileep','','','','','8500222765','','','','','','uk','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-23 10:54:08','','','',0,0,'','','','','','','','','','','',0),
(18,'','','ramachecking','','','','','123456','','','','','','sew16xfgj','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-06-30 01:47:33','','','',0,0,'','','','','','','','','','','',100),
(19,'','','Rama Tulasi','','','','','+19493962511','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-06-30 06:12:33','','','',0,0,'','','','','','','','','','','',140),
(20,'','','mom','','','','','728','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-06-30 22:22:59','','','',0,0,'','','','','','','','','','','',120),
(21,'','','checking','','','','','12345','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-06-30 23:34:12','','','',0,0,'','','','','','','','','','','',140),
(22,'','','checking2','','','','','1234567','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-06-30 23:39:59','','','',0,0,'','','','','','','','','','','',100),
(23,'','','Rama Tulasi','','','','','544','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-07 22:56:46','','','',0,0,'','','','','','','','','','','',40),
(24,'','','offline1','','','','','1113','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-07 23:08:52','','','',0,0,'','','','','','','','','','','',40),
(25,'','','offline2','','','','','54455','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-07 23:09:45','','','',0,0,'','','','','','','','','','','',0),
(26,'','','sample3','','','','','12123','','','','','','sw166hf','',0,'','0000-00-00',0,'sample3@gmail.com',0,'0000-00-00 00:00:00','2019-07-14 02:58:03','08072019115802cartoon1.jpg','51.4285061','-0.1312775',0,0,'','','','','','','','','','','',0),
(27,'','','ttt','','','','','1414','','','','','','df','',0,'','0000-00-00',0,'ttt',0,'0000-00-00 00:00:00','2019-07-09 01:56:08','09072019142608Image-1560763083539.jpg','null','null',0,0,'','','','','','','','','','','',0),
(28,'','','ww','','','','','55','','','','','','ff','',0,'','0000-00-00',0,'hh',0,'0000-00-00 00:00:00','2019-07-09 07:22:13','09072019195213Image-1562682093326.jpg','null','null',0,0,'','','','','','','','','','','',0),
(29,'','','lll','','','','','00','','','','','','lll','',0,'','0000-00-00',0,'lll',0,'0000-00-00 00:00:00','2019-07-09 22:27:22','10072019105722Image-1562736401186.jpg','null','null',0,0,'','','','','','','','','','','',0),
(30,'','','aa','','','','','141414','','','','','','Foreplan Travel & Property Services, 5 Mitcham Lane, , , , London, ','',0,'','0000-00-00',0,'aa',0,'0000-00-00 00:00:00','2019-07-09 22:38:26','10072019110826Image-1560763241929.jpg','51.4287056','-0.1314904',0,0,'','','','','','','','','','','',0),
(31,'','','er','','','','','58','','','','','','3 Bank Buildings, Mitcham Lane, , , , London, ','',0,'','0000-00-00',0,'se',0,'0000-00-00 00:00:00','2019-07-09 23:42:28','10072019121228Image-1562740858891.jpg','51.4323882','-0.129319',0,0,'','','','','','','','','','','',0),
(32,'','','checking','','','','','121','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-10 12:34:19','','','',0,0,'','','','','','','','','','','',0),
(33,'','','checing','','','','','111','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-10 12:35:28','','','',0,0,'','','','','','','','','','','',0),
(34,'','','yggy','','','','','5255','','','','','','','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-10 23:06:00','','','',0,0,'','','','','','','','','','','',6),
(35,'','','sneha','','','','','09080908','','','','','','sw166lg','',0,'','0000-00-00',0,'',0,'0000-00-00 00:00:00','2019-07-17 02:30:01','','','',0,0,'','','','','','','','','','','',38);

/*Table structure for table `tbl_vendor_drivers` */

DROP TABLE IF EXISTS `tbl_vendor_drivers`;

CREATE TABLE `tbl_vendor_drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `driver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_vendor_drivers` */

insert  into `tbl_vendor_drivers`(`id`,`vendor_id`,`driver_id`,`status`,`created_at`) values 
(7,'c16a5320fa475530d9583c34fd356ef5','1679091c5a880faf6fb5e6087eb1b2dc',1,'2019-08-15 12:56:14');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
