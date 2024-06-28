-- MySQL Script generated by MySQL Workbench
-- Thu Jun 27 03:19:04 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS mydb ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema cuci_sepatu2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS cuci_sepatu2 ;

-- -----------------------------------------------------
-- Schema cuci_sepatu2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS cuci_sepatu2 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE mydb ;

-- -----------------------------------------------------
-- Table mydb.pegawai
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.pegawai (
  pegawai_id VARCHAR(15) NOT NULL,
  pegawai_name VARCHAR(15) NOT NULL,
  pegawai_alamat VARCHAR(45) NOT NULL,
  pegawai_performa INT NULL,
  PRIMARY KEY (pegawai_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.pelanggan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.pelanggan (
  pelanggan_id VARCHAR(15) NOT NULL,
  pelanggan_nama VARCHAR(15) NOT NULL,
  pelanggan_alamat VARCHAR(45) NOT NULL,
  PRIMARY KEY (pelanggan_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.pesanan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.pesanan (
  pesanan_id INT NOT NULL AUTO_INCREMENT,
  pesanan_pelanggan_id VARCHAR(15) NOT NULL,
  pesanan_tanggal_antar DATE NOT NULL,
  pesanan_pegawai_id VARCHAR(15) NOT NULL,
  pesanan_total DECIMAL(10,2) NULL,
  PRIMARY KEY (pesanan_id),
  INDEX pesanan_pelanggan_idx (pesanan_pelanggan_id ASC) VISIBLE,
  INDEX fk_pesanan_pegawai1_idx (pesanan_pegawai_id ASC) VISIBLE,
  CONSTRAINT pesanan_pelanggan
    FOREIGN KEY (pesanan_pelanggan_id)
    REFERENCES mydb.pelanggan (pelanggan_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_pesanan_pegawai1
    FOREIGN KEY (pesanan_pegawai_id)
    REFERENCES mydb.pegawai (pegawai_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.jenis_sepatu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.jenis_sepatu (
  jenis_sepatu_id CHAR(5) NOT NULL,
  jenis_sepatu_nama VARCHAR(45) NOT NULL,
  jenis_sepatu_harga DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (jenis_sepatu_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.detail_pesanan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.detail_pesanan (
  detail_pesanan_id INT NOT NULL AUTO_INCREMENT,
  detail_pesanan_pesanan_id INT NOT NULL,
  detail_pesanan_total_biaya INT NOT NULL,
  detail_pesanan_jenis_sepatu CHAR(5) NOT NULL,
  detail_pesanan_jumlah INT NOT NULL,
  PRIMARY KEY (detail_pesanan_id),
  INDEX detail_pesanan_pesanan_id_idx (detail_pesanan_pesanan_id ASC) VISIBLE,
  INDEX detail_pesanan_jenis_sepatu_idx (detail_pesanan_jenis_sepatu ASC) VISIBLE,
  CONSTRAINT detail_pesanan_pesanan_id
    FOREIGN KEY (detail_pesanan_pesanan_id)
    REFERENCES mydb.pesanan (pesanan_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT detail_pesanan_jenis_sepatu
    FOREIGN KEY (detail_pesanan_jenis_sepatu)
    REFERENCES mydb.jenis_sepatu (jenis_sepatu_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.feedback
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.feedback (
  feedback_id INT NOT NULL AUTO_INCREMENT,
  feedback_rate_pegawai TINYINT NOT NULL,
  feedback_rate_toko TINYINT NOT NULL,
  feedback_komentar TEXT NOT NULL,
  feedback_pesanan_id INT NOT NULL,
  PRIMARY KEY (feedback_id),
  INDEX feedback_pesanan_idx (feedback_pesanan_id ASC) VISIBLE,
  CONSTRAINT feedback_pesanan
    FOREIGN KEY (feedback_pesanan_id)
    REFERENCES mydb.pesanan (pesanan_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.informasi_usaha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.informasi_usaha (
  informasi_waktu TIMESTAMP(2) NOT NULL,
  informasi_usaha_omset DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (informasi_waktu))
ENGINE = InnoDB;

ALTER TABLE mydb.pesanan
ADD COLUMN pesanan_status_delivery VARCHAR(15) DEFAULT 'Pending',
ADD COLUMN pesanan_tanggal_pickup DATE NULL,
ADD COLUMN pesanan_tanggal_delivery DATE NULL;

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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;