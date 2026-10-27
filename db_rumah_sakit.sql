-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 27, 2026 at 03:24 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `id_poli` int NOT NULL,
  `spesialisasi` varchar(100) NOT NULL,
  `tarif_konsultasi` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status_dokter` varchar(20) NOT NULL DEFAULT 'Aktif'
) ;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_poli`, `spesialisasi`, `tarif_konsultasi`, `status_dokter`) VALUES
(1, 'dr. Andi Wijaya', 2, 'Spesialis Penyakit Dalam', '150000.00', 'Aktif'),
(2, 'dr. Bintang Pratama', 3, 'Spesialis Anak', '120000.00', 'Aktif'),
(3, 'dr. Citra Dewi', 4, 'Spesialis Konservasi Gigi', '100000.00', 'Aktif'),
(4, 'dr. Dian Sastro', 5, 'Spesialis THT-KL', '110000.00', 'Aktif'),
(5, 'dr. Eka Putra', 6, 'Spesialis Mata', '130000.00', 'Aktif'),
(6, 'dr. Farhan Ali', 7, 'Spesialis Saraf', '200000.00', 'Aktif'),
(7, 'dr. Grace Natalie', 8, 'Spesialis Jantung', '250000.00', 'Aktif'),
(8, 'dr. Hendra Setiawan', 1, 'Dokter Umum', '75000.00', 'Aktif'),
(9, 'dr. Irfan Bachdim', 9, 'Spesialis Kulit', '140000.00', 'Cuti'),
(10, 'dr. Joko Widodo', 10, 'Spesialis Jiwa', '180000.00', 'Nonaktif');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int NOT NULL,
  `id_pasien` int NOT NULL,
  `id_dokter` int NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `jenis_kunjungan` varchar(30) NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `status_kunjungan` varchar(30) NOT NULL
) ;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `jenis_kunjungan`, `diagnosis`, `status_kunjungan`) VALUES
(1, 1, 1, '2026-10-01', 'Umum', 'Hipertensi Ringan', 'Selesai'),
(2, 2, 2, '2026-10-02', 'Kontrol', 'Demam Dengue', 'Selesai'),
(3, 3, 3, '2026-10-03', 'Umum', 'Karies Gigi', 'Selesai'),
(4, 4, 4, '2026-10-04', 'Darurat', 'Otitis Media Akut', 'Selesai'),
(5, 5, 5, '2026-10-05', 'Kontrol', 'Katarak Senilis', 'Selesai'),
(6, 6, 6, '2026-10-06', 'Darurat', 'Vertigo Posisi Paroksismal', 'Selesai'),
(7, 7, 7, '2026-10-07', 'Darurat', 'Aritmia Jantung', 'Selesai'),
(8, 8, 8, '2026-10-08', 'Kontrol', 'Influenza Ringan', 'Selesai'),
(9, 1, 1, '2026-10-09', 'Kontrol', 'Evaluasi Tekanan Darah', 'Selesai'),
(10, 2, 2, '2026-10-10', 'Darurat', 'Kejang Demam Kompleks', 'Selesai'),
(11, 3, 8, '2026-10-11', 'Umum', 'Batuk Pilek', 'Menunggu'),
(12, 4, 4, '2026-10-12', 'Darurat', 'Nyeri Telinga Akut', 'Batal');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_hp`) VALUES
(1, 'Budi Santoso', 'L', '1990-05-15', 'Jl. Mawar No. 12 Jakarta', '081234567890'),
(2, 'Siti Aminah', 'P', '1995-08-20', 'Jl. Melati No. 5 Bandung', '081298765432'),
(3, 'Ahmad Dahlan', 'L', '1985-03-10', 'Jl. Anggrek No. 8 Surabaya', '081311223344'),
(4, 'Dewi Lestari', 'P', '1992-11-25', 'Jl. Kenanga No. 15 Semarang', '081355667788'),
(5, 'Eko Prasetyo', 'L', '1988-07-04', 'Jl. Dahlia No. 3 Yogyakarta', '081244332211'),
(6, 'Fitri Handayani', 'P', '1998-01-30', 'Jl. Flamboyan No. 20 Medan', '081399887766'),
(7, 'Gading Marten', 'L', '1982-12-12', 'Jl. Kamboja No. 7 Malang', '081277665544'),
(8, 'Hany Sugianto', 'P', '2001-04-18', 'Jl. Seroja No. 9 Surakarta', '081333445566'),
(9, 'Indra Wijaya', 'L', '1993-09-09', 'Jl. Teratai No. 11 Palembang', '081211223344'),
(10, 'Julia Perez', 'P', '1997-06-14', 'Jl. Bougainville No. 4 Makassar', '081388776655');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_kunjungan` int NOT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `biaya_konsultasi` decimal(12,2) DEFAULT '0.00',
  `biaya_obat` decimal(12,2) DEFAULT '0.00',
  `biaya_laboratorium` decimal(12,2) DEFAULT '0.00',
  `diskon` decimal(12,2) DEFAULT '0.00',
  `metode_bayar` varchar(30) DEFAULT NULL,
  `status_bayar` varchar(20) NOT NULL DEFAULT 'Belum Lunas'
) ;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `tanggal_bayar`, `biaya_konsultasi`, `biaya_obat`, `biaya_laboratorium`, `diskon`, `metode_bayar`, `status_bayar`) VALUES
(1, 1, '2026-10-01', '150000.00', '100000.00', '50000.00', '20000.00', 'Tunai', 'Lunas'),
(2, 2, '2026-10-02', '120000.00', '180000.00', '150000.00', '50000.00', 'Transfer', 'Lunas'),
(3, 3, '2026-10-03', '100000.00', '30000.00', '0.00', '0.00', 'Tunai', 'Lunas'),
(4, 4, '2026-10-04', '110000.00', '40000.00', '0.00', '60000.00', 'Asuransi', 'Lunas'),
(5, 5, '2026-10-05', '130000.00', '120000.00', '100000.00', '0.00', 'Transfer', 'Lunas'),
(6, 6, '2026-10-06', '200000.00', '150000.00', '200000.00', '50000.00', 'Asuransi', 'Lunas'),
(7, 7, '2026-10-07', '250000.00', '200000.00', '300000.00', '100000.00', 'Asuransi', 'Belum Lunas'),
(8, 8, '2026-10-08', '75000.00', '20000.00', '0.00', '0.00', 'Tunai', 'Belum Lunas'),
(9, 9, '2026-10-09', '150000.00', '50000.00', '0.00', '10000.00', 'Transfer', 'Lunas'),
(10, 10, '2026-10-10', '120000.00', '80000.00', '50000.00', '0.00', 'Tunai', 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` int NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lantai` int NOT NULL,
  `status_poli` varchar(20) NOT NULL DEFAULT 'Aktif'
) ;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `lantai`, `status_poli`) VALUES
(1, 'Poli Umum', 1, 'Aktif'),
(2, 'Poli Penyakit Dalam', 2, 'Aktif'),
(3, 'Poli Anak', 2, 'Aktif'),
(4, 'Poli Gigi', 1, 'Aktif'),
(5, 'Poli THT', 3, 'Aktif'),
(6, 'Poli Mata', 3, 'Aktif'),
(7, 'Poli Saraf', 4, 'Aktif'),
(8, 'Poli Jantung', 4, 'Aktif'),
(9, 'Poli Kulit & Kelamin', 2, 'Aktif'),
(10, 'Poli Jiwa', 5, 'Nonaktif');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_klasifikasi_biaya`
-- (See below for the actual view)
--
CREATE TABLE `view_klasifikasi_biaya` (
`id_kunjungan` int
,`id_pembayaran` int
,`klasifikasi_biaya` varchar(8)
,`total_biaya` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_kunjungan_lengkap`
-- (See below for the actual view)
--
CREATE TABLE `view_kunjungan_lengkap` (
`diagnosis` varchar(200)
,`id_dokter` int
,`id_pasien` int
,`nama_dokter` varchar(100)
,`nama_pasien` varchar(100)
,`nama_poli` varchar(100)
,`spesialisasi` varchar(100)
,`status_kunjungan` varchar(30)
,`tanggal_kunjungan` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_pemeriksaan_pembayaran`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan_pemeriksaan_pembayaran` (
`diagnosis` varchar(200)
,`diskon` decimal(12,2)
,`id_kunjungan` int
,`metode_pembayaran` varchar(30)
,`nama_dokter` varchar(100)
,`nama_pasien` varchar(100)
,`nama_poli` varchar(100)
,`status_pembayaran` varchar(20)
,`tanggal_kunjungan` date
,`total_sebelum_diskon` decimal(14,2)
,`total_setelah_diskon` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_pembayaran_diskon`
-- (See below for the actual view)
--
CREATE TABLE `view_pembayaran_diskon` (
`biaya_konsultasi` decimal(12,2)
,`biaya_laboratorium` decimal(12,2)
,`biaya_obat` decimal(12,2)
,`diskon` decimal(12,2)
,`id_kunjungan` int
,`id_pembayaran` int
,`keterangan_diskon` varchar(21)
,`metode_bayar` varchar(30)
,`status_bayar` varchar(20)
,`tanggal_bayar` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_prioritas_pelayanan`
-- (See below for the actual view)
--
CREATE TABLE `view_prioritas_pelayanan` (
`id_dokter` int
,`id_kunjungan` int
,`id_pasien` int
,`jenis_kunjungan` varchar(30)
,`status_kunjungan` varchar(30)
,`status_prioritas` varchar(17)
,`tanggal_kunjungan` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_rekap_dokter_kunjungan`
-- (See below for the actual view)
--
CREATE TABLE `view_rekap_dokter_kunjungan` (
`id_dokter` int
,`id_kunjungan` int
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`spesialisasi` varchar(100)
,`status_kunjungan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_rekap_pasien_kunjungan`
-- (See below for the actual view)
--
CREATE TABLE `view_rekap_pasien_kunjungan` (
`id_pasien` int
,`jumlah_kunjungan` bigint
,`nama_pasien` varchar(100)
,`no_hp` varchar(15)
,`tanggal_kunjungan_terakhir` date
);

-- --------------------------------------------------------

--
-- Structure for view `view_klasifikasi_biaya`
--
DROP TABLE IF EXISTS `view_klasifikasi_biaya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_klasifikasi_biaya`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, (((`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat`) + `pembayaran`.`biaya_laboratorium`) - `pembayaran`.`diskon`) AS `total_biaya`, if(((((`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat`) + `pembayaran`.`biaya_laboratorium`) - `pembayaran`.`diskon`) < 100000),'Ekonomis',if(((((`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat`) + `pembayaran`.`biaya_laboratorium`) - `pembayaran`.`diskon`) < 300000),'Menengah','Premium')) AS `klasifikasi_biaya` FROM `pembayaran``pembayaran`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_kunjungan_lengkap`
--
DROP TABLE IF EXISTS `view_kunjungan_lengkap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kunjungan_lengkap`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `d`.`id_dokter` AS `id_dokter`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `d`.`spesialisasi` AS `spesialisasi`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan`, `k`.`diagnosis` AS `diagnosis` FROM (((`kunjungan` `k` join `pasien` `p` on((`k`.`id_pasien` = `p`.`id_pasien`))) join `dokter` `d` on((`k`.`id_dokter` = `d`.`id_dokter`))) join `poli` `po` on((`d`.`id_poli` = `po`.`id_poli`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_pemeriksaan_pembayaran`
--
DROP TABLE IF EXISTS `view_laporan_pemeriksaan_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_pemeriksaan_pembayaran`  AS SELECT `k`.`id_kunjungan` AS `id_kunjungan`, `p`.`nama_pasien` AS `nama_pasien`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`diagnosis` AS `diagnosis`, ((`pm`.`biaya_konsultasi` + `pm`.`biaya_obat`) + `pm`.`biaya_laboratorium`) AS `total_sebelum_diskon`, `pm`.`diskon` AS `diskon`, (((`pm`.`biaya_konsultasi` + `pm`.`biaya_obat`) + `pm`.`biaya_laboratorium`) - `pm`.`diskon`) AS `total_setelah_diskon`, ifnull(`pm`.`metode_bayar`,'Belum Ada Pembayaran') AS `metode_pembayaran`, ifnull(`pm`.`status_bayar`,'Belum Dibayar') AS `status_pembayaran` FROM ((((`kunjungan` `k` join `pasien` `p` on((`k`.`id_pasien` = `p`.`id_pasien`))) join `dokter` `d` on((`k`.`id_dokter` = `d`.`id_dokter`))) join `poli` `po` on((`d`.`id_poli` = `po`.`id_poli`))) left join `pembayaran` `pm` on((`k`.`id_kunjungan` = `pm`.`id_kunjungan`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_pembayaran_diskon`
--
DROP TABLE IF EXISTS `view_pembayaran_diskon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pembayaran_diskon`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`tanggal_bayar` AS `tanggal_bayar`, `pembayaran`.`biaya_konsultasi` AS `biaya_konsultasi`, `pembayaran`.`biaya_obat` AS `biaya_obat`, `pembayaran`.`biaya_laboratorium` AS `biaya_laboratorium`, `pembayaran`.`diskon` AS `diskon`, if((`pembayaran`.`diskon` > 0),'Mendapat Diskon','Tidak Mendapat Diskon') AS `keterangan_diskon`, `pembayaran`.`metode_bayar` AS `metode_bayar`, `pembayaran`.`status_bayar` AS `status_bayar` FROM `pembayaran``pembayaran`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_prioritas_pelayanan`
--
DROP TABLE IF EXISTS `view_prioritas_pelayanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_prioritas_pelayanan`  AS SELECT `kunjungan`.`id_kunjungan` AS `id_kunjungan`, `kunjungan`.`id_pasien` AS `id_pasien`, `kunjungan`.`id_dokter` AS `id_dokter`, `kunjungan`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `kunjungan`.`jenis_kunjungan` AS `jenis_kunjungan`, `kunjungan`.`status_kunjungan` AS `status_kunjungan`, if(((`kunjungan`.`jenis_kunjungan` = 'Darurat') and (`kunjungan`.`status_kunjungan` <> 'Batal')),'Prioritas Tinggi',if(((`kunjungan`.`jenis_kunjungan` = 'Kontrol') and (`kunjungan`.`status_kunjungan` = 'Selesai')),'Kontrol Selesai',if((`kunjungan`.`status_kunjungan` = 'Batal'),'Tidak Dilayani','Pelayanan Reguler'))) AS `status_prioritas` FROM `kunjungan``kunjungan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_rekap_dokter_kunjungan`
--
DROP TABLE IF EXISTS `view_rekap_dokter_kunjungan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rekap_dokter_kunjungan`  AS SELECT `d`.`id_dokter` AS `id_dokter`, `d`.`nama_dokter` AS `nama_dokter`, `d`.`spesialisasi` AS `spesialisasi`, `po`.`nama_poli` AS `nama_poli`, `k`.`id_kunjungan` AS `id_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan` FROM ((`dokter` `d` left join `kunjungan` `k` on((`k`.`id_dokter` = `d`.`id_dokter`))) join `poli` `po` on((`d`.`id_poli` = `po`.`id_poli`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_rekap_pasien_kunjungan`
--
DROP TABLE IF EXISTS `view_rekap_pasien_kunjungan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rekap_pasien_kunjungan`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `p`.`no_hp` AS `no_hp`, count(`k`.`id_kunjungan`) AS `jumlah_kunjungan`, max(`k`.`tanggal_kunjungan`) AS `tanggal_kunjungan_terakhir` FROM (`pasien` `p` left join `kunjungan` `k` on((`p`.`id_pasien` = `k`.`id_pasien`))) GROUP BY `p`.`id_pasien`, `p`.`nama_pasien`, `p`.`no_hp``no_hp`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `id_kunjungan` (`id_kunjungan`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
