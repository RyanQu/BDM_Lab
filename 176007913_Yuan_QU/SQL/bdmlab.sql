-- phpMyAdmin SQL Dump
-- version 4.4.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-03-26 23:04:15
-- Server version： 5.7.14
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bdmlab`
--
CREATE DATABASE IF NOT EXISTS `bdmlab` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bdmlab`;

-- --------------------------------------------------------

--
-- Table Structure `buynsell`
--

DROP TABLE IF EXISTS `buynsell`;
CREATE TABLE IF NOT EXISTS `buynsell` (
  `ID` int(4) NOT NULL,
  `ticker` varchar(6) NOT NULL,
  `buy_or_sell` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` float NOT NULL,
  `num_of_shares` int(6) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Truncate before the insert `buynsell`
--

TRUNCATE TABLE `buynsell`;
--
-- Insert data into `buynsell`
--

INSERT INTO `buynsell` (`ID`, `ticker`, `buy_or_sell`, `date`, `timestamp`, `price`, `num_of_shares`) VALUES
(1, 'IBM', 'BUY', '2017-03-20', '2017-03-20 15:55:00', 273, 1100),
(2, 'IBM', 'BUY', '2017-03-21', '2017-03-21 14:45:00', 271, 2400),
(3, 'IBM', 'SELL', '2017-03-22', '2017-03-22 16:09:00', 270.5, 2500),
(4, 'GOOG', 'BUY', '2017-03-20', '2017-03-20 16:22:00', 86, 2200),
(5, 'GOOG', 'SELL', '2017-03-20', '2017-03-20 18:00:00', 87, 1000),
(6, 'GOOG', 'SELL', '2017-03-21', '2017-03-21 14:22:00', 87.5, 1000),
(7, 'GOOG', 'BUY', '2017-03-21', '2017-03-21 17:28:00', 87, 800),
(8, 'GOOG', 'SELL', '2017-03-22', '2017-03-22 15:45:00', 86, 500),
(9, 'AAPL', 'BUY', '2017-03-20', '2017-03-20 14:01:00', 99, 1000),
(10, 'AAPL', 'BUY', '2017-03-20', '2017-03-20 15:22:00', 99.5, 1000),
(11, 'AAPL', 'BUY', '2017-03-21', '2017-03-21 18:22:00', 100, 1000),
(12, 'AAPL', 'SELL', '2017-03-22', '2017-03-26 23:01:08', 1030, 3000),
(13, 'MSFT', 'BUY', '2017-03-20', '2017-03-20 15:45:00', 186, 1500),
(14, 'MSFT', 'SELL', '2017-03-21', '2017-03-21 14:45:00', 188, 1000),
(15, 'MSFT', 'BUY', '2017-03-22', '2017-03-22 16:03:00', 187, 5000),
(16, 'AAPL', 'SELL', '2017-03-22', '2017-03-22 23:37:36', 105, 5000);

-- --------------------------------------------------------

--
-- Table Structure `price`
--

DROP TABLE IF EXISTS `price`;
CREATE TABLE IF NOT EXISTS `price` (
  `ticker` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `close` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate before the insert `price`
--

TRUNCATE TABLE `price`;
--
-- Insert data into `price`
--

INSERT INTO `price` (`ticker`, `date`, `close`) VALUES
('AAPL', '2017-03-20', 100),
('AAPL', '2017-03-21', 101.5),
('AAPL', '2017-03-22', 106.5),
('GOOG', '2017-03-20', 100),
('GOOG', '2017-03-21', 130),
('GOOG', '2017-03-22', 110),
('MSFT', '2017-03-20', 184.5),
('MSFT', '2017-03-21', 188.5),
('MSFT', '2017-03-22', 210),
('IBM', '2017-03-20', 72),
('IBM', '2017-03-21', 70),
('IBM', '2017-03-22', 10),
('GE', '2017-03-20', 101.1),
('GE', '2017-03-21', 102.2);

-- --------------------------------------------------------

--
-- Table Structure `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `ticker` varchar(6) NOT NULL,
  `exchange` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate before the insert `stock`
--

TRUNCATE TABLE `stock`;
--
-- Insert data into `stock`
--

INSERT INTO `stock` (`ticker`, `exchange`) VALUES
('AAPL', 'NASDAQ'),
('GOOG', 'NASDAQ'),
('MSFT', 'NASDAQ'),
('IBM', 'NYSE'),
('GE', 'NYSE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buynsell`
--
ALTER TABLE `buynsell`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`ticker`,`date`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ticker`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buynsell`
--
ALTER TABLE `buynsell`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
