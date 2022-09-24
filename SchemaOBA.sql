CREATE SCHEMA `OBA` ;
use oba;
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'PkmOba_2022';

-- flush privileges;

CREATE TABLE `cpl` (
  `IDCPL` varchar(8) NOT NULL,
  `IDTahunAjar` char(6) NOT NULL,
  `Deskripsi` text,
  PRIMARY KEY (`IDCPL`,`IDTahunAjar`),
  KEY `IDTahunAjarCPL_idx` (`IDTahunAjar`),
  CONSTRAINT `IDTahunAjarCPL` FOREIGN KEY (`IDTahunAjar`) REFERENCES `tahunajar` (`IDTahunAjar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cpmk` (
  `IDCPMK` varchar(32) NOT NULL,
  `IDCPL` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`IDCPMK`),
  UNIQUE KEY `IDCpmk_UNIQUE` (`IDCPMK`),
  KEY `IDCPMKCPL_idx` (`IDCPL`),
  CONSTRAINT `IDCPMKCPL` FOREIGN KEY (`IDCPL`) REFERENCES `cpl` (`IDCPL`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `kurikulum` (
  `IDKurikulum` varchar(32) NOT NULL,
  PRIMARY KEY (`IDKurikulum`),
  UNIQUE KEY `IDKurikulum_UNIQUE` (`IDKurikulum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `matakuliah` (
  `IDMataKuliah` varchar(32) NOT NULL,
  `IDTahunAjar` char(6) DEFAULT NULL,
  PRIMARY KEY (`IDMataKuliah`),
  UNIQUE KEY `id_UNIQUE` (`IDMataKuliah`),
  KEY `IDTahunAjarMataKuliah_idx` (`IDTahunAjar`),
  CONSTRAINT `IDMataKuliahTahunAjar` FOREIGN KEY (`IDTahunAjar`) REFERENCES `tahunajar` (`IDTahunAjar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `matakuliahcpmk` (
  `IDMataKuliahCPMK` varchar(32) NOT NULL,
  `IDMatakuliah` varchar(32) NOT NULL,
  `IDCPMK` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`IDMatakuliah`),
  UNIQUE KEY `IDMataKuliahCPMK_UNIQUE` (`IDMataKuliahCPMK`),
  KEY `IDMataKuliahCPMKCPMK_idx` (`IDCPMK`),
  CONSTRAINT `IDMataKuliahCPMKCPMK` FOREIGN KEY (`IDCPMK`) REFERENCES `cpmk` (`IDCPMK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `IDMataKuliahCPMKMataKuliah` FOREIGN KEY (`IDMatakuliah`) REFERENCES `matakuliah` (`IDMataKuliah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `semesterganjil` (
  `IDSemesterGanjil` varchar(32) NOT NULL,
  `IDTahunAjar` char(6) DEFAULT NULL,
  PRIMARY KEY (`IDSemesterGanjil`),
  UNIQUE KEY `IDSemesterGanjil_UNIQUE` (`IDSemesterGanjil`),
  KEY `IDTahunAjarSemesterGanjil_idx` (`IDTahunAjar`),
  CONSTRAINT `IDTahunAjarSemesterGanjil` FOREIGN KEY (`IDTahunAjar`) REFERENCES `tahunajar` (`IDTahunAjar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `semestergenap` (
  `IDSemesterGenap` varchar(32) NOT NULL,
  `IDTahunAjar` char(6) DEFAULT NULL,
  PRIMARY KEY (`IDSemesterGenap`),
  UNIQUE KEY `IDSemesterGenap_UNIQUE` (`IDSemesterGenap`),
  KEY `IDTahunAjarSemesterGenap_idx` (`IDTahunAjar`),
  CONSTRAINT `IDSemesterGenapTahunAjar` FOREIGN KEY (`IDTahunAjar`) REFERENCES `tahunajar` (`IDTahunAjar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subcpmk` (
  `IDSubCPMK` varchar(32) NOT NULL,
  `IDCPMK` varchar(32) DEFAULT NULL,
  `IDMataKuliah` varchar(32) DEFAULT NULL,
  UNIQUE KEY `IDSubCPMK_UNIQUE` (`IDSubCPMK`),
  KEY `IDSubCPMKMataKuliah_idx` (`IDMataKuliah`),
  KEY `IDSubCPMKCPMK_idx` (`IDCPMK`),
  CONSTRAINT `IDSubCPMKCPMK` FOREIGN KEY (`IDCPMK`) REFERENCES `cpmk` (`IDCPMK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `IDSubCPMKMataKuliah` FOREIGN KEY (`IDMataKuliah`) REFERENCES `matakuliah` (`IDMataKuliah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tahunajar` (
  `IDTahunAjar` char(6) NOT NULL,
  `IDKurikulum` varchar(32) DEFAULT NULL,
  `TahunAjar` char(9) DEFAULT NULL,
  `Semester` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`IDTahunAjar`),
  UNIQUE KEY `IDTahunAjar_UNIQUE` (`IDTahunAjar`),
  KEY `IDKurikulumTahunAjar_idx` (`IDKurikulum`),
  CONSTRAINT `IDKurikulumTahunAjar` FOREIGN KEY (`IDKurikulum`) REFERENCES `kurikulum` (`IDKurikulum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * from OBA.Kurikulum;

INSERT INTO OBA.Kurikulum
VALUES ('KO2013');

INSERT INTO OBA.TahunAjar
VALUES ('2122GJ', 'KO2013','2021/2022', 'Ganjil');

INSERT INTO OBA.CPL
VALUES ('S.8', '2122GJ', 'Menginternalisasi nilai, norma, dan etika akademik');