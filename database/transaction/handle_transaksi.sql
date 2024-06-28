CREATE PROCEDURE AddDetailPesanan(
    IN p_jenis_sepatu_id CHAR(5),
    IN p_jumlah INT
)
BEGIN
    DECLARE v_harga DECIMAL(10,2);
    DECLARE v_total_biaya DECIMAL(10,2);
    SET @last_pesanan_id = (SELECT MAX(pesanan_id) FROM pesanan);

    -- Mendapatkan harga per unit dari jenis sepatu
    SELECT jenis_sepatu_harga INTO v_harga FROM jenis_sepatu WHERE jenis_sepatu_id = p_jenis_sepatu_id;
    
    -- Menghitung total biaya
    SET v_total_biaya = v_harga * p_jumlah;
    
    -- Menambahkan detail pesanan
    INSERT INTO detail_pesanan (detail_pesanan_jenis_sepatu, detail_pesanan_jumlah, detail_pesanan_total_biaya, detail_pesanan_pesanan_id)
    VALUES (p_jenis_sepatu_id, p_jumlah, v_total_biaya, @last_pesanan_id);  
END;

INSERT INTO jenis_sepatu (jenis_sepatu_id, jenis_sepatu_nama, jenis_sepatu_harga) VALUES
('JS01', 'Sneakers', 250000),
('JS02', 'Loafers', 300000),
('JS03', 'Boots', 550000),
('JS04', 'Derby', 400000),
('JS05', 'High Heels', 350000),
('JS06', 'Sandals', 150000),
('JS07', 'Athletic', 450000),
('JS08', 'Casual Shoes', 200000),
('JS09', 'Formal Shoes', 600000),
('JS10', 'Slippers', 100000);

DROP PROCEDURE IF EXISTS AddDetailPesanan;
CALL AddDetailPesanan('JS01', 2);
CALL AddDetailPesanan('JS02', 3);

SELECT * FROM pesanan;
SELECT * FROM informasi_usaha;