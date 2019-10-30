# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: departmentofproduct
# Generation Time: 2017-03-28 17:25:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerEmail` varchar(500) COLLATE latin1_german2_ci DEFAULT '',
  `FirstName` varchar(50) COLLATE latin1_german2_ci DEFAULT NULL,
  `LastName` varchar(50) COLLATE latin1_german2_ci DEFAULT NULL,
  `City` varchar(90) COLLATE latin1_german2_ci DEFAULT NULL,
  `State` varchar(20) COLLATE latin1_german2_ci DEFAULT NULL,
  `Zip` varchar(12) COLLATE latin1_german2_ci DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Phone` varchar(20) COLLATE latin1_german2_ci DEFAULT NULL,
  `Fax` varchar(20) COLLATE latin1_german2_ci DEFAULT NULL,
  `Country` varchar(20) COLLATE latin1_german2_ci DEFAULT NULL,
  `Address` varchar(100) COLLATE latin1_german2_ci DEFAULT NULL,
  `Address2` varchar(50) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`CustomerID`, `CustomerEmail`, `FirstName`, `LastName`, `City`, `State`, `Zip`, `RegistrationDate`, `Phone`, `Fax`, `Country`, `Address`, `Address2`)
VALUES
	(1,'john.smith@example.com','John','Smith','London','London','E15FF','2017-02-14 10:49:59','44202787098',NULL,'GB','7 Landseer Street','Brick Lane'),
	(2,'julia.smith@example.com','Julia','Smith','Edinburgh','Edinburgh','ED13J','2017-02-14 11:37:22','44202787033',NULL,'GB','1 Edinburgh Street','Petticoat Avenue'),
	(3,'ann.hathoway@example.com','Ann','Hathoway','Los Angeles','California','CF1428','2017-02-14 11:37:52','12898700376',NULL,'USA','11 Hollywood boulevard',NULL),
	(4,'richard.holmes@example.com','Richard','Holmes','London','London','E14LL','2017-02-14 11:39:36','447785793028',NULL,'GB','25 Princess Street',NULL),
	(5,'oprah.winfrey@whitehouse.org','Oprah','Winfrey','Washington DC','Washington DC','WS3847','2017-02-14 11:40:06','176360484628',NULL,NULL,'The White House',NULL);

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table optiongroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `optiongroups`;

CREATE TABLE `optiongroups` (
  `OptionGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `OptionGroupName` varchar(50) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`OptionGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

LOCK TABLES `optiongroups` WRITE;
/*!40000 ALTER TABLE `optiongroups` DISABLE KEYS */;

INSERT INTO `optiongroups` (`OptionGroupID`, `OptionGroupName`)
VALUES
	(1,'color'),
	(2,'size');

/*!40000 ALTER TABLE `optiongroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `OptionID` int(11) NOT NULL AUTO_INCREMENT,
  `OptionGroupID` int(11) DEFAULT NULL,
  `OptionName` varchar(50) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`OptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;

INSERT INTO `options` (`OptionID`, `OptionGroupID`, `OptionName`)
VALUES
	(1,1,'red'),
	(2,1,'blue'),
	(3,1,'green'),
	(4,2,'S'),
	(5,2,'M'),
	(6,2,'L'),
	(7,2,'XL'),
	(8,2,'XXL');

/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `OrdrAmt` float NOT NULL,
  `OrderShipName` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderShipAddress` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderShipAddress2` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderCity` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `OrderState` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `OrderZip` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `OrderCountry` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `OrderPhone` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `OrderFax` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `OrderShipping` float NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmail` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` tinyint(1) NOT NULL DEFAULT '0',
  `OrderTrackingNumber` varchar(80) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrdrAmt`, `OrderShipName`, `OrderShipAddress`, `OrderShipAddress2`, `OrderCity`, `OrderState`, `OrderZip`, `OrderCountry`, `OrderPhone`, `OrderFax`, `OrderShipping`, `OrderTax`, `OrderEmail`, `OrderDate`, `OrderShipped`, `OrderTrackingNumber`)
VALUES
	(100,4,100,'','','','','','','','','',0,0,'richard.holmes@example.com','2017-02-14 10:48:01',0,NULL),
	(101,2,287,'','','','','','','','','',0,0,'julia.smith@example.com','2017-02-14 10:56:23',0,NULL);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table productcategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productcategories`;

