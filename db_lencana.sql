-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 12:09 AM
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
(1, 'Paskibra', 'paskibra', 'kaKDeKcTqob83xPy16gyPRieXPgfZyxjtFax5ZE5.png', '2022-01-08 03:50:47', '2022-04-19 04:35:28'),
(2, 'Polisi', 'polisi', 'syBdDt42oIfpRFVqU0D00sbFVgE674CcWhZMSkyc.png', '2022-01-08 03:50:55', '2022-03-24 01:30:09'),
(3, 'Pramuka', 'pramuka', '874buLzZ9mJjMSbBiazetwUotdOZTJv3UgEGQAZL.png', '2022-01-08 03:51:01', '2022-03-24 01:27:53'),
(4, 'Satpam', 'satpam', 'qU74BJ2492zqtLj6ESrzqrk8udd47bGucoqXXX7Y.png', '2022-01-08 03:51:08', '2022-03-24 01:26:11'),
(5, 'Satpol PP', 'satpol-pp', 'ZoUD7ral6OSROZqjsKsdT4moJBI6yotSGLvXY3SG.png', '2022-01-08 03:51:16', '2022-03-24 01:23:59'),
(6, 'Dishub', 'dishub', 'lM5XwV4wnkIn5kZXJm8y6lYAXhKmsNa7DBR5uEDH.png', '2022-01-08 03:51:33', '2022-04-19 04:35:13');

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
(4, 'INVOICE-08336KTFA0', 1, 'jne', 'OKE', 31000, 200, 'EEE', 76565, 1, 17, 0, 'SADASD', NULL, 'ASas', 'done', 38012, '2022-03-26 02:32:47', '2022-03-28 10:15:05'),
(18, 'INVOICE-453XX31HFO', 1, 'tiki', 'REG', 15000, 300, 'Robby', 77777, 5, 210, 0, 'nghokeyy', 'sdsadasdas', NULL, 'payment_review', 55068, '2022-04-19 03:46:42', '2022-04-19 03:55:09'),
(28, 'INVOICE-4S5PI9E751', 1, 'jne', 'OKE', 10000, 12, '123123', 128941298, 10, 163, 0, '12asdasasd', 'sadasda', NULL, 'pending', 70085, '2022-04-19 04:55:37', '2022-04-19 04:55:37'),
(29, 'INVOICE-1M013W4FD5', 1, 'jne', 'OKE', 8000, 17, 'halohalo', 123124124, 5, 419, 0, '12312312', NULL, NULL, 'progress', 71078, '2022-04-19 04:58:19', '2022-04-19 05:05:59'),
(32, 'INVOICE-71S5L86P8A', 1, 'jne', 'YES', 34000, 300, 'Robby', 9988767675, 6, 152, 0, 'kota', NULL, NULL, 'payment_review', 74014, '2022-04-19 06:02:56', '2022-04-19 06:05:48');

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
(6, 4, 'INVOICE-08336KTFA0', 1, 'Wing Polisi', 'CDjLz87u7tCkBlDi1hkRZLFnyULKTAb8TUQxkYsS.png', 'pcs', 1, 7000, '2022-03-26 02:32:47', '2022-03-26 02:32:47'),
(7, 21, 'INVOICE-AX38S3F1IL', 18, 'Pin Atribut Putri', 'th7EPzjDja7CHmSKkI9710GWkFukVicF56Kzdtv5.png', 'pcs', 20, 2000, '2022-04-19 04:17:40', '2022-04-19 04:17:40'),
(8, 22, 'INVOICE-6544H8NQNP', 18, 'Pin Atribut Putri', 'th7EPzjDja7CHmSKkI9710GWkFukVicF56Kzdtv5.png', 'pcs', 20, 2000, '2022-04-19 04:26:53', '2022-04-19 04:26:53'),
(9, 23, 'INVOICE-JQC15477IB', 18, 'Pin Atribut Putri', 'th7EPzjDja7CHmSKkI9710GWkFukVicF56Kzdtv5.png', 'pcs', 20, 2000, '2022-04-19 04:30:46', '2022-04-19 04:30:46'),
(10, 24, 'INVOICE-1R6L4451CX', 18, 'Pin Atribut Putri', 'th7EPzjDja7CHmSKkI9710GWkFukVicF56Kzdtv5.png', 'pcs', 20, 2000, '2022-04-19 04:32:16', '2022-04-19 04:32:16'),
(11, 25, 'INVOICE-3CCZR3250G', 18, 'Pin Atribut Putri', 'th7EPzjDja7CHmSKkI9710GWkFukVicF56Kzdtv5.png', 'pcs', 40, 2000, '2022-04-19 04:34:43', '2022-04-19 04:34:43'),
(12, 26, 'INVOICE-E6T51482TX', 18, 'Pin Atribut Putri', 'th7EPzjDja7CHmSKkI9710GWkFukVicF56Kzdtv5.png', 'pcs', 20, 2000, '2022-04-19 04:37:12', '2022-04-19 04:37:12'),
(13, 27, 'INVOICE-2P3D5DH5T7', 18, 'Pin Atribut Putri', 'th7EPzjDja7CHmSKkI9710GWkFukVicF56Kzdtv5.png', 'pcs', 20, 2000, '2022-04-19 04:43:06', '2022-04-19 04:43:06'),
(14, 28, 'INVOICE-4S5PI9E751', 17, 'Chevron Taruna', '5SqIxNzpAth0vE5pu97j0gUlfm2RyDFglQAbfAWf.png', 'pcs', 30, 2000, '2022-04-19 04:55:37', '2022-04-19 04:55:37'),
(15, 29, 'INVOICE-1M013W4FD5', 15, 'Paskibra', '8uKdhfk0LHIodI7B6dIckS9PYU4IXlvQRh6Jy3L7.png', 'pcs', 20, 3150, '2022-04-19 04:58:19', '2022-04-19 04:58:19'),
(16, 30, 'INVOICE-95607N0EK9', 15, 'Paskibra', '8uKdhfk0LHIodI7B6dIckS9PYU4IXlvQRh6Jy3L7.png', 'pcs', 20, 3150, '2022-04-19 05:17:26', '2022-04-19 05:17:26'),
(17, 31, 'INVOICE-D0Z0VNR6L4', 17, 'Chevron Taruna', '5SqIxNzpAth0vE5pu97j0gUlfm2RyDFglQAbfAWf.png', 'pcs', 30, 2000, '2022-04-19 05:20:38', '2022-04-19 05:20:38'),
(18, 32, 'INVOICE-71S5L86P8A', 18, 'Pin Atribut Putri', 'KhvZQvaCHW3ExT3365BBKNF2kmdI9RqcbI3rFMUV.png', 'pcs', 20, 2000, '2022-04-19 06:02:56', '2022-04-19 06:02:56');

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
(2, 1, 0, 'EEE', 76565, 'INVOICE-08336KTFA0', 'BCA', 'BNI - 0289196729 - AN. ROBBY NOVIANTO', 'Bambang', 40000, '2022-03-17', 'XxBYI5CBXwrxdQOnKddylxRc7RzwvQYQPljJmjPf.png', 'asssu', '2022-03-28 10:09:24', '2022-03-28 10:09:24'),
(3, 1, 0, 'Robby', 77777, 'INVOICE-453XX31HFO', 'Bank Mandiri', 'BNI - 0289196729 - AN. ROBBY NOVIANTO', 'toosd', 55068, '2022-04-19', 'QkVfa3y6Q6a5C9ZV536jf8fatfZB1HeYTGaJFCKT.png', 's', '2022-04-19 03:55:09', '2022-04-19 03:55:09'),
(4, 1, 0, 'halohalo', 123124124, 'INVOICE-1M013W4FD5', 'BCA', 'DANA - 087730799869 - AN. ROBBY NOVIANTO', 'Feri Alfandi', 71078, '2022-04-19', 'tC7KyqYGAA1XSDjnD17V34syhDyNuvp3Qqr4u2nw.png', NULL, '2022-04-19 05:05:28', '2022-04-19 05:05:28'),
(5, 1, 0, 'Robby', 9988767675, 'INVOICE-71S5L86P8A', 'BCA', 'DANA - 087730799869 - AN. ROBBY NOVIANTO', 'Robby', 74014, '2022-04-19', 'jtkye6GfbWWRUTNQDV5BNsXx0Pvdy6mO8Qn5g6gU.png', NULL, '2022-04-19 06:05:48', '2022-04-19 06:05:48');

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
(6, 'VZTPu8eztKIRCHVKuVv1g63z4uRfDBk4a4ByAqmj.png', 'Pangkat Polisi', 'pangkat-polisi', 2, '<p><strong>Sistem pembelian Pre-Order 7 Hari</strong></p>\n\n<p>Pesanan masuk -&gt; Tahap Produksi -&gt; Pengiriman</p>\n\n<p>1 pcs berisi 2 pasang kanan dan kiri.</p>\n\n<p>&nbsp;</p>\n\n<p>##minimal pembelian 10 pasang##</p>\n', 'pcs', 10, 21, 20000, 0, 'Jabatan, Polisi, Lencana', '1 pcs berisi 2 pasang kanan dan kiri.\n##minimal pembelian 20 pasang##', '2022-04-19 01:05:32', '2022-04-19 06:22:49'),
(7, 'i1pAD5OKYTHS5nK5N7QFuIM1Ohnm6fRNhuYK96BQ.png', 'Pangkat Satpam', 'pangkat-satpam', 4, '<p>1 pcs berisi 2 pasang kanan dan kiri.</p>\n\n<p>##minimal pembelian 10 pasang##</p>\n', 'pcs', 10, 20, 15000, 0, 'Pangkat, Satpam, Lencana', 'ok', '2022-04-19 01:24:00', '2022-04-19 06:23:55'),
(8, 'mhGAyivK4DBM1Ulyyl7Hcqc66qktyBOaPupeNvT8.png', 'Tanda Tutup Kepala', 'tanda-tutup-kepala', 3, '<p>##minimal pembelian 20 pcs##</p>\n', 'pcs', 20, 20, 5000, 7, 'Emblem, Pramuka', 'oke', '2022-04-19 01:28:34', '2022-04-19 06:24:40'),
(9, 'EjEIyboIkIRbWWi4HvfTO4UdIHy1wMWK1Z5RRhgF.png', 'Pangkat Dishub', 'pangkat-dishub', 6, '<p>1 pcs berisi 2 pasang kanan dan kiri.</p>\n\n<p>##minimal pembelian 10 pasang##</p>\n', 'pcs', 10, 20, 15000, 0, 'pangkat, lencana', 'oke', '2022-04-19 01:34:58', '2022-04-19 06:25:14'),
(10, 'SYNXwfJOdQ92APv7naDPldhJlXc2uwbIwWCefkqk.png', 'Wing Perhubungan', 'wing-perhubungan', 6, '<p>##minimal pembelian 15 pcs##</p>\n', 'pcs', 15, 30, 9000, 0, 'wing, lencana', 'oke', '2022-04-19 01:37:47', '2022-04-19 06:26:13'),
(11, '3tCwmixpn5psHv28MZskzogUSK3KuqE7y2kzqRY6.png', 'Baret Simbol', 'baret-simbol', 2, '<p>##minimal pembelian 15##</p>\n', 'pcs', 15, 18, 10000, 0, 'baret, polisi', 'oke', '2022-04-19 01:42:01', '2022-04-19 06:27:07'),
(12, 'f3F1WqOEWhS6y8GipZGhKgCk6Ks9YmOF1E5vbydb.png', 'Bantara', 'bantara', 3, '<p>1 pcs berisi 2 pasang kanan dan kiri.</p>\n\n<p>##minimal pembelian 20 pasang##</p>\n', 'pcs', 20, 20, 5000, 0, 'pramuka, bantara', 'oke', '2022-04-19 01:44:37', '2022-04-19 06:27:59'),
(13, 'lQXgjiebXDpv5SrUN5HSPXw1JjUYr2mPTc4qZSLk.png', 'Paskibra', 'paskibra', 1, '<p>1 pcs berisi 2 pasang kanan dan kiri.</p>\n\n<p>##minimal pembelian 20 pasang##</p>\n', 'pcs', 20, 17, 5000, 0, 'paskibra, lencana', 'oke', '2022-04-19 01:49:44', '2022-04-19 06:28:13'),
(14, 'pCZ5ZhBLoTs4Cpxzh1EHEVCiaGEbHACZxh1fQRWU.png', 'Monogram Bulat Satpam', 'monogram-bulat-satpam', 4, '<p>1 pcs berisi 2 pasang kanan dan kiri.</p>\n\n<p>##minimal pembelian 20 pasang##</p>\n', 'pcs', 20, 13, 5000, 0, 'monogram, satpam', 'oke', '2022-04-19 02:00:44', '2022-04-19 06:28:43'),
(15, '8uKdhfk0LHIodI7B6dIckS9PYU4IXlvQRh6Jy3L7.png', 'Paskibra', 'paskibra', 1, '<p>1 pcs berisi 2 pasang kanan dan kiri.</p>\n\n<p>##minimal pembelian 20 pasang##</p>\n', 'pcs', 20, 17, 3500, 10, 'paskibra', 'oke\n', '2022-04-19 02:04:47', '2022-04-19 04:56:04'),
(16, 'eVobBim78R3d4npcc9KoS7oDHl37Ud1n69xQs4ZQ.png', 'Gada Pratama', 'gada-pratama', 4, '<p>##minimal pembelian 15 pcs##</p>\n', 'pcs', 15, 22, 9000, 0, 'gada, satpam', 'oke', '2022-04-19 02:13:05', '2022-04-19 06:29:15'),
(17, '5SqIxNzpAth0vE5pu97j0gUlfm2RyDFglQAbfAWf.png', 'Chevron Taruna', 'chevron-taruna', 2, '<p>1 pcs berisi 2 pasang</p>\n\n<p>##minimal pembelian 4 pcs##</p>\n', 'pcs', 4, 12, 25000, 0, 'chevron', 'oke', '2022-04-19 02:21:39', '2022-04-19 06:30:30'),
(18, 'KhvZQvaCHW3ExT3365BBKNF2kmdI9RqcbI3rFMUV.png', 'Pin Atribut Putri', 'pin-atribut-putri', 3, '<p>##minimal pembelian 20 pcs##</p>\n', 'pcs', 20, 15, 3500, 0, 'pin, pramuka', 'oke\n', '2022-04-19 02:24:52', '2022-04-19 06:30:58');

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
(2, 'Azie Melasari', 'aziemelasari@gmail.com', NULL, '$2y$10$g7Q0Ko5UTvFp1Klc9oWBh.XEMKUE0mHqxmqB.50gXIJY.mpTiwIM.', NULL, '2022-04-17 03:39:11', '2022-04-19 07:11:54');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payment_confirmations`
--
ALTER TABLE `payment_confirmations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
