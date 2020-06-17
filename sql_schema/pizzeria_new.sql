-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               10.1.30-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Zrzut struktury bazy danych pizzeria_new
CREATE DATABASE IF NOT EXISTS `pizzeria_new` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `pizzeria_new`;

-- Zrzut struktury tabela pizzeria_new.details
CREATE TABLE IF NOT EXISTS `details` (
  `DetailsID` int(10) unsigned NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  `Description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`DetailsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria_new.details: ~0 rows (około)
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
/*!40000 ALTER TABLE `details` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria_new.item
CREATE TABLE IF NOT EXISTS `item` (
  `ItemId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria_new.item: ~0 rows (około)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria_new.order
CREATE TABLE IF NOT EXISTS `order` (
  `OrderID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria_new.order: ~0 rows (około)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria_new.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `ItemId` int(11) unsigned DEFAULT NULL,
  `OrderId` int(10) unsigned DEFAULT NULL,
  `Quantity` int(10) unsigned DEFAULT NULL,
  KEY `FK_ItemId` (`ItemId`),
  KEY `FK_OrderId` (`OrderId`),
  CONSTRAINT `FK_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `item` (`ItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `order` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria_new.order_item: ~0 rows (około)
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria_new.pizza
CREATE TABLE IF NOT EXISTS `pizza` (
  `PizzaID` int(10) unsigned DEFAULT NULL,
  KEY `FK_PizzaID` (`PizzaID`),
  CONSTRAINT `FK_PizzaID` FOREIGN KEY (`PizzaID`) REFERENCES `item` (`ItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria_new.pizza: ~0 rows (około)
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria_new.pizza_details
CREATE TABLE IF NOT EXISTS `pizza_details` (
  `PizzaID` int(10) unsigned DEFAULT NULL,
  `DetailsID` int(10) unsigned DEFAULT NULL,
  KEY `FK_details_PizzaID` (`PizzaID`),
  KEY `FK_details_DetailsID` (`DetailsID`),
  CONSTRAINT `FK_details_DetailsID` FOREIGN KEY (`DetailsID`) REFERENCES `details` (`DetailsID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_details_PizzaID` FOREIGN KEY (`PizzaID`) REFERENCES `pizza` (`PizzaID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria_new.pizza_details: ~0 rows (około)
/*!40000 ALTER TABLE `pizza_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
