-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für krautundrueben
DROP DATABASE IF EXISTS `krautundrueben`;
CREATE DATABASE IF NOT EXISTS `krautundrueben` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `krautundrueben`;

-- Exportiere Struktur von Tabelle krautundrueben.allergien
DROP TABLE IF EXISTS `allergien`;
CREATE TABLE IF NOT EXISTS `allergien` (
  `AllergieID` int(11) NOT NULL AUTO_INCREMENT,
  `AllergieName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AllergieID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.allergien: ~7 rows (ungefähr)
DELETE FROM `allergien`;
/*!40000 ALTER TABLE `allergien` DISABLE KEYS */;
INSERT INTO `allergien` (`AllergieID`, `AllergieName`) VALUES
	(1, 'Erdnuss'),
	(2, 'Kuhmilch'),
	(3, 'Baumnuesse'),
	(4, 'Sojabohne'),
	(5, 'Huehnerei'),
	(6, 'Fisch und Meeresfruechte'),
	(7, 'Weizen');
/*!40000 ALTER TABLE `allergien` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.bestellung
DROP TABLE IF EXISTS `bestellung`;
CREATE TABLE IF NOT EXISTS `bestellung` (
  `BESTELLNR` int(11) NOT NULL AUTO_INCREMENT,
  `KUNDENNR` int(11) DEFAULT NULL,
  `BESTELLDATUM` date DEFAULT NULL,
  `RECHNUNGSBETRAG` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`BESTELLNR`),
  KEY `KUNDENNR` (`KUNDENNR`),
  CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`KUNDENNR`) REFERENCES `kunde` (`KUNDENNR`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.bestellung: ~12 rows (ungefähr)
DELETE FROM `bestellung`;
/*!40000 ALTER TABLE `bestellung` DISABLE KEYS */;
INSERT INTO `bestellung` (`BESTELLNR`, `KUNDENNR`, `BESTELLDATUM`, `RECHNUNGSBETRAG`) VALUES
	(1, 2001, '2020-07-01', 6.21),
	(2, 2002, '2020-07-08', 32.96),
	(3, 2003, '2020-08-01', 24.08),
	(4, 2004, '2020-08-02', 19.90),
	(5, 2005, '2020-08-02', 6.47),
	(6, 2006, '2020-08-10', 6.96),
	(7, 2007, '2020-08-10', 2.41),
	(8, 2008, '2020-08-10', 13.80),
	(9, 2009, '2020-08-10', 8.67),
	(10, 2007, '2020-08-15', 17.98),
	(11, 2005, '2020-08-12', 8.67),
	(12, 2003, '2020-08-13', 20.87);
/*!40000 ALTER TABLE `bestellung` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.bestellungzutat
DROP TABLE IF EXISTS `bestellungzutat`;
CREATE TABLE IF NOT EXISTS `bestellungzutat` (
  `BESTELLNR` int(11) NOT NULL,
  `ZUTATENNR` int(11) NOT NULL,
  `MENGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`BESTELLNR`,`ZUTATENNR`),
  KEY `ZUTATENNR` (`ZUTATENNR`),
  CONSTRAINT `bestellungzutat_ibfk_1` FOREIGN KEY (`BESTELLNR`) REFERENCES `bestellung` (`BESTELLNR`),
  CONSTRAINT `bestellungzutat_ibfk_2` FOREIGN KEY (`ZUTATENNR`) REFERENCES `zutat` (`ZUTATENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.bestellungzutat: ~26 rows (ungefähr)
DELETE FROM `bestellungzutat`;
/*!40000 ALTER TABLE `bestellungzutat` DISABLE KEYS */;
INSERT INTO `bestellungzutat` (`BESTELLNR`, `ZUTATENNR`, `MENGE`) VALUES
	(1, 1001, 5),
	(1, 1002, 3),
	(1, 1004, 3),
	(1, 1006, 2),
	(2, 1003, 4),
	(2, 1005, 5),
	(2, 6408, 5),
	(2, 9001, 10),
	(3, 3001, 5),
	(3, 6300, 15),
	(4, 3003, 2),
	(4, 5001, 7),
	(5, 1001, 5),
	(5, 1002, 4),
	(5, 1004, 5),
	(6, 1010, 5),
	(7, 1009, 9),
	(8, 1008, 7),
	(8, 1012, 5),
	(9, 1007, 4),
	(9, 1012, 5),
	(10, 1011, 7),
	(10, 4001, 7),
	(11, 1012, 5),
	(11, 5001, 2),
	(12, 1010, 15);
/*!40000 ALTER TABLE `bestellungzutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.ernaehrungskategorie
DROP TABLE IF EXISTS `ernaehrungskategorie`;
CREATE TABLE IF NOT EXISTS `ernaehrungskategorie` (
  `ErnKatID` int(11) NOT NULL AUTO_INCREMENT,
  `ErnKatName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ErnKatID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.ernaehrungskategorie: ~7 rows (ungefähr)
DELETE FROM `ernaehrungskategorie`;
/*!40000 ALTER TABLE `ernaehrungskategorie` DISABLE KEYS */;
INSERT INTO `ernaehrungskategorie` (`ErnKatID`, `ErnKatName`) VALUES
	(1, 'Vegan'),
	(2, 'Vegetarisch'),
	(3, 'Frutarisch'),
	(4, 'ohne Gentechnik'),
	(5, 'Laktosefrei'),
	(6, 'Glutenfrei'),
	(7, 'Low Carb');
/*!40000 ALTER TABLE `ernaehrungskategorie` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.kunde
DROP TABLE IF EXISTS `kunde`;
CREATE TABLE IF NOT EXISTS `kunde` (
  `KUNDENNR` int(11) NOT NULL,
  `NACHNAME` varchar(50) DEFAULT NULL,
  `VORNAME` varchar(50) DEFAULT NULL,
  `GEBURTSDATUM` date DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `HAUSNR` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `TELEFON` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KUNDENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.kunde: ~9 rows (ungefähr)
DELETE FROM `kunde`;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
INSERT INTO `kunde` (`KUNDENNR`, `NACHNAME`, `VORNAME`, `GEBURTSDATUM`, `STRASSE`, `HAUSNR`, `PLZ`, `ORT`, `TELEFON`, `EMAIL`) VALUES
	(2001, 'Wellensteyn', 'Kira', '1990-05-05', 'Eppendorfer Landstrasse', '104', '20249', 'Hamburg', '040/443322', 'k.wellensteyn@yahoo.de'),
	(2002, 'Foede', 'Dorothea', '2000-03-24', 'Ohmstraße', '23', '22765', 'Hamburg', '040/543822', 'd.foede@web.de'),
	(2003, 'Leberer', 'Sigrid', '1989-09-21', 'Bilser Berg', '6', '20459', 'Hamburg', '0175/1234588', 'sigrid@leberer.de'),
	(2004, 'Soerensen', 'Hanna', '1974-04-03', 'Alter Teichweg', '95', '22049', 'Hamburg', '040/634578', 'h.soerensen@yahoo.de'),
	(2005, 'Schnitter', 'Marten', '1964-04-17', 'Stübels', '10', '22835', 'Barsbüttel', '0176/447587', 'schni_mart@gmail.com'),
	(2006, 'Maurer', 'Belinda', '1978-09-09', 'Grotelertwiete', '4a', '21075', 'Hamburg', '040/332189', 'belinda1978@yahoo.de'),
	(2007, 'Gessert', 'Armin', '1978-01-29', 'Küstersweg', '3', '21079', 'Hamburg', '040/67890', 'armin@gessert.de'),
	(2008, 'Haessig', 'Jean-Marc', '1982-08-30', 'Neugrabener Bahnhofstraße', '30', '21149', 'Hamburg', '0178-67013390', 'jm@haessig.de'),
	(2009, 'Urocki', 'Eric', '1999-12-04', 'Elbchaussee', '228', '22605', 'Hamburg', '0152-96701390', 'urocki@outlook.de');
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.lieferant
DROP TABLE IF EXISTS `lieferant`;
CREATE TABLE IF NOT EXISTS `lieferant` (
  `LIEFERANTENNR` int(11) NOT NULL,
  `LIEFERANTENNAME` varchar(50) DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `HAUSNR` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `TELEFON` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LIEFERANTENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.lieferant: ~6 rows (ungefähr)
DELETE FROM `lieferant`;
/*!40000 ALTER TABLE `lieferant` DISABLE KEYS */;
INSERT INTO `lieferant` (`LIEFERANTENNR`, `LIEFERANTENNAME`, `STRASSE`, `HAUSNR`, `PLZ`, `ORT`, `TELEFON`, `EMAIL`) VALUES
	(101, 'Bio-Hof Müller', 'Dorfstraße', '74', '24354', 'Weseby', '04354-9080', 'mueller@biohof.de'),
	(102, 'Obst-Hof Altes Land', 'Westerjork 74', '76', '21635', 'Jork', '04162-4523', 'info@biohof-altesland.de'),
	(103, 'Molkerei Henning', 'Molkereiwegkundekunde', '13', '19217', 'Dechow', '038873-8976', 'info@molkerei-henning.de'),
	(104, 'RuptureFarms', 'Mudosalley', '13', '50367', 'Mudos', '193872441', 'molluck@rupturefarms.com'),
	(105, 'GüntersGurkenGmbH', 'Hinterdeich', '215', '31045', 'Otterndorf', '16497452', 'guenter@gurkengmbh.de'),
	(404, 'Not Found', 'N.A.', '404', '00000', 'N.A.', '404-0000', 'notFound@no-reply.com');
/*!40000 ALTER TABLE `lieferant` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezept
DROP TABLE IF EXISTS `rezept`;
CREATE TABLE IF NOT EXISTS `rezept` (
  `RezeptID` int(11) NOT NULL AUTO_INCREMENT,
  `RezeptName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RezeptID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezept: ~5 rows (ungefähr)
DELETE FROM `rezept`;
/*!40000 ALTER TABLE `rezept` DISABLE KEYS */;
INSERT INTO `rezept` (`RezeptID`, `RezeptName`) VALUES
	(1, 'Lachslasagne'),
	(2, 'ThaiCurry'),
	(3, 'Kartoffelsuppe'),
	(4, 'Milchreis mit Apfelmus'),
	(5, 'Sommerlicher Couscous-Salat');
/*!40000 ALTER TABLE `rezept` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezeptallergien
DROP TABLE IF EXISTS `rezeptallergien`;
CREATE TABLE IF NOT EXISTS `rezeptallergien` (
  `RezeptID` int(11) NOT NULL,
  `AllergieID` int(11) NOT NULL,
  PRIMARY KEY (`RezeptID`,`AllergieID`),
  KEY `AllergieID` (`AllergieID`),
  CONSTRAINT `rezeptallergien_ibfk_1` FOREIGN KEY (`RezeptID`) REFERENCES `rezept` (`RezeptID`),
  CONSTRAINT `rezeptallergien_ibfk_2` FOREIGN KEY (`AllergieID`) REFERENCES `allergien` (`AllergieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezeptallergien: ~4 rows (ungefähr)
DELETE FROM `rezeptallergien`;
/*!40000 ALTER TABLE `rezeptallergien` DISABLE KEYS */;
INSERT INTO `rezeptallergien` (`RezeptID`, `AllergieID`) VALUES
	(1, 2),
	(1, 7),
	(3, 4),
	(4, 2);
/*!40000 ALTER TABLE `rezeptallergien` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezepternaehrungskategorie
DROP TABLE IF EXISTS `rezepternaehrungskategorie`;
CREATE TABLE IF NOT EXISTS `rezepternaehrungskategorie` (
  `RezeptID` int(11) NOT NULL,
  `ErnKatID` int(11) NOT NULL,
  PRIMARY KEY (`RezeptID`,`ErnKatID`),
  KEY `ErnKatID` (`ErnKatID`),
  CONSTRAINT `rezepternaehrungskategorie_ibfk_1` FOREIGN KEY (`RezeptID`) REFERENCES `rezept` (`RezeptID`),
  CONSTRAINT `rezepternaehrungskategorie_ibfk_2` FOREIGN KEY (`ErnKatID`) REFERENCES `ernaehrungskategorie` (`ErnKatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezepternaehrungskategorie: ~15 rows (ungefähr)
DELETE FROM `rezepternaehrungskategorie`;
/*!40000 ALTER TABLE `rezepternaehrungskategorie` DISABLE KEYS */;
INSERT INTO `rezepternaehrungskategorie` (`RezeptID`, `ErnKatID`) VALUES
	(1, 4),
	(2, 4),
	(2, 5),
	(2, 6),
	(3, 1),
	(3, 2),
	(3, 4),
	(3, 5),
	(3, 6),
	(4, 4),
	(5, 1),
	(5, 2),
	(5, 4),
	(5, 5),
	(5, 7);
/*!40000 ALTER TABLE `rezepternaehrungskategorie` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezeptzutat
DROP TABLE IF EXISTS `rezeptzutat`;
CREATE TABLE IF NOT EXISTS `rezeptzutat` (
  `RezeptID` int(11) NOT NULL,
  `ZUTATENNR` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL,
  PRIMARY KEY (`RezeptID`,`ZUTATENNR`),
  KEY `ZUTATENNR` (`ZUTATENNR`),
  CONSTRAINT `rezeptzutat_ibfk_1` FOREIGN KEY (`RezeptID`) REFERENCES `rezept` (`RezeptID`),
  CONSTRAINT `rezeptzutat_ibfk_2` FOREIGN KEY (`ZUTATENNR`) REFERENCES `zutat` (`ZUTATENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezeptzutat: ~42 rows (ungefähr)
DELETE FROM `rezeptzutat`;
/*!40000 ALTER TABLE `rezeptzutat` DISABLE KEYS */;
INSERT INTO `rezeptzutat` (`RezeptID`, `ZUTATENNR`, `Menge`) VALUES
	(1, 1013, 1),
	(1, 1019, 1),
	(1, 2002, 1),
	(1, 3001, 1),
	(1, 3003, 1),
	(1, 3004, 1),
	(1, 3005, 1),
	(1, 3006, 1),
	(1, 6000, 1),
	(1, 6400, 1),
	(1, 7043, 2),
	(1, 8001, 2),
	(2, 1009, 1),
	(2, 1014, 1),
	(2, 1015, 2),
	(2, 1016, 1),
	(2, 1101, 1),
	(2, 3011, 1),
	(2, 7025, 1),
	(2, 9002, 3),
	(3, 1002, 1),
	(3, 1005, 1),
	(3, 1006, 5),
	(3, 1008, 1),
	(3, 1012, 1),
	(3, 1017, 1),
	(3, 1018, 1),
	(3, 1019, 1),
	(3, 7043, 5),
	(3, 9001, 2),
	(4, 1014, 1),
	(4, 2011, 1),
	(4, 3001, 1),
	(4, 3003, 1),
	(4, 6200, 1),
	(5, 1001, 1),
	(5, 1003, 3),
	(5, 1017, 1),
	(5, 1020, 1),
	(5, 1102, 1),
	(5, 6408, 1),
	(5, 7043, 2);
/*!40000 ALTER TABLE `rezeptzutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.zutat
DROP TABLE IF EXISTS `zutat`;
CREATE TABLE IF NOT EXISTS `zutat` (
  `ZUTATENNR` int(11) NOT NULL,
  `BEZEICHNUNG` varchar(50) DEFAULT NULL,
  `EINHEIT` varchar(25) DEFAULT NULL,
  `NETTOPREIS` decimal(10,2) DEFAULT NULL,
  `BESTAND` int(11) DEFAULT NULL,
  `LIEFERANT` int(11) DEFAULT NULL,
  `KALORIEN` int(11) DEFAULT NULL,
  `KOHLENHYDRATE` decimal(10,2) DEFAULT NULL,
  `PROTEIN` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ZUTATENNR`),
  KEY `LIEFERANT` (`LIEFERANT`),
  CONSTRAINT `zutat_ibfk_1` FOREIGN KEY (`LIEFERANT`) REFERENCES `lieferant` (`LIEFERANTENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.zutat: ~44 rows (ungefähr)
DELETE FROM `zutat`;
/*!40000 ALTER TABLE `zutat` DISABLE KEYS */;
INSERT INTO `zutat` (`ZUTATENNR`, `BEZEICHNUNG`, `EINHEIT`, `NETTOPREIS`, `BESTAND`, `LIEFERANT`, `KALORIEN`, `KOHLENHYDRATE`, `PROTEIN`) VALUES
	(1001, 'Zucchini', 'Stück', 0.89, 100, 101, 19, 2.00, 1.60),
	(1002, 'Zwiebel', 'Stück', 0.15, 50, 101, 28, 4.90, 1.20),
	(1003, 'Tomate', 'Stück', 0.45, 50, 101, 18, 2.60, 1.00),
	(1004, 'Schalotte', 'Stück', 0.20, 500, 101, 25, 3.30, 1.50),
	(1005, 'Karotte', 'Stück', 0.30, 500, 101, 41, 10.00, 0.90),
	(1006, 'Kartoffel', 'Stück', 0.15, 1500, 101, 71, 14.60, 2.00),
	(1007, 'Rucola', 'Bund', 0.90, 10, 101, 27, 2.10, 2.60),
	(1008, 'Lauch', 'Stück', 1.20, 35, 101, 29, 3.30, 2.10),
	(1009, 'Knoblauch', 'Stück', 0.25, 250, 101, 141, 28.40, 6.10),
	(1010, 'Basilikum', 'Bund', 1.30, 10, 101, 41, 5.10, 3.10),
	(1011, 'Süßkartoffel', 'Stück', 2.00, 200, 101, 86, 20.00, 1.60),
	(1012, 'Schnittlauch', 'Bund', 0.90, 10, 101, 28, 1.00, 3.00),
	(1013, 'Spinat', 'Packung', 1.45, 24, 101, 17, 1.00, 3.00),
	(1014, 'Reis', 'Packung', 1.93, 84, 101, 351, 75.00, 8.80),
	(1015, 'Gemüse (gemischt)', 'Packung', 1.79, 34, 101, 90, 6.40, 2.50),
	(1016, 'Bambussprossen', 'Glass', 1.27, 14, 101, 22, 0.90, 2.60),
	(1017, 'Petersilie', 'Bund', 2.67, 165, 101, 0, 6.00, 3.00),
	(1018, 'Majoran', 'Bund', 3.50, 100, 105, 0, 61.00, 13.00),
	(1019, 'Muskat', 'Dose', 6.95, 30, 105, 227, 45.00, 5.70),
	(1020, 'Paprika', 'Stück', 1.16, 45, 101, 43, 6.40, 1.30),
	(1101, 'Currypaste', 'Glass', 2.79, 1, 105, 460, 2.10, 3.80),
	(1102, 'Sonnenblumenöl', 'Flasche', 0.96, 76, 105, 884, 0.00, 0.00),
	(2001, 'Apfel', 'Stück', 1.20, 750, 102, 54, 14.40, 0.30),
	(2002, 'Zitrone', ' Stück', 0.97, 23, 102, 56, 8.00, 1.00),
	(2011, 'Apfelmuss', 'Glass', 0.97, 20, 105, 71, 17.00, 0.10),
	(3001, 'Vollmilch. 3.5%', 'Liter', 1.50, 50, 103, 65, 4.70, 3.40),
	(3002, 'Mozzarella', 'Packung', 3.50, 20, 103, 241, 1.00, 18.10),
	(3003, 'Butter', 'Stück', 3.00, 50, 103, 741, 0.60, 0.70),
	(3004, 'Käse (geriebenen)', 'Packung', 1.09, 50, 103, 364, 0.00, 22.00),
	(3005, 'Sahne', '250g', 1.29, 19, 103, 163, 4.00, 2.90),
	(3006, 'Pamesan', 'Packung', 1.79, 73, 103, 402, 0.00, 32.00),
	(3011, 'Kokosmilch', 'Liter', 2.69, 6, 105, 27, 1.90, 0.20),
	(4001, 'Ei', 'Stück', 0.40, 300, 101, 137, 1.50, 11.90),
	(5001, 'Wiener Würstchen', 'Paar', 1.80, 40, 104, 331, 1.20, 9.90),
	(6000, 'Mehl', 'Packung', 1.09, 27, 101, 337, 71.00, 10.00),
	(6200, 'Vanillezucker', 'Päckchen', 0.96, 55, 105, 394, 98.50, 0.00),
	(6300, 'Kichererbsen', 'Dose', 1.00, 400, 101, 150, 21.20, 9.00),
	(6400, 'Nudelplatten', 'Stück', 2.15, 11, 101, 359, 71.70, 12.00),
	(6408, 'Couscous', 'Packung', 1.90, 15, 101, 351, 67.00, 12.00),
	(7025, 'Sojasoße', 'Flasche', 2.39, 29, 105, 229, 50.00, 6.30),
	(7043, 'Gemüsebrühe', 'Würfel', 0.20, 4000, 101, 1, 0.50, 0.50),
	(8001, 'Lachs (TK)', 'Packung', 3.15, 3, 105, 131, 0.00, 18.40),
	(9001, 'Tofu-Würstchen', 'Stück', 1.80, 20, 105, 252, 7.00, 17.00),
	(9002, 'Hähnchenbrustfilet', '200g', 2.40, 15, 104, 111, 0.00, 25.00);
/*!40000 ALTER TABLE `zutat` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
