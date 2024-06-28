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