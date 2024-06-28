CREATE TABLE IF NOT EXISTS mydb.pengiriman (
  pengiriman_id INT NOT NULL AUTO_INCREMENT,
  pesanan_id INT NOT NULL,
  kurir_nama VARCHAR(45) NOT NULL,
  kurir_kontak VARCHAR(15) NOT NULL,
  waktu_pickup TIMESTAMP NULL,
  waktu_delivery TIMESTAMP NULL,
  status VARCHAR(15) DEFAULT 'Pending', -- seperti 'In Transit', 'Delivered', 'Picked Up'
  PRIMARY KEY (pengiriman_id),
  FOREIGN KEY (pesanan_id) REFERENCES mydb.pesanan (pesanan_id) ON DELETE CASCADE
) ENGINE = InnoDB;
