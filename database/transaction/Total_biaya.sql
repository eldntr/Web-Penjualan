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

CREATE TRIGGER after_detail_update
AFTER UPDATE ON mydb.detail_pesanan
FOR EACH ROW
BEGIN
  CALL UpdateOrderTotal(NEW.detail_pesanan_pesanan_id);
END;
