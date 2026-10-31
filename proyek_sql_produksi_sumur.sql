
CREATE TABLE produksi_sumur (
	id INTEGER PRIMARY KEY,
	nama_sumur TEXT,
	lapangan TEXT,
	tanggal TEXT,
	minyak_bbl INTEGER,
	air_bbl INTEGER,
	status TEXT
	);
    
    INSERT into produksi_sumur VALUES
    (1, 'MNS-001', 'Minas', '2026-10-01', 120, 800, 'Aktif'),
(2, 'MNS-002', 'Minas', '2026-10-01', 95, 650, 'Aktif'),
(3, 'MNS-003', 'Minas', '2026-10-01', 0, 0, 'Perawatan'),
(4, 'DRI-001', 'Duri', '2026-10-01', 210, 1500, 'Aktif'),
(5, 'DRI-002', 'Duri', '2026-10-01', 185, 1320, 'Aktif'),
(6, 'DRI-003', 'Duri', '2026-10-01', 60, 400, 'Aktif'),
(7, 'BGK-001', 'Bangko', '2026-10-01', 75, NULL, 'Aktif'),
(8, 'BGK-002', 'Bangko', '2026-10-01', 40, 300, 'Aktif'),
(9, 'BKP-001', 'Bekasap', '2026-10-01', 110, 700, 'Aktif'),
(10, 'BKP-002', 'Bekasap', '2026-10-01', 0, 0, 'Mati'),
(11, 'MNS-001', 'Minas', '2026-10-02', 118, 810, 'Aktif'),
(12, 'MNS-002', 'Minas', '2026-10-02', 97, 640, 'Aktif'),
(13, 'MNS-003', 'Minas', '2026-10-02', 55, 380, 'Aktif'),
(14, 'DRI-001', 'Duri', '2026-10-02', 205, 1490, 'Aktif'),
(15, 'DRI-002', 'Duri', '2026-10-02', 0, 0, 'Perawatan'),
(16, 'DRI-003', 'Duri', '2026-10-02', 63, 410, 'Aktif'),
(17, 'BGK-00 SELECT lapangan , SUM (minyak_bbl) AS total_minyak  from produksi_sumur GROUP by lapangan ORDER BY total_minyak DESC;
1', 'Bangko', '2026-10-02', 78, NULL, 'Aktif'),
(18, 'BGK-002', 'Bangko', '2026-10-02', 38, 310, 'Aktif'),
(19, 'BKP-001', 'Bekasap', '2026-10-02', 112, 690, 'Aktif'),
(20, 'BKP-002', 'Bekasap', '2026-10-02', 0, 0, 'Mati');

select * FROM produksi_sumur

SELECT lapangan, SUM(minyak_bbl) AS total_minyak FROM produksi_sumur GROUP BY lapangan ORDER BY total_minyak DESC;
 
 
SELECT tanggal , SUM (minyak_bbl) AS total_minyak  from produksi_sumur GROUP by tanggal 

SELECT tanggal, lapangan , SUM(minyak_bbl) as totao_minya from produksi_sumur GROUP by lapangan,tanggal ORDER BY  lapangan , tanggal ;

SELECT  lapangan, ROUND(AVG(minyak_bbl), 1) as rata_rata FROM produksi_sumur WHERE status = 'Aktif'  GROUP by lapangan;

SELECT lapangan , COUNT (DISTINCT nama_sumur) as jumlah_sumur FROM produksi_sumur GROUP BY lapangan 
 
SELECT lapangan , SUM ( minyak_bbl	)as total_minyak  FROM produksi_sumur GROUP by lapangan having SUM (minyak_bbl)> 500 

SELECT nama_sumur ,SUM ( minyak_bbl) AS total_minyak  FROM produksi_sumur GROUP by nama_sumur HAVING SUM  (minyak_bbl) > 200 
ORDER BY total_minyak DESC;


SELECT lapangan , COUNT (*) as baris_aktif  FROM  produksi_sumur where status = 'Aktif' GROUP by lapangan  HAVING COUNT (*) >=2;

SELECT case 
 WHEN minyak_bbl >= 150 THEn 'tinggi' 
 WHEN minyak_bbl >= 50 THEN 'sedang '
 WHEN minyak_bbl >= 0 THEN 'rendah' 
 else 'tidak di produksi'
  end as kategori ,  COUNT (*) as jumlah  FROM produksi_sumur GROUP BY kategori order by jumlah desc ; 
  
  
  SELECT lapangan ,
  SUM(CASE WHEN tanggal = '2026-10-01' THEN minyak_bbl ELSE 0 END) AS okt_1,
SUM(CASE WHEN tanggal = '2026-10-02' THEN minyak_bbl ELSE 0 END) AS okt_2
FROM produksi_sumur GROUP by lapangan 
 
 
SELECT lapangan,
ROUND(AVG(air_bbl), 1) AS abaikan_kosong,
ROUND(AVG(COALESCE(air_bbl, 0)), 1) AS kosong_jadi_nol
FROM produksi_sumur
GROUP BY lapangan;

SELECT status , COUNT(*) as jumlah  from produksi_sumur 


SELECT lapangan, SUM(minyak_bbl) AS total_minyak FROM produksi_sumur GROUP BY lapangan ORDER BY total_minyak ASC;



-- 1
SELECT status, COUNT(*) AS jumlah
FROM produksi_sumur
GROUP BY status;
-- Aktif 16, Mati 2, Perawatan 2
-- 2
SELECT lapangan, SUM(minyak_bbl) AS total_minyak
FROM produksi_sumur
GROUP BY lapangan
ORDER BY total_minyak DESC;
-- Duri 723, Minas 485, Bangko 231, Bekasap 222
-- 3
SELECT lapangan, ROUND(AVG(minyak_bbl), 1) AS rata_rata
FROM produksi_sumur
WHERE status = 'Aktif'
GROUP BY lapangan;
-- Bangko 57.8, Bekasap 111.0, Duri 144.6, Minas 97.0
-- 4
SELECT tanggal, SUM(minyak_bbl) AS total_minyak
FROM produksi_sumur
GROUP BY tanggal;
-- 2026-10-01: 895, 2026-10-02: 766
-- 5
SELECT lapangan, COUNT(DISTINCT nama_sumur) AS jumlah_sumur
FROM produksi_sumur
GROUP BY lapangan;
-- Bangko 2, Bekasap 2, Duri 3, Minas 3

-- 6
SELECT lapangan, SUM(minyak_bbl) AS total_minyak
FROM produksi_sumur
GROUP BY lapangan
HAVING SUM(minyak_bbl) > 250;
-- Duri 723, Minas 485
SELECT nama_sumur, SUM(minyak_bbl) AS total_minyak
FROM produksi_sumur
GROUP BY nama_sumur
HAVING SUM(minyak_bbl) > 200
ORDER BY total_minyak DESC;
-- DRI-001 415, MNS-001 238, BKP-001 222
-- 8
SELECT lapangan, COUNT(*) AS baris_aktif
FROM produksi_sumur
WHERE status = 'Aktif'
GROUP BY lapangan
HAVING COUNT(*) >= 4;
-- Bangko 4, Duri 5, Minas 5
-- 9
SELECT nama_sumur, tanggal, minyak_bbl,
CASE
WHEN minyak_bbl >= 150 THEN 'Tinggi'
WHEN minyak_bbl >= 50 THEN 'Sedang'
WHEN minyak_bbl > 0 THEN 'Rendah'
ELSE 'Tidak produksi'
END AS kategori
FROM produksi_sumur;
-- 20 baris, enam baris pertama sama dengan tabel di Materi 3
-- 10
SELECT CASE
WHEN minyak_bbl >= 150 THEN 'Tinggi'
WHEN minyak_bbl >= 50 THEN 'Sedang'
WHEN minyak_bbl > 0 THEN 'Rendah'
ELSE 'Tidak produksi'
END AS kategori,
COUNT(*) AS jumlah
FROM produksi_sumur
GROUP BY kategori
ORDER BY jumlah DESC;
-- Sedang 11, Tidak produksi 4, Tinggi 3, Rendah 2
-- 11
SELECT lapangan, ROUND(AVG(COALESCE(air_bbl, 0)), 1) AS rata_air
FROM produksi_sumur
GROUP BY lapangan;
-- Bangko 152.5, Bekasap 347.5, Duri 853.3, Minas 546.7
sELECT lapangan,
SUM(CASE WHEN tanggal = '2026-10-01' THEN minyak_bbl ELSE 0 END) AS okt_1,
SUM(CASE WHEN tanggal = '2026-10-02' THEN minyak_bbl ELSE 0 END) AS okt_2
FROM produksi_sumur
GROUP BY lapangan;
-- Bangko 115/116, Bekasap 110/112, Duri 455/268, Minas 215/270


CREATE TABLE sumur_info  (
  nama_sumur TEXT PRIMARY KEY,
  jenis_pompa TEXT,
  kedalaman_m INTEGER,
  tahun_bor INTEGER
);
INSERT INTO sumur_info VALUES
('MNS-001','ESP',1500,2012),
('MNS-002','Sucker Rod',1350,2008),
('MNS-003','Sucker Rod',1420,2010),
('MNS-004','ESP',1600,2025),
('DRI-001','Steam',700,2005),
('DRI-002','Steam',650,2006),
('DRI-003','Steam',720,2009),
('BGK-001','Sucker Rod',1100,2015),
('BKP-001','ESP',1250,2018),
('BKP-002','Sucker Rod',1300,2011);

SELECT COUNT(*) from produksi_sumur
SELECT COUNT(*) from sumur_info

SELECT*FROM sumur_info

SELECT p.nama_sumur , p.tanggal , p.minyak_bbl , i.jenis_pompa , i.tahun_bor FROM produksi_sumur p
INNER join sumur_info i on  p.nama_sumur = i.nama_sumur
SELECT i.jenis_pompa, sum (p.minyak_bbl) as total_minyak 
FROM produksi_sumur p 
inner join  sumur_info i on p.nama_sumur  = i.nama_sumur 
GROUP By  i.jenis_pompa  ORDER BY total_minyak DESC
 SELECT p.nama_sumur , i.tahun_bor , p.minyak_bbl 
 FROM produksi_sumur p INNER join sumur_info i on p.nama_sumur = i.nama_sumur 
 WHERE i.tahun_bor <2010 and p. tanggal =  '2026-10-01'
 ORDER by p.minyak_bbl DESC;
 
 SELECT i.jenis_pompa , round(AVG(p.minyak_bbl), 1) as rata_rata 
 FROM produksi_sumur p  INNER join sumur_info i on p.nama_sumur  = i.nama_sumur 
 GROUP by i.jenis_pompa HAVING avg (p.minyak_bbl)>100
 
 SELECT p.nama_sumur , p.tanggal, p.minyak_bbl , i.jenis_pompa 
 from produksi_sumur p 
 left join sumur_info i on  p.nama_sumur = i.nama_sumur ;
 
 SELECT DISTINCT p.nama_sumur 
 From 	produksi_sumur p
 left join sumur_info  i on p.nama_sumur = i.nama_sumur 
 where i.nama_sumur ISNULL
 
 SELECT i.nama_sumur FROM  sumur_info i left JOIN produksi_sumur p on p.nama_sumur 	= i.nama_sumur 	
 WHERE p.nama_sumur IS null
 
 SELECT  i.nama_sumur , coalesce (sum (p.minyak_bbl), 0) AS total_minyak  from sumur_info i 
 LEFT join  produksi_sumur p on  p.nama_sumur = i.nama_sumur GROUP by i.nama_sumur 	ORDER by total_minyak DESC, i.nama_sumur ;
 
 SELECT avg (minyak_bbl) from produksi_sumur 
 SELECT nama_sumur, tanggal minyak_bbl 
 FROM produksi_sumur  WHERE minyak_bbl >(SELECT avg (minyak_bbl ) from produksi_sumur )
 ORDER BY minyak_bbl desc
 
 
 SELECT DISTINCT  nama_sumur  FROM produksi_sumur WHERE nama_sumur in (SELECT nama_sumur FROM sumur_info  WHERE  jenis_pompa ='ESP')
 SELECT  ROUND(avg(total), 1) as rata_total FROM (SELECT nama_sumur , sum(minyak_bbl) as total FROM produksi_sumur GROUP by nama_sumur)
 
 
 -- 1
SELECT p.nama_sumur, p.tanggal, p.minyak_bbl, i.jenis_pompa
FROM produksi_sumur p
INNER JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
WHERE p.tanggal = '2026-10-01';

-- 2
SELECT i.jenis_pompa, SUM(p.minyak_bbl) AS total_minyak
FROM produksi_sumur p
INNER JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
GROUP BY i.jenis_pompa
ORDER BY total_minyak DESC;

-- 3
SELECT p.nama_sumur, i.tahun_bor, p.minyak_bbl
FROM produksi_sumur p
INNER JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
WHERE i.tahun_bor < 2010 AND p.tanggal = '2026-10-01'
ORDER BY p.minyak_bbl DESC;

-- 4
SELECT COUNT(*)
FROM produksi_sumur p
LEFT JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
WHERE i.jenis_pompa IS NULL;

-- 5
SELECT DISTINCT p.nama_sumur
FROM produksi_sumur p
LEFT JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
WHERE i.nama_sumur IS NULL;

-- 6
SELECT i.nama_sumur
FROM sumur_info i
LEFT JOIN produksi_sumur p ON p.nama_sumur = i.nama_sumur
WHERE p.nama_sumur IS NULL;

-- 7
SELECT i.nama_sumur, COALESCE(SUM(p.minyak_bbl), 0) AS total_minyak
FROM sumur_info i
LEFT JOIN produksi_sumur p ON p.nama_sumur = i.nama_sumur
GROUP BY i.nama_sumur
ORDER BY total_minyak DESC, i.nama_sumur;

-- 8
SELECT i.jenis_pompa, ROUND(AVG(p.minyak_bbl), 1) AS rata_rata
FROM produksi_sumur p
INNER JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
GROUP BY i.jenis_pompa
HAVING AVG(p.minyak_bbl) > 100;

-- 9
SELECT nama_sumur, tanggal, minyak_bbl
FROM produksi_sumur
WHERE minyak_bbl > (SELECT AVG(minyak_bbl) FROM produksi_sumur)
ORDER BY minyak_bbl DESC;

-- 10
SELECT DISTINCT nama_sumur
FROM produksi_sumur
WHERE nama_sumur IN (SELECT nama_sumur FROM sumur_info WHERE jenis_pompa = 'ESP');

-- 11
SELECT nama_sumur, kedalaman_m
FROM sumur_info
WHERE kedalaman_m > (SELECT AVG(kedalaman_m) FROM sumur_info)
ORDER BY kedalaman_m DESC;

-- 12
SELECT p.nama_sumur, p.minyak_bbl, i.jenis_pompa
FROM produksi_sumur p
INNER JOIN sumur_info i ON p.nama_sumur = i.nama_sumur


SELECT COUNT (*) FROM produksi_sumur
SELECT COUNT (*) FROM sumur_info
SELECT sqlite_version();


WITH Total_sumur as (
  SELECT nama_sumur , sum( minyak_bbl )  as total 
  FROM produksi_sumur 
  GROUP by  nama_sumur 
  )
  SELECT nama_sumur , total 
  FROM total_sumur 
  WHERE total > (SELECT avg ( total ) FROM  total_sumur ) 
  ORDER by total desc

with harian as (SELECT lapangan,tanggal , sum (minyak_bbl ) as total from produksi_sumur GROUP by lapangan , tanggal )
  SELECT lapangan , max (total) as terbesar 
  FROM harian GROUP by lapangan ORDER by lapangan ;

SELECT nama_sumur, minyak_bbl,
ROW_NUMBER() OVER (ORDER BY minyak_bbl DESC, nama_sumur) AS urutan
FROM produksi_sumur
WHERE tanggal = '2026-10-01';

SELECT nama_sumur, tanggal, minyak_bbl,
ROW_NUMBER() OVER (PARTITION BY tanggal ORDER BY minyak_bbl DESC, nama_sumur) AS
urutan
FROM produksi_sumur;

WITH peringkat AS (
SELECT nama_sumur, tanggal, minyak_bbl,
ROW_NUMBER() OVER (PARTITION BY tanggal ORDER BY minyak_bbl DESC, nama_sumur) AS
urutan
FROM produksi_sumur
)
SELECT * FROM peringkat
WHERE urutan <= 3
ORDER BY tanggal, urutan;


SELECT nama_sumur, minyak_bbl,
RANK() OVER (ORDER BY minyak_bbl DESC) AS peringkat
FROM produksi_sumur
WHERE tanggal = '2026-10-01';




SELECT nama_sumur, tanggal, minyak_bbl,
SUM(minyak_bbl) OVER (PARTITION BY nama_sumur ORDER BY tanggal) AS kumulatif
FROM produksi_sumur
ORDER BY nama_sumur, tanggal;

SELECT nama_sumur, minyak_bbl,
ROUND(100.0 * minyak_bbl / SUM(minyak_bbl) OVER (), 1) AS persen
FROM produksi_sumur
WHERE tanggal = '2026-10-01'
ORDER BY minyak_bbl DESC, nama_sumur;

SELECT lapangan, nama_sumur, minyak_bbl,
ROUND(AVG(minyak_bbl) OVER (PARTITION BY lapangan), 1) AS rata_lapangan
FROM produksi_sumur
WHERE tanggal = '2026-10-01'
ORDER BY lapangan, nama_sumur;


SELECT nama_sumur, tanggal, minyak_bbl,
LAG(minyak_bbl) OVER (PARTITION BY nama_sumur ORDER BY tanggal) AS kemarin,
minyak_bbl - LAG(minyak_bbl) OVER (PARTITION BY nama_sumur ORDER BY tanggal) AS
selisih
FROM produksi_sumur
ORDER BY nama_sumur, tanggal;

WITH x AS (
SELECT nama_sumur, tanggal,
minyak_bbl - LAG(minyak_bbl) OVER (PARTITION BY nama_sumur ORDER BY tanggal) AS
selisih

FROM produksi_sumur
)
SELECT nama_sumur, selisih FROM x WHERE selisih < 0 ORDER BY selisih;


INSERT INTO produksi_sumur VALUES
(21,'MNS-001','Minas','2026-10-03',116,805,'Aktif'),
(22,'MNS-002','Minas','2026-10-03',99,645,'Aktif'),
(23,'MNS-003','Minas','2026-10-03',58,390,'Aktif'),
(24,'DRI-001','Duri','2026-10-03',198,1480,'Aktif'),
(25,'DRI-002','Duri','2026-10-03',0,0,'Perawatan'),
(26,'DRI-003','Duri','2026-10-03',66,420,'Aktif'),
(27,'BGK-001','Bangko','2026-10-03',80,NULL,'Aktif'),
(28,'BGK-002','Bangko','2026-10-03',36,305,'Aktif'),
(29,'BKP-001','Bekasap','2026-10-03',113,695,'Aktif'),
(30,'BKP-002','Bekasap','2026-10-03',0,0,'Mati');


DROP TABLE IF EXISTS lapangan_info;
CREATE TABLE lapangan_info (
  lapangan TEXT PRIMARY KEY,
  jenis_minyak TEXT,
  tahun_mulai INTEGER
);
INSERT INTO lapangan_info VALUES
('Minas','Ringan',2001),
('Duri','Berat',1999),
('Bangko','Ringan',2005),
('Bekasap','Ringan',2003);
-- 1. Validasi: jumlah baris per tanggal
SELECT tanggal, COUNT(*) AS jumlah_baris
FROM produksi_sumur
GROUP BY tanggal;

-- 2. Tren harian: total dan selisih dengan hari sebelumnya
WITH h AS (
SELECT tanggal, SUM(minyak_bbl) AS total
FROM produksi_sumur
GROUP BY tanggal
)
SELECT tanggal, total,
total - LAG(total) OVER (ORDER BY tanggal) AS selisih
FROM h
ORDER BY tanggal;

-- 3. Peringkat lapangan menurut total tiga hari
WITH t AS (
SELECT lapangan, SUM(minyak_bbl) AS total
FROM produksi_sumur
GROUP BY lapangan
)
SELECT lapangan, total,
RANK() OVER (ORDER BY total DESC) AS peringkat
FROM t
ORDER BY peringkat;

-- 4. Kategori produksi per tanggal
SELECT tanggal,
CASE
WHEN minyak_bbl >= 150 THEN 'Tinggi'
WHEN minyak_bbl >= 50 THEN 'Sedang'
WHEN minyak_bbl > 0 THEN 'Rendah'
ELSE 'Tidak produksi'
END AS kategori,
COUNT(*) AS jumlah
FROM produksi_sumur
GROUP BY tanggal, kategori

ORDER BY tanggal, kategori;

-- 5. Sumur dengan produksi 0 minimal dua hari
SELECT nama_sumur, COUNT(*) AS hari_nol
FROM produksi_sumur
WHERE minyak_bbl = 0
GROUP BY nama_sumur
HAVING COUNT(*) >= 2
ORDER BY hari_nol DESC;

-- 6. Ringkasan per jenis pompa
SELECT i.jenis_pompa,
SUM(p.minyak_bbl) AS total,
COUNT(DISTINCT p.nama_sumur) AS jumlah_sumur,
ROUND(1.0 * SUM(p.minyak_bbl) / COUNT(DISTINCT p.nama_sumur), 1) AS rata_per_sumur
FROM produksi_sumur p
JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
GROUP BY i.jenis_pompa
ORDER BY total DESC;

-- 7. Total menurut jenis minyak
SELECT l.jenis_minyak, SUM(p.minyak_bbl) AS total
FROM produksi_sumur p
JOIN lapangan_info l ON p.lapangan = l.lapangan
GROUP BY l.jenis_minyak
ORDER BY total DESC;

-- 8. Dua sumur terbaik per lapangan
WITH t AS (
SELECT lapangan, nama_sumur, SUM(minyak_bbl) AS total
FROM produksi_sumur
GROUP BY lapangan, nama_sumur), r AS (SELECT lapangan, nama_sumur, total,
ROW_NUMBER() OVER (PARTITION BY lapangan ORDER BY total DESC, nama_sumur) AS u
FROM t
)
SELECT lapangan, nama_sumur, total, u
FROM r
WHERE u <= 2
ORDER BY lapangan, u;
-- 9. Kumulatif per lapangan
WITH h AS (
SELECT lapangan, tanggal, SUM(minyak_bbl) AS total
FROM produksi_sumur
GROUP BY lapangan, tanggal
)
SELECT lapangan, tanggal, total,
SUM(total) OVER (PARTITION BY lapangan ORDER BY tanggal) AS kumulatif
FROM h
ORDER BY lapangan, tanggal;

-- 10. Tren naik dua hari berturut-turut
WITH x AS (
SELECT nama_sumur,
minyak_bbl - LAG(minyak_bbl) OVER (PARTITION BY nama_sumur ORDER BY tanggal) AS s
FROM produksi_sumur
)
SELECT nama_sumur
FROM x
GROUP BY nama_sumur
HAVING SUM(CASE WHEN s > 0 THEN 1 ELSE 0 END) = 2
ORDER BY nama_sumur;

-- 11. Sumur di produksi tapi tidak ada di sumur_info
SELECT DISTINCT p.nama_sumur
FROM produksi_sumur p
LEFT JOIN sumur_info i ON p.nama_sumur = i.nama_sumur
WHERE i.nama_sumur IS NULL;

-- 12. Sumur dengan air_bbl kosong di semua baris
SELECT nama_sumur, COUNT(*) AS baris, COUNT(air_bbl) AS air_terisi
FROM produksi_sumur
GROUP BY nama_sumur
HAVING COUNT(air_bbl) = 0;





