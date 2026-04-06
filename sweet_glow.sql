-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2026 at 04:02 AM
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
-- Database: `sweet_glow`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carritos`
--

CREATE TABLE `carritos` (
  `id_carrito` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','checked_out') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carritos`
--

INSERT INTO `carritos` (`id_carrito`, `id_usuario`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'active', '2026-03-27 02:52:52', '2026-03-27 02:52:52'),
(2, 1, 'active', '2026-04-02 05:17:08', '2026-04-02 05:17:08'),
(3, 1, 'active', '2026-04-02 08:39:15', '2026-04-02 08:39:15'),
(4, 1, 'active', '2026-04-06 02:11:30', '2026-04-06 02:11:30'),
(5, 1, 'active', '2026-04-06 02:12:38', '2026-04-06 02:12:38'),
(6, 1, 'active', '2026-04-06 02:15:10', '2026-04-06 02:15:10'),
(7, 1, 'active', '2026-04-06 02:20:11', '2026-04-06 02:20:11'),
(8, 1, 'active', '2026-04-06 02:20:31', '2026-04-06 02:20:31'),
(9, 1, 'active', '2026-04-06 02:20:44', '2026-04-06 02:20:44'),
(10, 1, 'active', '2026-04-06 02:26:59', '2026-04-06 02:26:59'),
(11, 1, 'active', '2026-04-06 02:27:39', '2026-04-06 02:27:39'),
(12, 1, 'active', '2026-04-06 02:28:00', '2026-04-06 02:28:00'),
(13, 1, 'active', '2026-04-06 02:28:24', '2026-04-06 02:28:24'),
(14, 1, 'active', '2026-04-06 02:29:01', '2026-04-06 02:29:01'),
(15, 1, 'active', '2026-04-06 02:29:20', '2026-04-06 02:29:20'),
(16, 1, 'active', '2026-04-06 02:31:22', '2026-04-06 02:31:22'),
(17, 1, 'active', '2026-04-06 02:32:08', '2026-04-06 02:32:08'),
(18, 1, 'active', '2026-04-06 02:32:24', '2026-04-06 02:32:24'),
(19, 1, 'active', '2026-04-06 04:10:30', '2026-04-06 04:10:30'),
(20, 1, 'active', '2026-04-06 04:18:46', '2026-04-06 04:18:46'),
(21, 1, 'active', '2026-04-06 04:21:19', '2026-04-06 04:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'test', '2026-03-26 21:02:04', '2026-03-26 21:02:04'),
(2, 'testc', '2026-04-02 22:46:26', '2026-04-02 22:46:26'),
(3, 'skin care', '2026-04-05 19:24:01', '2026-04-05 19:24:01'),
(4, 'perfumes', '2026-04-05 19:24:14', '2026-04-05 19:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `elementos_carritos`
--

CREATE TABLE `elementos_carritos` (
  `id_elemento_carrito` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `id_carrito` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `elementos_carritos`
--

INSERT INTO `elementos_carritos` (`id_elemento_carrito`, `id_producto`, `id_carrito`, `cantidad`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 1000.00, '2026-03-27 02:52:53', '2026-03-27 02:52:53'),
(2, 1, 2, 4, 1000.00, '2026-04-02 05:17:09', '2026-04-02 05:17:09'),
(3, 1, 3, 1, 1000.00, '2026-04-02 08:39:17', '2026-04-02 08:39:17'),
(4, 6, 3, 1, 10000.00, '2026-04-02 08:39:18', '2026-04-02 08:39:18'),
(5, 7, 3, 1, 10000.00, '2026-04-02 08:39:18', '2026-04-02 08:39:18'),
(6, 8, 3, 1, 10000.00, '2026-04-02 08:39:19', '2026-04-02 08:39:19'),
(7, 1, 4, 5, 1000.00, '2026-04-06 02:11:31', '2026-04-06 02:11:31'),
(8, 1, 5, 5, 1000.00, '2026-04-06 02:12:40', '2026-04-06 02:12:40'),
(9, 1, 6, 5, 1000.00, '2026-04-06 02:15:12', '2026-04-06 02:15:12'),
(10, 1, 7, 5, 1000.00, '2026-04-06 02:20:13', '2026-04-06 02:20:13'),
(11, 1, 8, 5, 1000.00, '2026-04-06 02:20:32', '2026-04-06 02:20:32'),
(12, 1, 9, 5, 1000.00, '2026-04-06 02:20:45', '2026-04-06 02:20:45'),
(13, 1, 10, 5, 1000.00, '2026-04-06 02:27:01', '2026-04-06 02:27:01'),
(14, 1, 11, 5, 1000.00, '2026-04-06 02:27:41', '2026-04-06 02:27:41'),
(15, 1, 12, 5, 1000.00, '2026-04-06 02:28:01', '2026-04-06 02:28:01'),
(16, 1, 13, 5, 1000.00, '2026-04-06 02:28:25', '2026-04-06 02:28:25'),
(17, 1, 14, 5, 1000.00, '2026-04-06 02:29:03', '2026-04-06 02:29:03'),
(18, 1, 15, 5, 1000.00, '2026-04-06 02:29:21', '2026-04-06 02:29:21'),
(19, 1, 16, 5, 1000.00, '2026-04-06 02:31:24', '2026-04-06 02:31:24'),
(20, 1, 17, 5, 1000.00, '2026-04-06 02:32:10', '2026-04-06 02:32:10'),
(21, 1, 18, 5, 1000.00, '2026-04-06 02:32:26', '2026-04-06 02:32:26'),
(22, 6, 19, 2, 10000.00, '2026-04-06 04:10:32', '2026-04-06 04:10:32'),
(23, 6, 20, 6, 10000.00, '2026-04-06 04:18:48', '2026-04-06 04:18:48'),
(24, 10, 21, 2, 10000.00, '2026-04-06 04:21:21', '2026-04-06 04:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `factura_pedidos`
--

CREATE TABLE `factura_pedidos` (
  `id_factura_pedido` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `id_carrito` bigint(20) UNSIGNED NOT NULL,
  `id_tarjeta` bigint(20) UNSIGNED DEFAULT NULL,
  `neto` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `mp_status` text DEFAULT NULL,
  `mp_id` text DEFAULT NULL,
  `status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `factura_pedidos`
--

INSERT INTO `factura_pedidos` (`id_factura_pedido`, `id_usuario`, `id_carrito`, `id_tarjeta`, `neto`, `descuento`, `mp_status`, `mp_id`, `status`, `created_at`, `updated_at`) VALUES
(1000, 1, 1, NULL, 3000.00, 0.00, NULL, NULL, 'pending', '2026-03-27 02:52:54', '2026-03-27 02:52:54'),
(1001, 1, 1, NULL, 10000.00, 0.00, NULL, NULL, 'failed', '2026-03-27 03:01:22', '2026-03-27 03:01:22'),
(1002, 1, 2, NULL, 4000.00, 0.00, 'approved', '152186801683', 'paid', '2026-04-02 05:17:09', '2026-04-02 05:45:55'),
(1003, 1, 3, 1000, 31000.00, 10000.00, NULL, NULL, 'pending', '2026-04-02 08:39:19', '2026-04-02 08:39:19'),
(1007, 1, 7, 1001, 0.00, 10000.00, NULL, NULL, 'pending', '2026-04-06 02:20:13', '2026-04-06 02:20:13'),
(1008, 1, 8, 1001, 0.00, 10000.00, NULL, NULL, 'pending', '2026-04-06 02:20:33', '2026-04-06 02:20:33'),
(1009, 1, 9, 1001, 0.00, 10000.00, NULL, NULL, 'pending', '2026-04-06 02:20:46', '2026-04-06 02:20:46'),
(1010, 1, 10, 1001, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:27:01', '2026-04-06 02:27:02'),
(1011, 1, 11, 1001, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:27:41', '2026-04-06 02:27:43'),
(1012, 1, 12, 1001, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:28:02', '2026-04-06 02:28:02'),
(1013, 1, 13, 1001, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:28:25', '2026-04-06 02:28:26'),
(1014, 1, 14, 1001, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:29:03', '2026-04-06 02:29:04'),
(1015, 1, 15, NULL, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:29:22', '2026-04-06 02:29:23'),
(1016, 1, 16, 1001, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:31:24', '2026-04-06 02:31:25'),
(1017, 1, 17, NULL, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:32:11', '2026-04-06 02:32:12'),
(1018, 1, 18, NULL, 0.00, 10000.00, NULL, NULL, 'paid', '2026-04-06 02:32:26', '2026-04-06 02:32:27'),
(1019, 1, 19, 1002, 0.00, 20000.00, NULL, NULL, 'paid', '2026-04-06 04:10:33', '2026-04-06 04:10:34'),
(1020, 1, 20, 1002, 40000.00, 20000.00, NULL, NULL, 'pending', '2026-04-06 04:18:49', '2026-04-06 04:18:49'),
(1021, 1, 21, 1002, 0.00, 20000.00, NULL, NULL, 'paid', '2026-04-06 04:21:21', '2026-04-06 04:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guia_regalos`
--

CREATE TABLE `guia_regalos` (
  `id_guia` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guia_regalos`
--

INSERT INTO `guia_regalos` (`id_guia`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'test', 'asdfghjhgsfa', '2026-03-27 02:04:14', '2026-03-27 02:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagen` bigint(20) UNSIGNED NOT NULL,
  `filename` text NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imagenes`
--

INSERT INTO `imagenes` (`id_imagen`, `filename`, `id_producto`, `created_at`, `updated_at`) VALUES
(1, 'imagenes_productos/yNib2A7fxZztSuYeAh71x4WROV70SF5HZBXpkURr.jpg', 1, '2026-03-30 08:55:50', '2026-03-30 08:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones_regalo`
--

CREATE TABLE `inscripciones_regalo` (
  `id_inscripcion` bigint(20) UNSIGNED NOT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'participando',
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `id_factura_pedido` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inscripciones_regalo`
--

INSERT INTO `inscripciones_regalo` (`id_inscripcion`, `estado`, `id_usuario`, `id_factura_pedido`, `created_at`, `updated_at`) VALUES
(1, 'participando', 1, 1000, '2026-04-02 10:15:25', NULL),
(3, 'participando', 1, 1001, '2026-04-02 22:58:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `pais_origen` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre`, `pais_origen`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', '2026-03-27 02:02:21', '2026-03-27 02:02:21'),
(2, 'testm', 'hola', '2026-04-03 03:46:46', '2026-04-03 03:46:46');

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
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2025_11_10_043607_create_roles_table', 1),
(4, '2025_11_10_043614_create_usuarios_table', 1),
(5, '2025_11_10_043624_create_categorias_table', 1),
(6, '2025_11_10_043634_create_marcas_table', 1),
(7, '2025_11_10_043648_create_referencia_productos_table', 1),
(8, '2025_11_10_043704_create_productos_table', 1),
(9, '2025_11_10_043717_create_imagenes_table', 1),
(10, '2025_11_10_043729_create_tarjetas_regalo_table', 1),
(11, '2025_11_10_043753_create_carritos_table', 1),
(12, '2025_11_10_043755_create_factura_pedidos_table', 1),
(13, '2025_11_10_043804_create_inscripciones_regalo_table', 1),
(14, '2025_11_13_023000_create_premios_table', 1),
(15, '2025_11_13_023015_create_premiados_table', 1),
(16, '2025_11_13_023021_create_resenas_table', 1),
(17, '2026_02_17_035620_create_guia_regalos_table', 1),
(18, '2026_02_17_040202_add_id_guia_to_productos_table', 1),
(19, '2026_02_28_231825_create_sessions_table', 1),
(20, '2026_03_23_011937_elementos_carritos', 1);

-- --------------------------------------------------------

--
-- Table structure for table `premiados`
--

CREATE TABLE `premiados` (
  `id_premiado` bigint(20) UNSIGNED NOT NULL,
  `id_premio` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `id_inscripcion` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `premios`
--

CREATE TABLE `premios` (
  `id_premio` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tendencia` tinyint(1) NOT NULL,
  `descuento` tinyint(1) NOT NULL,
  `prod_regalo` tinyint(1) NOT NULL,
  `premio` tinyint(1) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` bigint(20) UNSIGNED NOT NULL,
  `id_marca` bigint(20) UNSIGNED NOT NULL,
  `id_referencia` bigint(20) UNSIGNED NOT NULL,
  `id_guia` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `tendencia`, `descuento`, `prod_regalo`, `premio`, `stock`, `id_categoria`, `id_marca`, `id_referencia`, `id_guia`, `created_at`, `updated_at`) VALUES
(1, 'test', 'asdasdasdads', 1000.00, 1, 0, 1, 0, 90, 1, 1, 1, 1, '2026-03-27 02:08:23', '2026-04-03 01:49:04'),
(6, 'TEST', 'TESTTTTTT', 10000.00, 1, 1, 1, 0, 100, 1, 1, 2, NULL, '2026-03-27 21:26:55', '2026-03-27 21:26:55'),
(7, 'TEST', 'TESTTTTTT', 10000.00, 1, 1, 1, 0, 100, 1, 1, 3, NULL, '2026-03-27 21:26:55', '2026-03-27 21:26:55'),
(8, 'TEST', 'TESTTTTTT', 10000.00, 1, 1, 1, 0, 100, 1, 1, 4, NULL, '2026-03-27 21:26:55', '2026-03-27 21:26:55'),
(9, 'TEST', 'TESTTTTTT', 10000.00, 1, 1, 1, 0, 100, 1, 1, 5, NULL, '2026-03-27 21:26:55', '2026-03-27 21:26:55'),
(10, 'TEST', 'TESTTTTTT', 10000.00, 1, 1, 1, 0, 100, 1, 1, 6, NULL, '2026-03-27 21:26:55', '2026-03-27 21:26:55'),
(11, 'testc', 'testc0000000', 1000.00, 1, 1, 1, 1, 10, 2, 1, 8, 1, '2026-04-03 03:49:03', '2026-04-03 03:49:03'),
(12, 'test', '01234567890', 10000.00, 0, 0, 0, 0, 1, 1, 2, 7, 1, '2026-04-03 03:55:30', '2026-04-03 03:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `referencia_productos`
--

CREATE TABLE `referencia_productos` (
  `id_referencia` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `tamano` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referencia_productos`
--

INSERT INTO `referencia_productos` (`id_referencia`, `codigo`, `color`, `tamano`, `created_at`, `updated_at`) VALUES
(1, '100', 'morado', '10x10', '2026-03-27 02:03:32', '2026-03-27 02:03:32'),
(2, '101', 'rosa', '100ml', '2026-03-27 21:26:11', '2026-03-27 21:26:11'),
(3, '102', 'rosa', '100ml', '2026-03-27 21:26:11', '2026-03-27 21:26:11'),
(4, '103', 'rosa', '100ml', '2026-03-27 21:26:11', '2026-03-27 21:26:11'),
(5, '104', 'rosa', '100ml', '2026-03-27 21:26:11', '2026-03-27 21:26:11'),
(6, '105', 'rosa', '100ml', '2026-03-27 21:26:11', '2026-03-27 21:26:11'),
(7, '106', 'morado', '10x10', '2026-04-03 03:48:02', '2026-04-03 03:48:02'),
(8, '107', 'morado', '10x10', '2026-04-03 03:48:14', '2026-04-03 03:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `resenas`
--

CREATE TABLE `resenas` (
  `id_resena` bigint(20) UNSIGNED NOT NULL,
  `resena` int(11) NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resenas`
--

INSERT INTO `resenas` (`id_resena`, `resena`, `id_producto`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, '2026-04-02 09:39:40', '2026-04-02 09:39:40'),
(2, 3, 1, 1, '2026-04-02 09:40:26', '2026-04-02 09:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_rol` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2026-03-26 20:49:30', '2026-03-26 20:49:30'),
(2, 'Cliente', '2026-03-26 20:49:30', '2026-03-26 20:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('07qJ61N84KSsmUZgMT3emHdSowkZwXGvv3cwXxo2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak5zOEtKazJCRG55ZG1rZUw1V0wySUR0b2g1dGlJNkZUZFB5QzdqQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mYWN0dXJhLzEwMDIvcGRmIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1775095247);

-- --------------------------------------------------------

--
-- Table structure for table `tarjetas_regalo`
--

CREATE TABLE `tarjetas_regalo` (
  `id_tarjeta` bigint(20) UNSIGNED NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_expiracion` datetime NOT NULL,
  `fecha_de_uso` datetime NOT NULL,
  `estado` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `mp_status` text DEFAULT NULL,
  `mp_id` text DEFAULT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tarjetas_regalo`
--

INSERT INTO `tarjetas_regalo` (`id_tarjeta`, `monto`, `fecha_creacion`, `fecha_expiracion`, `fecha_de_uso`, `estado`, `status`, `mp_status`, `mp_id`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1000, 10000.00, '2026-04-01 22:03:29', '2026-04-03 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-02 08:03:29', '2026-04-02 08:03:29'),
(1001, 10000.00, '2026-04-01 23:49:36', '2027-04-02 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-02 09:49:36', '2026-04-02 09:49:36'),
(1002, 20000.00, '2026-04-02 12:55:22', '2027-04-02 00:00:00', '1000-01-01 00:00:00', 'usada', 'unpaid', NULL, NULL, 1, '2026-04-02 22:55:22', '2026-04-06 04:21:23'),
(1003, 200000.00, '2026-04-02 12:55:28', '2027-04-02 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-02 22:55:28', '2026-04-02 22:55:28'),
(1004, 20000.00, '2026-04-05 16:39:45', '2027-04-05 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-06 02:39:45', '2026-04-06 02:39:45'),
(1005, 80000.00, '2026-04-05 20:15:56', '2027-04-06 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-06 06:15:56', '2026-04-06 06:15:56'),
(1006, 80000.00, '2026-04-05 20:17:57', '2027-04-06 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-06 06:17:57', '2026-04-06 06:17:57'),
(1007, 80000.00, '2026-04-05 20:22:59', '2027-04-06 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-06 06:22:59', '2026-04-06 06:22:59'),
(1008, 80000.00, '2026-04-05 20:25:52', '2027-04-06 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-06 06:25:52', '2026-04-06 06:25:52'),
(1009, 200000.00, '2026-04-05 20:26:03', '2027-04-06 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-06 06:26:03', '2026-04-06 06:26:03'),
(1010, 80000.00, '2026-04-05 20:26:18', '2027-04-06 00:00:00', '1000-01-01 00:00:00', 'activa', 'unpaid', NULL, NULL, 1, '2026-04-06 06:26:18', '2026-04-06 06:26:18'),
(1011, 80000.00, '2026-04-05 20:28:14', '2027-04-06 00:00:00', '1000-01-01 00:00:00', 'activa', 'paid', 'approved', '152683605861', 1, '2026-04-06 06:28:14', '2026-04-06 06:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `tipo_documento` varchar(255) NOT NULL,
  `num_documento` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_rol` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `tipo_documento`, `num_documento`, `nombres`, `apellidos`, `correo`, `contrasena`, `telefono`, `direccion`, `id_rol`, `created_at`, `updated_at`) VALUES
(1, 'CC', '1033259287', 'edison', 'orozco', 'andresorozco1206@gmail.com', '$2y$12$QznTMpf/wwNShgC/LHldw.agu4vAwsid9URDq0EW7nMhk9xb5dDMm', '3026357194', 'Amazonas / Leticia / Amazonas / Leticia / Amazonas / Leticia / Antioquia / Abejorral / Vereda san jose del manzanillo', 1, '2026-03-27 01:52:26', '2026-04-06 04:20:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `carritos_id_usuario_foreign` (`id_usuario`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `elementos_carritos`
--
ALTER TABLE `elementos_carritos`
  ADD PRIMARY KEY (`id_elemento_carrito`),
  ADD KEY `elementos_carritos_id_producto_foreign` (`id_producto`),
  ADD KEY `elementos_carritos_id_carrito_foreign` (`id_carrito`);

--
-- Indexes for table `factura_pedidos`
--
ALTER TABLE `factura_pedidos`
  ADD PRIMARY KEY (`id_factura_pedido`),
  ADD KEY `factura_pedidos_id_usuario_foreign` (`id_usuario`),
  ADD KEY `factura_pedidos_id_carrito_foreign` (`id_carrito`),
  ADD KEY `factura_pedidos_id_tarjeta_foreign` (`id_tarjeta`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `guia_regalos`
--
ALTER TABLE `guia_regalos`
  ADD PRIMARY KEY (`id_guia`);

--
-- Indexes for table `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `imagenes_id_producto_foreign` (`id_producto`);

--
-- Indexes for table `inscripciones_regalo`
--
ALTER TABLE `inscripciones_regalo`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `inscripciones_regalo_id_factura_pedido_foreign` (`id_factura_pedido`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `premiados`
--
ALTER TABLE `premiados`
  ADD PRIMARY KEY (`id_premiado`),
  ADD KEY `premiados_id_premio_foreign` (`id_premio`),
  ADD KEY `premiados_id_usuario_foreign` (`id_usuario`),
  ADD KEY `premiados_id_inscripcion_foreign` (`id_inscripcion`);

--
-- Indexes for table `premios`
--
ALTER TABLE `premios`
  ADD PRIMARY KEY (`id_premio`),
  ADD KEY `premios_id_producto_foreign` (`id_producto`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `productos_id_referencia_unique` (`id_referencia`),
  ADD KEY `productos_id_categoria_foreign` (`id_categoria`),
  ADD KEY `productos_id_marca_foreign` (`id_marca`),
  ADD KEY `productos_id_guia_foreign` (`id_guia`);

--
-- Indexes for table `referencia_productos`
--
ALTER TABLE `referencia_productos`
  ADD PRIMARY KEY (`id_referencia`);

--
-- Indexes for table `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `resenas_id_producto_foreign` (`id_producto`),
  ADD KEY `resenas_id_usuario_foreign` (`id_usuario`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tarjetas_regalo`
--
ALTER TABLE `tarjetas_regalo`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD KEY `tarjetas_regalo_id_usuario_foreign` (`id_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuarios_correo_unique` (`correo`),
  ADD KEY `usuarios_id_rol_foreign` (`id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carritos`
--
ALTER TABLE `carritos`
  MODIFY `id_carrito` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `elementos_carritos`
--
ALTER TABLE `elementos_carritos`
  MODIFY `id_elemento_carrito` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `factura_pedidos`
--
ALTER TABLE `factura_pedidos`
  MODIFY `id_factura_pedido` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1022;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guia_regalos`
--
ALTER TABLE `guia_regalos`
  MODIFY `id_guia` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inscripciones_regalo`
--
ALTER TABLE `inscripciones_regalo`
  MODIFY `id_inscripcion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `premiados`
--
ALTER TABLE `premiados`
  MODIFY `id_premiado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `premios`
--
ALTER TABLE `premios`
  MODIFY `id_premio` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `referencia_productos`
--
ALTER TABLE `referencia_productos`
  MODIFY `id_referencia` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id_resena` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tarjetas_regalo`
--
ALTER TABLE `tarjetas_regalo`
  MODIFY `id_tarjeta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1012;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carritos`
--
ALTER TABLE `carritos`
  ADD CONSTRAINT `carritos_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `elementos_carritos`
--
ALTER TABLE `elementos_carritos`
  ADD CONSTRAINT `elementos_carritos_id_carrito_foreign` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`),
  ADD CONSTRAINT `elementos_carritos_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Constraints for table `factura_pedidos`
--
ALTER TABLE `factura_pedidos`
  ADD CONSTRAINT `factura_pedidos_id_carrito_foreign` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`),
  ADD CONSTRAINT `factura_pedidos_id_tarjeta_foreign` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjetas_regalo` (`id_tarjeta`),
  ADD CONSTRAINT `factura_pedidos_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;

--
-- Constraints for table `inscripciones_regalo`
--
ALTER TABLE `inscripciones_regalo`
  ADD CONSTRAINT `inscripciones_regalo_id_factura_pedido_foreign` FOREIGN KEY (`id_factura_pedido`) REFERENCES `factura_pedidos` (`id_factura_pedido`),
  ADD CONSTRAINT `inscripciones_regalo_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `premiados`
--
ALTER TABLE `premiados`
  ADD CONSTRAINT `premiados_id_inscripcion_foreign` FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones_regalo` (`id_inscripcion`) ON DELETE CASCADE,
  ADD CONSTRAINT `premiados_id_premio_foreign` FOREIGN KEY (`id_premio`) REFERENCES `premios` (`id_premio`) ON DELETE CASCADE,
  ADD CONSTRAINT `premiados_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `premios`
--
ALTER TABLE `premios`
  ADD CONSTRAINT `premios_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `productos_id_guia_foreign` FOREIGN KEY (`id_guia`) REFERENCES `guia_regalos` (`id_guia`),
  ADD CONSTRAINT `productos_id_marca_foreign` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  ADD CONSTRAINT `productos_id_referencia_foreign` FOREIGN KEY (`id_referencia`) REFERENCES `referencia_productos` (`id_referencia`);

--
-- Constraints for table `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `resenas_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `tarjetas_regalo`
--
ALTER TABLE `tarjetas_regalo`
  ADD CONSTRAINT `tarjetas_regalo_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_id_rol_foreign` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
