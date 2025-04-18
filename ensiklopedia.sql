-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2024 at 02:57 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ensiklopedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `ARTICLE_ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `CATEGORY_ID` int DEFAULT NULL,
  `JUDUL_ARTICLE` longtext,
  `KONTEN_ARTICLE` text,
  `FOTO_ARTICLE` varchar(100) DEFAULT NULL,
  `TANGGAL_ARTICLE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ARTICLE_ID`, `USER_ID`, `CATEGORY_ID`, `JUDUL_ARTICLE`, `KONTEN_ARTICLE`, `FOTO_ARTICLE`, `TANGGAL_ARTICLE`) VALUES
(8, 2, 1, 'b', 'b', NULL, '2024-05-30 14:19:27'),
(9, 2, 1, 'g', 'g', NULL, '2024-05-30 14:49:52'),
(10, 2, 3, 'judul 1', 'konten 1', NULL, '2024-05-31 16:50:06'),
(11, 2, 2, 'judul komedi', 'konten komedi', NULL, '2024-05-31 17:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `BOOKMARK_ID` int NOT NULL,
  `ARTICLE_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `CATEGORY_ID` int DEFAULT NULL,
  `JUDUL_BOOKMARK` varchar(100) DEFAULT NULL,
  `URL_BOOKMARK` varchar(100) DEFAULT NULL,
  `KONTEN_BOOKMARK` text,
  `FOTO_BOOKMARK` varchar(100) DEFAULT NULL,
  `TANGGAL_ BOOKMARK` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CATEGORY_ID` int NOT NULL,
  `NAMA_CATEGORY` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CATEGORY_ID`, `NAMA_CATEGORY`) VALUES
(1, 'Sains'),
(2, 'Humor'),
(3, 'Horror'),
(4, 'SciFi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `FOTO_USER` varchar(100) DEFAULT NULL,
  `IS_ADMIN` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `NAMA`, `USERNAME`, `EMAIL`, `PASSWORD`, `FOTO_USER`, `IS_ADMIN`) VALUES
(1, 'c', 'c', 'c', 'c', NULL, 0),
(2, 'b', 'b', 'b', 'b', NULL, 0),
(3, 'fadil', 'f', 'f', 'f', NULL, 0),
(4, 'Albi Akhsanul', 'albi', 'albi@gmail.com', 'password', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`ARTICLE_ID`),
  ADD KEY `FK_ARTICLE_MEMILIKI_CATEGORY` (`CATEGORY_ID`),
  ADD KEY `FK_ARTICLE_MEMILIKI_USER` (`USER_ID`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`BOOKMARK_ID`),
  ADD KEY `FK_BOOKMARK_MEMILIKI_ARTICLE` (`ARTICLE_ID`),
  ADD KEY `FK_BOOKMARK_MEMILIKI_CATEGORY` (`CATEGORY_ID`),
  ADD KEY `FK_BOOKMARK_MEMILIKI_USER` (`USER_ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CATEGORY_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `ARTICLE_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `BOOKMARK_ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CATEGORY_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `FK_ARTICLE_MEMILIKI_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`CATEGORY_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_ARTICLE_MEMILIKI_USER` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `FK_BOOKMARK_MEMILIKI_ARTICLE` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `articles` (`ARTICLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_BOOKMARK_MEMILIKI_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`CATEGORY_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_BOOKMARK_MEMILIKI_USER` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
