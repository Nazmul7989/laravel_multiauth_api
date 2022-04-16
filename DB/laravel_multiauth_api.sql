-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2022 at 07:14 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_multiauth_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '2022-04-14 12:04:55', '$2y$10$zTkJi2B71O5OadkusGgFGOBbwgmpNnmgmYBHj3xFer.I8lsKsdbvS', NULL, '2022-04-14 12:04:55', '2022-04-14 12:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `user_id`, `date`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, '2022-04-13', 2000, 1, '2022-04-15 05:07:44', '2022-04-16 02:24:13'),
(3, 3, '2022-04-05', 5000, 1, '2022-04-15 05:16:35', '2022-04-15 05:24:47'),
(4, 1, '2022-04-20', 6000, 0, '2022-04-15 05:16:48', '2022-04-15 05:24:59'),
(6, 4, '2022-04-07', 1000, 1, '2022-04-15 05:25:10', '2022-04-15 05:25:13'),
(7, 1, '2022-04-07', 8000, 0, '2022-04-15 07:44:08', '2022-04-15 07:44:08'),
(8, 1, '2022-04-30', 3000, 1, '2022-04-15 07:44:24', '2022-04-15 07:44:29'),
(9, 1, '2022-04-10', 50000, 0, '2022-04-15 08:43:03', '2022-04-15 08:43:03'),
(16, 13, '2022-04-20', 1000, 0, '2022-04-15 11:10:08', '2022-04-15 11:10:08'),
(17, 13, '2022-04-12', 1000, 0, '2022-04-16 03:08:02', '2022-04-16 03:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_04_14_135359_create_admins_table', 1),
(11, '2022_04_15_101256_create_bills_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0afab72d429ea70b22913d1249bac78a3a80a6f8a91d5bda4b8004af84abfc8180940e8327167e1a', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 22:19:47', '2022-04-15 22:19:47', '2023-04-16 04:19:47'),
('0ca1c401daf5152c51e8a0b188a277ab2aa64cc82e61fee74d166e078170c6eba6477d2789a88d38', 13, 1, 'Personal Access Token', '[]', 0, '2022-04-16 09:08:21', '2022-04-16 09:08:21', '2023-04-16 15:08:21'),
('0d3ed85c77fb407ddf77e3ad12d7da3919c84f410b2719ffdd783522c4f0ab2717cdef85794f3780', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 20:53:59', '2022-04-15 20:53:59', '2023-04-16 02:53:59'),
('0e686daf4c31cf434e0a08cb7c2ac391496544fd91e848c6b5fad525d63f0ab440728cf27cc9079e', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 02:25:38', '2022-04-15 02:25:38', '2023-04-15 08:25:38'),
('10e458472183e7f35284c209af02d100f812dabe70c0704b25282a795d691f7e26efde32513eacb4', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 12:15:36', '2022-04-14 12:15:36', '2023-04-14 18:15:36'),
('13c1b9de68492c6726440ed48da556a346caffdb93c2bb2cea329b99f2ff556475b5a74dea27df0e', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 20:45:20', '2022-04-15 20:45:20', '2023-04-16 02:45:20'),
('15544aa8aab37a00ca0ae9aba0301652b432567feedba0db9c06ecf4ec769fe0c2ae90e06d5090ae', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:00:42', '2022-04-14 22:00:42', '2023-04-15 04:00:42'),
('170bc23b71158ec69ac8d95e0304b06f38ae4419260217050906a7f5fe9a158051ea88e59706989d', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 21:17:24', '2022-04-15 21:17:24', '2023-04-16 03:17:24'),
('17c7278013bcdb7f61a01b5b7739333bff0147871fb694af5ce036bf6d93db74acef00c39a0b70bd', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:15:34', '2022-04-14 22:15:34', '2023-04-15 04:15:34'),
('1bf237aa447550ca6662d88d51fb8ee6b4f7aa5ab6e85f9f9d885970f426f1380634eebfba3357a5', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:28:47', '2022-04-16 01:28:47', '2023-04-16 07:28:47'),
('1bf29c9ca2f884fbb77440b1af99968662a9ac0293a5eecab3ee7a97d2e6c2b3359eae8f3099d5cd', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:15:15', '2022-04-14 22:15:15', '2023-04-15 04:15:15'),
('20822aee8ff575434f643774478ae06bba7fdeba93b84296eb780a8245d9ce6984f6a93b81fbb20c', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:43:48', '2022-04-15 07:43:48', '2023-04-15 13:43:48'),
('25663d88d29bd9e1b737e4260c3bb6cd1210e66e664ce530a611ee6732faf146e28c0d880bd67c25', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 23:22:51', '2022-04-15 23:22:51', '2023-04-16 05:22:51'),
('29e36f66f175f21e0b3afa135f683373c34dff1f4b46f88a3eafa6ed441853664386c6a886a0dda0', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:20:12', '2022-04-15 07:20:12', '2023-04-15 13:20:12'),
('2b5d35630ce34082e4e6fc5d730ae16ced782383eecbcd535263f8fb056b6b9030460f30e8f9d3da', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 12:10:35', '2022-04-14 12:10:35', '2023-04-14 18:10:35'),
('2bb8fa69df80b0c2bb37b01f5e884e6e7bcb2796cadf0b3fd5c04a5892ccc4c94d152ea1937ba06b', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 03:10:15', '2022-04-15 03:10:15', '2023-04-15 09:10:15'),
('315ffbf5100fe74dba397f3ff8d552c983a6a751beacff40cef7bfeba9a003fde4f0441bdd7e9a4d', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 02:05:53', '2022-04-16 02:05:53', '2023-04-16 08:05:53'),
('39eb95ac37da18680b8b2230d7b052925c13aeb7d5ab34c337a5f53b5202576a2062bcaad84d1856', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:40:27', '2022-04-14 22:40:27', '2023-04-15 04:40:27'),
('427b10bb2d137bdda9663a4d3903485106c20e6b0a4dd31ba0c665b081bf78b98a024fe50d70516b', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:42:12', '2022-04-16 01:42:12', '2023-04-16 07:42:12'),
('43120c83d8df2ec147edeef47509325f501b8a58c9b7d3a79fb9bf0c2d85876fbf8c6d8a09a1ec84', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 21:41:01', '2022-04-14 21:41:01', '2023-04-15 03:41:01'),
('46094786188cabed47c16f17448d536390be7cacbf7f20d52c238d85e8d7895557e365b7ce386025', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:06:38', '2022-04-14 22:06:38', '2023-04-15 04:06:38'),
('47998174f8eb4f1c38f090287c20e159dae26311cad16e0b8aa566d7763d8091011d3650dd81b22e', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:33:06', '2022-04-16 01:33:06', '2023-04-16 07:33:06'),
('4dd966ccdbf49f301b7ab2e0c64b1800ee890ecf9a1b70c05f9747b33d4981441a39657f6671fa9b', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 23:08:20', '2022-04-15 23:08:20', '2023-04-16 05:08:20'),
('4f3f17f92c93aa822a3037cea5bb2af0eed637d1bb8e1f8ba25affd754bfecc338403c8a37d370fa', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:21:08', '2022-04-16 01:21:08', '2023-04-16 07:21:08'),
('51b963e87e983608acb4bd5a0c0912be6f3d474fddb73682d9ad0df088751237d63d11214e48ba8a', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:10:20', '2022-04-14 22:10:20', '2023-04-15 04:10:20'),
('560c9c3d88dae41474b305d08d88d3d4f644b300654be5a07c194546b1a344a6ed4413de4c8094a5', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 21:43:44', '2022-04-15 21:43:44', '2023-04-16 03:43:44'),
('585b95e1ccdc539bfce59176af7f73b9d84efad4f0a560af19bb0f7f045781ef5e100aebae717d3b', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 22:10:01', '2022-04-15 22:10:01', '2023-04-16 04:10:01'),
('5a92492d517656cbd10e1ae06f9083824c6cf90829869126f181a8b409b74f711077069487de9372', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 21:21:48', '2022-04-15 21:21:48', '2023-04-16 03:21:48'),
('5d3bf463044835c2bbcb8c8178db75ba84aa97275048f7af88ee94e1d109945526bcbcd442ce7559', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 09:06:47', '2022-04-16 09:06:47', '2023-04-16 15:06:47'),
('5f52c57b8b198be3869bbdbea9fb2e9871fb901fa7ee3c281594e0ce81f544fc0a2116e4c386fc5e', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 09:06:12', '2022-04-16 09:06:12', '2023-04-16 15:06:12'),
('65773ed5184acdf6bdb2bcbc3fde16d4eff615bdb9b6971732d4cf346e8fab0f3a96da108cbc0834', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:11:17', '2022-04-16 01:11:17', '2023-04-16 07:11:17'),
('6687e061f1efdf7a01994485ccf140d27abbe0bf1e6525956a00282bba8a0ea1778eaf2db95d2321', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 00:43:56', '2022-04-15 00:43:56', '2023-04-15 06:43:56'),
('687a651fda2a56e26691a3c5689822066aea5401a1a5c33800883e1351a9403f1982ebf272471537', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 21:31:11', '2022-04-15 21:31:11', '2023-04-16 03:31:11'),
('68f6a6ba3cc055f4ae19a16cb1845e43b64b63a98779fcd24ef463495cdc17b9838999f592de54b0', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 11:21:03', '2022-04-15 11:21:03', '2023-04-15 17:21:03'),
('6a9b937a600258afe87194c1388fdae4de16b1494290e586bacc4e944f0c6b77ca1059dd62f132ec', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:38:22', '2022-04-16 01:38:22', '2023-04-16 07:38:22'),
('6b9d539b4847b80a9a54d0dfb6a3281e895b905e157b707f0af75310b748677e44ce9a69b7c74c54', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 20:54:39', '2022-04-15 20:54:39', '2023-04-16 02:54:39'),
('7069afa733a0ec26d01e2c7c7fd943ec9e6e2291fd2f824753c27f83019f0019c562c5c9e93d31cf', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 22:40:36', '2022-04-15 22:40:36', '2023-04-16 04:40:36'),
('778c8dde08d9d7e47c64b72da3baee6daa4fe69a75aab0e8fc777a2809fdca0716d3c1de62aefa78', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 06:59:01', '2022-04-15 06:59:01', '2023-04-15 12:59:01'),
('7ba316a4a20a8f0b39079cffd80f321ea9e38aeb8597e77054cfea0a5d715f8fa69c234d4a4909b9', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 03:07:34', '2022-04-16 03:07:34', '2023-04-16 09:07:34'),
('7c7d4ba6ad44eff15af97138192285e4ea85ba4193b4bdce64ac534da2d733fbd04878d511769542', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:26:45', '2022-04-16 01:26:45', '2023-04-16 07:26:45'),
('7f25dc059b95fe7ab84e1d586d92ebf9818e34214adc70166d7662828478399446d8aacd6dc1a06d', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:26:15', '2022-04-16 01:26:15', '2023-04-16 07:26:15'),
('8226cc88acb22a75fe3969a364ccfe0c6cd9a28d6adf009f3b66428e727a028e51dd5d353e56696c', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 23:10:21', '2022-04-15 23:10:21', '2023-04-16 05:10:21'),
('82aa12cec750a655c3a2a68fc7b311031158d5c551fe6cb5245a326483dfcd45c1ba1126a3eae744', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 03:06:07', '2022-04-16 03:06:07', '2023-04-16 09:06:07'),
('83fcf18abc8f991b9cf422184376391eb4aa92600839c1df17de06600308e397b94a3a0a2d33f898', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:43:04', '2022-04-16 01:43:04', '2023-04-16 07:43:04'),
('891e0ebed88ee3f4339241d1a1b7b84f829a9c4d68a17dd144d2f0e69490d112e676cc89fb33433a', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 23:04:53', '2022-04-15 23:04:53', '2023-04-16 05:04:53'),
('89c44952867891471acaf67fc81d00bce315308436fddc5df8f14d9d27ad69032d35ef79d2859919', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 23:02:22', '2022-04-15 23:02:22', '2023-04-16 05:02:22'),
('8c028a9d22302f35f1825d2b20585f4dce63b25b0c300b4f5da4f48b452c67f8be7448b7155ff51f', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:48:42', '2022-04-16 01:48:42', '2023-04-16 07:48:42'),
('8f5e8aafcddfe97f300172eb6933ac6f7a4abb994e28725f1394859044cc17cd4161fb58cf9d6740', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 21:33:22', '2022-04-15 21:33:22', '2023-04-16 03:33:22'),
('94be6854ee729ea8f20df644d3477716c4ba30ebd16cb6ea6803021a8475d66d46419473a669088e', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 22:21:03', '2022-04-15 22:21:03', '2023-04-16 04:21:03'),
('95723352547bf717e44b71745c2135e2f719683f2999acd2bfa9389da92bda05d18a3648fc69bc26', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 20:42:47', '2022-04-15 20:42:47', '2023-04-16 02:42:47'),
('98009a158434fd73389522b9c207900b0bf5f5b8b2ddea83561b1c1b31c3fd9f52305d966d6c657f', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 02:45:22', '2022-04-16 02:45:22', '2023-04-16 08:45:22'),
('9c4325a81829fdbee63d869dd4225314dbde78c756e6cbf561487d902cdd57ba604031bb709787de', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:03:55', '2022-04-15 07:03:55', '2023-04-15 13:03:55'),
('9d966810a82b3fae79b1335cfcd72b58428a8284054bd0b110c93013e7d281afdf26dc36631bc31e', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:39:32', '2022-04-14 22:39:32', '2023-04-15 04:39:32'),
('9ea1e10df89b4b90e34ddd33fafbaa5dc139f364a98e94742b458063d33f1ee85511fc84dc709949', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 02:55:46', '2022-04-16 02:55:46', '2023-04-16 08:55:46'),
('9f035253858882d28efb80280efd120bcbed70cc0fa4990adbd4b9e974a54769d8c36565d2fca393', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:09:38', '2022-04-15 07:09:38', '2023-04-15 13:09:38'),
('9f9ef3a9c575a26a883bbc8a19188820ff9082ea3198c7f4c8b67afbef7a6f6b088005abda7bf288', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 22:05:19', '2022-04-15 22:05:19', '2023-04-16 04:05:19'),
('a19bfcc3a4b59ff9b827708625d7a24bae7633aafc00bfcdb188b078f0b053f38d842c935ad26dac', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:22:56', '2022-04-15 07:22:56', '2023-04-15 13:22:56'),
('a1d3cd29d8e88d5770f700ca9060ae409db25f13fcd3d8aac687fe842eb2eb3476534750f034ddbf', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 20:40:14', '2022-04-15 20:40:14', '2023-04-16 02:40:14'),
('a8c1d4b8ac59c8db6257b29e03b3b1f236d4060a9a2d5b4f017115c96828ca6e2814eed652580a0a', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:42:52', '2022-04-14 22:42:52', '2023-04-15 04:42:52'),
('aeba237485cf080768e9db333262dcda19dee3f0260567410643eb17b5bb4a777600ead20fa1a921', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 11:21:26', '2022-04-15 11:21:26', '2023-04-15 17:21:26'),
('b0aa87b4ecaf9b4b6bf6d46f0652b5b866f456bd73cbe341816812676ed436f8d5862c7c1361a4b4', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 02:48:46', '2022-04-16 02:48:46', '2023-04-16 08:48:46'),
('b44ff0a0dbe65e760e3cde3602cce3e5df0c2bfd4c6b6d24fe16c41db998c9ab3a1eb87034ad2f64', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 00:59:34', '2022-04-15 00:59:34', '2023-04-15 06:59:34'),
('b5fb2db544b3324009d7bb54d515da0f49fb69993b26597b2cbb2a0b5a6710e063d5c152c21384ec', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 06:59:39', '2022-04-15 06:59:39', '2023-04-15 12:59:39'),
('bb28e3616dad91309658690ce56067195891b52c46f7948dd31a8c861ea536d21d4e1f3e795575b2', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:29:35', '2022-04-16 01:29:35', '2023-04-16 07:29:35'),
('bb35b06d837fd90e2382ee0a73288ae331960368a0b137dc2dc0e16102f5122754ab230cb164fc2f', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:02:24', '2022-04-15 07:02:24', '2023-04-15 13:02:24'),
('bc56d45a4efff65eae98ae1e988341a8176bfec1eb75c1cff8462148ec528b7ad3546d91e6f1c0d4', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 08:42:20', '2022-04-15 08:42:20', '2023-04-15 14:42:20'),
('c094ef7ec2ff70a846c55103227719905d49872ea0506aca16522ad4f43307eae9701dcbd9913e81', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:20:55', '2022-04-15 07:20:55', '2023-04-15 13:20:55'),
('c4f5000d20173a05ed13e6a59302fe69313fec5c3134c11b160199da87775b3817352e5c19027638', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 02:31:21', '2022-04-15 02:31:21', '2023-04-15 08:31:21'),
('cde6cc0084b33d1a25b0b018d12362a1229440adf5bbafc1304f37015bbc3f77da263195b4c2abb7', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 22:08:07', '2022-04-15 22:08:07', '2023-04-16 04:08:07'),
('cfba6f18dc82cb6aa83dcfbf37338a37393d87c55d1acce23265ba540f9e8f4605ffe09c5def4072', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 02:53:29', '2022-04-15 02:53:29', '2023-04-15 08:53:29'),
('dfba0fd4852cf9728747372fd381adc5bf770857f4d0991f7681344eda8d144d92b22bfefac58419', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 02:17:57', '2022-04-15 02:17:57', '2023-04-15 08:17:57'),
('dfbd6f91326206b841db73ab56d6ecc9858d12d89a7c590d0d80b6ceded31c3d49d428a838f063c5', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:04:17', '2022-04-15 07:04:17', '2023-04-15 13:04:17'),
('e14d952ed1e107f4a1da1b6f653bf333f4836fbb67a1899b702f96885985ad209532d6435b5d5634', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:14:22', '2022-04-16 01:14:22', '2023-04-16 07:14:22'),
('e763b6d551038cdd480fca3dfff070f7a1336cb8f5a6768d24c7e72e64277141c9804bc79214178c', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 21:50:35', '2022-04-14 21:50:35', '2023-04-15 03:50:35'),
('e92de6f1991daa8041b3e81d9aba3258afbacf3c09bdd436b5aa1beeb6a8b2fdf36bdd59006cdcc9', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:41:57', '2022-04-14 22:41:57', '2023-04-15 04:41:57'),
('f403d0c5f4f1f4f6e07ee45c2b18281302fdb831c1e7f1cf2884832b539ce8fe3fbe98db758c5d86', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 07:18:12', '2022-04-15 07:18:12', '2023-04-15 13:18:12'),
('faab9d4aed4cbb1b116c092fa5585350f26930a5d8c5fac1cb1a30a00886ea56ebdbd8515fd825ab', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:07:12', '2022-04-14 22:07:12', '2023-04-15 04:07:12'),
('fb0f1624cf3b3fd031fe43a5f7d8436d78c5294adee27dc6a9d9a781a01fede58e4d34f61dec6900', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-14 22:40:21', '2022-04-14 22:40:21', '2023-04-15 04:40:21'),
('fca365d9ca961612414f157f735f7050e05feecdf32bd3bd4d77e6a13f5086b8bf93d4b162546e1f', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-16 01:37:40', '2022-04-16 01:37:40', '2023-04-16 07:37:40'),
('fdf6dc4d405290f7bed2a97498b9ec9f4ca21aa9c71d7c76a7ec9123ef1d3933eaf114b9cfd9c6fb', 1, 1, 'Personal Access Token', '[]', 0, '2022-04-15 06:58:52', '2022-04-15 06:58:52', '2023-04-15 12:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Personal Access Token', 'I8DEMiFaXVVnoCHouteM6zbIt120TAJEupZRGWUA', NULL, 'http://localhost', 1, 0, 0, '2022-04-14 12:10:18', '2022-04-14 12:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-04-14 12:10:18', '2022-04-14 12:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Customer', 'customer@gmail.com', '2022-04-14 12:04:54', '$2y$10$6kL8SpzF3ObsOBTWuJAuf.mCTs9/F2VCMN6vlmR4kvb2SRRAQO08q', NULL, 'tHlBPAWCZs', '2022-04-14 12:04:54', '2022-04-14 12:04:54'),
(2, 'Mizanur Rahman', 'mizan@gmail.com', '2022-04-14 12:04:54', '$2y$10$a/umEuWheJWZTbJCB4YH0OS5W4vyfzcJei11UBVVQzkWvs5T0wABm', 'Natore', 'tP4bsdvjOn', '2022-04-14 12:04:55', '2022-04-15 04:05:50'),
(3, 'Winston Hyatt', 'maxwell.spencer@example.org', '2022-04-14 12:04:54', '$2y$10$KsYZY7Wx1wpeovo.zVZYMuD.Xb1UtdLuuxp1SYrnoHVe0PzZq60/C', NULL, 'JptEjnQvys', '2022-04-14 12:04:55', '2022-04-15 04:07:42'),
(4, 'Kevin Daniel DDS', 'astokes@example.com', '2022-04-14 12:04:55', '$2y$10$/FS4MDvunKpoV/ip0p6muOkKk67.rbqPSDTAMABCZ38f6pNpI28Ba', NULL, 'fev8rtqRJB', '2022-04-14 12:04:55', '2022-04-14 12:04:55'),
(5, 'Mr. Tavares Dietrich', 'glover.marietta@example.com', '2022-04-14 12:04:55', '$2y$10$cXP6OcUytBrg/ZGTpdegIet378a.dCgZVlTYKDeCNgu9xtsrS/Pbe', NULL, 'NbXs6BuyQj', '2022-04-14 12:04:55', '2022-04-14 12:04:55'),
(6, 'Mr. Antone Ruecker', 'arogahn@example.com', '2022-04-14 12:04:55', '$2y$10$2ebQ8bTbCcqcVhFtMwvG0.dve.hIs/qU5FGnmX3rb9i7nqXs3Glui', NULL, 'IdjhXW4qql', '2022-04-14 12:04:55', '2022-04-14 12:04:55'),
(13, 'Nazmul', 'nazmul.ns7989@gmail.com', NULL, '$2y$10$Ou4l6RRfglZbcF1gCHM7u.zB1lSPbn5x.bHFgAHa5J0vhFDIo/loS', 'Jhenaidah,Bangladesh', NULL, '2022-04-15 08:45:42', '2022-04-15 08:45:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
