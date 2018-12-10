-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2018 at 04:10 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.1.23-3+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LittleBobbyTablesAuctionHouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `AuctionData`
--

CREATE TABLE `AuctionData` (
  `AuctionID` int(11) NOT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `SellerID` int(11) DEFAULT NULL,
  `BuyerID` int(11) DEFAULT NULL,
  `OpeningDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ClosingDate` timestamp NULL DEFAULT NULL,
  `CurrentBidID` int(11) DEFAULT NULL,
  `ClosingBidID` int(11) DEFAULT NULL,
  `OpeningBid` int(11) DEFAULT NULL,
  `ClosingBid` int(11) DEFAULT NULL,
  `CurrentBid` int(11) DEFAULT NULL,
  `CurrentHighBid` int(11) DEFAULT NULL,
  `Reserve` int(11) DEFAULT NULL,
  `Increment` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `AuctionData`
--

INSERT INTO `AuctionData` (`AuctionID`, `ItemID`, `SellerID`, `BuyerID`, `OpeningDate`, `ClosingDate`, `CurrentBidID`, `ClosingBidID`, `OpeningBid`, `ClosingBid`, `CurrentBid`, `CurrentHighBid`, `Reserve`, `Increment`, `EmployeeID`) VALUES
(10, 5, 123456789, NULL, '2018-12-09 21:33:05', '2018-12-10 20:59:54', NULL, NULL, 200, NULL, NULL, NULL, 800, 50, 616666661),
(11, 3, 912345678, NULL, '2018-12-09 21:33:05', '2018-12-12 05:00:00', NULL, NULL, 2000, NULL, NULL, NULL, 14000, 500, 771177711),
(12, 2, 567891234, NULL, '2018-12-09 21:37:12', '2018-12-12 05:00:00', NULL, NULL, 3000, NULL, NULL, NULL, 22000, 600, 616666661),
(13, 4, 678912345, NULL, '2018-12-09 21:37:12', '2018-12-12 05:00:00', NULL, NULL, 3000, NULL, NULL, NULL, 25000, 800, 555555115),
(14, 1, 123456789, NULL, '2018-12-09 21:39:15', '2018-12-13 05:00:00', NULL, NULL, 1000, NULL, NULL, NULL, 2000, 100, 616666661),
(15, 5, 912345678, NULL, '2018-12-09 21:39:15', '2018-12-10 18:35:35', NULL, NULL, 400, NULL, NULL, NULL, 900, 50, 771725123),
(16, 5, 567891234, NULL, '2018-12-06 05:00:00', '2018-12-08 05:00:00', 13, 13, 200, NULL, NULL, NULL, 800, 150, 765567567),
(17, 5, 567891234, NULL, '2018-12-07 05:00:00', '2018-12-08 05:00:00', 14, 14, 300, NULL, NULL, NULL, 800, 100, 771177711),
(18, 3, 567891234, NULL, '2018-12-05 05:00:00', '2018-12-07 05:00:00', 28, 28, 4000, NULL, NULL, 12500, 8000, 600, 765567567),
(19, 2, 912345678, NULL, '2018-12-05 05:00:00', '2018-12-07 05:00:00', 22, 16, 3000, NULL, NULL, 10000, 10000, 500, 555555115),
(20, 5, 678912345, NULL, '2018-12-07 05:00:00', '2018-12-12 21:00:01', 42, NULL, 400, NULL, NULL, 1350, 1150, 100, 600000998);

-- --------------------------------------------------------

--
-- Table structure for table `Bid`
--

CREATE TABLE `Bid` (
  `BidNum` int(11) NOT NULL,
  `AuctionID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `MaxBid` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Bid`
--

INSERT INTO `Bid` (`BidNum`, `AuctionID`, `CustomerID`, `Value`, `MaxBid`, `Time`) VALUES
(13, 16, 891234567, 2000, 2000, '2018-12-09 21:48:14'),
(14, 17, 777888999, 1000, 1000, '2018-12-09 21:48:14'),
(15, 18, 303030300, 8000, 8000, '2018-12-09 21:53:57'),
(16, 19, 777888999, 10000, 10000, '2018-12-09 21:53:57'),
(22, 19, 777888999, 100, 100, '2018-12-10 18:32:21'),
(23, 20, 678912345, 600, 800, '2018-12-10 18:36:51'),
(27, 18, 777888999, 11500, 11500, '2018-12-10 19:29:10'),
(28, 18, 678912345, 12500, 12500, '2018-12-10 19:33:21'),
(29, 18, 567891234, 500, 600, '2018-12-10 19:33:53'),
(42, 20, 891234567, 1150, 1350, '2018-12-10 21:09:51'),
(43, 20, 891234567, 1150, 1350, '2018-12-10 21:09:53');

--
-- Triggers `Bid`
--
DELIMITER $$
CREATE TRIGGER `update_AuctionDatas_CurrentBidID` AFTER INSERT ON `Bid` FOR EACH ROW UPDATE AuctionData A
SET A.CurrentBidID = NEW.BidNum
WHERE NEW.Value > 
(SELECT B.Value
FROM Bid B 
WHERE B.AuctionID = NEW.AuctionID AND B.BidNum != NEW.BidNum
ORDER BY B.Value DESC
LIMIT 1
)
AND A.AuctionID = NEW.AuctionID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerData`
--

CREATE TABLE `CustomerData` (
  `CustomerID` int(11) NOT NULL,
  `LastName` char(40) DEFAULT NULL,
  `FirstName` char(40) DEFAULT NULL,
  `Address` char(40) DEFAULT NULL,
  `City` char(40) DEFAULT NULL,
  `State` enum('AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY') DEFAULT NULL,
  `ZipCode` int(5) DEFAULT NULL,
  `Telephone` bigint(10) DEFAULT NULL,
  `EmailAddress` char(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `CreditCard` bigint(23) DEFAULT NULL,
  `NumberItemsSold` int(11) NOT NULL DEFAULT '0',
  `ItemsPurchased` int(11) NOT NULL DEFAULT '0',
  `Rating` int(11) NOT NULL DEFAULT '0',
  `RatingAmount` int(11) NOT NULL DEFAULT '0',
  `AuthorizationLevel` enum('customer') NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CustomerData`
--

INSERT INTO `CustomerData` (`CustomerID`, `LastName`, `FirstName`, `Address`, `City`, `State`, `ZipCode`, `Telephone`, `EmailAddress`, `Password`, `CreditCard`, `NumberItemsSold`, `ItemsPurchased`, `Rating`, `RatingAmount`, `AuthorizationLevel`) VALUES
(123456789, 'Ul', 'Yongshi', '321 bad street', 'bony brook', 'OK', 11791, 1234123411, 'shiyong@gmail.com', 'password123', 2018201820182018, 12, 12, 5, 11, 'customer'),
(303030300, 'cool', 'cool', 'cool', 'cool', 'CO', 30001, 3030303004, 'cool@cool.cool', 'cool', 4004000044444444, 0, 0, 2, 0, 'customer'),
(567891234, 'Smith', 'John', '789 Peace Blvd.', 'Los ANgeles', 'CA', 12345, 4124434321, 'shlu@ic.sunysb.edu', 'password123', 2345678923456789, 5, 4, 1, 1, 'customer'),
(678912345, 'Phil', 'Lewis', '135 Knowledge Lane', 'Stony Brook', 'NY', 11794, 5166668888, 'pml@cs.sunysb.edu', 'password123', 6789234567892345, 4, 3, 1, 1, 'customer'),
(777888999, 'Kleiman', 'Ilan', 'Something Something else', 'Stony Brook', 'NY', 10441, 6464643484, 'ilan@stonybrook.edu', 'goodpassword', 12341234123412344, 0, 0, 0, 0, 'customer'),
(891234567, 'j', '1', '1', '1', 'AL', 1, 1, '1@1.1', '1', 1, 0, 0, 0, 0, 'customer'),
(912345678, 'Three', 'Two', '2nd Street', 'New York', 'NY', 22222, 9112222222, '2@2.2', '2', 2222222222222222, 0, 0, 2, 0, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeData`
--

CREATE TABLE `EmployeeData` (
  `EmployeeID` int(11) NOT NULL,
  `LastName` char(40) DEFAULT NULL,
  `FirstName` char(40) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Address` char(100) DEFAULT NULL,
  `City` char(40) DEFAULT NULL,
  `State` enum('AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY') DEFAULT NULL,
  `ZipCode` int(5) DEFAULT NULL,
  `Telephone` bigint(11) DEFAULT NULL,
  `StartDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HourlyRate` int(11) DEFAULT NULL,
  `AuthorizationLevel` enum('manager','customerRepresentative') DEFAULT 'customerRepresentative',
  `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `EmployeeData`
--

INSERT INTO `EmployeeData` (`EmployeeID`, `LastName`, `FirstName`, `EmailAddress`, `Password`, `Address`, `City`, `State`, `ZipCode`, `Telephone`, `StartDate`, `HourlyRate`, `AuthorizationLevel`, `Created`) VALUES
(123321111, 'l', 'la', 'l@l.l', 'l', 'l', 'l', 'LA', 10101, 1010101010, '2016-05-01 04:00:00', 2039, 'customerRepresentative', '2018-12-09 04:40:26'),
(123321123, 'pp', 'pp', 'pp@pp.pp', 'pp', 'pp', 'pp', 'PA', 34271, 9142377700, '2016-04-18 04:00:00', 210, 'customerRepresentative', '2018-12-09 04:40:26'),
(555555115, 'Davidson', 'Jared', 'd@d.d', 'd', '4322 other Street', 'New Jersey', 'NJ', 10001, 2313572385, '2018-12-10 17:35:50', 20, 'customerRepresentative', '2018-12-09 04:40:26'),
(600000998, '123', '123', '345678@0876.12', '123', '123', 'bigD', 'IN', 31982, 6000009987, '2018-06-05 04:00:00', 42, 'customerRepresentative', '2018-12-09 04:40:26'),
(616666661, 'Goat', 'William', 'bgoat@bt.org', 'bpass', '4 Grass Lane', 'New York', 'NY', 10003, 7186295728, '2018-12-07 13:48:06', 14, 'customerRepresentative', '2018-12-09 04:40:26'),
(667789191, 'pp', 'pp', 'pp@pp.pp', 'pp', 'pp', 'pp', 'PA', 43245, 5150908888, '2018-05-01 04:00:00', 20, 'customerRepresentative', '2018-12-09 04:40:26'),
(715999010, '8y1iu2h3', 'iuy4jk3', '1283712uiyk@mail.com', 'jhasd', '87y1iu3', 'Biuhwqkeb', 'HI', 65754, 7159990101, '2018-09-08 04:00:00', 21, 'customerRepresentative', '2018-12-09 04:40:26'),
(765567567, 't', 't', 't@t.t', 't', 't', 't', 'TN', 10000, 9998888, '2018-12-09 04:40:51', 321, 'customerRepresentative', '2018-12-09 04:40:26'),
(771177711, 'Seinfeld', 'Jerry', 'nightEmp@em.c', NULL, '5 78th Street', 'New York', 'NY', 10001, 9742103947, '2018-12-07 13:48:09', 11, 'customerRepresentative', '2018-12-09 04:40:26'),
(771725123, 'Warren', 'David', 'wd@wd.wd', 'wd', '456 Sunken Street', 'Stony Brook', 'NY', 11794, 5166329987, '2018-12-07 13:48:12', 50, 'manager', '2018-12-09 04:40:26'),
(909909111, 'asd', 'asd', 'alama@al.c', 'asd', 'dsa', 'asd', 'CT', 123, 3217778888, '2018-04-15 04:00:00', 420, 'customerRepresentative', '2018-12-09 04:40:26'),
(987638176, 'pp', 'pp', 'pppa@ppp.ppp', 'pp', 'pp', 'pp', 'PA', 32141, 1234321234, '2016-08-05 04:00:00', 42, 'customerRepresentative', '2018-12-09 04:40:26'),
(999999999, 'q', 'qw', 'q@q.q', 'q', 'q', '99999', 'OH', 99999, 9999999999, '2012-04-10 04:00:00', 9123, 'customerRepresentative', '2018-12-09 04:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `ItemData`
--

CREATE TABLE `ItemData` (
  `ItemID` int(11) NOT NULL,
  `ItemName` char(40) DEFAULT NULL,
  `PosterIdNumber` int(10) NOT NULL,
  `ItemType` enum('Books','Food, Media','Games','Beauty','Electronics, Clothing','Jewelry','Home','Sports') DEFAULT NULL,
  `YearManufactured` year(4) DEFAULT NULL,
  `AmountInStock` int(11) DEFAULT NULL,
  `ItemDescription` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ItemData`
--

INSERT INTO `ItemData` (`ItemID`, `ItemName`, `PosterIdNumber`, `ItemType`, `YearManufactured`, `AmountInStock`, `ItemDescription`) VALUES
(1, 'Titanic', 5, 'Food, Media', 2005, 4, 'Big Boat'),
(2, 'Nissan Sentra', 1000, 'Books', 2007, 1, 'Big Car'),
(3, 'JaguarCar', 2, 'Food, Media', 2000, 5, 'Small Car'),
(4, 'PriusCar', 5, 'Food, Media', 2010, 3, 'Tiny Car'),
(5, 'iPhone5', 8, 'Electronics, Clothing', 2015, 200, 'Big Phone');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AuctionData`
--
ALTER TABLE `AuctionData`
  ADD PRIMARY KEY (`AuctionID`),
  ADD KEY `SellerID` (`SellerID`) USING BTREE,
  ADD KEY `AuctionData_EmployeeID_EmployeeData` (`EmployeeID`),
  ADD KEY `AuctionData_ibfk_2` (`ItemID`),
  ADD KEY `AuctionData_ibfk_4` (`BuyerID`),
  ADD KEY `bidNumReferences` (`ClosingBidID`),
  ADD KEY `currBidNumReferences` (`CurrentHighBid`),
  ADD KEY `currBidNumReferencesS` (`CurrentBidID`);

--
-- Indexes for table `Bid`
--
ALTER TABLE `Bid`
  ADD PRIMARY KEY (`BidNum`),
  ADD KEY `something_auction_id` (`AuctionID`),
  ADD KEY `something_customer_id` (`CustomerID`);

--
-- Indexes for table `CustomerData`
--
ALTER TABLE `CustomerData`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `EmployeeData`
--
ALTER TABLE `EmployeeData`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `ItemData`
--
ALTER TABLE `ItemData`
  ADD PRIMARY KEY (`ItemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AuctionData`
--
ALTER TABLE `AuctionData`
  MODIFY `AuctionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Bid`
--
ALTER TABLE `Bid`
  MODIFY `BidNum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `EmployeeData`
--
ALTER TABLE `EmployeeData`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000000;

--
-- AUTO_INCREMENT for table `ItemData`
--
ALTER TABLE `ItemData`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AuctionData`
--
ALTER TABLE `AuctionData`
  ADD CONSTRAINT `AuctionData_EmployeeID_EmployeeData` FOREIGN KEY (`EmployeeID`) REFERENCES `EmployeeData` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `AuctionData_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `ItemData` (`ItemID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `AuctionData_ibfk_3` FOREIGN KEY (`SellerID`) REFERENCES `CustomerData` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `AuctionData_ibfk_4` FOREIGN KEY (`BuyerID`) REFERENCES `CustomerData` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bidNumReferences` FOREIGN KEY (`ClosingBidID`) REFERENCES `Bid` (`BidNum`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `currBidNumReferencesS` FOREIGN KEY (`CurrentBidID`) REFERENCES `Bid` (`BidNum`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Bid`
--
ALTER TABLE `Bid`
  ADD CONSTRAINT `something_auction_id` FOREIGN KEY (`AuctionID`) REFERENCES `AuctionData` (`AuctionID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `something_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `CustomerData` (`CustomerID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
