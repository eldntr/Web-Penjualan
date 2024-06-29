INSERT INTO pelanggan (pelanggan_id, pelanggan_nama, pelanggan_alamat) VALUES
('081234567890', 'Agus Salim', 'Jl. Arief Rahman Hakim No. 100'),
('081234567891', 'Siti Aminah', 'Jl. Raya Gubeng No. 45'),
('081234567892', 'Rahmat Hidayat', 'Jl. Darmo Permai No. 20'),
('081234567893', 'Nurul Huda', 'Jl. Jemursari Timur No. 11'),
('081234567894', 'Irfan Bachdim', 'Jl. Kenjeran No. 98'),
('081234567895', 'Wahyu Subuh', 'Jl. Gayungsari Barat No. 77'),
('081234567896', 'Retno Marsudi', 'Jl. Lidah Wetan No. 45'),
('081234567897', 'Dwi Susanto', 'Jl. Nginden Intan No. 15'),
('081234567898', 'Ayu Dewi', 'Jl. Keputih No. 3'),
('081234567899', 'Agung Laksono', 'Jl. Simo Pomahan No. 19'),
('081234567900', 'Andi Susanto', 'Jl. Pakis Argosari No. 17'),
('081234567901', 'Maria Ulfa', 'Jl. Gayungan IV No. 22'),
('081234567902', 'Yusuf Maulana', 'Jl. Karang Asem No. 5'),
('081234567903', 'Dewi Sartika', 'Jl. Kaliasin No. 8'),
('081234567904', 'Ahmad Dahlan', 'Jl. Mojo III No. 11'),
('081234567905', 'Sari Puspita', 'Jl. Panjang Jiwo No. 21'),
('081234567906', 'Bagus Kurniawan', 'Jl. Tambak Segaran No. 32'),
('081234567907', 'Rini Handayani', 'Jl. Ketintang Madya No. 47'),
('081234567908', 'Teguh Kusuma', 'Jl. Siwalankerto Timur No. 56'),
('081234567909', 'Nila Dwi Astuti', 'Jl. Ketintang Baru V No. 64'),
('081234567910', 'Fajar Nugraha', 'Jl. Jemur Andayani No. 28'),
('081234567911', 'Linda Kusmawati', 'Jl. Dukuh Kupang Barat No. 72'),
('081234567912', 'Rahman Indarto', 'Jl. Rungkut Harapan No. 85'),
('081234567913', 'Nur Hasan', 'Jl. Rungkut Asri Tengah No. 91'),
('081234567914', 'Eka Prasetya', 'Jl. Kalirungkut No. 98'),
('081234567915', 'Rini Agustina', 'Jl. Medokan Semampir Indah No. 104'),
('081234567916', 'Bambang Suryo', 'Jl. Margorejo Indah No. 118'),
('081234567917', 'Suci Ramadhani', 'Jl. Nginden Semolo No. 127'),
('081234567918', 'Arief Budiman', 'Jl. Mulyosari Prima No. 135'),
('081234567919', 'Galuh Saraswati', 'Jl. Raya Tenggilis No. 144');

CALL insertPesanan('081234567890', '081122334401');
CALL insertPesanan('081234567891', '081122334402');
SELECT * FROM pesanan WHERE pesanan_pelanggan_id = '081234567890' AND pesanan_pegawai_id = '081122334401';
-- langsung ke pesanan



INSERT INTO pegawai (pegawai_id, pegawai_name, pegawai_alamat) VALUES
('081122334401', 'Budi Darmawan', 'Jl. Dharmahusada Indah Timur No. 35'),
('081122334402', 'Ratna Sari', 'Jl. Mayjen Sungkono No. 89'),
('081122334403', 'Joko Widodo', 'Jl. Manyar Kertoarjo V No. 62'),
('081122334404', 'Susilo Bambang', 'Jl. Margorejo Indah No. 97'),
('081122334405', 'Sri Mulyani', 'Jl. Menur Pumpungan No. 34'),
('081122334406', 'Mega Sari', 'Jl. Ngagel Jaya Selatan No. 73'),
('081122334407', 'Arief Yahya', 'Jl. Prapen Indah No. 15'),
('081122334408', 'Tri Rismaharini', 'Jl. Tenggilis Mejoyo No. 25'),
('081122334409', 'Anies Baswedan', 'Jl. Kertajaya Indah No. 29'),
('081122334410', 'Ganjar Pranowo', 'Jl. Siwalankerto No. 67');

