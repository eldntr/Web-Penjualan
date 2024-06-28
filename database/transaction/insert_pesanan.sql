CREATE PROCEDURE insertPesanan(
    IN p_pelanggan_id VARCHAR(15),
    IN p_pegawai_id VARCHAR(15)
)
BEGIN
    -- Memasukkan data pesanan baru
    INSERT INTO pesanan (pesanan_pelanggan_id, pesanan_tanggal_antar, pesanan_pegawai_id)
    VALUES (p_pelanggan_id, CURDATE(), p_pegawai_id);
END;