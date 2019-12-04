-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Des 2019 pada 16.03
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts_cahyo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `nim` varchar(12) DEFAULT NULL,
  `no_hp_lama` varchar(14) DEFAULT NULL,
  `no_hp_baru` varchar(14) DEFAULT NULL,
  `tgl_diubah` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id`, `nim`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
(1, '2147483647', '2147483649', '089669987444', '2019-10-29 15:29:36'),
(2, '161240000483', '2147483648', '085786303475', '2019-11-06 14:31:23'),
(3, '2147483647', '085786303475', '085786303475', '2019-11-06 14:31:37'),
(4, '2147483647', '089669987444', '089669987444', '2019-11-06 14:32:00'),
(7, '763', '456789', '12', '2019-12-04 15:53:04'),
(8, '762', '85', '90', '2019-12-04 15:52:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(2) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `nomor_hp` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama_mahasiswa`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES
(7, '763', 'uhgf', 'p', 'fghgjk', '12'),
(8, '762', 'kdf', 'p', 'kj', '90'),
(9, '191240000484', 'eeee', 'p', 'eeeee1', '1'),
(10, '191240000456', 'we', 'p', 'qwwq', '1221'),
(11, '1', 'eeee', 'p', 'rr', '23'),
(12, '67', 'we', 'p', 'Sukosono', '23'),
(13, '233', 'erere', 'p', 'Sukosono', '22');

--
-- Trigger `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `update_nomor` AFTER UPDATE ON `mahasiswa` FOR EACH ROW BEGIN
INSERT INTO log
set 
id = old.id,
nim = old.nim,
no_hp_lama = old.nomor_hp,
no_hp_baru = new.nomor_hp,
tgl_diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tampilkan_data`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tampilkan_data` (
`id` int(11)
,`nim` varchar(12)
,`nama_mahasiswa` varchar(50)
,`jenis_kelamin` varchar(2)
,`alamat` varchar(200)
,`nomor_hp` varchar(14)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `tampilkan_data`
--
DROP TABLE IF EXISTS `tampilkan_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampilkan_data`  AS  select `mahasiswa`.`id` AS `id`,`mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`,`mahasiswa`.`jenis_kelamin` AS `jenis_kelamin`,`mahasiswa`.`alamat` AS `alamat`,`mahasiswa`.`nomor_hp` AS `nomor_hp` from `mahasiswa` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
