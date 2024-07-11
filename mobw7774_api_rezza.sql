-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 12 Jul 2024 pada 00.49
-- Versi server: 10.3.39-MariaDB-cll-lve
-- Versi PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobw7774_api_rezza`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `name`, `description`, `price`, `image_url`) VALUES
(1, 'Ramen', 'Sup mie Jepang dengan kaldu yang kaya rasa dan berbagai topping seperti chashu (daging babi panggang), telur rebus, dan sayuran.', 10.00, 'https://tse2.mm.bing.net/th?id=OIP._eZXB3j8dflu6EbCV7QdEwHaFj&pid=Api&P=0&h=180'),
(2, 'Sushi', 'Makanan Jepang yang terdiri dari nasi cuka dengan berbagai topping seperti ikan segar, sayuran, dan telur.', 12.00, ''),
(3, 'Tempura', 'Makanan Jepang berupa bahan makanan (seperti udang, ikan, dan sayuran) yang dibalut adonan tepung dan digoreng hingga crispy.', 8.00, ''),
(4, 'Udon', 'Mie Jepang yang tebal dan kenyal disajikan dalam kaldu yang gurih dengan berbagai topping seperti daging, sayuran, dan tempura.', 9.00, ''),
(5, 'Takoyaki', 'Bola-bola tepung yang diisi potongan gurita, disajikan dengan saus takoyaki, bonito flakes, dan nori.', 7.00, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_testimoni`
--

CREATE TABLE `tbl_testimoni` (
  `id` int(11) NOT NULL,
  `testimonial` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_testimoni`
--

INSERT INTO `tbl_testimoni` (`id`, `testimonial`, `created_at`) VALUES
(1, 'Great service!', '2024-07-08 09:40:19'),
(2, 'Excellent food!', '2024-07-08 09:40:19'),
(3, 'Loved the ambiance!', '2024-07-08 09:40:19'),
(4, 'hifdi sangat enak', '2024-07-08 09:42:14'),
(5, 'eca : ramen sangat enak', '2024-07-09 05:07:21'),
(6, 'enak ramenya', '2024-07-10 06:27:55'),
(7, 'sushi enak bangett', '2024-07-11 14:39:30'),
(8, 'ramen nya sangat enak dan lezat', '2024-07-11 15:04:46'),
(9, 'udon nya sangat enak', '2024-07-11 15:21:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'eca', '$2y$10$MkzjV7xtl9l/fLz.BoArYuo0Iv0.CQuv5LahxAl6sf29QpL1uN9U6'),
(3, 'ule', '$2y$10$WBkHrPgq4Sh/65z8cP1VGOrVMCBVJPd9mtj.9XhhFKSEExPOpJbW6'),
(4, 'rezza', '$2y$10$0uDqANUES4x5lp8BCSIyKOtCo3N3oV7a5H1ESQUCHUrrU1tqwYOn.'),
(5, 'maulana', '$2y$10$uU7NYY1tNowyb5FB4ZZ2luReZw8s4jB33cauhcA8y/9Z5r1/54KIK'),
(6, 'banu', '$2y$10$5U0fh4sc6FwMLBLtlpJFUev7LzXozrqJLXw02mF2wSkJnlMzatSaK');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_testimoni`
--
ALTER TABLE `tbl_testimoni`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_testimoni`
--
ALTER TABLE `tbl_testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