INSERT INTO jenis_sepatu (jenis_sepatu_id, jenis_sepatu_nama, jenis_sepatu_harga) VALUES
('JS001', 'Sneakers', 15000.00),
('JS002', 'Boots', 20000.00),
('JS003', 'Flats', 10000.00),
('JS004', 'High Heels', 35000),
('JS005', 'Casual Shoes', 20000),
('JS006', 'Formal Shoes', 60000);

-- 	INSERT INTO mydb.pesanan (pesanan_pelanggan_id, pesanan_tanggal_antar, pesanan_pegawai_id, pesanan_total, pesanan_status_delivery, pesanan_tanggal_pickup, pesanan_tanggal_delivery) VALUES

-- 	('081234567890', '2024-06-20', '081122334401', 30000.00, 'Delivered', '2024-06-19', '2024-06-20'),
-- 	('081234567891', '2024-06-21', '081122334402', 20000.00, 'Pending', '2024-06-20', NULL),
-- 	('081234567892', '2024-06-22', '081122334403', 15000.00, 'In Transit', '2024-06-21', NULL),
-- 	('081234567893', '2024-06-23', '081122334404', 25000.00, 'Delivered', '2024-06-22', '2024-06-23'),
-- 	('081234567894', '2024-06-24', '081122334405', 35000.00, 'Pending', '2024-06-23', NULL),
-- 	('081234567895', '2024-06-25', '081122334406', 40000.00, 'In Transit', '2024-06-24', NULL),
-- 	('081234567896', '2024-06-26', '081122334407', 18000.00, 'Delivered', '2024-06-25', '2024-06-26'),
-- 	('081234567897', '2024-06-27', '081122334408', 22000.00, 'Pending', '2024-06-26', NULL),
-- 	('081234567898', '2024-06-28', '081122334409', 19000.00, 'In Transit', '2024-06-27', NULL),
-- 	('081234567899', '2024-06-29', '081122334410', 27000.00, 'Delivered', '2024-06-28', '2024-06-29');
    
INSERT INTO feedback (feedback_rate_pegawai, feedback_rate_toko, feedback_komentar, feedback_pesanan_id) VALUES
(5, 5, 'Luar biasa!', 4),
(4, 4, 'Bagus, tetapi layanan bisa lebih cepat.', 5),
(3, 3, 'Memuaskan.', 6),
(5, 5, 'Sangat baik dan cepat.', 7),
(4, 4, 'Baik, tetapi sedikit terlambat.', 8),
(3, 3, 'Memuaskan, tapi bisa lebih baik.', 9),
(5, 5, 'Pelayanan sangat memuaskan.', 10),
(4, 4, 'Bagus, tapi harga cukup mahal.', 11),
(3, 3, 'Cukup baik, bisa lebih baik.', 12),
(5, 5, 'Sangat baik dan cepat.', 13),
(4, 4, 'Baik, tetapi sedikit terlambat.', 14),
(3, 3, 'Memuaskan, tapi bisa lebih baik.', 15),
(5, 5, 'Pelayanan sangat memuaskan.', 16),
(4, 4, 'Bagus, tapi harga cukup mahal.', 17),
(3, 3, 'Cukup baik, bisa lebih baik.', 18);
-- --------------------------------------------------------------------------------------------------------

