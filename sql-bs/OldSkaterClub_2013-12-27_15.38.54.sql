-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.9


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema oldskaterclub
--

CREATE DATABASE IF NOT EXISTS oldskaterclub;
USE oldskaterclub;

--
-- Definition of table `oldskaterclub`.`account_types`
--

DROP TABLE IF EXISTS `oldskaterclub`.`account_types`;
CREATE TABLE  `oldskaterclub`.`account_types` (
  `type_type` varchar(10) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `cost_1` decimal(10,2) NOT NULL DEFAULT '4.95',
  `max_images` int(11) NOT NULL DEFAULT '20',
  `max_upload_size` int(11) NOT NULL DEFAULT '100000',
  `max_image_width` int(11) NOT NULL DEFAULT '800',
  `max_image_height` int(11) NOT NULL DEFAULT '600',
  `auto_jpeg` tinyint(4) NOT NULL,
  `jpeg_quality` tinyint(4) NOT NULL DEFAULT '65',
  `add_branding` tinyint(4) NOT NULL DEFAULT '1',
  `simultaneous_uploads` tinyint(4) NOT NULL DEFAULT '1',
  `auto_resize` tinyint(4) NOT NULL DEFAULT '1',
  `email_friends` tinyint(4) NOT NULL DEFAULT '1',
  `images_per_page` int(10) unsigned NOT NULL DEFAULT '5',
  `max_galleries` int(11) NOT NULL DEFAULT '1',
  `resize_images` tinyint(4) NOT NULL DEFAULT '1',
  `rename_images` tinyint(4) NOT NULL DEFAULT '1',
  `bandwidth` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `cost_3` decimal(10,2) NOT NULL DEFAULT '14.95',
  `cost_6` decimal(10,2) NOT NULL DEFAULT '24.95',
  `cost_12` decimal(10,2) NOT NULL DEFAULT '44.00',
  `rotate_images` tinyint(4) NOT NULL DEFAULT '1',
  `allow_zip_uploads` tinyint(4) NOT NULL,
  `zip_uploads_max_images` int(11) NOT NULL DEFAULT '10',
  `zip_uploads_max_size` int(11) NOT NULL DEFAULT '8',
  PRIMARY KEY (`type_type`),
  KEY `nameindex` (`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`account_types`
--

/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
LOCK TABLES `account_types` WRITE;
INSERT INTO `oldskaterclub`.`account_types` VALUES  ('free','','4.95',20,100000,800,600,0,65,1,1,1,1,5,1,1,1,0,0,'14.95','24.95','44.00',1,0,10,8),
 ('paid','','4.95',20,100000,800,600,0,65,1,1,1,1,5,1,1,1,0,0,'14.95','24.95','44.00',1,0,10,8);
UNLOCK TABLES;
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`ads`
--

DROP TABLE IF EXISTS `oldskaterclub`.`ads`;
CREATE TABLE  `oldskaterclub`.`ads` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL,
  `live` tinyint(4) NOT NULL,
  `groupname` varchar(50) NOT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `viewsindex` (`live`,`views`),
  KEY `nameindex` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`ads`
--

/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
LOCK TABLES `ads` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`banned_ips`
--

DROP TABLE IF EXISTS `oldskaterclub`.`banned_ips`;
CREATE TABLE  `oldskaterclub`.`banned_ips` (
  `ip` varchar(20) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`banned_ips`
--

/*!40000 ALTER TABLE `banned_ips` DISABLE KEYS */;
LOCK TABLES `banned_ips` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `banned_ips` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`galleries`
--

DROP TABLE IF EXISTS `oldskaterclub`.`galleries`;
CREATE TABLE  `oldskaterclub`.`galleries` (
  `gallery_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gallery_name` varchar(50) NOT NULL,
  `gallery_intro` text NOT NULL,
  PRIMARY KEY (`gallery_id`),
  KEY `userindex` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`galleries`
--

/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
LOCK TABLES `galleries` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`images`
--

DROP TABLE IF EXISTS `oldskaterclub`.`images`;
CREATE TABLE  `oldskaterclub`.`images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` varchar(5) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `uploaded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filesize` int(10) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL,
  `checked` tinyint(4) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `bandwidth` int(11) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `rating` float NOT NULL,
  `votes` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `userindex` (`user_id`,`name`),
  KEY `useruploadedindex` (`user_id`,`uploaded`),
  KEY `nameindex` (`name`),
  KEY `galindex` (`gallery_id`),
  KEY `uploadedindex` (`uploaded`,`public`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`images`
--

/*!40000 ALTER TABLE `images` DISABLE KEYS */;
LOCK TABLES `images` WRITE;
INSERT INTO `oldskaterclub`.`images` VALUES  (4,1,'burnside.jpeg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0),
 (3,1,'montegue.jpeg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0),
 (5,2,'jfa.jpeg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0),
 (6,2,'cab-deck.jpeg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0),
 (7,2,'bomb.jpeg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0),
 (8,2,'broken.jpeg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0),
 (9,1,'freakoutmag.jpg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0),
 (12,1,'vision.jpeg','',0,0,'0000-00-00 00:00:00',0,'',0,0,0,0,0,0,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`news`
--

DROP TABLE IF EXISTS `oldskaterclub`.`news`;
CREATE TABLE  `oldskaterclub`.`news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('unpublished','published','archived','hidden') NOT NULL DEFAULT 'unpublished',
  `headline` varchar(100) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `published` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`news_id`),
  KEY `pubindex` (`published`,`status`),
  KEY `sindex` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`news`
--

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
LOCK TABLES `news` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`page_content`
--

DROP TABLE IF EXISTS `oldskaterclub`.`page_content`;
CREATE TABLE  `oldskaterclub`.`page_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`content_id`),
  KEY `nameindex` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`page_content`
--

/*!40000 ALTER TABLE `page_content` DISABLE KEYS */;
LOCK TABLES `page_content` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `page_content` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`paypalpayments`
--

DROP TABLE IF EXISTS `oldskaterclub`.`paypalpayments`;
CREATE TABLE  `oldskaterclub`.`paypalpayments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `txn_id` varchar(20) NOT NULL,
  `dated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paypal_email` varchar(100) NOT NULL,
  `paypal_data` text NOT NULL,
  `sub_id` varchar(32) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `txnindex` (`txn_id`),
  KEY `userindex` (`user_id`),
  KEY `emailindex` (`paypal_email`),
  KEY `datedindex` (`dated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`paypalpayments`
--

/*!40000 ALTER TABLE `paypalpayments` DISABLE KEYS */;
LOCK TABLES `paypalpayments` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `paypalpayments` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`settings`
--

DROP TABLE IF EXISTS `oldskaterclub`.`settings`;
CREATE TABLE  `oldskaterclub`.`settings` (
  `admin_username` varchar(50) NOT NULL DEFAULT 'admin',
  `admin_password` varchar(50) NOT NULL DEFAULT 'password',
  `admin_email` varchar(150) NOT NULL,
  `sitename` varchar(100) NOT NULL,
  `siteurl` varchar(150) NOT NULL,
  `email_confirmation` tinyint(3) unsigned NOT NULL,
  `signup_email_from` varchar(100) NOT NULL,
  `signup_email_subject` varchar(100) NOT NULL DEFAULT 'Welcome to {sitename}',
  `signup_email_template` text NOT NULL,
  `email_confirmation_key` varchar(50) NOT NULL DEFAULT 'enter something random here',
  `allow_signups` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `thumbnail_width` int(10) unsigned NOT NULL DEFAULT '120',
  `thumbnail_height` int(10) unsigned NOT NULL DEFAULT '120',
  `image_folder` varchar(255) NOT NULL DEFAULT './images',
  `thumb_folder` varchar(255) NOT NULL DEFAULT './thumbs',
  `image_url` varchar(255) NOT NULL DEFAULT '/images/',
  `thumb_url` varchar(255) NOT NULL DEFAULT '/thumbs/',
  `allow_uploads` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `branding_text` varchar(100) NOT NULL DEFAULT 'hosted by www.mysite.com',
  `branding_color` varchar(10) NOT NULL DEFAULT '#ffffff',
  `branding_bgcolor` varchar(10) NOT NULL DEFAULT '#000000',
  `branding_transparency` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `branding_size` tinyint(3) unsigned NOT NULL DEFAULT '8',
  `min_branding_width` int(10) unsigned NOT NULL DEFAULT '200',
  `min_branding_height` int(10) unsigned NOT NULL DEFAULT '150',
  `email_images_subject` varchar(100) NOT NULL DEFAULT 'Have a look at my pictures',
  `email_images_template` text NOT NULL,
  `reminder_email_from` varchar(50) NOT NULL,
  `reminder_email_subject` varchar(100) NOT NULL DEFAULT 'your password reminder',
  `reminder_email_template` text NOT NULL,
  `paypal_email` varchar(100) NOT NULL,
  `payment_email_subject` varchar(100) NOT NULL DEFAULT 'Your account has been upgraded!',
  `payment_email_message` text NOT NULL,
  `installed` tinyint(3) unsigned NOT NULL,
  `ban_ips` tinyint(4) NOT NULL DEFAULT '1',
  `gallery_max_image_width` int(11) NOT NULL DEFAULT '500',
  `gallery_max_image_height` int(11) NOT NULL DEFAULT '500',
  `gallery_url_mode` varchar(20) NOT NULL DEFAULT 'querystring',
  `bandwidth_checked` date NOT NULL DEFAULT '0000-00-00',
  `bandwidth_reset_checked` date NOT NULL DEFAULT '0000-00-00',
  `notify_bandwidth_exceeded` tinyint(4) NOT NULL,
  `bandwidth_exceeded_from` varchar(100) NOT NULL DEFAULT 'admin@example.com',
  `bandwidth_exceeded_subject` varchar(100) NOT NULL DEFAULT 'monthly bandwidth exceeded',
  `bandwidth_exceeded_message` text NOT NULL,
  `payment_notifications` tinyint(4) NOT NULL DEFAULT '1',
  `paypal_account_email` varchar(150) NOT NULL,
  `browse_per_page` int(11) NOT NULL DEFAULT '12',
  `browse_images` tinyint(4) NOT NULL DEFAULT '1',
  `browse_checked_only` tinyint(4) NOT NULL,
  `browse_max_image_width` int(11) NOT NULL DEFAULT '450',
  `upload_public_default` tinyint(4) NOT NULL DEFAULT '1',
  `sidebar_images` int(11) NOT NULL DEFAULT '4',
  `sidebar_top_html` text NOT NULL,
  `sidebar_bottom_html` text NOT NULL,
  `sidebar_image_width` int(11) NOT NULL DEFAULT '75',
  `sidebar_account_pos` enum('navbar','top','bottom','before','after') NOT NULL DEFAULT 'after',
  `random_per_page` int(11) NOT NULL DEFAULT '6',
  `sidebar_image_type` enum('recent','random') NOT NULL DEFAULT 'random',
  `home_page_show_plans` tinyint(4) NOT NULL DEFAULT '1',
  `upgrade_show_plans` tinyint(4) NOT NULL DEFAULT '1',
  `home_page_images` int(11) NOT NULL DEFAULT '6',
  `home_page_which_images` enum('none','recent','random') NOT NULL DEFAULT 'none',
  `home_page_image_width` int(11) NOT NULL DEFAULT '450',
  `home_page_thumb_width` int(11) NOT NULL DEFAULT '120',
  `home_page_single_image` enum('none','random','recent') NOT NULL DEFAULT 'none',
  `hotlink_thumbnails` tinyint(4) NOT NULL DEFAULT '1',
  `hotlink_images` tinyint(4) NOT NULL DEFAULT '1',
  `monitor_thumbnail_bandwidth` tinyint(4) NOT NULL,
  `monitor_image_bandwidth` tinyint(4) NOT NULL DEFAULT '1',
  `show_errors` tinyint(4) NOT NULL DEFAULT '1',
  `browse_image_links` tinyint(4) NOT NULL,
  `browse_thumb_links` tinyint(4) NOT NULL,
  `browse_thumb_embed` tinyint(4) NOT NULL,
  `browse_image_embed` tinyint(4) NOT NULL,
  `browse_image_bbcode` tinyint(4) NOT NULL,
  `browse_thumb_bbcode` tinyint(4) NOT NULL,
  `theme` varchar(40) NOT NULL DEFAULT 'default',
  `stylesheet` varchar(40) NOT NULL DEFAULT 'default/styles/default.css',
  `language` varchar(40) NOT NULL DEFAULT 'default',
  `rewrite_urls` tinyint(4) NOT NULL,
  `imagick_path` varchar(255) NOT NULL,
  `image_tool` varchar(20) NOT NULL DEFAULT 'gd',
  `temp_dir` varchar(150) NOT NULL,
  `rewrite_old_urls` tinyint(4) NOT NULL,
  `htaccess_no_indexes` tinyint(4) NOT NULL,
  `debug_imagick` tinyint(4) NOT NULL,
  `sidebar_news_items` tinyint(4) NOT NULL,
  `homepage_news_items` tinyint(4) NOT NULL,
  `image_ratings` enum('off','members','anyone') NOT NULL DEFAULT 'off',
  `log_image_views` tinyint(4) NOT NULL,
  `disable_site` tinyint(4) NOT NULL,
  `site_disabled_message` text NOT NULL,
  `branding_font` varchar(100) NOT NULL DEFAULT 'AIRSTREA.TTF',
  `dbversion` varchar(20) NOT NULL DEFAULT '1.4.0.10'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`settings`
--

/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
LOCK TABLES `settings` WRITE;
INSERT INTO `oldskaterclub`.`settings` VALUES  ('admin','password','admin@dottomm.com','Old Skater Club','http://dottomm.com/oldskaterclub/',0,'tom@dottomm.com','Welcome to {sitename}','Welcome to {sitename}\n\nYour username is: {username}\n\nYour password is what you entered when you signed up.\n<confirm>\nPlease confirm your email address by visiting the url below:\n{confirmurl}\n</confirm>\n\nThank you for joining {sitename}!','enter something random here',1,120,120,'/home1/dottommc/public_html/oldskaterclub/images/','/home1/dottommc/public_html/oldskaterclub/thumbs/','http://dottomm.com/oldskaterclub/images/','http://dottomm.com/oldskaterclub/thumbs/',1,'hosted by www.mysite.com','#ffffff','#000000',50,8,200,150,'Have a look at my pictures','{message}\n\nClick the links below to view the images in your web browser. If clicking the links does not work, copy them and paste them into your browser\'s address bar.\n\n{imagelinks}\n\nThis message was sent to you from {sitename} ({siteurl}) on behalf of the sender.\nIf you believe you have received this message in error please accept our apologies.\nIf you wish to complain about the sender of this message, please contact us at:\n{siteurl}?cmd=contact\n\nThanks.','tom@dottomm.com','your password reminder','Hi there,\n\nThis is a password reminder:\n\nYour username: {username}\nYour password: {password}\n\n<confirm>\nPlease confirm your email address by visiting the url below:\n\n{confirmurl}\n</confirm>\nYou can login at {siteurl}?cmd=login\n\nThanks, the {sitename} team.','paypal@dottomm.com','Your account has been upgraded!','',0,1,500,500,'querystring','2013-12-27','2013-12-27',0,'admin@example.com','monthly bandwidth exceeded','You have exceeded your monthly bandwidth limit on {sitename}.\n\nYour images cannot be viewed until your bandwidth usage is reset at the beginning of the next month of your membership.',1,'paypal@dottomm.com',12,1,0,450,1,4,'','',75,'after',6,'random',1,1,6,'none',450,120,'none',1,1,0,1,1,0,0,0,0,0,0,'default','default/styles/default.css','default',0,'','gd','/home1/dottommc/public_html/oldskaterclub/temp',0,0,0,0,0,'off',0,0,'','AIRSTREA.TTF','1.4.0.10');
UNLOCK TABLES;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;


--
-- Definition of table `oldskaterclub`.`users`
--

DROP TABLE IF EXISTS `oldskaterclub`.`users`;
CREATE TABLE  `oldskaterclub`.`users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `joined` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL,
  `account_type` varchar(10) NOT NULL DEFAULT 'free',
  `paid_until` date NOT NULL DEFAULT '0000-00-00',
  `loginip` varchar(20) NOT NULL,
  `bandwidth_exceeded` tinyint(4) NOT NULL,
  `bandwidth_reset` date NOT NULL DEFAULT '0000-00-00',
  `deleted_images_bandwidth` int(11) NOT NULL,
  `sub_id` varchar(100) NOT NULL,
  `sub_months` tinyint(4) NOT NULL,
  `sub_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`user_id`),
  KEY `loginindex` (`username`,`pass`),
  KEY `joinedindex` (`joined`,`status`),
  KEY `emailindex` (`email`,`username`),
  KEY `statusindex` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldskaterclub`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `oldskaterclub`.`users` VALUES  (1,1,'Tomas','Tranfaglia','311 Woodside Drive','Rohnert Park','CA','USA','usertom','queenie','tom@dottomm.com',NULL,'2013-12-27 11:08:03','2013-12-27 11:08:03','2013-12-27 11:08:15','50.202.194.198','free','0000-00-00','50.202.194.198',0,'0000-00-00',0,'',0,'0.00'),
 (2,0,'Skater','Hater','211 Board Street','Petaluma','CA','USA','skaterhater','queenie','skater@hater.com',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','','free','0000-00-00','',0,'0000-00-00',0,'',0,'0.00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
