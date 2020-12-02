-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 11:35 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', '2020-12-01 17:23:22', NULL),
(2, 'Laptop', '2020-12-01 17:23:22', NULL),
(3, 'Tv', '2020-12-01 17:24:11', NULL),
(4, 'Bike', '2020-12-01 17:24:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cat_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Iphone1', '65000.00', '2020-12-01 17:25:17', '2020-12-02 06:52:11'),
(2, 2, 'HP', '68000.00', '2020-12-01 17:25:17', NULL),
(3, 3, 'Sony', '32500.00', '2020-12-01 17:26:03', NULL),
(4, 4, 'Hero', '125000.00', '2020-12-01 17:26:03', NULL),
(6, 1, 'Nokia', '13500.00', '2020-12-02 06:53:07', NULL),
(7, 1, 'Samsung', '15500.00', '2020-12-02 06:53:07', NULL),
(8, 1, 'Xiaomi', '18500.00', '2020-12-02 06:54:05', NULL),
(9, 1, 'Huawei ', '14500.00', '2020-12-02 06:54:05', '2020-12-02 06:54:17'),
(10, 2, 'Lenevo', '45000.00', '2020-12-02 06:55:27', NULL),
(11, 2, 'Asus', '48000.00', '2020-12-02 06:55:27', NULL),
(12, 2, 'Dell', '120000.00', '2020-12-02 01:39:36', '2020-12-02 01:39:36'),
(13, 3, 'walton', '12800.00', '2020-12-02 01:48:03', '2020-12-02 01:48:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
