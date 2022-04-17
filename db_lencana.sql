-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 06:27 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lencana`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Paskibra', 'paskibra', 'aAd08wEYJ0OOUd7ILJzXCc2C4gA4JiF6XldRSsH2.png', '2022-01-08 03:50:47', '2022-04-16 23:41:50'),
(2, 'Polisi', 'polisi', 'syBdDt42oIfpRFVqU0D00sbFVgE674CcWhZMSkyc.png', '2022-01-08 03:50:55', '2022-03-24 01:30:09'),
(3, 'Pramuka', 'pramuka', '874buLzZ9mJjMSbBiazetwUotdOZTJv3UgEGQAZL.png', '2022-01-08 03:51:01', '2022-03-24 01:27:53'),
(4, 'Satpam', 'satpam', 'qU74BJ2492zqtLj6ESrzqrk8udd47bGucoqXXX7Y.png', '2022-01-08 03:51:08', '2022-03-24 01:26:11'),
(5, 'Satpol PP', 'satpol-pp', 'ZoUD7ral6OSROZqjsKsdT4moJBI6yotSGLvXY3SG.png', '2022-01-08 03:51:16', '2022-03-24 01:23:59'),
(6, 'Dishub', 'dishub', 'H2MGbempoEUc0y422Teu9ugfZDuiDz2A4NiGf6CS.png', '2022-01-08 03:51:33', '2022-04-16 23:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Robby Novianto', 'robbyprogaming1@gmail.com', NULL, '$2y$10$TSG0468kx3OiktfvYDJxkOkHrGgR2/Wa2cFrvDE5vUC8bit1QVwmS', NULL, '2022-01-08 03:54:24', '2022-01-08 03:54:24'),
(2, 'Fahri Alfandi', 'fahri@gmail.com', NULL, '$2y$10$ltOjV4LzSlgKnfQrAGLOEujBt2B7j34DN3.jPp5EOXs8Bmr2sd76m', NULL, '2022-04-17 03:35:56', '2022-04-17 03:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `courier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_courier` bigint(20) NOT NULL,
  `weight` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_resi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','payment_review','payment_invalid','progress','shipping','done') COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice`, `customer_id`, `courier`, `service`, `cost_courier`, `weight`, `name`, `phone`, `province`, `city`, `district`, `address`, `note`, `no_resi`, `status`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 'INVOICE-3DI0XG2E89', 1, 'jne', 'OKE', 10000, 200, 'Robby Novianto', 87730799869, 10, 209, 0, 'Ds. Ledok Demaan RT3/5 no 885', 'asss', NULL, 'done', 17049, '2022-01-08 03:55:20', '2022-01-08 08:14:42'),
