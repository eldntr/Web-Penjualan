-- Menghitung total biaya pesanan setelah diskon
-- Tambahkan tabel diskon:
CREATE TABLE IF NOT EXISTS mydb.diskon_pelanggan (
  diskon_id INT NOT NULL AUTO_INCREMENT,
  pelanggan_id VARCHAR(15) NOT NULL,
  diskon_persen DECIMAL(3,2) NOT NULL,  -- Persentase diskon, misal 15.00 untuk 15%
  tanggal_mulai DATE,
  tanggal_berakhir DATE,
  PRIMARY KEY (diskon_id),
  FOREIGN KEY (pelanggan_id) REFERENCES mydb.pelanggan (pelanggan_id) ON DELETE CASCADE
) ENGINE = InnoDB;
--
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS UpdateOrderTotal;
CREATE PROCEDURE UpdateOrderTotal(pesananId INT)
BEGIN
  DECLARE v_pelanggan_id VARCHAR(15);
  DECLARE v_diskon DECIMAL(5,2) DEFAULT 0.0;
  DECLARE v_total DECIMAL(10,2);
  DECLARE v_diskon_total DECIMAL(10,2);

  -- Dapatkan pelanggan_id dari pesanan
  SELECT pesanan_pelanggan_id INTO v_pelanggan_id FROM mydb.pesanan WHERE pesanan_id = pesananId;

  -- Cek apakah pelanggan memiliki diskon aktif
  SELECT COALESCE(MAX(diskon_persen), 0) INTO v_diskon
  FROM mydb.diskon_pelanggan
  WHERE pelanggan_id = v_pelanggan_id
    AND CURRENT_DATE BETWEEN tanggal_mulai AND tanggal_berakhir;

  -- Hitung ulang total harga pesanan
  SELECT SUM(detail_pesanan_total_biaya) INTO v_total
  FROM mydb.detail_pesanan
  WHERE detail_pesanan_pesanan_id = pesananId;

  -- Kalkulasi total setelah diskon
  SET v_diskon_total = v_total - (v_total * v_diskon / 100);

  -- Update total pesanan di tabel pesanan
  UPDATE mydb.pesanan
  SET pesanan_total = v_diskon_total
  WHERE pesanan_id = pesananId;
END;


DROP TRIGGER IF EXISTS after_detail_insert;
CREATE TRIGGER after_detail_insert
AFTER INSERT ON mydb.detail_pesanan
FOR EACH ROW
BEGIN
  CALL UpdateOrderTotal(NEW.detail_pesanan_pesanan_id);
END;
