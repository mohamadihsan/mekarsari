-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01 Jun 2017 pada 18.46
-- Versi Server: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mekarsaridb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `arus_bahan_baku`
--

CREATE TABLE `arus_bahan_baku` (
  `id` int(11) NOT NULL,
  `id_bahan_baku` int(11) NOT NULL,
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('masuk','keluar') NOT NULL,
  `jumlah` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `arus_bahan_baku`
--

INSERT INTO `arus_bahan_baku` (`id`, `id_bahan_baku`, `waktu`, `status`, `jumlah`) VALUES
(2, 13, '2017-05-02 18:56:09', 'masuk', 10),
(3, 13, '2017-05-06 00:27:38', 'masuk', 10),
(4, 13, '2017-05-06 00:27:38', 'masuk', 5),
(5, 13, '2017-05-22 16:44:55', 'masuk', 1),
(6, 13, '2017-05-22 16:45:27', 'keluar', 1),
(7, 13, '2017-05-22 16:46:29', 'keluar', 2),
(8, 13, '2017-05-22 17:06:53', 'masuk', 4),
(9, 13, '2017-05-22 17:07:01', 'keluar', 4),
(10, 13, '2017-05-22 17:08:17', 'keluar', 4),
(11, 13, '2017-05-22 17:10:54', 'keluar', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `arus_produk`
--

CREATE TABLE `arus_produk` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('masuk','keluar') NOT NULL,
  `jumlah` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id` int(11) NOT NULL,
  `kode` char(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bahan_baku`
--

INSERT INTO `bahan_baku` (`id`, `kode`, `nama`, `satuan`) VALUES
(13, 'MS/BB/0001', 'Gula Merah', 'Kg'),
(14, 'MS/BB/0013', 'Garam', 'Kg'),
(15, 'MS/BB/0014', 'Kacang Kedelai Hitam', 'Kg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_bahan_baku`
--

CREATE TABLE `detail_bahan_baku` (
  `id_bahan_baku` int(11) NOT NULL,
  `stok` float NOT NULL DEFAULT '0',
  `tanggal_kadaluarsa` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_bahan_baku`
--

INSERT INTO `detail_bahan_baku` (`id_bahan_baku`, `stok`, `tanggal_kadaluarsa`) VALUES
(13, 10, '2017-05-03 00:00:00'),
(13, 10, '2017-05-06 00:00:00'),
(13, 5, '2017-05-10 00:00:00'),
(13, 1, '2017-05-22 00:00:00'),
(13, 1, '2017-05-22 00:00:00'),
(13, 2, '2017-05-29 00:00:00'),
(13, -2, '2017-05-22 00:00:00'),
(13, 4, '2017-05-23 00:00:00'),
(13, -4, '2017-05-23 00:00:00'),
(13, -5, '2017-05-10 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pembelian_bahan_baku`
--

CREATE TABLE `detail_pembelian_bahan_baku` (
  `bahan_baku` int(11) NOT NULL COMMENT 'ID BAHAN BAKU',
  `faktur` int(11) NOT NULL COMMENT 'ID FAKTUR PEMBELIAN BAHAN BAKU',
  `jumlah` int(11) NOT NULL COMMENT 'JUMLAH PEMBELIAN',
  `satuan` varchar(20) NOT NULL COMMENT 'SATUAN PEMBELIAN BAHAN BAKU',
  `harga` int(11) NOT NULL COMMENT 'HARGA PER SATUAN BAHAN BAKU'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan_produk`
--

CREATE TABLE `detail_penjualan_produk` (
  `produk` int(11) NOT NULL COMMENT 'ID PRODUK',
  `faktur` int(11) NOT NULL COMMENT 'ID FAKTUR PENJUALAN',
  `jumlah` int(11) NOT NULL COMMENT 'JUMLAH PRODUK YANG DIBELI',
  `satuan` varchar(20) NOT NULL COMMENT 'SATUAN PRODUK',
  `harga` int(11) NOT NULL COMMENT 'HARGA PER SATUAN PRODUK'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_produk`
--

CREATE TABLE `detail_produk` (
  `id_produk` int(11) NOT NULL,
  `stok` smallint(6) NOT NULL DEFAULT '0',
  `tanggal_kadaluarsa` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_produk`
--

INSERT INTO `detail_produk` (`id_produk`, `stok`, `tanggal_kadaluarsa`) VALUES
(5, 10, '2017-05-10 00:00:00'),
(5, 100, '2017-05-02 00:00:00'),
(5, -5, '2017-05-10 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_supplier`
--

CREATE TABLE `detail_supplier` (
  `id_supplier` int(11) NOT NULL,
  `jenis` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_supplier`
--

INSERT INTO `detail_supplier` (`id_supplier`, `jenis`, `harga`, `satuan`) VALUES
(1, 13, 100, 'kg'),
(1, 14, 50, 'kg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `distribusi`
--

CREATE TABLE `distribusi` (
  `id` int(11) NOT NULL COMMENT 'ID DISTRIBUSI AUTOINCREMENT',
  `nomor_faktur` int(11) NOT NULL COMMENT 'ID FAKTUR PENJUALAN',
  `kendaraan` int(11) NOT NULL COMMENT 'ID KENDARAAN YANG DIGUNAKAN',
  `tanggal` datetime NOT NULL COMMENT 'TANGGAL DISTRIBUSI',
  `status` char(1) NOT NULL COMMENT 'STATUS DISTRIBUSI (SUDAH/BELUM)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL,
  `plat_nomor` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tujuan_pengiriman` enum('dalam kota','luar kota') NOT NULL,
  `kapasitas` float NOT NULL,
  `supir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komposisi`
--

CREATE TABLE `komposisi` (
  `id_produk` int(11) NOT NULL,
  `id_bahan_baku` int(11) NOT NULL,
  `takaran` float NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nip` char(8) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nama_panggilan` varchar(20) NOT NULL,
  `jabatan` enum('pemilik','manager','kepala pemasaran','kepala administrasi','kepala produksi','kepala gudang dan pengadaan','staff penerimaan','staff promosi','staff keuangan','staff pengolahan data','staff produksi','staff gudang','administrator') NOT NULL,
  `nama_pengguna` varchar(20) DEFAULT NULL,
  `kata_sandi` varchar(62) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama_lengkap`, `nama_panggilan`, `jabatan`, `nama_pengguna`, `kata_sandi`) VALUES
(1, '10112645', 'Nama Kepala Administrasi', 'Kep. Adm', 'kepala administrasi', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, '00000000', 'Maman Abdurahman', 'Maman', 'staff gudang', 'sgudang', '39ab4e99fc29004971b30f4c7cec1d84'),
(3, '00000001', 'Nama Kepala Gudang', 'Kep. Gud', 'kepala gudang dan pengadaan', 'kgudang', 'e7e32f1146da57e681cf5e634d72cc7a'),
(4, '00000002', 'Nama Kepala Pemsaran', 'Kep. Pem', 'kepala pemasaran', 'kpemasaran', '0dd980b6b0b3598be4759c9c2a7d32ec'),
(5, '00000003', 'Nama Kepala Produksi', 'Kep. Prod', 'kepala produksi', 'kproduksi', '036a2ff235d294544e68d9a252d0cfdf'),
(6, '00000004', 'Manager', 'Man', 'manager', 'manager', '1d0258c2440a8d19e716292b231e3190'),
(7, '00000005', 'Nama Staff Keaungan', 'Stf. Keu', 'staff keuangan', 'skeuangan', '9df53dae7fe8395e28827b8d58c01e3d');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `kode` char(7) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kota` enum('dalam kota','luar kota') NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nama_pengguna` varchar(20) DEFAULT NULL,
  `kata_sandi` varchar(62) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_bahan_baku`
--

CREATE TABLE `pembelian_bahan_baku` (
  `id` int(11) NOT NULL COMMENT 'ID PEMBELIAN AUTOINCREMENT',
  `nomor_faktur` varchar(20) NOT NULL COMMENT 'NOMOR FAKTUR PEMBELIAN BAHAN BAKU',
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'TANGGAL PEMBELIAN BAHAN BAKU',
  `supplier` int(11) NOT NULL COMMENT 'IDENTITAS SUPPLIER',
  `status_pembelian` char(1) NOT NULL COMMENT 'STATUS PEMBELIAN (BERHASIL/RETUR/GAGAL)',
  `status_pembayaran` char(1) NOT NULL COMMENT 'STATUS PEMBAYARAN (BELUM/SUDAH)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int(11) NOT NULL,
  `jenis` enum('pemesanan produk','pembelian bahan baku','pembayaran pemesanan','pembayaran pembelian','pengiriman') NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan_produk`
--

CREATE TABLE `pemesanan_produk` (
  `id` int(11) NOT NULL COMMENT 'ID FAKTUR PENJUALAN',
  `nomor_faktur` varchar(20) NOT NULL COMMENT 'NOMOR FAKTUR PENJUALAN',
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'TANGGAL TRANSAKSI/PENJUALAN',
  `pelanggan` int(11) NOT NULL COMMENT 'PELANGGAN YANG MEMBELI',
  `pegawai` int(11) NOT NULL COMMENT 'PEGAWAI YANG MENANGANI',
  `status_pesanan` char(1) NOT NULL COMMENT 'STATUS TRANSAKSI',
  `status_pembayaran` char(1) NOT NULL COMMENT 'STATUS PEMBAYARAN (BERHASIL/GAGAL)',
  `metode_pembayaran` varchar(20) NOT NULL COMMENT 'METODE PEMBAYARAN (KAS/JATUH TEMPO)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode` char(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kemasan` enum('botol 600 ml','plastik 275 ml') NOT NULL,
  `satuan` enum('botol','plastik') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `jenis_kemasan`, `satuan`) VALUES
(5, 'MS/P/0001', 'Kecap', 'botol 600 ml', 'botol');

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur_pembelian`
--

CREATE TABLE `retur_pembelian` (
  `faktur` int(11) NOT NULL COMMENT 'IDENTITAS FAKTUR PEMBELIAN',
  `tanggal` datetime NOT NULL COMMENT 'TANGGAL RETUR',
  `keterangan` text NOT NULL COMMENT 'KETERANGAN RETUR',
  `status` char(1) NOT NULL COMMENT 'STATUS RETUR (BERHASIL/GAGAL)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur_penjualan`
--

CREATE TABLE `retur_penjualan` (
  `faktur` int(11) NOT NULL COMMENT 'ID FAKTUR PENJUALAN',
  `tanggal` datetime NOT NULL COMMENT 'TANGGAL RETUR',
  `keterangan` text NOT NULL COMMENT 'KETERANGAN RETUR',
  `status` char(1) NOT NULL COMMENT 'STATUS RETUR (BERHASIL/GAGAL)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `waktu_pengiriman` tinyint(4) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `kata_sandi` varchar(62) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `alamat`, `waktu_pengiriman`, `nama_pengguna`, `kata_sandi`) VALUES
(1, 'SUPPLIER 1', 'Bandung', 3, 'supplier', '99b0e8da24e29e4ccb5d7d76e677c2ac');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arus_bahan_baku`
--
ALTER TABLE `arus_bahan_baku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bahan_baku` (`id_bahan_baku`);

--
-- Indexes for table `arus_produk`
--
ALTER TABLE `arus_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_bahan_baku` (`kode`);

--
-- Indexes for table `detail_bahan_baku`
--
ALTER TABLE `detail_bahan_baku`
  ADD KEY `id_bahan_baku` (`id_bahan_baku`);

--
-- Indexes for table `detail_pembelian_bahan_baku`
--
ALTER TABLE `detail_pembelian_bahan_baku`
  ADD KEY `bahan_baku` (`bahan_baku`),
  ADD KEY `faktur` (`faktur`);

--
-- Indexes for table `detail_penjualan_produk`
--
ALTER TABLE `detail_penjualan_produk`
  ADD KEY `produk` (`produk`),
  ADD KEY `faktur` (`faktur`);

--
-- Indexes for table `detail_produk`
--
ALTER TABLE `detail_produk`
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `detail_supplier`
--
ALTER TABLE `detail_supplier`
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `jenis` (`jenis`);

--
-- Indexes for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kendaraan` (`kendaraan`),
  ADD KEY `nomor_faktur` (`nomor_faktur`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plat_nomor` (`plat_nomor`),
  ADD KEY `supir` (`supir`);

--
-- Indexes for table `komposisi`
--
ALTER TABLE `komposisi`
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_bahan_baku` (`id_bahan_baku`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_pelanggan` (`kode`);

--
-- Indexes for table `pembelian_bahan_baku`
--
ALTER TABLE `pembelian_bahan_baku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_faktur_pembelian` (`nomor_faktur`),
  ADD KEY `supplier` (`supplier`);

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `pemesanan_produk`
--
ALTER TABLE `pemesanan_produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_faktur_penjualan` (`nomor_faktur`),
  ADD KEY `pelanggan` (`pelanggan`),
  ADD KEY `pegawai` (`pegawai`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_produk` (`kode`);

--
-- Indexes for table `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  ADD KEY `faktur` (`faktur`);

--
-- Indexes for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD KEY `faktur` (`faktur`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_pengguna_supplier` (`nama_pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arus_bahan_baku`
--
ALTER TABLE `arus_bahan_baku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `arus_produk`
--
ALTER TABLE `arus_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID DISTRIBUSI AUTOINCREMENT';
--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembelian_bahan_baku`
--
ALTER TABLE `pembelian_bahan_baku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID PEMBELIAN AUTOINCREMENT';
--
-- AUTO_INCREMENT for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pemesanan_produk`
--
ALTER TABLE `pemesanan_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID FAKTUR PENJUALAN';
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `arus_bahan_baku`
--
ALTER TABLE `arus_bahan_baku`
  ADD CONSTRAINT `arus_bahan_baku_ibfk_1` FOREIGN KEY (`id_bahan_baku`) REFERENCES `bahan_baku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `arus_produk`
--
ALTER TABLE `arus_produk`
  ADD CONSTRAINT `arus_produk_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_bahan_baku`
--
ALTER TABLE `detail_bahan_baku`
  ADD CONSTRAINT `detail_bahan_baku_ibfk_1` FOREIGN KEY (`id_bahan_baku`) REFERENCES `bahan_baku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_pembelian_bahan_baku`
--
ALTER TABLE `detail_pembelian_bahan_baku`
  ADD CONSTRAINT `detail_pembelian_bahan_baku_ibfk_1` FOREIGN KEY (`bahan_baku`) REFERENCES `bahan_baku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pembelian_bahan_baku_ibfk_2` FOREIGN KEY (`faktur`) REFERENCES `pembelian_bahan_baku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_penjualan_produk`
--
ALTER TABLE `detail_penjualan_produk`
  ADD CONSTRAINT `detail_penjualan_produk_ibfk_1` FOREIGN KEY (`faktur`) REFERENCES `pemesanan_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_penjualan_produk_ibfk_2` FOREIGN KEY (`produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_produk`
--
ALTER TABLE `detail_produk`
  ADD CONSTRAINT `detail_produk_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_supplier`
--
ALTER TABLE `detail_supplier`
  ADD CONSTRAINT `detail_supplier_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_supplier_ibfk_2` FOREIGN KEY (`jenis`) REFERENCES `bahan_baku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  ADD CONSTRAINT `distribusi_ibfk_1` FOREIGN KEY (`nomor_faktur`) REFERENCES `pemesanan_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_ibfk_2` FOREIGN KEY (`kendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`supir`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komposisi`
--
ALTER TABLE `komposisi`
  ADD CONSTRAINT `komposisi_ibfk_1` FOREIGN KEY (`id_bahan_baku`) REFERENCES `bahan_baku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komposisi_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembelian_bahan_baku`
--
ALTER TABLE `pembelian_bahan_baku`
  ADD CONSTRAINT `pembelian_bahan_baku_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD CONSTRAINT `pemberitahuan_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemesanan_produk`
--
ALTER TABLE `pemesanan_produk`
  ADD CONSTRAINT `pemesanan_produk_ibfk_1` FOREIGN KEY (`pelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_produk_ibfk_2` FOREIGN KEY (`pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  ADD CONSTRAINT `retur_pembelian_ibfk_1` FOREIGN KEY (`faktur`) REFERENCES `pembelian_bahan_baku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD CONSTRAINT `retur_penjualan_ibfk_1` FOREIGN KEY (`faktur`) REFERENCES `pemesanan_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
