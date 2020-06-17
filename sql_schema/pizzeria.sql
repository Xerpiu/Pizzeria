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


-- Zrzut struktury bazy danych pizzeria
CREATE DATABASE IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `pizzeria`;

-- Zrzut struktury tabela pizzeria.credit_card
CREATE TABLE IF NOT EXISTS `credit_card` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.credit_card: ~0 rows (około)
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.customer: ~0 rows (około)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.customer_credit_card
CREATE TABLE IF NOT EXISTS `customer_credit_card` (
  `customer_id` int(11) NOT NULL,
  `credit_card_id` int(11) NOT NULL,
  KEY `fk_customer_id` (`customer_id`),
  KEY `credit_card_id` (`credit_card_id`),
  CONSTRAINT `customer_credit_card_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `customer_credit_card_ibfk_2` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.customer_credit_card: ~0 rows (około)
/*!40000 ALTER TABLE `customer_credit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_credit_card` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.customer_drinks
CREATE TABLE IF NOT EXISTS `customer_drinks` (
  `customer_order_id` int(11) DEFAULT NULL,
  `drink` varchar(20) DEFAULT NULL,
  KEY `customer_order_id` (`customer_order_id`),
  KEY `drink` (`drink`),
  CONSTRAINT `customer_drinks_ibfk_1` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`),
  CONSTRAINT `customer_drinks_ibfk_2` FOREIGN KEY (`drink`) REFERENCES `drinks` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.customer_drinks: ~0 rows (około)
/*!40000 ALTER TABLE `customer_drinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_drinks` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.customer_order
CREATE TABLE IF NOT EXISTS `customer_order` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `credit_card_id` int(11) DEFAULT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `credit_card_id` (`credit_card_id`),
  CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.customer_order: ~0 rows (około)
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.customer_order_preference
CREATE TABLE IF NOT EXISTS `customer_order_preference` (
  `customer_id` int(11) DEFAULT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `customer_order_id` (`customer_order_id`),
  CONSTRAINT `customer_order_preference_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `customer_order_preference_ibfk_2` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.customer_order_preference: ~0 rows (około)
/*!40000 ALTER TABLE `customer_order_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_order_preference` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.customer_pizzas
CREATE TABLE IF NOT EXISTS `customer_pizzas` (
  `customer_order_id` int(11) DEFAULT NULL,
  `pizza_id` int(11) DEFAULT NULL,
  KEY `customer_order_id` (`customer_order_id`),
  KEY `pizza_id` (`pizza_id`),
  CONSTRAINT `customer_pizzas_ibfk_1` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`),
  CONSTRAINT `customer_pizzas_ibfk_2` FOREIGN KEY (`pizza_id`) REFERENCES `pizzas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.customer_pizzas: ~0 rows (około)
/*!40000 ALTER TABLE `customer_pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_pizzas` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.drinks
CREATE TABLE IF NOT EXISTS `drinks` (
  `name` varchar(20) NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.drinks: ~0 rows (około)
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` (`name`, `price`) VALUES
	('coke', 2.00),
	('diet-coke', 2.00),
	('extra-dimensional-wa', 25.00),
	('liquid-schwartz', 20.00),
	('red-balls', 4.00);
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.pizzas
CREATE TABLE IF NOT EXISTS `pizzas` (
  `id` int(11) NOT NULL,
  `size` varchar(2) DEFAULT NULL,
  `topping_1` varchar(20) DEFAULT NULL,
  `topping_2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `size` (`size`),
  KEY `topping_1` (`topping_1`),
  KEY `topping_2` (`topping_2`),
  CONSTRAINT `pizzas_ibfk_1` FOREIGN KEY (`size`) REFERENCES `sizes` (`name`),
  CONSTRAINT `pizzas_ibfk_2` FOREIGN KEY (`topping_1`) REFERENCES `toppings` (`name`),
  CONSTRAINT `pizzas_ibfk_3` FOREIGN KEY (`topping_2`) REFERENCES `toppings` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.pizzas: ~0 rows (około)
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.sizes
CREATE TABLE IF NOT EXISTS `sizes` (
  `name` varchar(2) NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.sizes: ~0 rows (około)
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` (`name`, `price`) VALUES
	('L', 14.00),
	('M', 12.00),
	('S', 10.00),
	('XL', 18.00);
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;

-- Zrzut struktury tabela pizzeria.toppings
CREATE TABLE IF NOT EXISTS `toppings` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Zrzucanie danych dla tabeli pizzeria.toppings: ~0 rows (około)
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` (`name`) VALUES
	('bacon'),
	('beef'),
	('chicken'),
	('ham'),
	('jalapenos'),
	('mushroom'),
	('olive'),
	('onions'),
	('pepperonni'),
	('peppers'),
	('pineapple'),
	('sausage');
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
