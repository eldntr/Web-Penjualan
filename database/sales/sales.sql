CREATE TRIGGER update_daily_sales
AFTER INSERT ON detail_pesanan
FOR EACH ROW
BEGIN
  DECLARE current_datetime TIMESTAMP(2);
  SET current_datetime = NOW(2); -- Set the current timestamp with precision

  -- Check if today's entry exists
  IF EXISTS (SELECT * FROM informasi_usaha WHERE DATE(informasi_waktu) = CURDATE()) THEN
    -- Update total sales for today
    UPDATE informasi_usaha
    SET informasi_usaha_omset = informasi_usaha_omset + NEW.detail_pesanan_total_biaya
    WHERE DATE(informasi_waktu) = CURDATE();
  ELSE
    -- Insert new entry for today
    INSERT INTO informasi_usaha (informasi_waktu, informasi_usaha_omset)
    VALUES (current_datetime, NEW.detail_pesanan_total_biaya);
  END IF;
END;

-- -----------------------------------------------------
-- Menghitung keuntungan dan omset 

ALTER TABLE mydb.jenis_sepatu
ADD COLUMN omset DECIMAL(10,2) NOT NULL DEFAULT 0,
ADD COLUMN keuntungan DECIMAL(10,2) NOT NULL DEFAULT 0;

-- -----------------------------------------------------

CREATE VIEW v_biaya_bahan_per_sepatu AS
SELECT pb.jenis_sepatu_id, SUM(b.biaya_per_unit * pb.jumlah_per_sepatu) AS total_biaya_bahan
FROM mydb.penggunaan_bahan pb
JOIN mydb.bahan b ON pb.bahan_id = b.bahan_id
GROUP BY pb.jenis_sepatu_id;

-- -----------------------------------------------------

CREATE TRIGGER update_omset_keuntungan_after_order
AFTER INSERT ON mydb.detail_pesanan
FOR EACH ROW
BEGIN
  DECLARE v_total_biaya_bahan DECIMAL(10,2);
  DECLARE v_harga_pencucian DECIMAL(10,2);
  DECLARE v_keuntungan DECIMAL(10,2);

  -- Dapatkan total biaya bahan untuk jenis sepatu di pesanan
  SELECT total_biaya_bahan INTO v_total_biaya_bahan
  FROM v_biaya_bahan_per_sepatu
  WHERE jenis_sepatu_id = NEW.detail_pesanan_jenis_sepatu;

  -- Dapatkan harga pencucian untuk jenis sepatu
  SELECT jenis_sepatu_harga INTO v_harga_pencucian
  FROM mydb.jenis_sepatu
  WHERE jenis_sepatu_id = NEW.detail_pesanan_jenis_sepatu;

  -- Hitung keuntungan
  SET v_keuntungan = (v_harga_pencucian - v_total_biaya_bahan) * NEW.detail_pesanan_jumlah;

  -- Update omset dan keuntungan di jenis_sepatu
  UPDATE mydb.jenis_sepatu
  SET omset = omset + (v_harga_pencucian * NEW.detail_pesanan_jumlah),
      keuntungan = keuntungan + v_keuntungan
  WHERE jenis_sepatu_id = NEW.detail_pesanan_jenis_sepatu;
END;

-- -----------------------------------------------------