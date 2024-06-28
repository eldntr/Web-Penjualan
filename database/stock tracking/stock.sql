-- --------------------------------------------
-- PINDAHKAN JIKA SUDAH SELESAI: TABEL UNTUK MELACAK STOK BAHAN
CREATE TABLE IF NOT EXISTS mydb.bahan (
  bahan_id INT NOT NULL AUTO_INCREMENT,
  bahan_nama VARCHAR(45) NOT NULL,
  stok INT NOT NULL,
  biaya_per_unit DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (bahan_id)
) ENGINE = InnoDB;


-- Tabel untuk melacak penggunaan bahan per sepatu
CREATE TABLE IF NOT EXISTS mydb.penggunaan_bahan (
  penggunaan_id INT NOT NULL AUTO_INCREMENT,
  jenis_sepatu_id CHAR(5) NOT NULL,
  bahan_id INT NOT NULL,
  jumlah_per_sepatu INT NOT NULL,  -- Jumlah bahan yang digunakan per sepatu
  PRIMARY KEY (penggunaan_id),
  FOREIGN KEY (jenis_sepatu_id) REFERENCES mydb.jenis_sepatu (jenis_sepatu_id) ON DELETE CASCADE,
  FOREIGN KEY (bahan_id) REFERENCES mydb.bahan (bahan_id) ON DELETE CASCADE
) ENGINE = InnoDB;

-- 
-- -- -----------------------------------------------------

-- Trigger untuk mengurangi stok bahan setelah detail_pesanan dibuat
CREATE TRIGGER reduce_stock_after_order
AFTER INSERT ON mydb.detail_pesanan
FOR EACH ROW
BEGIN
  DECLARE jumlah_bahan INT;
  DECLARE total_penggunaan INT;

  -- Menghitung total penggunaan bahan berdasarkan jenis sepatu dan jumlah yang dipesan
  SELECT jumlah_per_sepatu INTO jumlah_bahan
  FROM mydb.penggunaan_bahan
  WHERE jenis_sepatu_id = NEW.detail_pesanan_jenis_sepatu;

  SET total_penggunaan = jumlah_bahan * NEW.detail_pesanan_jumlah;

  -- Mengurangi stok bahan
  UPDATE mydb.bahan
  SET stok = stok - total_penggunaan
  WHERE bahan_id IN (
    SELECT bahan_id
    FROM mydb.penggunaan_bahan
    WHERE jenis_sepatu_id = NEW.detail_pesanan_jenis_sepatu
  );
END;