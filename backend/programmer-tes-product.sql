-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2026 at 08:59 AM
-- Server version: 9.3.0
-- PHP Version: 8.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `programmer-tes-product`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`) VALUES
(1, 'iphone promek', 120000),
(2, 'infinix 12 pro', 120000),
(3, 'asda', 123),
(4, 'barang bagus ngab', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` enum('ACTIVE','CANCELLED') DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `product_id`, `quantity`, `total_price`, `status`, `created_at`) VALUES
(1, 3, 2, 120000.00, 'ACTIVE', '2026-01-13 04:43:23'),
(2, 1, 10, 1200000.00, 'ACTIVE', '2026-01-13 06:04:07'),
(3, 1, 2, 240000.00, 'ACTIVE', '2026-01-13 06:06:55'),
(4, 1, 2, 240000.00, 'ACTIVE', '2026-01-13 06:19:19'),
(5, 2, 1, 120000.00, 'ACTIVE', '2026-01-13 08:32:40'),
(6, 2, 1, 120000.00, 'ACTIVE', '2026-01-13 08:33:30'),
(7, 2, 1, 120000.00, 'ACTIVE', '2026-01-13 08:33:32'),
(8, 2, 1, 120000.00, 'ACTIVE', '2026-01-13 08:33:32'),
(9, 2, 1, 120000.00, 'ACTIVE', '2026-01-13 08:33:33'),
(10, 2, 1, 120000.00, 'ACTIVE', '2026-01-13 08:33:33'),
(11, 2, 1, 120000.00, 'ACTIVE', '2026-01-13 08:33:34'),
(12, 3, 1, 123.00, 'ACTIVE', '2026-01-13 08:33:37'),
(13, 3, 1, 123.00, 'ACTIVE', '2026-01-13 08:33:38'),
(14, 3, 1, 123.00, 'ACTIVE', '2026-01-13 08:33:38'),
(15, 3, 1, 123.00, 'ACTIVE', '2026-01-13 08:33:39'),
(16, 3, 1, 123.00, 'ACTIVE', '2026-01-13 08:33:39'),
(17, 3, 1, 123.00, 'ACTIVE', '2026-01-13 08:33:40'),
(18, 4, 1, 10000.00, 'ACTIVE', '2026-01-13 08:33:43'),
(19, 4, 1, 10000.00, 'ACTIVE', '2026-01-13 08:33:43'),
(20, 4, 1, 10000.00, 'ACTIVE', '2026-01-13 08:33:44'),
(21, 4, 5, 50000.00, 'ACTIVE', '2026-01-13 08:33:56'),
(22, 3, 1, 123.00, 'ACTIVE', '2026-01-13 08:50:20'),
(23, 2, 2, 240000.00, 'ACTIVE', '2026-01-13 08:52:38'),
(24, 3, 12, 1476.00, 'ACTIVE', '2026-01-13 08:54:16'),
(25, 3, 12, 1476.00, 'ACTIVE', '2026-01-13 08:54:44'),
(26, 3, 12, 1476.00, 'ACTIVE', '2026-01-13 08:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `quantity`) VALUES
(2, 3, 80),
(3, 2, 991),
(4, 4, 2),
(5, 1, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
