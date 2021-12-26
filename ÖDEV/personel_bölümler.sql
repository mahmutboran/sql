CREATE TABLE bölümler (bölüm_id INTEGER PRIMARY KEY, bölüm_isim TEXT,konum TEXT);
INSERT INTO bölümler VALUES(10,'MUHASEBE','IST'),
(20,'MUDURLUK','ANKARA'),(30,'SATIS','IZMIR'),(40,'ISLETME','BURSA'),(50,'DEPO','YOZGAT');

CREATE TABLE personel (personel_id INTEGER PRIMARY KEY, 
personel_isim TEXT, meslek TEXT, 
müdür_id INTEGER,ise_baslama DATE, maas REAL, bölüm_id INTEGER, FOREIGN KEY (bölüm_id) REFERENCES bölümler(bölüm_id));

  INSERT INTO personel VALUES (7369,'AHMET','KATIP',7902,'17-12-1980',800,20);
  INSERT INTO personel VALUES (7499,'BAHATTIN','SATIS',7698,'20-2-1981',1600,30);
  INSERT INTO personel VALUES (7521,'NESE','SATIS',7698,'22-2-1981',1250,30);
  INSERT INTO personel VALUES (7566,'MUZAFFER','MUDUR',7839,'2-4-1981',2975,20);
  INSERT INTO personel VALUES (7654,'MUHAMMET','SATIS',7698,'28-9-1981',1250,30);
  INSERT INTO personel VALUES (7698,'EMINE','MUDUR',7839,'1-5-1981',2850,30);
  INSERT INTO personel VALUES (7782,'HARUN','MUDUR',7839,'9-6-1981', 2450,10);
  INSERT INTO personel VALUES (7788,'MESUT','ANALIST',7566,'13-07-87',3000,20);
  INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,'17-11-1981',5000,10);
  INSERT INTO personel VALUES (7844,'DUYGU','SATIS',7698,'8-9-1981',1500,30);
  INSERT INTO personel VALUES (7876,'ALI','KATIP',7788,'13-07-87',1100,20);
  INSERT INTO personel VALUES (7900,'MERVE','KATIP',7698,'3-12-1981',950,30);
  INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',7566,'3-12-1981',3000,20);
  INSERT INTO personel VALUES (7934,'EBRU','KATIP',7782,'23-1-1982',1300,10);
  
SELECT bölüm_isim,personel_isim  FROM personel p
JOIN bölümler b ON b.bölüm_id=p.bölüm_id
WHERE b.bölüm_isim IN('MUHASEBE','SATIS');

SELECT personel_isim,bölüm_isim,ise_baslama  FROM bölümler b
LEFT JOIN personel p  ON b.bölüm_id=p.bölüm_id
WHERE b.bölüm_isim IN('ISLETME','SATIS','DEPO')
ORDER BY personel_isim ;

SELECT personel_isim,bölüm_isim,maas  FROM bölümler b
LEFT JOIN personel p  ON b.bölüm_id=p.bölüm_id
ORDER BY bölüm_isim ASC,maas DESC ;

SELECT personel_isim,bölüm_isim,maas  FROM bölümler b
LEFT JOIN personel p  ON b.bölüm_id=p.bölüm_id AND maas>=2000
WHERE b.bölüm_isim IN('MUDURLUK','SATIS') 
ORDER BY b.bölüm_id,personel_isim ;

SELECT bölüm_isim,personel_isim,maas  FROM bölümler b
JOIN personel p  ON b.bölüm_id=p.bölüm_id
WHERE personel_isim IN('MESUT','EMINE') 

SELECT bölüm_isim,personel_isim,maas,  (SELECT personel_isim FROM personel WHERE personel_id=p.müdür_id) as mudur_adı 
FROM bölümler b
JOIN personel p  ON b.bölüm_id=p.bölüm_id 
WHERE p.müdür_id IN(7788,7698) 
ORDER BY maas DESC ;
