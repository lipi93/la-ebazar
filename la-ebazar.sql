-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2023 at 05:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebazar`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(3, 'armani watch', '1695089179_.jpg', '2023-09-18 20:06:19', '2023-09-18 20:06:19'),
(4, 'Diesel\'s watch', '1695089220_.webp', '2023-09-18 20:07:00', '2023-09-18 20:07:00'),
(5, 'Gucci', '1695090131_.webp', '2023-09-18 20:22:11', '2023-09-18 20:22:11'),
(6, 'Jimmy Choo', '1695090760_.webp', '2023-09-18 20:32:40', '2023-09-18 20:32:40'),
(7, 'Apple watch', '1695094382_.png', '2023-09-18 21:33:02', '2023-09-18 21:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(3, 'men\'s watch', '1695088990_.jpg', '2023-09-18 20:03:10', '2023-09-18 20:03:10'),
(4, 'women\'s perfume', '1695089138_.webp', '2023-09-18 20:05:38', '2023-09-18 20:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `payable` varchar(255) NOT NULL,
  `cus_details` varchar(255) NOT NULL,
  `ship_details` varchar(255) NOT NULL,
  `tran_id` varchar(255) NOT NULL,
  `val_id` varchar(255) NOT NULL,
  `status` enum('pending','processing','completed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) NOT NULL,
  `main_price` varchar(255) NOT NULL,
  `sale_price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_09_13_100413_create_users_table', 1),
