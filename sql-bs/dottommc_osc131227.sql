-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2013 at 11:30 AM
-- Server version: 5.5.35
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dottommc_osc`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
CREATE TABLE IF NOT EXISTS `account_types` (
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
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`type_type`, `type_name`, `cost_1`, `max_images`, `max_upload_size`, `max_image_width`, `max_image_height`, `auto_jpeg`, `jpeg_quality`, `add_branding`, `simultaneous_uploads`, `auto_resize`, `email_friends`, `images_per_page`, `max_galleries`, `resize_images`, `rename_images`, `bandwidth`, `storage`, `cost_3`, `cost_6`, `cost_12`, `rotate_images`, `allow_zip_uploads`, `zip_uploads_max_images`, `zip_uploads_max_size`) VALUES
('free', '', 4.95, 20, 100000, 800, 600, 0, 65, 1, 1, 1, 1, 5, 1, 1, 1, 0, 0, 14.95, 24.95, 44.00, 1, 0, 10, 8),
('paid', '', 4.95, 20, 100000, 800, 600, 0, 65, 1, 1, 1, 1, 5, 1, 1, 1, 0, 0, 14.95, 24.95, 44.00, 1, 0, 10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
CREATE TABLE IF NOT EXISTS `ads` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL,
  `live` tinyint(4) NOT NULL,
  `groupname` varchar(50) NOT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `viewsindex` (`live`,`views`),
  KEY `nameindex` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `banned_ips`
--

DROP TABLE IF EXISTS `banned_ips`;
CREATE TABLE IF NOT EXISTS `banned_ips` (
  `ip` varchar(20) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `gallery_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gallery_name` varchar(50) NOT NULL,
  `gallery_intro` text NOT NULL,
  PRIMARY KEY (`gallery_id`),
  KEY `userindex` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `user_id`, `name`, `type`, `width`, `height`, `uploaded`, `filesize`, `ip`, `checked`, `gallery_id`, `bandwidth`, `public`, `rating`, `votes`, `views`) VALUES
(1, 1, 'burnside', 'jpg', 273, 185, '2013-12-27 11:09:00', 7461, '50.202.194.198', 0, 0, 0, 1, 0, 0, 0),
(2, 1, 'caballeroatmontegue', 'jpg', 225, 225, '2013-12-27 11:09:24', 7855, '50.202.194.198', 0, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('unpublished','published','archived','hidden') NOT NULL DEFAULT 'unpublished',
  `headline` varchar(100) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `published` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`news_id`),
  KEY `pubindex` (`published`,`status`),
  KEY `sindex` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page_content`
--

DROP TABLE IF EXISTS `page_content`;
CREATE TABLE IF NOT EXISTS `page_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`content_id`),
  KEY `nameindex` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypalpayments`
--

