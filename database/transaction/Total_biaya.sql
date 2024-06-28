DROP TRIGGER IF EXISTS UpdateTotalAfterInsert;
CREATE TRIGGER UpdateTotalAfterInsert
AFTER INSERT ON detail_pesanan
FOR EACH ROW
BEGIN
    DECLARE new_total DECIMAL(10,2);
    -- Menghitung total biaya baru
    SET new_total = CalculateFinalTotal(NEW.detail_pesanan_pesanan_id);
    -- Mengupdate total biaya di tabel pesanan
    UPDATE pesanan SET pesanan_total = new_total WHERE pesanan_id = NEW.detail_pesanan_pesanan_id;
END;

CREATE FUNCTION CalculateFinalTotal(p_pesanan_id INT) RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_total_biaya DECIMAL(10,2);
    
    -- Menghitung total biaya sebelum diskon dari semua detail_pesanan yang terkait dengan pesanan tertentu
    SELECT SUM(detail_pesanan_total_biaya) INTO v_total_biaya FROM detail_pesanan WHERE detail_pesanan_pesanan_id = p_pesanan_id;
    
    -- Mengembalikan total biaya
    RETURN v_total_biaya;
END;
