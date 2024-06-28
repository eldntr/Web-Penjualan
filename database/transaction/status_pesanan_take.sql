-- --------------------------------------------
-- PINDAHKAN KE SCRIPT JIKA SUDAH SELESAI

ALTER TABLE mydb.detail_pesanan
ADD COLUMN status BOOLEAN DEFAULT FALSE;

ALTER TABLE mydb.pesanan
ADD COLUMN status BOOLEAN DEFAULT FALSE;

--
-- -----------------------------------------------------

CREATE TRIGGER after_detail_update
AFTER Insert ON mydb.detail_pesanan
FOR EACH ROW
BEGIN
  DECLARE total_items INT DEFAULT 0;
  DECLARE cleaned_items INT DEFAULT 0;

  -- Hitung jumlah total item dalam pesanan
  SELECT COUNT(*) INTO total_items
  FROM mydb.detail_pesanan
  WHERE detail_pesanan_pesanan_id = NEW.detail_pesanan_pesanan_id;

  -- Hitung jumlah item yang telah dicuci
  SELECT COUNT(*) INTO cleaned_items
  FROM mydb.detail_pesanan
  WHERE detail_pesanan_pesanan_id = NEW.detail_pesanan_pesanan_id
    AND status = TRUE;

  -- Perbarui status di pesanan jika semua item telah dicuci
  IF total_items = cleaned_items THEN
    UPDATE mydb.pesanan
    SET status = TRUE
    WHERE pesanan_id = NEW.detail_pesanan_pesanan_id;
  END IF;
END;