DROP TABLE IF EXISTS `paypalpayments`;
CREATE TABLE IF NOT EXISTS `paypalpayments` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
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
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`admin_username`, `admin_password`, `admin_email`, `sitename`, `siteurl`, `email_confirmation`, `signup_email_from`, `signup_email_subject`, `signup_email_template`, `email_confirmation_key`, `allow_signups`, `thumbnail_width`, `thumbnail_height`, `image_folder`, `thumb_folder`, `image_url`, `thumb_url`, `allow_uploads`, `branding_text`, `branding_color`, `branding_bgcolor`, `branding_transparency`, `branding_size`, `min_branding_width`, `min_branding_height`, `email_images_subject`, `email_images_template`, `reminder_email_from`, `reminder_email_subject`, `reminder_email_template`, `paypal_email`, `payment_email_subject`, `payment_email_message`, `installed`, `ban_ips`, `gallery_max_image_width`, `gallery_max_image_height`, `gallery_url_mode`, `bandwidth_checked`, `bandwidth_reset_checked`, `notify_bandwidth_exceeded`, `bandwidth_exceeded_from`, `bandwidth_exceeded_subject`, `bandwidth_exceeded_message`, `payment_notifications`, `paypal_account_email`, `browse_per_page`, `browse_images`, `browse_checked_only`, `browse_max_image_width`, `upload_public_default`, `sidebar_images`, `sidebar_top_html`, `sidebar_bottom_html`, `sidebar_image_width`, `sidebar_account_pos`, `random_per_page`, `sidebar_image_type`, `home_page_show_plans`, `upgrade_show_plans`, `home_page_images`, `home_page_which_images`, `home_page_image_width`, `home_page_thumb_width`, `home_page_single_image`, `hotlink_thumbnails`, `hotlink_images`, `monitor_thumbnail_bandwidth`, `monitor_image_bandwidth`, `show_errors`, `browse_image_links`, `browse_thumb_links`, `browse_thumb_embed`, `browse_image_embed`, `browse_image_bbcode`, `browse_thumb_bbcode`, `theme`, `stylesheet`, `language`, `rewrite_urls`, `imagick_path`, `image_tool`, `temp_dir`, `rewrite_old_urls`, `htaccess_no_indexes`, `debug_imagick`, `sidebar_news_items`, `homepage_news_items`, `image_ratings`, `log_image_views`, `disable_site`, `site_disabled_message`, `branding_font`, `dbversion`) VALUES
('admin', 'password', 'admin@dottomm.com', 'Old Skater Club', 'http://dottomm.com/oldskaterclub/', 0, 'tom@dottomm.com', 'Welcome to {sitename}', 'Welcome to {sitename}\n\nYour username is: {username}\n\nYour password is what you entered when you signed up.\n<confirm>\nPlease confirm your email address by visiting the url below:\n{confirmurl}\n</confirm>\n\nThank you for joining {sitename}!', 'enter something random here', 1, 120, 120, '/home1/dottommc/public_html/oldskaterclub/images/', '/home1/dottommc/public_html/oldskaterclub/thumbs/', 'http://dottomm.com/oldskaterclub/images/', 'http://dottomm.com/oldskaterclub/thumbs/', 1, 'hosted by www.mysite.com', '#ffffff', '#000000', 50, 8, 200, 150, 'Have a look at my pictures', '{message}\n\nClick the links below to view the images in your web browser. If clicking the links does not work, copy them and paste them into your browser''s address bar.\n\n{imagelinks}\n\nThis message was sent to you from {sitename} ({siteurl}) on behalf of the sender.\nIf you believe you have received this message in error please accept our apologies.\nIf you wish to complain about the sender of this message, please contact us at:\n{siteurl}?cmd=contact\n\nThanks.', 'tom@dottomm.com', 'your password reminder', 'Hi there,\n\nThis is a password reminder:\n\nYour username: {username}\nYour password: {password}\n\n<confirm>\nPlease confirm your email address by visiting the url below:\n\n{confirmurl}\n</confirm>\nYou can login at {siteurl}?cmd=login\n\nThanks, the {sitename} team.', 'paypal@dottomm.com', 'Your account has been upgraded!', '', 0, 1, 500, 500, 'querystring', '2013-12-27', '2013-12-27', 0, 'admin@example.com', 'monthly bandwidth exceeded', 'You have exceeded your monthly bandwidth limit on {sitename}.\n\nYour images cannot be viewed until your bandwidth usage is reset at the beginning of the next month of your membership.', 1, 'paypal@dottomm.com', 12, 1, 0, 450, 1, 4, '', '', 75, 'after', 6, 'random', 1, 1, 6, 'none', 450, 120, 'none', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'default', 'default/styles/default.css', 'default', 0, '', 'gd', '/home1/dottommc/public_html/oldskaterclub/temp', 0, 0, 0, 0, 0, 'off', 0, 0, '', 'AIRSTREA.TTF', '1.4.0.10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `status`, `name`, `username`, `pass`, `email`, `joined`, `updated`, `lastlogin`, `ip`, `account_type`, `paid_until`, `loginip`, `bandwidth_exceeded`, `bandwidth_reset`, `deleted_images_bandwidth`, `sub_id`, `sub_months`, `sub_amount`) VALUES
(1, 1, 'Usertom', 'usertom', 'queenie', 'tom@dottomm.com', '2013-12-27 11:08:03', '2013-12-27 11:08:03', '2013-12-27 11:08:15', '50.202.194.198', 'free', '0000-00-00', '50.202.194.198', 0, '0000-00-00', 0, '', 0, 0.00);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