INSERT INTO pengiriman (pesanan_id, kurir_nama, kurir_kontak, waktu_pickup, waktu_delivery, status) VALUES
(1, 'Gojek', '081234567890', '2024-06-19 14:00:00', '2024-06-20 10:00:00', 'Delivered'),
(2, 'Grab', '081234567891', '2024-06-20 15:00:00', NULL, 'Pending'),
(3, 'JNE', '081234567892', '2024-06-21 16:00:00', NULL, 'In Transit'),
(4, 'SiCepat', '081234567893', '2024-06-22 14:30:00', '2024-06-23 10:30:00', 'Delivered'),
(5, 'Pos Indonesia', '081234567894', '2024-06-23 15:30:00', NULL, 'Pending'),
(6, 'TIKI', '081234567895', '2024-06-24 16:30:00', NULL, 'In Transit'),
(7, 'J&T', '081234567896', '2024-06-25 14:45:00', '2024-06-26 10:45:00', 'Delivered'),
(8, 'Wahana', '081234567897', '2024-06-26 15:45:00', NULL, 'Pending'),
(9, 'Pahala Express', '081234567898', '2024-06-27 16:45:00', NULL, 'In Transit'),
(10, 'DHL', '081234567899', '2024-06-28 14:00:00', '2024-06-29 10:00:00', 'Delivered'),
(11, 'FedEx', '081234567900', '2024-06-29 15:00:00', NULL, 'Pending'),
(12, 'UPS', '081234567901', '2024-06-30 16:00:00', NULL, 'In Transit');

-- Data untuk tabel bahan (bahan pembersih sepatu)
INSERT INTO mydb.bahan (bahan_id, bahan_nama, stok, biaya_per_unit) VALUES
(1, 'Sabun Pembersih', 100, 5000.00),
(2, 'Air', 200, 1000.00),
(3, 'Sikat', 150, 3000.00),
(4, 'Kain Lap', 120, 2000.00),
(5, 'Penghilang Noda', 180, 4500.00);

INSERT INTO mydb.penggunaan_bahan (jenis_sepatu_id, bahan_id, jumlah_per_sepatu) VALUES
('JS001', 1, 10), -- Sneakers menggunakan 10 unit Sabun Pembersih
('JS001', 2, 5),  -- Sneakers menggunakan 5 unit Air
('JS001', 3, 1),  -- Sneakers menggunakan 1 unit Sikat
('JS002', 1, 12), -- Boots menggunakan 12 unit Sabun Pembersih
('JS002', 2, 6),  -- Boots menggunakan 6 unit Air
('JS002', 4, 1),  -- Boots menggunakan 1 unit Kain Lap
('JS003', 1, 8),  -- Flats menggunakan 8 unit Sabun Pembersih
('JS003', 2, 4),  -- Flats menggunakan 4 unit Air
('JS003', 5, 1),  -- Flats menggunakan 1 unit Penghilang Noda
('JS004', 1, 15), -- High Heels menggunakan 15 unit Sabun Pembersih
('JS004', 2, 7),  -- High Heels menggunakan 7 unit Air
('JS004', 3, 1),  -- High Heels menggunakan 1 unit Sikat
('JS005', 1, 10), -- Casual Shoes menggunakan 10 unit Sabun Pembersih
('JS005', 2, 5),  -- Casual Shoes menggunakan 5 unit Air
('JS005', 4, 1),  -- Casual Shoes menggunakan 1 unit Kain Lap
('JS006', 1, 20), -- Formal Shoes menggunakan 20 unit Sabun Pembersih
('JS006', 2, 10), -- Formal Shoes menggunakan 10 unit Air
('JS006', 5, 1);  -- Formal Shoes menggunakan 1 unit Penghilang Noda

iNSERT INTO mydb.diskon_pelanggan (pelanggan_id, diskon_persen, tanggal_mulai, tanggal_berakhir) VALUES
('081234567890', 12.50, '2024-06-01', '2024-06-30'),
('081234567891', 18.00, '2024-07-01', '2024-07-31'),
('081234567892', 22.00, '2024-08-01', '2024-08-31'),
('081234567893', 11.00, '2024-09-01', '2024-09-30'),
('081234567894', 16.00, '2024-10-01', '2024-10-31'),
('081234567895', 19.00, '2024-11-01', '2024-11-30'),
('081234567896', 13.50, '2024-12-01', '2024-12-31'),
('081234567897', 17.00, '2024-01-01', '2024-01-31'),
('081234567898', 21.00, '2024-02-01', '2024-02-28'),
('081234567899', 14.00, '2024-03-01', '2024-03-31');
