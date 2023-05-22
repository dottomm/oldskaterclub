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
