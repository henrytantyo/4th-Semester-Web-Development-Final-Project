-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jun 2022 pada 20.30
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitalie`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `confirm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `material`
--

CREATE TABLE `material` (
  `id_material` int(11) NOT NULL,
  `nama_material` varchar(150) NOT NULL,
  `deskripsi_material` varchar(255) NOT NULL,
  `harga_beli_material` double NOT NULL,
  `harga_jual_material` double NOT NULL,
  `gambar_material` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `material`
--

INSERT INTO `material` (`id_material`, `nama_material`, `deskripsi_material`, `harga_beli_material`, `harga_jual_material`, `gambar_material`) VALUES
(1, 'Doff Paper', 'Shipping Available for All Regions', 5000, 7000, 'doff.png'),
(2, 'Sublime Paper', 'Shipping Available for All Regions', 5000, 7000, 'sublime.png'),
(3, 'Vinyl Paper', 'Shipping Available for All Regions', 5000, 7000, 'vinyl.png'),
(4, 'Laster Photo Paper', 'Shipping Available for All Regions', 5000, 7000, 'laster.png'),
(5, 'Canvas Paper', 'Shipping Available for All Regions', 5000, 7000, 'doff.png'),
(6, 'Double Side Paper', 'Shipping Available for All Regions', 5000, 7000, 'dside.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_list`
--

CREATE TABLE `order_list` (
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `confirm` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desain` varchar(255) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_list`
--

INSERT INTO `order_list` (`order_id`, `date`, `subtotal`, `total`, `confirm`, `user_id`, `desain`, `bukti_pembayaran`) VALUES
(31, '2022-05-31', 20000, 22000, 'belum', 10, '', ''),
(32, '2022-06-01', 33000, 50000, 'sudah bayar', 9, '244-poster.png', 'dside.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_table`
--

CREATE TABLE `order_table` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `gambar_produk` varchar(255) NOT NULL,
  `duration` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `deskripsi`, `harga_beli`, `harga_jual`, `gambar_produk`, `duration`) VALUES
(2, 'Poster', 'Shipping available for all regions', 50000, 60000, 'poster.png', 2),
(3, 'Brochure', 'Shipping available for all regions', 2000, 2300, 'brochure.png', 3),
(4, 'Name Card', 'Shipping available for all regions', 22000, 24000, 'namecard.png', 7),
(5, 'Photobook', 'Shipping available for all regions', 275000, 300000, 'photobook.png', 9),
(6, 'Logo', 'Shipping available for all regions', 4500, 5000, 'logo.png', 1),
(7, 'Sticker', 'Shipping available for all regions', 5000, 6500, 'sticker.png', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profilepic`
--

CREATE TABLE `profilepic` (
  `pic_id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profilepic`
--

INSERT INTO `profilepic` (`pic_id`, `picture`, `user_id`) VALUES
(4, 'userpic/IMG_4042.JPG', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `cart_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga_jual` double NOT NULL,
  `total` int(11) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `confirm` varchar(255) NOT NULL,
  `id_material` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status_order` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desain` varchar(255) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `shopping_cart`
--

INSERT INTO `shopping_cart` (`cart_id`, `date`, `fname`, `lname`, `nama_produk`, `harga_jual`, `total`, `phone`, `address`, `confirm`, `id_material`, `quantity`, `status_order`, `user_id`, `desain`, `bukti_pembayaran`) VALUES
(29, '2022-06-03', 'Alex', 'e', 'Brochure', 6900, 7659, '231123', '4132423', 'Sudah Bayar', 3, 3, 'Order Sedang Diproses', 11, 'IMG_4042.JPG', 'messageImage_1651845360556.jpg'),
(30, '2022-06-03', 'Alex', 'e', 'Brochure', 4600, 5106, '231123', '4132423', 'Belum Bayar', 3, 2, '', 11, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `phone`, `address`, `role`, `created_at`) VALUES
(8, 'thomas', 'j', 'thomas@gmail.com', '$2y$10$Tgala/tzCbo8lG5vARcrlubvjil65E7lj1ZvT6rDdUoTFP5HAfWpK', '08123', 'bsd', 'admin', '2022-05-30'),
(9, 'toar', 'alex', 'toar@gmail.com', '$2y$10$RuJAgxM1uUCv063r0BPdVu2sNnpj0r8KZEl7MnbP5shme76ThRHxa', '0812345', 'depok', 'customer', '2022-05-30'),
(10, 'Aljevan', 'Komala', 'aljevankomala40@gmail.com', '$2y$10$LmtrNsocgFmQiiY6CGXPceC0pNFlXC3x5VIDVaktdsW3gakV0Gg2a', '087877167318', 'Central Karawaci A1/12A Jl. Raya Binong, Curug, Tangerang\r\nPerumahan Central Karawaci, Binong', 'customer', '2022-05-31'),
(11, 'Toar', 'Alexander', 'mahesaputra74@gmail.com', '$2y$10$Tgala/tzCbo8lG5vARcrlubvjil65E7lj1ZvT6rDdUoTFP5HAfWpK', '08123', 'Jakarta', 'customer', '2022-06-03');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indeks untuk tabel `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`);

--
-- Indeks untuk tabel `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profilepic`
--
ALTER TABLE `profilepic`
  ADD PRIMARY KEY (`pic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `material`
--
ALTER TABLE `material`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `order_list`
--
ALTER TABLE `order_list`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `profilepic`
--
ALTER TABLE `profilepic`
  MODIFY `pic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`material_id`) REFERENCES `material` (`id_material`);

--
-- Ketidakleluasaan untuk tabel `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `order_table`
--
ALTER TABLE `order_table`
  ADD CONSTRAINT `order_table_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
