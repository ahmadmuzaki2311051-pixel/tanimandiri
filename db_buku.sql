-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2026 at 06:19 PM
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
-- Database: `db_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `kode_buku` varchar(20) NOT NULL,
  `judul_buku` varchar(150) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kode_buku`, `judul_buku`, `pengarang`, `penerbit`, `tahun_terbit`, `stok`, `harga`) VALUES
(25, '1001', 'ZENUS', 'OBAT RUMPU', 'ZENUS', NULL, 181, 70000),
(26, '1002', 'SOLUSI', 'Obat Rumput', 'Solusi K', NULL, 1, 35000),
(28, '8993175531719', 'beras', 'sapi', 'beras', NULL, 71, 25000),
(29, '1003', 'HANTU', 'OBAT RUMPUT', 'HANTU', NULL, 74, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `buku_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `subtotal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id`, `transaksi_id`, `buku_id`, `jumlah`, `harga`, `subtotal`) VALUES
(1, 1, 25, 3, 70000, 210000),
(2, 2, 25, 2, 70000, 140000),
(3, 2, 26, 2, 35000, 70000),
(4, 3, 25, 2, 70000, 140000),
(5, 3, 26, 6, 35000, 210000),
(6, 4, 25, 2, 70000, 140000),
(7, 5, 25, 1, 70000, 70000),
(8, 6, 25, 1, 70000, 70000),
(9, 7, 25, 3, 70000, 210000),
(10, 8, 25, 1, 70000, 70000),
(12, 10, 25, 10, 70000, 700000),
(13, 11, 25, 3, 70000, 210000),
(14, 12, 28, 2, 25000, 50000),
(15, 13, 25, 9, 70000, 630000),
(16, 14, 25, 1, 70000, 70000),
(17, 15, 25, 7, 70000, 490000),
(18, 16, 25, 11, 70000, 770000);

-- --------------------------------------------------------

--
-- Table structure for table `stok_masuk`
--

CREATE TABLE `stok_masuk` (
  `id` int(10) UNSIGNED NOT NULL,
  `buku_id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_masuk`
--

INSERT INTO `stok_masuk` (`id`, `buku_id`, `nama_produk`, `jumlah`, `catatan`, `tanggal`) VALUES
(1, 28, 'beras', 6, NULL, '2026-09-29 21:47:18'),
(2, 29, 'HANTU', 45, NULL, '2026-09-29 21:57:02'),
(3, 26, 'SOLUSI', 1, NULL, '2026-09-29 22:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `total` bigint(20) NOT NULL,
  `bayar` bigint(20) NOT NULL,
  `kembalian` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `tanggal`, `total`, `bayar`, `kembalian`) VALUES
(1, '2026-09-27 14:04:39', 210000, 250000, 40000),
(2, '2026-09-27 14:08:36', 210000, 300000, 90000),
(3, '2026-09-27 14:28:45', 350000, 400000, 50000),
(4, '2026-09-27 14:57:01', 140000, 200000, 60000),
(5, '2026-09-28 21:59:17', 70000, 100000, 30000),
(6, '2026-09-28 23:16:17', 70000, 100000, 30000),
(7, '2026-09-29 10:09:03', 210000, 250000, 40000),
(8, '2026-09-29 14:23:42', 70000, 100000, 30000),
(10, '2026-09-29 14:34:21', 700000, 1000000, 300000),
(11, '2026-09-29 15:31:19', 210000, 250000, 40000),
(12, '2026-09-29 21:39:36', 50000, 70000, 20000),
(13, '2026-09-29 22:20:40', 630000, 700000, 70000),
(14, '2026-09-29 22:26:53', 70000, 100000, 30000),
(15, '2026-09-29 22:49:29', 490000, 500000, 10000),
(16, '2026-09-29 22:50:52', 770000, 800000, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('owner','karyawan','pelanggan') NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `session_token` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `aktif`, `dibuat_pada`, `session_token`) VALUES
(1, 'owner', '$2y$10$P0mvCWz8hNNGs4tXdhz6FOXcPUrL8NVgGEZIPBX6n3xzHd3Znjl/a', 'owner', 1, '2026-09-29 06:06:39', 'b7647152f7541c108473235df53f69f70926862df65d9e16207476c1e04b40f9'),
(2, 'karyawan', '$2y$10$cKBkMP0ryezJNWHTFbrqley22JuWW./3UcE3AISKBb3byxUwUYB3a', 'karyawan', 1, '2026-09-29 06:06:39', '1ae220fbedab28e570a75ef227b56ba057f6670fc40706301e2c18ab5ab6ebb5'),
(3, 'pelanggan', '$2y$10$2qGtPUm/UgYTAewBM5CwCuc3NqIoUe15jx2ExH84XNYdS7JIshbji', 'pelanggan', 1, '2026-09-29 06:06:39', NULL),
(4, 'zac', '$2y$10$272m17Abhlmxcv1l2DqfB.hvAxqTlMUGQnOuLRL6.aM2s2zbnuiVO', 'owner', 1, '2026-09-29 07:59:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `buku_id` (`buku_id`);

--
-- Indexes for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
