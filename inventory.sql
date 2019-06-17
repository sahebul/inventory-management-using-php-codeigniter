-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2019 at 11:02 AM
-- Server version: 10.1.40-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_activities`
--

CREATE TABLE `tbl_admin_activities` (
  `activity_id` int(10) NOT NULL,
  `login_id` varchar(100) NOT NULL,
  `activity` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin_activities`
--

INSERT INTO `tbl_admin_activities` (`activity_id`, `login_id`, `activity`, `created_at`) VALUES
(1, '1', 'Admin created a category at Jun 17, 2019 10:31', '2019-06-17 05:01:10'),
(2, '1', 'Admin created a category at Jun 17, 2019 10:31', '2019-06-17 05:01:21'),
(3, '1', 'Admin created a category at Jun 17, 2019 10:31', '2019-06-17 05:01:33'),
(4, '1', 'Admin created a category at Jun 17, 2019 10:31', '2019-06-17 05:01:42'),
(5, '1', 'Admin created a category at Jun 17, 2019 10:31', '2019-06-17 05:01:51'),
(6, '1', 'Admin adde a brand at Jun 17, 2019 10:32', '2019-06-17 05:02:14'),
(7, '1', 'Admin adde a brand at Jun 17, 2019 10:32', '2019-06-17 05:02:24'),
(8, '1', 'Admin adde a brand at Jun 17, 2019 10:32', '2019-06-17 05:02:32'),
(9, '1', 'Admin adde a brand at Jun 17, 2019 10:32', '2019-06-17 05:02:39'),
(10, '1', 'Admin adde a brand at Jun 17, 2019 10:32', '2019-06-17 05:02:48'),
(11, '1', 'Admin adde a attribute at Jun 17, 2019 10:33', '2019-06-17 05:03:32'),
(12, '1', 'Admin adde a attribute at Jun 17, 2019 10:34', '2019-06-17 05:04:13'),
(13, '1', 'Admin adde a attribute at Jun 17, 2019 10:34', '2019-06-17 05:04:55'),
(14, '1', 'Admin adde a product at Jun 17, 2019 10:36', '2019-06-17 05:06:07'),
(15, '1', 'Admin adde a product at Jun 17, 2019 10:40', '2019-06-17 05:10:13'),
(16, '1', 'Admin adde a sales at Jun 17, 2019 10:50', '2019-06-17 05:20:51'),
(17, '1', 'Admin adde a sales at Jun 17, 2019 10:51', '2019-06-17 05:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image_path` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `name`, `image_path`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Brand 1', NULL, '2019-06-17 05:02:14', '0000-00-00 00:00:00', 0),
(2, 'Brand 2', NULL, '2019-06-17 05:02:24', '0000-00-00 00:00:00', 0),
(3, 'Brand 3', NULL, '2019-06-17 05:02:32', '0000-00-00 00:00:00', 0),
(4, 'Brand 4', NULL, '2019-06-17 05:02:39', '0000-00-00 00:00:00', 0),
(5, 'Brand 5', NULL, '2019-06-17 05:02:48', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `name`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Category 1', '2019-06-17 05:01:10', '2019-06-17 05:01:10', 0),
(2, 'Category 2', '2019-06-17 05:01:21', '2019-06-17 05:01:21', 0),
(3, 'Category 3', '2019-06-17 05:01:33', '2019-06-17 05:01:33', 0),
(4, 'Category 4', '2019-06-17 05:01:42', '2019-06-17 05:01:42', 0),
(5, 'Category 5', '2019-06-17 05:01:51', '2019-06-17 05:01:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `username`, `password`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2019-05-23 04:13:47', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `prod_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `image_path` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`prod_id`, `category_id`, `brand_id`, `name`, `description`, `image_path`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 1, 1, 'Product 1', ' Sample text', NULL, '2019-06-17 05:06:07', '0000-00-00 00:00:00', 0),
(2, 2, 2, 'Product 2', ' product description', NULL, '2019-06-17 05:10:12', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_attributes`
--

CREATE TABLE `tbl_product_attributes` (
  `attributes_id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `values` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_attributes`
--

INSERT INTO `tbl_product_attributes` (`attributes_id`, `name`, `values`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Color', '[{\"value\":\"Red\"},{\"value\":\"Blue\"},{\"value\":\"White\"},{\"value\":\"Green\"}]', '2019-06-17 05:03:32', '0000-00-00 00:00:00', 0),
(2, 'Thickness', '[{\"value\":\"10mm\"},{\"value\":\"12mm\"},{\"value\":\"14mm\"},{\"value\":\"20mm\"}]', '2019-06-17 05:04:13', '0000-00-00 00:00:00', 0),
(3, 'Diameter', '[{\"value\":\"10 cm\"},{\"value\":\"12 cm\"},{\"value\":\"20 cm\"}]', '2019-06-17 05:04:55', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_attribute_values`
--

CREATE TABLE `tbl_product_attribute_values` (
  `attributes_value_id` int(10) NOT NULL,
  `attributes_id` int(10) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_price`
--

CREATE TABLE `tbl_product_price` (
  `prod_price_id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL,
  `price` float NOT NULL,
  `attributes_id` int(10) DEFAULT '0',
  `attributes_value` varchar(50) DEFAULT NULL,
  `sold_as` varchar(10) NOT NULL,
  `inventory` int(10) NOT NULL DEFAULT '0',
  `tax_rate` int(3) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_price`
--

INSERT INTO `tbl_product_price` (`prod_price_id`, `prod_id`, `price`, `attributes_id`, `attributes_value`, `sold_as`, `inventory`, `tax_rate`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 1, 120, 1, 'Red', 'Kg', 200, 5, '2019-06-17 05:06:07', '0000-00-00 00:00:00', 0),
(2, 1, 130, 1, 'Blue', 'Kg', 200, 12, '2019-06-17 05:06:07', '0000-00-00 00:00:00', 0),
(3, 2, 12, 3, '10 cm', 'Ton', 1230, 12, '2019-06-17 05:10:13', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `sales_id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL,
  `price` float NOT NULL,
  `qty` int(3) NOT NULL,
  `attributes_value` varchar(50) DEFAULT NULL,
  `sold_as` varchar(10) NOT NULL,
  `tax_rate` int(3) NOT NULL DEFAULT '0',
  `total` float NOT NULL,
  `order_id` int(10) NOT NULL,
  `sales_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_sales`
--

INSERT INTO `tbl_sales` (`sales_id`, `prod_id`, `price`, `qty`, `attributes_value`, `sold_as`, `tax_rate`, `total`, `order_id`, `sales_date`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 1, 120, 12, 'Red', 'Kg', 5, 1512, 1, '2019-06-15', '2019-06-17 05:20:51', '0000-00-00 00:00:00', 0),
(2, 1, 130, 12, 'Blue', 'Kg', 12, 1747.2, 1, '2019-06-15', '2019-06-17 05:20:51', '0000-00-00 00:00:00', 0),
(3, 1, 120, 12, 'Red', 'Kg', 5, 1512, 2, '2019-06-30', '2019-06-17 05:21:39', '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin_activities`
--
ALTER TABLE `tbl_admin_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `tbl_product_attributes`
--
ALTER TABLE `tbl_product_attributes`
  ADD PRIMARY KEY (`attributes_id`);

--
-- Indexes for table `tbl_product_attribute_values`
--
ALTER TABLE `tbl_product_attribute_values`
  ADD PRIMARY KEY (`attributes_value_id`);

--
-- Indexes for table `tbl_product_price`
--
ALTER TABLE `tbl_product_price`
  ADD PRIMARY KEY (`prod_price_id`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin_activities`
--
ALTER TABLE `tbl_admin_activities`
  MODIFY `activity_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `prod_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_product_attributes`
--
ALTER TABLE `tbl_product_attributes`
  MODIFY `attributes_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_product_attribute_values`
--
ALTER TABLE `tbl_product_attribute_values`
  MODIFY `attributes_value_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_price`
--
ALTER TABLE `tbl_product_price`
  MODIFY `prod_price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `sales_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