(4, 'INVOICE-08336KTFA0', 1, 'jne', 'OKE', 31000, 200, 'EEE', 76565, 1, 17, 0, 'SADASD', NULL, 'ASas', 'done', 38012, '2022-03-26 02:32:47', '2022-03-28 10:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2014_10_12_000000_create_users_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2021_09_20_095254_create_categories_table', 1),
(16, '2021_09_20_095403_create_products_table', 1),
(17, '2021_09_20_095431_create_vouchers_table', 1),
(18, '2021_09_20_095510_create_sliders_table', 1),
(19, '2021_09_20_095538_create_customers_table', 1),
(20, '2021_09_20_095603_create_invoices_table', 1),
(21, '2021_09_20_095636_create_orders_table', 1),
(22, '2021_09_20_095702_create_payment_confirmations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_weight` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `invoice`, `product_id`, `product_name`, `image`, `unit`, `unit_weight`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'INVOICE-3DI0XG2E89', 1, 'Wing Polisi', 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'pcs', 1, 7000, '2022-01-08 03:55:20', '2022-01-08 03:55:20'),
(2, 2, 'INVOICE-442Y052305', 1, 'Wing Polisi', 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'pcs', 1, 7000, '2022-03-24 02:07:19', '2022-03-24 02:07:19'),
(3, 3, 'INVOICE-C2N9S52V2R', 1, 'Wing Polisi', 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'pcs', 1, 7000, '2022-03-25 04:06:09', '2022-03-25 04:06:09'),
(4, 3, 'INVOICE-C2N9S52V2R', 1, 'Wing Polisi', 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'pcs', 1, 7000, '2022-03-25 04:06:09', '2022-03-25 04:06:09'),
(5, 3, 'INVOICE-C2N9S52V2R', 1, 'Wing Polisi', 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'pcs', 1, 7000, '2022-03-25 04:06:09', '2022-03-25 04:06:09'),
(6, 4, 'INVOICE-08336KTFA0', 1, 'Wing Polisi', 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'pcs', 1, 7000, '2022-03-26 02:32:47', '2022-03-26 02:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_confirmations`
--

CREATE TABLE `payment_confirmations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_transfer_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_transfer_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` bigint(20) NOT NULL,
  `transfer_date` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_confirmations`
--

INSERT INTO `payment_confirmations` (`id`, `customer_id`, `invoice_id`, `name`, `phone`, `invoice`, `bank_transfer_from`, `bank_transfer_to`, `from_name`, `total`, `transfer_date`, `image`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Robby Novianto', 87730799869, 'INVOICE-3DI0XG2E89', 'BCA', 'BNI - 0289196729 - AN. ROBBY NOVIANTO', 'Robby Novianto', 12345, '2022-01-08', 'SZzVnVYoTPo0Yk7dnG3Ddpwm9uGTTcKMbfDDrCKU.png', NULL, '2022-01-08 03:55:36', '2022-01-08 03:55:36'),
(2, 1, 0, 'EEE', 76565, 'INVOICE-08336KTFA0', 'BCA', 'BNI - 0289196729 - AN. ROBBY NOVIANTO', 'Bambang', 40000, '2022-03-17', 'XxBYI5CBXwrxdQOnKddylxRc7RzwvQYQPljJmjPf.png', 'asssu', '2022-03-28 10:09:24', '2022-03-28 10:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_weight` bigint(20) NOT NULL,
  `weight` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `title`, `slug`, `category_id`, `content`, `unit`, `unit_weight`, `weight`, `price`, `discount`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(1, 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'Wing Polisi', 'wing-polisi', 2, 'Wing polisi', 'pcs', 1, 200, 7000, 0, 'polisi', 'oke', '2022-01-08 03:53:52', '2022-01-08 03:53:52'),
(2, 'Mu5m09rmKCYGewO4rJjkTVmWMDLLijbPKHwN16BU.png', 'ASede', 'asede', 6, '<p>asd;lasmd;alsdm</p>\n', 'pcs', 1, 200, 3333, 0, '12321', '123', '2022-03-29 05:09:18', '2022-03-29 22:27:56'),
(3, 'J3tHNHBW6vpSiXg1pDwdZorqWuHsnNzvMhEVsV2h.png', 'Rajawali', 'rajawali', 1, '<p>adasd</p>\n', 'pcs', 2, 200, 9000, 0, 'qweqw', 'qweqweq', '2022-03-29 05:23:52', '2022-03-30 06:50:53'),
(4, '4b6RtOZwjbXLNXHZRsHYTh6WqWccaqkLkCjP0ytF.png', 'Gagak', 'gagak', 2, '<p>sadsa</p>\n', 'pcs', 20, 20, 7500, 0, 'sadas', 'sada', '2022-03-29 05:35:39', '2022-04-17 00:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(10, '92vBMUV1g0xFGNuSaEwjf0hvtvb3kImdEZGqg4Ke.png', '3', '2022-01-08 08:23:47', '2022-01-08 08:23:47'),
(11, 'uVpv6kcaCWkwoT9A7mC2Zwd6NLV631Xu17LnkA3E.png', '2', '2022-01-08 08:23:52', '2022-01-08 08:23:52'),
(12, 'Y9FAJd3w0AkhnDUabxHXXLMEU98jQEElW0QFUZA0.png', '1', '2022-01-08 08:23:56', '2022-01-08 08:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Robby Novianto', 'robbynovianto33@gmail.com', NULL, '$2y$10$eXaf0D1OVr5JfDXnRmwF6.izy13yeVKQKANMxpSq7KbVdHBin.LYW', NULL, '2022-01-08 03:50:04', '2022-01-08 03:50:04'),
(2, 'Azie Melasari', 'aziemelasari@gmail.com', NULL, '$2y$10$ibCc.kXnato9Q9CF14TYHOkSTvg0eW0OTSbzEGZm38v2V4QNyTCNK', NULL, '2022-04-17 03:39:11', '2022-04-17 03:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal_voucher` bigint(20) NOT NULL,
  `total_minimal_shopping` bigint(20) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_confirmations`
--
ALTER TABLE `payment_confirmations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_confirmations`
--
ALTER TABLE `payment_confirmations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
