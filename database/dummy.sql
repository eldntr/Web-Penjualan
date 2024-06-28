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

-- SELECT * FROM pelanggan;

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

-- SELECT * FROM pegawai;

INSERT INTO jenis_sepatu (jenis_sepatu_id, jenis_sepatu_nama, jenis_sepatu_harga) VALUES
('JS001', 'Sneakers', 15000.00),
('JS002', 'Boots', 20000.00),
('JS003', 'Flats', 10000.00),
('JS004', 'High Heels', 35000),
('JS005', 'Casual Shoes', 20000),
('JS006', 'Formal Shoes', 60000);

-- SELECT * FROM jenis_sepatu;

INSERT INTO pesanan (pesanan_pelanggan_id, pesanan_tanggal_antar, pesanan_pegawai_id, pesanan_total, pesanan_status_delivery, pesanan_tanggal_pickup, pesanan_tanggal_delivery) VALUES

('081234567890', '2024-06-20', '081122334401', 30000.00, 'Delivered', '2024-06-19', '2024-06-20'),
('081234567891', '2024-06-21', '081122334402', 20000.00, 'Pending', '2024-06-20', NULL),
('081234567892', '2024-06-22', '081122334403', 15000.00, 'In Transit', '2024-06-21', NULL);

-- select * from pesanan;

INSERT INTO feedback (feedback_rate_pegawai, feedback_rate_toko, feedback_komentar, feedback_pesanan_id) VALUES
(5, 5, 'Sangat baik!', 1),
(4, 4, 'Bagus, tapi ada keterlambatan sedikit.', 2),
(3, 3, 'Cukup memuaskan.', 3);

-- select * from feedback;

INSERT INTO informasi_usaha (informasi_waktu, informasi_usaha_omset) VALUES
('2024-06-20 00:00:00', 300000.00),
('2024-06-21 00:00:00', 200000.00),
('2024-06-22 00:00:00', 150000.00);	

-- select * from informasi_usaha;

INSERT INTO pengiriman (pesanan_id, kurir_nama, kurir_kontak, waktu_pickup, waktu_delivery, status) VALUES
(1, 'Gojek', '081234567890', '2024-06-19 14:00:00', '2024-06-20 10:00:00', 'Delivered'),
(2, 'Grab', '081234567891', '2024-06-20 15:00:00', NULL, 'Pending'),
(3, 'JNE', '081234567892', '2024-06-21 16:00:00', NULL, 'In Transit');

-- select * from pengiriman;
