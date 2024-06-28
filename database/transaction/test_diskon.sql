INSERT INTO pelanggan (pelanggan_id, pelanggan_nama, pelanggan_alamat)
VALUES ('0326293873', 'budi', 'jalan2');

INSERT INTO pegawai (pegawai_id, pegawai_name, pegawai_alamat)
VALUES ('0326293898', 'buda', 'jalan2');

CALL insertPesanan('0326293873', '0326293898')

SELECT * FROM pesanan;
SELECT * FROM diskon_pelanggan

INSERT INTO mydb.diskon_pelanggan (pelanggan_id, diskon_persen, tanggal_mulai, tanggal_berakhir)
VALUES ('0326293873', 15.00, '2023-01-01', '2025-12-31');

CALL addDetailPesanan(1, 'Buku', 10000, 2);

SELECT * FROM pesanan;

UPDATE detail_pesanan
SET status = TRUE
WHERE detail_pesanan_id = 2;

INSERT INTO mydb.bahan (bahan_nama, stok, biaya_per_unit)
VALUES ('Bahan A', 100, 10.00);

-- Insert data into `penggunaan_bahan` table
INSERT INTO mydb.penggunaan_bahan (jenis_sepatu_id, bahan_id, jumlah_per_sepatu)
VALUES ('JS01', 1, 2);

SELECT * FROM informasi_usaha

SELECT * FROM bahan