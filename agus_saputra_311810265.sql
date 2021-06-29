-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jun 2021 pada 14.07
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `septian_saputra_311810265`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` char(25) DEFAULT NULL,
  `alamat_pelanggan` char(50) DEFAULT NULL,
  `nohp` varchar(13) NOT NULL,
  `status` varchar(50) NOT NULL,
  `nik` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `nohp`, `status`, `nik`) VALUES
(1002, 'Marco Roland', 'Cibarusah', '08229865772', 'Customer Platinum', '201601280006'),
(1003, 'M. Nasrudin', 'Pasir Gombong', '08994221412', 'Customer Platinum', '201601280005'),
(1004, 'Sabar Budiman', 'Cibarusah', '02283123213', 'Customer Premium', '201601280003'),
(1005, 'Fajar Ravi', 'Jababeka', '082182373821', 'Cusomer Premium', '201601280002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` char(25) DEFAULT NULL,
  `harga_produk` char(15) DEFAULT NULL,
  `kemasan_produk` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `kemasan_produk`) VALUES
(1, 'Scuto Platinum Medium Car', '5500000', 'paket'),
(2, 'Scuto Platinum Small Car', '4500000', 'paket'),
(3, 'Scuto Premium Medium Car', '4000000', 'paket');

-- --------------------------------------------------------

--
-- Struktur dari tabel `salesman`
--

CREATE TABLE `salesman` (
  `id_salesman` int(11) NOT NULL,
  `nama_salesman` char(25) DEFAULT NULL,
  `nohp_sales` varchar(13) NOT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `salesman`
--

INSERT INTO `salesman` (`id_salesman`, `nama_salesman`, `nohp_sales`, `id_produk`, `id_pelanggan`) VALUES
(2001, 'Arif', '021651265', 2, 1003),
(2002, 'Mario', '022165446', 1, 1002),
(2004, 'Riski', '21354546', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(11, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`id_salesman`),
  ADD KEY `fk_pelanggan` (`id_pelanggan`),
  ADD KEY `fk_produk` (`id_produk`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `salesman`
--
ALTER TABLE `salesman`
  ADD CONSTRAINT `salesman_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salesman_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