(3, '2023_09_13_100449_create_user_profiles_table', 1),
(4, '2023_09_13_100534_create_shiping_addresses_table', 1),
(5, '2023_09_13_100554_create_categories_table', 1),
(6, '2023_09_13_100605_create_brands_table', 1),
(7, '2023_09_13_100617_create_products_table', 1),
(8, '2023_09_13_100629_create_product_reviews_table', 1),
(9, '2023_09_13_100723_create_product_details_table', 1),
(10, '2023_09_13_100740_create_product_sliders_table', 1),
(11, '2023_09_13_100801_create_product_wishes_table', 1),
(12, '2023_09_13_100814_create_product_carts_table', 1),
(13, '2023_09_13_100846_create_sslcommerz_accounts_table', 1),
(14, '2023_09_13_100927_create_invoices_table', 1),
(15, '2023_09_13_100941_create_invoice_products_table', 1),
(16, '2023_09_13_101006_create_policies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('about','refund','terms','how to buy','contact','complain') NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_des` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `discount_price` varchar(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `star` varchar(255) NOT NULL,
  `remark` enum('popular','new','top','special','trending','regular') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cat_id`, `brand_id`, `title`, `short_des`, `price`, `discount`, `discount_price`, `image`, `stock`, `star`, `remark`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'Omega watch', 'OMEGA® Watches: Official website of the Swiss Luxury Watch manufacturer', '3000', '0', '0', '1695089419_.jpeg', '23', '0', 'popular', '2023-09-18 20:10:19', '2023-09-18 20:10:19'),
(2, 3, 3, 'Rolex watch', 'Rolex timepieces are the most reputable and renowned timepieces in the world today.', '700', '0', '0', '1695089513_.jpg', '234', '0', 'regular', '2023-09-18 20:11:53', '2023-09-18 20:11:53'),
(3, 3, 3, 'Tag Heuer watch', 'TAG Heuer S.A. (/ˌtæɡ ˈhɔɪ. ər/ TAG HOY-ər) is a Swiss luxury', '2100', '0', '0', '1695089586_.png', '34', '0', 'popular', '2023-09-18 20:13:06', '2023-09-18 20:13:06'),
(4, 3, 3, 'Swatch watc', 'Swatch watches is their impeccable Swiss excellence and performance', '1200', '0', '0', '1695089758_.jpeg', '100', '0', 'popular', '2023-09-18 20:15:58', '2023-09-18 20:15:58'),
(5, 3, 3, 'Timex watch', 'mex offers a suite of watches for men, women, boys, and girls. Shop watches', '1340', '0', '0', '1695089820_.jpeg', '200', '0', 'popular', '2023-09-18 20:17:00', '2023-09-18 20:17:00'),
(6, 3, 3, 'Patek Philippe', 'Patek Philippe Patek Philippe', '2600', '0', '0', '1695089933_.jpg', '290', '0', 'popular', '2023-09-18 20:18:53', '2023-09-18 20:18:53'),
(7, 4, 5, 'Chanel Perfume', 'French Chanel practically wrote the manual when it comes to the best fragrance.', '1500', '0', '0', '1695090213_.jpg', '123', '0', 'popular', '2023-09-18 20:23:33', '2023-09-18 20:23:33'),
(8, 4, 5, 'Givenchy Perfume', 'y and seductive, Givenchy fragrance is a soft dream of a brand', '99', '0', '0', '1695090296_.jpg', '400', '0', 'special', '2023-09-18 20:24:56', '2023-09-18 20:24:56'),
(9, 4, 5, 'Tom Ford Perfume', '====== Tom Ford is the power dresser of the fragrance world. Eau De Soleil Blanc.', '990', '0', '0', '1695090398_.jpg', '200', '0', 'popular', '2023-09-18 20:26:38', '2023-09-18 20:26:38'),
(10, 4, 5, 'Gucci Perfume', 'scents tend to be floral based, ranging from sweet Rush’s coriander, Damask rose, and patchouli', '1500', '0', '0', '1695090557_.jpg', '200', '0', 'popular', '2023-09-18 20:29:17', '2023-09-18 20:29:17'),
(11, 4, 6, 'uerlain Perfume', 'It’s a gently powder-filled spritz of delicate ylang-ylang,', '1200', '0', '0', '1695090822_.jpg', '230', '0', 'popular', '2023-09-18 20:33:42', '2023-09-18 20:33:42'),
(12, 4, 6, 'Christian Dior Perfume', 'Christian Dior is simultaneously youthful. Dior Jadore is the brand’s best selling fragrance, regularly', '990', '0', '0', '1695090898_.jpg', '123', '0', 'new', '2023-09-18 20:34:58', '2023-09-18 20:34:58'),
(13, 4, 6, 'Jo Malone Perfume', 'British Jo Malone’s quintessential fragrances are modern and classy', '2200', '0', '0', '1695090947_.jpg', '500', '0', 'new', '2023-09-18 20:35:47', '2023-09-18 20:35:47'),
(15, 4, 6, 'Hugo Boss Perfum', 'Boss Hugo Deep Red is a large helping of bursting berries with a refreshing citrus appeal in the morning.', '490', '0', '0', '1695093589_.jpg', '500', '0', 'special', '2023-09-18 21:19:49', '2023-09-18 21:19:49'),
(16, 4, 6, 'Yves Saint Laurent', 'Black Opium’s seductively sweet coffee, jasmine, and bitter almond blur.', '959', '0', '0', '1695093636_.jpg', '400', '0', 'special', '2023-09-18 21:20:36', '2023-09-18 21:20:36'),
(17, 4, 6, 'Estee Lauder', '===== Estee Lauder Beautiful, Estee Lauder Pleasures, Estee Lauder Youth Dew', '560', '0', '0', '1695093686_.jpg', '200', '0', 'popular', '2023-09-18 21:21:26', '2023-09-18 21:21:26'),
(18, 4, 6, 'Versace Perfume', 'Versace Bright Crystal, Versace Yellow Diamond, Versace Crystal Noir;', '1200', '0', '0', '1695093822_.jpg', '30', '0', 'regular', '2023-09-18 21:23:42', '2023-09-18 21:23:42'),
(19, 4, 6, 'Lancome Perfum', 'Lancome La Vie Est Belle, Lancome Trésor, Lancome Miracle', '1200', '0', '0', '1695093863_.jpg', '234', '0', 'regular', '2023-09-18 21:24:23', '2023-09-18 21:24:23'),
(20, 4, 6, 'Calvin Klein Perfum', 'Calvin Klein Obsession, Calvin Klein Eternity, Calvin Klein Euphoria', '1200', '0', '0', '1695093954_.jpg', '1200', '0', 'popular', '2023-09-18 21:25:54', '2023-09-18 21:25:54'),
(21, 4, 6, 'Tommy Hilfiger', 'Tommy Hilfiger Tommy Girl, Tommy Hilfiger True Star, Tommy Hilfiger', '234', '0', '0', '1695094098_.jpg', '100', '0', 'popular', '2023-09-18 21:28:18', '2023-09-18 21:28:18'),
(22, 3, 4, 'Cartier watch', 'l case, beaded crown set with a synthetic cabochon-shaped spinel, silvered dial', '899', '0', '0', '1695094289_.jpg', '20', '0', 'popular', '2023-09-18 21:31:29', '2023-09-18 21:31:29'),
(23, 3, 4, 'Samsung', 'Samsung synthetic cabochon-shaped spinel, silvered dial', '1500', '0', '0', '1695094356_.jpg', '123', '0', 'special', '2023-09-18 21:32:36', '2023-09-18 21:32:36'),
(24, 3, 7, 'Apple watc', 'Apple Watch is a line of smartwatches produced by Apple Inc.', '1200', '0', '0', '1695094464_.jpg', '3700', '0', 'special', '2023-09-18 21:34:24', '2023-09-18 21:34:24'),
(25, 4, 6, 'Giorgio', 'Gucci scents tend to be floral based, ranging from sweet and to darker and more daring Rush’s coriander', '1900', '0', '0', '1695094637_.jpeg', '60', '0', 'special', '2023-09-18 21:37:17', '2023-09-18 21:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_carts`
--

CREATE TABLE `product_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `img1` varchar(200) NOT NULL,
  `img2` varchar(200) NOT NULL,
  `img3` varchar(200) NOT NULL,
  `img4` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `rating` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sliders`
--

CREATE TABLE `product_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_des` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_wishes`
--

CREATE TABLE `product_wishes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shiping_addresses`
--

CREATE TABLE `shiping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ship_name` varchar(255) NOT NULL,
  `ship_address` varchar(255) NOT NULL,
  `ship_city` varchar(255) NOT NULL,
  `ship_state` varchar(255) NOT NULL,
  `ship_country` varchar(255) NOT NULL,
  `ship_phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sslcommerz_accounts`
--

CREATE TABLE `sslcommerz_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` varchar(255) NOT NULL,
  `store_password` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `success_url` varchar(255) NOT NULL,
  `fail_url` varchar(255) NOT NULL,
  `cancel_url` varchar(255) NOT NULL,
  `ipn_url` varchar(255) NOT NULL,
  `init_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `otp` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'lipi', 'lipi@gmail.com', '123456', 'user', '0', '2023-09-18 19:15:31', '2023-09-18 19:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_carts`
--
ALTER TABLE `product_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_carts_user_id_foreign` (`user_id`),
  ADD KEY `product_carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_details_product_id_unique` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sliders`
--
ALTER TABLE `product_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_sliders_product_id_unique` (`product_id`);

--
-- Indexes for table `product_wishes`
--
ALTER TABLE `product_wishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_wishes_user_id_foreign` (`user_id`),
  ADD KEY `product_wishes_product_id_foreign` (`product_id`);

--
-- Indexes for table `shiping_addresses`
--
ALTER TABLE `shiping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shiping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `sslcommerz_accounts`
--
ALTER TABLE `sslcommerz_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_carts`
--
ALTER TABLE `product_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sliders`
--
ALTER TABLE `product_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_wishes`
--
ALTER TABLE `product_wishes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shiping_addresses`
--
ALTER TABLE `shiping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sslcommerz_accounts`
--
ALTER TABLE `sslcommerz_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_carts`
--
ALTER TABLE `product_carts`
  ADD CONSTRAINT `product_carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_sliders`
--
ALTER TABLE `product_sliders`
  ADD CONSTRAINT `product_sliders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_wishes`
--
ALTER TABLE `product_wishes`
  ADD CONSTRAINT `product_wishes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_wishes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `shiping_addresses`
--
ALTER TABLE `shiping_addresses`
  ADD CONSTRAINT `shiping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
