-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2020 at 02:42 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts-pbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `datapoint`
--

CREATE TABLE `datapoint` (
  `id` int(11) NOT NULL,
  `nama_laundry` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `latitude` varchar(11) DEFAULT NULL,
  `longitude` varchar(11) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datapoint`
--

INSERT INTO `datapoint` (`id`, `nama_laundry`, `keterangan`, `latitude`, `longitude`, `warna`) VALUES
(1, 'Laundry Kilat', NULL, '-6.186195', '106.974648', 'blue'),
(2, 'Laundry Bersih', NULL, '-6.190431', '106.971398', 'yellow'),
(3, 'Laundry Wangi', NULL, '-6.190292', '106.974788', 'white'),
(4, 'Laundry Murah', NULL, '-6.190873', '106.986092', 'white');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `setting_id` int(11) NOT NULL,
  `namaweb` varchar(16) DEFAULT NULL,
  `icon` varchar(16) DEFAULT NULL,
  `logo` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`setting_id`, `namaweb`, `icon`, `logo`) VALUES
(1, 'WEB GIS', 'bekasii.png', 'bekasii1.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(132) NOT NULL,
  `image` varchar(132) DEFAULT NULL,
  `akses_level` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `image`, `akses_level`) VALUES
(1, 'Admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'WhatsApp_Image_2019-08-16_at_22_23_16.jpeg', 'admin'),
(2, 'Operator', 'fe96dd39756ac41b74283a9292652d366d73931f', 'WhatsApp_Image_2019-08-16_at_22_23_15.jpeg', 'operator'),
(5, 'User', '12dea96fec20593566ab75692c9949596833adc9', 'irga.jpg', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datapoint`
--
ALTER TABLE `datapoint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datapoint`
--
ALTER TABLE `datapoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
