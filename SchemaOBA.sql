CREATE SCHEMA `OBA` ;
use oba;
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'PkmOba_2022';

-- flush privileges;

CREATE TABLE `Kurikulum` (
  `IDKurikulum` varchar(32) NOT NULL,
  PRIMARY KEY (`IDKurikulum`),
  UNIQUE KEY `IDKurikulum_UNIQUE` (`IDKurikulum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `TahunAjar` (
  `IDTahunAjar` char(6) NOT NULL,
  `IDKurikulum` varchar(32) DEFAULT NULL,
  `TahunAjar` char(9) DEFAULT NULL,
  `Semester` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`IDTahunAjar`),
  UNIQUE KEY `IDTahunAjar_UNIQUE` (`IDTahunAjar`),
  KEY `IDKurikulumTahunAjar_idx` (`IDKurikulum`),
  CONSTRAINT `IDKurikulumTahunAjar` FOREIGN KEY (`IDKurikulum`) REFERENCES `Kurikulum` (`IDKurikulum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `CPL` (
  `IDCPL` varchar(8) NOT NULL,
  `IDTahunAjar` char(6) NOT NULL,
  `Deskripsi` text,
  PRIMARY KEY (`IDCPL`,`IDTahunAjar`),
  KEY `IDTahunAjarCPL_idx` (`IDTahunAjar`),
  CONSTRAINT `IDTahunAjarCPL` FOREIGN KEY (`IDTahunAjar`) REFERENCES `TahunAjar` (`IDTahunAjar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from OBA.Kurikulum;

INSERT INTO OBA.Kurikulum
VALUES ('KO2013');

INSERT INTO OBA.TahunAjar
VALUES ('2122GJ', 'KO2013','2021/2022', 'Ganjil');

INSERT INTO OBA.CPL
VALUES ('S.8', '2122GJ', 'Menginternalisasi nilai, norma, dan etika akademik');

-- tessssssssssssssssssssssssssss