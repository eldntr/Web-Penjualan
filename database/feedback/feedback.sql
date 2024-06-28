DROP TRIGGER IF EXISTS update_performa_pegawai;
CREATE TRIGGER update_performa_pegawai
AFTER INSERT ON feedback FOR EACH ROW
BEGIN
    DECLARE avg_performa INT;
    SELECT AVG(feedback_rate_pegawai) INTO avg_performa FROM feedback WHERE feedback_pesanan_id = NEW.feedback_pesanan_id;
    UPDATE pegawai
    SET pegawai_performa = avg_performa
    WHERE pegawai_id = (SELECT pesanan_pegawai_id FROM pesanan WHERE pesanan_id = NEW.feedback_pesanan_id);
END;
