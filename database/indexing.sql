-- Index pada kolom pesanan_tanggal_antar untuk mempercepat query pencarian berdasarkan tanggal antar
CREATE INDEX idx_pesanan_tanggal_antar ON pesanan(pesanan_tanggal_antar);

-- Index pada kolom pelanggan_nama untuk pencarian pelanggan berdasarkan nama
CREATE INDEX idx_pelanggan_nama ON pelanggan(pelanggan_nama);

-- Index pada kolom feedback_rate_pegawai untuk analisis performa pegawai
CREATE INDEX idx_feedback_rate_pegawai ON feedback(feedback_rate_pegawai);
