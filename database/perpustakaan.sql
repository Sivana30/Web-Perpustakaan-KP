-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2023 pada 04.18
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` varchar(10) NOT NULL,
  `USERNAME` varchar(128) DEFAULT NULL,
  `PASSWORD` mediumtext DEFAULT NULL,
  `LAST_LOGIN` varchar(40) DEFAULT NULL,
  `ROLE` varchar(15) DEFAULT NULL,
  `FULLNAME` varchar(128) DEFAULT NULL,
  `JENKEL` char(1) DEFAULT NULL,
  `NO_TELP` varchar(20) DEFAULT NULL,
  `ALAMAT` mediumtext DEFAULT NULL,
  `PHOTO` mediumtext DEFAULT NULL,
  `DTE_CREATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`ID_ADMIN`, `USERNAME`, `PASSWORD`, `LAST_LOGIN`, `ROLE`, `FULLNAME`, `JENKEL`, `NO_TELP`, `ALAMAT`, `PHOTO`, `DTE_CREATED`) VALUES
('AD001', 'admin', '21232f297a57a5a743894a0e4a801fc3', '23-06-2023 19:30:50', 'superadmin', 'ADMINISTRATOR', 'L', '08556464667', 'SIDOARJO', 'avatar1.png', '2017-06-14'),
('AD003', 'hasim', 'd094c0a6c7ec4f01f75837ace20925fa', '16-07-2017 08:47:03', 'superadmin', 'Hasim Rochmad', 'L', '088788899', 'Jl semeru', 'Image_2d6d9b2.jpg', '2017-06-16'),
('AD004', 'tacik', '977dca586aea0eac2674a89793e252ec', '26-06-2017 18:12:38', 'admin', 'Riski Ananda W. P.', NULL, NULL, NULL, 'default.png', '2017-06-20'),
('AD005', 'ravi', '63dd3e154ca6d948fc380fa576343ba6', '24-06-2017 11:46:32', 'admin', 'Rafi Agatha', NULL, NULL, NULL, 'default.png', '2017-06-21'),
('AD006', 'rehan', '8625d1c13eaf0a75068d3cf2cdde43f6', '16-07-2017 14:46:29', 'admin', 'Rehan Arroihan', 'L', '0897789088', 'Jl Jalan id', 'stdmp.png', '2017-06-24'),
('AD007', 'rasta', '25f423bce283a8d0cbb66252da5d3cdd', '11-07-2017 07:26:51', 'superadmin', 'Rasta Hirgawana', NULL, NULL, NULL, 'default.png', '2017-07-11'),
('AD008', 'slamet', 'c5a42d9667c760e1b7c064e25536e570', '12-07-2017 03:36:15', 'admin', 'Slamet Riyadi', NULL, NULL, NULL, 'default.png', '2017-07-12'),
('AD009', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', '23-06-2023 19:31:43', 'admin', 'petugas', 'L', '085454545', 'SIDOARJO', 'admin.png', '2021-06-15'),
('AD010', 'admin2', 'c84258e9c39059a89ab77d846ddab909', '08-09-2022 12:28:33', 'superadmin', 'admin2', NULL, NULL, NULL, 'default.png', '2022-09-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `ID_ANGGOTA` varchar(10) NOT NULL,
  `ID_ADMIN` varchar(10) DEFAULT NULL,
  `ANGKATAN` int(11) NOT NULL,
  `FULL_NAME` varchar(128) DEFAULT NULL,
  `TMP_LAHIR` varchar(90) DEFAULT NULL,
  `TGL_LAHIR` varchar(20) DEFAULT NULL,
  `ALAMAT` mediumtext DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  `TELP` varchar(20) DEFAULT NULL,
  `FOTO` mediumtext DEFAULT NULL,
  `D_CREATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`ID_ANGGOTA`, `ID_ADMIN`, `ANGKATAN`, `FULL_NAME`, `TMP_LAHIR`, `TGL_LAHIR`, `ALAMAT`, `GENDER`, `TELP`, `FOTO`, `D_CREATED`) VALUES
('AGT001', 'AD001', 2020, 'Multazam Arroihan G', 'Bojonegoro', '02/20/2000', 'Jl. Danau Kerinci V G6D4, Sawojajar, Malang', 'L', '085733573529', '20__Multazam_A_3.JPG', '2017-06-16'),
('AGT002', 'AD001', 2020, 'Galbie Elinour', 'Malang', '06/16/2017', 'Jl. Kawi no. 89, Malang Kota', 'P', '0897786788954', '12__GALBIE_ELINOUR1.JPG', '2017-06-16'),
('AGT003', 'AD001', 2020, 'Alfan Cahyo Wicaksono', 'Malang', '10/13/1998', 'Jl. Silak Kesam 101', 'L', '087669887654', '2__Alfan_Cahyo_.JPG', '2017-06-16'),
('AGT004', 'AD001', 2020, 'Sasna Salsabila Hapsari', 'Madiun', '03/08/1999', 'Perum. Aspol 443, Kota Madiun', 'P', '081889754678', '30__Sasna_S_.JPG', '2017-06-16'),
('AGT005', 'AD001', 2020, 'Riski Ananda Widiya P', 'Tulungagung', '02/19/2000', 'Perum. Grand Emerald ZU3, Tulungagung', 'P', '093889765643', '31__Riski_Ananda.JPG', '2017-06-16'),
('AGT006', 'AD001', 2020, 'Anggyanisa Mutia Putri', 'Madiun', '08/18/2000', 'Gg. Pattimura 89', 'P', '085389755644', '2__Anddyanisa_M_.JPG', '2017-06-16'),
('AGT007', 'AD001', 2020, 'Prasetya Ananta W. S.', 'Malang', '06/16/1999', 'Sulfat Indah 89', 'L', '08267599432', '28__Prsetya_Ananta.JPG', '2017-06-16'),
('AGT008', 'AD001', 2020, 'Irvina Firadila', 'Lumajang', '08/12/1999', 'Ds. Sambungrejo RT. 4 RW. 7 Kec. Welasasih, Lumajang', 'P', '0876654897765', '14__Irvina_F_.JPG', '2017-06-16'),
('AGT009', 'AD001', 2020, 'Ridhwan Rofianto', 'Surabaya', '04/01/2001', 'Mburine cito', 'L', '089776598334', '29__RIDHWAN_ROFIANTO.JPG', '2017-06-16'),
('AGT010', 'AD001', 2020, 'Muhamad Iqbal Samudra', 'Banyuwangi', '04/05/2000', 'Ds. Sumoharjo, RT. 5 RW. 9', 'L', '08677564987', '18__Muh__Iqbal.JPG', '2017-06-16'),
('AGT011', 'AD001', 2020, 'Nabila Hanggana Raras', 'Sidoarjo', '03/08/2000', 'Perum. Sugih Asri F32, Candi, Sidoarjo', 'P', '084876835267', '28__Nabila_Hanggana_Raras.JPG', '2017-06-16'),
('AGT012', 'AD001', 2020, 'Erika Prafitasari Rotinsulu', 'Sidoarjo', '08/04/2000', 'Perum. Bumi Citra Fajar A76, Sekardangan, Sidoarjo', 'P', '08567498256', '9__Erika_P_.JPG', '2017-06-16'),
('AGT013', 'AD001', 2020, 'Nico Ardian Nugroho', 'Malang', '04/02/2000', 'Jl. Sironggo Ajoh Kav. 4, Malang', 'L', '089765689645', '24__Nico_Ardian.JPG', '2017-06-16'),
('AGT014', 'AD001', 2020, 'Ad Reana Vidya', 'Malang', '06/29/2000', 'Perum. Siswa Taman AG65, Kepanjen', 'P', '087995764839', '2__Ad_Reana.JPG', '2017-06-29'),
('AGT015', 'AD001', 2020, 'Vejryn Shaviero', 'Jember', '06/10/2000', 'Jl. Utama Kota gg. 6, Jember', 'L', '088786368495', '34__VEJRYN_SHAVIERO.JPG', '2017-06-29'),
('AGT016', 'AD001', 2020, 'Ridjal Fathoni Rosyidi', 'Tuban', '07/09/1998', 'Jl. Alun alun kota', 'L', '08766754345', '19__Muh__Ridjal.JPG', '2017-07-09'),
('AGT017', 'AD001', 2020, 'anggota', 'Bandung', '06/15/2021', 'Bandung', 'L', '4444', 'Arnold-Schwarzenegger-PNG-Image.png', '2021-06-15'),
('AGT018', 'AD001', 2020, 'GIO', 'JEMBER', '09/08/2000', 'JEMBER', 'L', '089566', 'admin.png', '2022-09-08'),
('AGT019', 'AD001', 2020, 'amelia', 'Surabaya', '06/23/2002', 'Pacar keling 1', 'P', '089612815851', 'Capture.PNG', '2023-06-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `ID_BUKU` varchar(10) NOT NULL,
  `ID_ADMIN` varchar(10) DEFAULT NULL,
  `TITLE` varchar(150) DEFAULT NULL,
  `AUTHOR` varchar(128) DEFAULT NULL,
  `PUBLISHER` varchar(128) DEFAULT NULL,
  `ISBN` text NOT NULL,
  `YEAR` char(4) DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `KELUAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`ID_BUKU`, `ID_ADMIN`, `TITLE`, `AUTHOR`, `PUBLISHER`, `ISBN`, `YEAR`, `QTY`, `KELUAR`) VALUES
('BKO004', 'AD003', 'Mikrotik Kung Fu : Kitab 1', 'Rendra Towidjojo', 'Jasakom', 'Tidak tercantum', '2016', 3, 1),
('BKO005', 'AD001', 'Windows 10 : Panduan Lengkap', 'Indra Susanto', 'Jasakom', 'Tidak tercantum', '2013', 3, 2),
('BKO006', 'AD001', 'Bisnis Online Revolution', 'Iwan Kenrianto', 'Gramedia', 'Tidak tercantum', '2015', 2, 1),
('BKO007', 'AD001', '3 Tools Facebook Graph Gratisan', 'Suryadin Laoddang', 'Dosen Jualan', 'Tidak tercantum', '2015', 1, 2),
('BKO008', 'AD001', 'Mengolah Database Excel', 'Sumonggo Surya', 'Andi Publisher', 'Tidak tercantum', '2001', 1, 1),
('BKO009', 'AD001', 'Mahir Corel Draw Dalam 4 Hari', 'Yuli Kristanto S', 'Izuka Komp', 'Tidak tercantum', '2008', 0, 3),
('BKO010', 'AD001', 'The Magic of Photoshop', 'Hendri Hendratama', 'Informatika', 'Tidak tercantum', '2013', 3, 3),
('BKO011', 'AD001', 'Teknik Profesional Photoshop CS3', 'Rahmat Widiyanto', 'Elex Media Computindo', 'Tidak tercantum', '2009', 3, 3),
('BKO012', 'AD001', 'Jago SEO', 'Hidayat Rahmad', 'Elex Media Computindo', 'Tidak tercantum', '2011', 1, 2),
('BKO013', 'AD001', 'Hacking Wireless Network', 'Suryatama Udin', 'Jasakom', 'Tidak tercantum', '2014', 7, 2),
('BKO014', 'AD001', 'Blender 3D Modelling', 'Hendri Hendratama', 'Informatika', 'Tidak tercantum', '2015', 0, 2),
('BKO015', 'AD001', 'Aplikasi Berbasis Android', 'Hyua Hendra La', 'Moklet Publisher', 'Tidak tercantum', '2019', 3, 1),
('BKO016', 'AD001', 'Membangun Aplikasi ASP', 'Hendro SPd', 'Moklet Publisher', 'Tidak tercantum', '2020', 2, 2),
('BKO017', 'AD001', 'Basis Data Kebun Binatang', 'Ifa Khoirunnisa', 'Moklet Publisher', 'Tidak tercantum', '2018', 3, 0),
('BKO018', 'AD001', 'Buku Panduan ASUS', 'Herman Dzumavo', 'Samsara', 'Tidak tercantum', '2008', 3, 0),
('BKO019', 'AD001', 'The Power of Microsoft Edge', 'Steven Reward', 'Duston Magz', 'Tidak tercantum', '2017', 5, 1),
('BKO020', 'AD001', 'MySQL Dasar dan Implementasi', 'Supratman Efendi', 'Ilmukom', 'Tidak tercantum', '2014', 3, 2),
('BKO021', 'AD001', 'Nippon Against World', 'Hasirama Tadashi', 'Sung Yang', 'Tidak tercantum', '2009', 1, 1),
('BKO022', 'AD001', 'Konfigursi Router Cisco', 'Solikin', 'Safari pub', 'Tidak tercantum', '2019', 3, 0),
('BKO023', 'AD001', 'Fashion Paris', 'Amire Melaine', 'FranceTime', 'Tidak tercantum', '2018', 1, 1),
('BKO024', 'AD001', 'Unreleashed Journal', 'Timothy Law', 'Askars', 'Tidak tercantum', '2017', 4, 0),
('BKO025', 'AD001', 'KEMERDEKAAN REPUBLIK INDONESIA', 'MR.XXXX', 'ERLANGGA', 'Tidak tercantum', '1994', 1, 1),
('BKO026', 'AD001', '1', '1', '1', 'Tidak tercantum', '1', 1, 0),
('BKO027', 'AD001', '2', '2', '2', 'Tidak tercantum', '2', 2, 0),
('BKO028', 'AD001', '3', '3', '3', 'Tidak tercantum', '3', 3, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `denda`
--

CREATE TABLE `denda` (
  `ID_DENDA` varchar(30) NOT NULL,
  `ID_ADMIN` varchar(30) NOT NULL,
  `JENIS` varchar(50) NOT NULL,
  `KETERANGAN` text NOT NULL,
  `BIAYA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `denda`
--

INSERT INTO `denda` (`ID_DENDA`, `ID_ADMIN`, `JENIS`, `KETERANGAN`, `BIAYA`) VALUES
('DND001', 'AD001', 'keterlambatan', 'keterlambatan', 2000),
('DND002', 'AD001', 'kerusakan', 'kerusakan', 3000),
('DND003', 'AD001', 'kehilangan', 'kehilangan', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `ID_DIPINJAM` int(11) NOT NULL,
  `ID_PINJAM` varchar(10) DEFAULT NULL,
  `ID_BUKU` varchar(10) DEFAULT NULL,
  `TGL_KEMBALI` date DEFAULT NULL,
  `DENDA` int(11) DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`ID_DIPINJAM`, `ID_PINJAM`, `ID_BUKU`, `TGL_KEMBALI`, `DENDA`, `STATUS`) VALUES
(13, 'P170623001', 'BKO005', '2017-06-25', 0, 'Sudah Kembali'),
(14, 'P170623001', 'BKO008', '2021-06-15', 723000, 'Sudah Kembali'),
(15, 'P170623001', 'BKO013', '2021-06-15', 723000, 'Sudah Kembali'),
(16, 'P170623002', 'BKO008', '2021-06-15', 723000, 'Sudah Kembali'),
(17, 'P170624001', 'BKO013', '2017-07-09', 4000, 'Sudah Kembali'),
(18, 'P170624001', 'BKO007', '2023-06-23', 1091500, 'Sudah Kembali'),
(19, 'P170624001', 'BKO011', '2023-06-23', 1091500, 'Sudah Kembali'),
(20, 'P170624002', 'BKO004', '2023-06-23', 1091500, 'Sudah Kembali'),
(21, 'P170624002', 'BKO005', NULL, 0, 'Belum Kembali'),
(22, 'P170624002', 'BKO007', NULL, 0, 'Belum Kembali'),
(23, 'P170624003', 'BKO011', NULL, 0, 'Belum Kembali'),
(24, 'P170624003', 'BKO004', NULL, 0, 'Belum Kembali'),
(25, 'P170624003', 'BKO015', NULL, 0, 'Belum Kembali'),
(26, 'P170624004', 'BKO017', '2017-06-25', 0, 'Sudah Kembali'),
(27, 'P170624005', 'BKO013', NULL, 0, 'Belum Kembali'),
(28, 'P170624005', 'BKO006', NULL, 0, 'Belum Kembali'),
(29, 'P170624006', 'BKO011', '2017-06-25', 0, 'Sudah Kembali'),
(30, 'P170624006', 'BKO018', '2017-07-10', 4500, 'Sudah Kembali'),
(31, 'P170625001', 'BKO019', NULL, 0, 'Belum Kembali'),
(32, 'P170625001', 'BKO020', NULL, 0, 'Belum Kembali'),
(33, 'P170625001', 'BKO021', NULL, 0, 'Belum Kembali'),
(34, 'P170625002', 'BKO010', '2017-07-09', 3500, 'Sudah Kembali'),
(35, 'P170625002', 'BKO016', NULL, 0, 'Belum Kembali'),
(36, 'P170626001', 'BKO012', NULL, 0, 'Belum Kembali'),
(37, 'P170626001', 'BKO009', NULL, 0, 'Belum Kembali'),
(38, 'P170626001', 'BKO014', NULL, 0, 'Belum Kembali'),
(39, 'P170626002', 'BKO014', NULL, 0, 'Belum Kembali'),
(40, 'P170626002', 'BKO010', NULL, 0, 'Belum Kembali'),
(41, 'P170629001', 'BKO013', NULL, 0, 'Belum Kembali'),
(42, 'P170629001', 'BKO009', NULL, 0, 'Belum Kembali'),
(43, 'P170629002', 'BKO010', NULL, 0, 'Belum Kembali'),
(44, 'P170629002', 'BKO016', NULL, 0, 'Belum Kembali'),
(45, 'P170629002', 'BKO012', NULL, 0, 'Belum Kembali'),
(46, 'P170709001', 'BKO020', NULL, 0, 'Belum Kembali'),
(47, 'P170709001', 'BKO011', NULL, 0, 'Belum Kembali'),
(48, 'P170709002', 'BKO022', '2021-06-15', 715000, 'Sudah Kembali'),
(49, 'P170709002', 'BKO021', '2021-06-15', 715000, 'Sudah Kembali'),
(50, 'P210615001', 'BKO010', NULL, 0, 'Belum Kembali'),
(51, 'P220908001', 'BKO025', NULL, 0, 'Belum Kembali'),
(52, 'P220908001', 'BKO023', NULL, 0, 'Belum Kembali'),
(53, 'P230623001', 'BKO004', '2023-06-23', 0, 'Sudah Kembali'),
(54, 'P230623001', 'BKO005', '2023-06-23', 10000, 'Sudah Kembali'),
(55, 'P230623001', 'BKO007', NULL, 0, 'Belum Kembali'),
(56, 'P230623002', 'BKO009', NULL, 0, 'Belum Kembali'),
(57, 'P230623003', 'BKO005', NULL, 0, 'Belum Kembali'),
(58, 'P230623003', 'BKO008', NULL, 0, 'Belum Kembali'),
(59, 'P230623003', 'BKO011', NULL, 0, 'Belum Kembali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notif`
--

CREATE TABLE `notif` (
  `ID_NOTIF` int(11) NOT NULL,
  `ID_ADMIN` varchar(128) NOT NULL,
  `JUDUL` varchar(128) NOT NULL,
  `ISI` varchar(128) NOT NULL,
  `DT` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `notif`
--

INSERT INTO `notif` (`ID_NOTIF`, `ID_ADMIN`, `JUDUL`, `ISI`, `DT`) VALUES
(2, 'AD003', 'Fokus target', 'Kejar sesuai kemampuan, open book', '2017-07-03'),
(5, 'AD003', 'Hahha', 'hehee', '2017-07-03'),
(6, 'AD003', 'THR Turun', 'silahkan antri di ruang bendahara jam 12.00', '2017-07-09'),
(7, 'AD007', 'Selamat siang', 'jangan lupa sholat dhuhr, cekno tenang atine', '2017-07-11'),
(8, 'AD008', 'Attitude is everything', 'semangat pagii, pagi pagi pagi', '2017-07-12'),
(11, 'AD001', 'Info', 'Masa pengembalian buku 7 Hari', '2022-09-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_PINJAM` varchar(10) NOT NULL,
  `ID_ANGGOTA` varchar(10) DEFAULT NULL,
  `ID_ADMIN` varchar(10) DEFAULT NULL,
  `TGL_PINJAM` date DEFAULT NULL,
  `JML_BUKU` int(11) NOT NULL,
  `DEADLINE` date NOT NULL,
  `STATS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`ID_PINJAM`, `ID_ANGGOTA`, `ID_ADMIN`, `TGL_PINJAM`, `JML_BUKU`, `DEADLINE`, `STATS`) VALUES
('P170623001', 'AGT002', 'AD004', '2017-06-23', 3, '0000-00-00', 'Sudah Kembali'),
('P170623002', 'AGT003', 'AD005', '2017-06-23', 1, '0000-00-00', 'Sudah Kembali'),
('P170624001', 'AGT007', 'AD005', '2017-06-24', 3, '0000-00-00', 'Sudah Kembali'),
('P170624002', 'AGT008', 'AD005', '2017-06-24', 3, '0000-00-00', 'Belum Kembali'),
('P170624003', 'AGT004', 'AD005', '2017-06-24', 3, '0000-00-00', 'Belum Kembali'),
('P170624004', 'AGT001', 'AD004', '2017-06-24', 1, '0000-00-00', 'Sudah Kembali'),
('P170624005', 'AGT007', 'AD004', '2017-06-24', 2, '0000-00-00', 'Belum Kembali'),
('P170624006', 'AGT003', 'AD006', '2017-06-24', 2, '0000-00-00', 'Sudah Kembali'),
('P170625001', 'AGT013', 'AD006', '2017-06-25', 3, '0000-00-00', 'Belum Kembali'),
('P170625002', 'AGT010', 'AD006', '2017-06-25', 2, '0000-00-00', 'Belum Kembali'),
('P170626001', 'AGT006', 'AD004', '2017-06-26', 3, '0000-00-00', 'Belum Kembali'),
('P170626002', 'AGT012', 'AD004', '2017-06-26', 2, '0000-00-00', 'Belum Kembali'),
('P170629001', 'AGT014', 'AD006', '2017-06-29', 2, '0000-00-00', 'Belum Kembali'),
('P170629002', 'AGT015', 'AD006', '2017-06-29', 3, '0000-00-00', 'Belum Kembali'),
('P170709001', 'AGT011', 'AD006', '2017-07-09', 2, '0000-00-00', 'Belum Kembali'),
('P170709002', 'AGT016', 'AD006', '2017-07-09', 2, '0000-00-00', 'Sudah Kembali'),
('P210615001', 'AGT001', 'AD009', '2021-06-15', 1, '0000-00-00', 'Belum Kembali'),
('P220908001', 'AGT018', 'AD009', '2022-09-08', 2, '0000-00-00', 'Belum Kembali'),
('P230623001', 'AGT001', 'AD009', '2023-06-22', 3, '2023-06-22', 'Belum Kembali'),
('P230623002', 'AGT002', 'AD009', '2023-06-23', 1, '2023-06-26', 'Belum Kembali'),
('P230623003', 'AGT003', 'AD009', '2023-06-23', 3, '2023-07-07', 'Belum Kembali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perpus`
--

CREATE TABLE `perpus` (
  `ID_PERPUS` int(11) NOT NULL,
  `NAMA_P` varchar(128) DEFAULT NULL,
  `ALAMAT_P` mediumtext DEFAULT NULL,
  `ABOUT` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `perpus`
--

INSERT INTO `perpus` (`ID_PERPUS`, `NAMA_P`, `ALAMAT_P`, `ABOUT`) VALUES
(1, 'SD ISLAM AL-FURQON', 'SURABAYA', 'Perpustakaan Nasional Arsip Buku');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD UNIQUE KEY `ADMIN_PK` (`ID_ADMIN`);

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_ANGGOTA`),
  ADD UNIQUE KEY `ANGGOTA_PK` (`ID_ANGGOTA`),
  ADD KEY `MAKE_FK` (`ID_ADMIN`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_BUKU`),
  ADD UNIQUE KEY `BUKU_PK` (`ID_BUKU`),
  ADD KEY `CREATE_FK` (`ID_ADMIN`);

--
-- Indeks untuk tabel `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`ID_DENDA`);

--
-- Indeks untuk tabel `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD PRIMARY KEY (`ID_DIPINJAM`),
  ADD UNIQUE KEY `DETAIL_PINJAM_PK` (`ID_DIPINJAM`),
  ADD KEY `MEMILIKI_FK` (`ID_PINJAM`),
  ADD KEY `MENGAMBIL_FK` (`ID_BUKU`);

--
-- Indeks untuk tabel `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`ID_NOTIF`),
  ADD KEY `FK_NOTIF_MEMBUAT_ADMIN` (`ID_ADMIN`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_PINJAM`),
  ADD UNIQUE KEY `PEMINJAMAN_PK` (`ID_PINJAM`),
  ADD KEY `MELAKUKAN_FK` (`ID_ANGGOTA`),
  ADD KEY `MELAYANI_FK` (`ID_ADMIN`);

--
-- Indeks untuk tabel `perpus`
--
ALTER TABLE `perpus`
  ADD PRIMARY KEY (`ID_PERPUS`),
  ADD UNIQUE KEY `PERPUS_PK` (`ID_PERPUS`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  MODIFY `ID_DIPINJAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `notif`
--
ALTER TABLE `notif`
  MODIFY `ID_NOTIF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `perpus`
--
ALTER TABLE `perpus`
  MODIFY `ID_PERPUS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `FK_ANGGOTA_MAKE_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `FK_BUKU_CREATE_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Ketidakleluasaan untuk tabel `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD CONSTRAINT `FK_DETAIL_P_MEMILIKI_PEMINJAM` FOREIGN KEY (`ID_PINJAM`) REFERENCES `peminjaman` (`ID_PINJAM`),
  ADD CONSTRAINT `FK_DETAIL_P_MENGAMBIL_BUKU` FOREIGN KEY (`ID_BUKU`) REFERENCES `buku` (`ID_BUKU`);

--
-- Ketidakleluasaan untuk tabel `notif`
--
ALTER TABLE `notif`
  ADD CONSTRAINT `FK_NOTIF_MEMBUAT_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `FK_PEMINJAM_MELAKUKAN_ANGGOTA` FOREIGN KEY (`ID_ANGGOTA`) REFERENCES `anggota` (`ID_ANGGOTA`),
  ADD CONSTRAINT `FK_PEMINJAM_MELAYANI_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
