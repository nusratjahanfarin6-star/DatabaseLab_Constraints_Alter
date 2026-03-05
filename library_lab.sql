-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2026 at 04:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `Book_Status` enum('AVAILABLE','BORROWED') DEFAULT 'AVAILABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `Title`, `ISBN`, `Price`, `Book_Status`) VALUES
(1, 'The Great Gatsby', '9780743273565', 159.00, 'AVAILABLE'),
(2, '1984', '9780451524935', 125.00, 'AVAILABLE'),
(3, 'The Hobbit', '9780547928227', 200.00, 'AVAILABLE'),
(4, 'Sapiens', '9780062316097', 180.00, 'AVAILABLE'),
(5, 'SQL Guide', '9781234567890', 450.00, 'AVAILABLE');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `LoanID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`LoanID`, `MemberID`, `BookID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Phone` varchar(15) NOT NULL DEFAULT 'N/A'
) ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `FullName`, `Email`, `Age`, `Phone`) VALUES
(1, 'Nusrat', 'nusrat@gmail.com', 20, '01471245451'),
(2, 'Saif', 'saif@gmail.com', 22, '01712545455'),
(3, 'Sakib', 'sakib@gmail.com', 15, '01922415454'),
(4, 'Sumaiya', 'sumaiya@gmail.com', 21, '01385124457'),
(5, 'Noyon', 'noyon@gmail.com', 23, '01812545455');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `LoanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