CREATE TABLE `productcategories` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

LOCK TABLES `productcategories` WRITE;
/*!40000 ALTER TABLE `productcategories` DISABLE KEYS */;

INSERT INTO `productcategories` (`CategoryID`, `CategoryName`)
VALUES
	(1,'Running'),
	(2,'Walking'),
	(3,'HIking'),
	(4,'Track and Trail'),
	(5,'Short Sleave'),
	(6,'Long Sleave');

/*!40000 ALTER TABLE `productcategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table productoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productoptions`;

CREATE TABLE `productoptions` (
  `ProductOptionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int(10) unsigned NOT NULL,
  `OptionID` int(10) unsigned NOT NULL,
  `OptionPriceIncrement` double DEFAULT NULL,
  `OptionGroupID` int(11) NOT NULL,
  PRIMARY KEY (`ProductOptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

LOCK TABLES `productoptions` WRITE;
/*!40000 ALTER TABLE `productoptions` DISABLE KEYS */;

INSERT INTO `productoptions` (`ProductOptionID`, `ProductID`, `OptionID`, `OptionPriceIncrement`, `OptionGroupID`)
VALUES
	(1,1,1,0,1),
	(2,1,2,0,1),
	(3,1,3,0,1),
	(4,1,4,0,2),
	(5,1,5,0,2),
	(6,1,6,0,2),
	(7,1,7,2,2),
	(8,1,8,2,2);

/*!40000 ALTER TABLE `productoptions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `ProductID` int(12) NOT NULL AUTO_INCREMENT,
  `ProductSKU` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `ProductName` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductWeight` float NOT NULL,
  `ProductCartDesc` varchar(250) COLLATE latin1_german2_ci NOT NULL,
  `ProductShortDesc` varchar(1000) COLLATE latin1_german2_ci NOT NULL,
  `ProductLongDesc` text COLLATE latin1_german2_ci NOT NULL,
  `ProductThumb` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `ProductImage` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `ProductCategoryID` int(11) DEFAULT NULL,
  `ProductUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProductStock` float DEFAULT NULL,
  `ProductLive` tinyint(1) DEFAULT '0',
  `ProductUnlimited` tinyint(1) DEFAULT '1',
  `ProductLocation` varchar(250) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`ProductID`, `ProductSKU`, `ProductName`, `ProductPrice`, `ProductWeight`, `ProductCartDesc`, `ProductShortDesc`, `ProductLongDesc`, `ProductThumb`, `ProductImage`, `ProductCategoryID`, `ProductUpdateDate`, `ProductStock`, `ProductLive`, `ProductUnlimited`, `ProductLocation`)
VALUES
	(1,'000-0001','Cotton T-Shirt',9.99,3,'Light Cotton T-Shirt','A light cotton T-Shirt made with 100% real cotton.','A light cotton T-Shirt made with 100% real cotton.\r\n\r\nMade right here in the USA for over 15 years, this t-shirt is lightweight and durable.','','',5,'2013-06-13 03:00:50',100,1,0,NULL),
	(2,'000-0004','Los Angeles Shoes',179.99,8,'Track and Trail','A rugged track and trail athletic shoe','A rugged track and trail athletic shoe','','',4,'2013-07-25 21:04:36',NULL,0,1,NULL),
	(3,'000-0005','Grey slippers',79.99,4,'Grey, warm slippers','A grey, comfortable pair of slippers','A grey, comfortable pair of slippers, perfect for lounging around the house with.','','',4,'2017-02-14 11:58:32',50,0,1,NULL);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
