CREATE TABLE calisanlar (id CHAR(4), isim VARCHAR2(50), maas NUMBER(5),CONSTRAINT id_pk PRIMARY KEY(id));

INSERT INTO calisanlar
VALUES ('1001','Ahmet Aslan',7000),
('1002','Mehmet Yılmaz',12000),
('1003','Meryem',7215),
('1004','Veli Han',5000);

CREATE TABLE aileler (id CHAR(4),cocuk_sayisi VARCHAR2(50),ek_gelir NUMBER(5),
CONSTRAINT id_fk FOREIGN KEY(id) REFERENCES calisanlar(id));

INSERT INTO aileler VALUES('1001',4,2000),('1002',2,1500),('1003',1,2200),('1004',3,2400);

UPDATE calisanlar 
SET maas=(SELECT maas FROM calisanlar WHERE isim='Veli Han')*1.20
WHERE isim='Veli Han';


UPDATE calisanlar 
SET maas=(SELECT maas FROM calisanlar WHERE isim='Veli Han')*1.20
WHERE isim='Veli Han';

UPDATE calisanlar 
SET maas=maas*1.20
WHERE maas<(SELECT AVG(maas) FROM calisanlar );

SELECT calisanlar.isim,aileler.cocuk_sayisi
FROM aileler
JOIN calisanlar ON aileler.id=calisanlar.id;

SELECT calisanlar.id,calisanlar.isim,aileler.ek_gelir+calisanlar.maas As TOPLAM_GELIR
FROM calisanlar
JOIN aileler
ON calisanlar.id=aileler.id; 

UPDATE calisanlar 
SET maas=maas*1.10
WHERE(SELECT (ek_gelir + maas)/(cocuk_sayisi + 2) FROM aileler WHERE calisanlar.id=aileler.id)<2000;