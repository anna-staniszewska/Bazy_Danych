-- Utworzenie bazy o nazwie projekt i przełączenie się na nią
CREATE DATABASE projekt;
USE projekt;

-- Utworzenie 5 tabel dla schematu znormalizowanego
CREATE TABLE projekt.geoeon (
	id_eon SMALLINT PRIMARY KEY,
    nazwa_eon VARCHAR(30) NOT NULL
);

CREATE TABLE projekt.geoera (
	id_era SMALLINT PRIMARY KEY,
    id_eon SMALLINT NOT NULL,
    FOREIGN KEY (id_eon) REFERENCES projekt.geoeon(id_eon),
    nazwa_era VARCHAR(30) NOT NULL
);

CREATE TABLE projekt.geookres (
	id_okres SMALLINT PRIMARY KEY,
    id_era SMALLINT NOT NULL,
    FOREIGN KEY (id_era) REFERENCES projekt.geoera(id_era),
    nazwa_okres VARCHAR(30) NOT NULL
);

CREATE TABLE projekt.geoepoka (
	id_epoka SMALLINT PRIMARY KEY,
    id_okres SMALLINT NOT NULL,
    FOREIGN KEY (id_okres) REFERENCES projekt.geookres(id_okres),
    nazwa_epoka VARCHAR(30) NOT NULL
);

CREATE TABLE projekt.geopietro (
	id_pietro SMALLINT PRIMARY KEY,
    id_epoka SMALLINT NOT NULL,
    FOREIGN KEY (id_epoka) REFERENCES projekt.geoepoka(id_epoka),
    nazwa_pietro VARCHAR(30) NOT NULL
);

INSERT INTO projekt.geoeon VALUES (1, 'fanerozoik');

INSERT INTO projekt.geoera VALUES (1, 1, 'paleozoik');
INSERT INTO projekt.geoera VALUES (2, 1, 'mezozoik');
INSERT INTO projekt.geoera VALUES (3, 1, 'kenozoik');

INSERT INTO projekt.geookres VALUES (1, 1, 'dewon');
INSERT INTO projekt.geookres VALUES (2, 1, 'karbon');
INSERT INTO projekt.geookres VALUES (3, 1, 'perm');
INSERT INTO projekt.geookres VALUES (4, 2, 'trias');
INSERT INTO projekt.geookres VALUES (5, 2, 'jura');
INSERT INTO projekt.geookres VALUES (6, 2, 'kreda');
INSERT INTO projekt.geookres VALUES (7, 3, 'paleogen');
INSERT INTO projekt.geookres VALUES (8, 3, 'neogen');
INSERT INTO projekt.geookres VALUES (9, 3, 'czwartorzęd');

INSERT INTO projekt.geoepoka VALUES (1, 1, 'dewon dolny');
INSERT INTO projekt.geoepoka VALUES (2, 1, 'dewon środkowy');
INSERT INTO projekt.geoepoka VALUES (3, 1, 'dewon górny');
INSERT INTO projekt.geoepoka VALUES (4, 2, 'karbon dolny');
INSERT INTO projekt.geoepoka VALUES (5, 2, 'karbon górny');
INSERT INTO projekt.geoepoka VALUES (6, 3, 'perm dolny');
INSERT INTO projekt.geoepoka VALUES (7, 3, 'perm górny');
INSERT INTO projekt.geoepoka VALUES (8, 4, 'trias dolny');
INSERT INTO projekt.geoepoka VALUES (9, 4, 'trias środkowy');
INSERT INTO projekt.geoepoka VALUES (10, 4, 'trias górny');
INSERT INTO projekt.geoepoka VALUES (11, 5, 'jura dolna');
INSERT INTO projekt.geoepoka VALUES (12, 5, 'jura środkowa');
INSERT INTO projekt.geoepoka VALUES (13, 5, 'jura górna');
INSERT INTO projekt.geoepoka VALUES (14, 6, 'kreda dolna');
INSERT INTO projekt.geoepoka VALUES (15, 6, 'kreda środkowa');
INSERT INTO projekt.geoepoka VALUES (16, 6, 'kreda górna');
INSERT INTO projekt.geoepoka VALUES (17, 7, 'paleocen');
INSERT INTO projekt.geoepoka VALUES (18, 7, 'eocen');
INSERT INTO projekt.geoepoka VALUES (19, 7, 'oligocen');
INSERT INTO projekt.geoepoka VALUES (20, 8, 'miocen');
INSERT INTO projekt.geoepoka VALUES (21, 8, 'pliocen');
INSERT INTO projekt.geoepoka VALUES (22, 9, 'plejstocen');
INSERT INTO projekt.geoepoka VALUES (23, 9, 'halocen');

INSERT INTO projekt.geopietro VALUES (1, 1, 'lochkow');
INSERT INTO projekt.geopietro VALUES (2, 1, 'prag');
INSERT INTO projekt.geopietro VALUES (3, 1, 'ems');
INSERT INTO projekt.geopietro VALUES (4, 2, 'eifel');
INSERT INTO projekt.geopietro VALUES (5, 2, 'żywet');
INSERT INTO projekt.geopietro VALUES (6, 3, 'fran');
INSERT INTO projekt.geopietro VALUES (7, 3, 'famen');
INSERT INTO projekt.geopietro VALUES (8, 4, 'turnej');
INSERT INTO projekt.geopietro VALUES (9, 4, 'wizen');
INSERT INTO projekt.geopietro VALUES (10, 4, 'serpuchow');
INSERT INTO projekt.geopietro VALUES (11, 5, 'baszkir');
INSERT INTO projekt.geopietro VALUES (12, 5, 'moskow');
INSERT INTO projekt.geopietro VALUES (13, 5, 'kasimow');
INSERT INTO projekt.geopietro VALUES (14, 5, 'gżel');
INSERT INTO projekt.geopietro VALUES (15, 6, 'assel');
INSERT INTO projekt.geopietro VALUES (16, 6, 'sakmar');
INSERT INTO projekt.geopietro VALUES (17, 6, 'artinsk');
INSERT INTO projekt.geopietro VALUES (18, 6, 'kungur');
INSERT INTO projekt.geopietro VALUES (19, 7, 'road');
INSERT INTO projekt.geopietro VALUES (20, 7, 'word');
INSERT INTO projekt.geopietro VALUES (21, 7, 'kapitan');
INSERT INTO projekt.geopietro VALUES (22, 7, 'wucziaping');
INSERT INTO projekt.geopietro VALUES (23, 7, 'czangsing');
INSERT INTO projekt.geopietro VALUES (24, 8, 'ind');
INSERT INTO projekt.geopietro VALUES (25, 8, 'olenek');
INSERT INTO projekt.geopietro VALUES (26, 9, 'anizyk');
INSERT INTO projekt.geopietro VALUES (27, 9, 'ladyn');
INSERT INTO projekt.geopietro VALUES (28, 10, 'karnik');
INSERT INTO projekt.geopietro VALUES (29, 10, 'noryk');
INSERT INTO projekt.geopietro VALUES (30, 10, 'retyk');
INSERT INTO projekt.geopietro VALUES (31, 11, 'hettang');
INSERT INTO projekt.geopietro VALUES (32, 11, 'synemur');
INSERT INTO projekt.geopietro VALUES (33, 11, 'toark');
INSERT INTO projekt.geopietro VALUES (34, 12, 'aalen');
INSERT INTO projekt.geopietro VALUES (35, 12, 'bajos');
INSERT INTO projekt.geopietro VALUES (36, 12, 'baton');
INSERT INTO projekt.geopietro VALUES (37, 12, 'kelowej');
INSERT INTO projekt.geopietro VALUES (38, 13, 'oksford');
INSERT INTO projekt.geopietro VALUES (39, 13, 'kimeryd');
INSERT INTO projekt.geopietro VALUES (40, 13, 'tyton');
INSERT INTO projekt.geopietro VALUES (41, 14, 'berrias');
INSERT INTO projekt.geopietro VALUES (42, 14, 'walanżyn');
INSERT INTO projekt.geopietro VALUES (43, 14, 'hoteryw');
INSERT INTO projekt.geopietro VALUES (44, 14, 'barrem');
INSERT INTO projekt.geopietro VALUES (45, 14, 'apt');
INSERT INTO projekt.geopietro VALUES (46, 14, 'alb');
INSERT INTO projekt.geopietro VALUES (47, 15, 'cenoman');
INSERT INTO projekt.geopietro VALUES (48, 15, 'turon');
INSERT INTO projekt.geopietro VALUES (49, 15, 'koniak');
INSERT INTO projekt.geopietro VALUES (50, 15, 'santon');
INSERT INTO projekt.geopietro VALUES (51, 15, 'kampan');
INSERT INTO projekt.geopietro VALUES (52, 15, 'mastrycht');
INSERT INTO projekt.geopietro VALUES (53, 16, 'dan');
INSERT INTO projekt.geopietro VALUES (54, 16, 'zeland');
INSERT INTO projekt.geopietro VALUES (55, 16, 'tanet');
INSERT INTO projekt.geopietro VALUES (56, 17, 'iprez');
INSERT INTO projekt.geopietro VALUES (57, 17, 'lutet');
INSERT INTO projekt.geopietro VALUES (58, 17, 'barton');
INSERT INTO projekt.geopietro VALUES (59, 17, 'priabon');
INSERT INTO projekt.geopietro VALUES (60, 18, 'rupel');
INSERT INTO projekt.geopietro VALUES (61, 19, 'szat');
INSERT INTO projekt.geopietro VALUES (62, 20, 'akwitan');
INSERT INTO projekt.geopietro VALUES (63, 20, 'burdygał');
INSERT INTO projekt.geopietro VALUES (64, 20, 'lang');
INSERT INTO projekt.geopietro VALUES (65, 20, 'serrawal');
INSERT INTO projekt.geopietro VALUES (66, 20, 'torton');
INSERT INTO projekt.geopietro VALUES (67, 20, 'messyn');
INSERT INTO projekt.geopietro VALUES (68, 21, 'zanki');
INSERT INTO projekt.geopietro VALUES (69, 21, 'piacent');
INSERT INTO projekt.geopietro VALUES (70, 22, 'gelas');
INSERT INTO projekt.geopietro VALUES (71, 22, 'kalabr');
INSERT INTO projekt.geopietro VALUES (72, 22, 'chiban');
INSERT INTO projekt.geopietro VALUES (73, 22, 'plejstocen górny');
INSERT INTO projekt.geopietro VALUES (74, 23, 'grenland');
INSERT INTO projekt.geopietro VALUES (75, 23, 'northgrip');
INSERT INTO projekt.geopietro VALUES (76, 23, 'megalaj');

-- Utworzenie tabeli dla schematu zdenormalizowanego
CREATE TABLE projekt.geotabela AS (SELECT * FROM projekt.geopietro 
NATURAL JOIN projekt.geoepoka NATURAL JOIN projekt.geookres NATURAL JOIN projekt.geoera NATURAL JOIN projekt.geoeon );
ALTER TABLE projekt.geotabela ADD PRIMARY KEY(id_pietro);

-- Utworzenie tabeli dziesiec
CREATE TABLE projekt.dziesiec(cyfra int, bit int);
INSERT INTO projekt.dziesiec VALUES (0,1);
INSERT INTO projekt.dziesiec VALUES (1,1);
INSERT INTO projekt.dziesiec VALUES (2,1);
INSERT INTO projekt.dziesiec VALUES (3,1);
INSERT INTO projekt.dziesiec VALUES (4,1);
INSERT INTO projekt.dziesiec VALUES (5,1);
INSERT INTO projekt.dziesiec VALUES (6,1);
INSERT INTO projekt.dziesiec VALUES (7,1);
INSERT INTO projekt.dziesiec VALUES (8,1);
INSERT INTO projekt.dziesiec VALUES (9,1);

-- Utworzenie tabeli milion
CREATE TABLE projekt.milion(liczba int,cyfra int, bit int);
INSERT INTO projekt.milion SELECT a1.cyfra + 10* a2.cyfra + 100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 10000*a6.cyfra AS liczba, a1.cyfra AS cyfra, a1.bit AS bit
FROM projekt.dziesiec a1, projekt.dziesiec a2, projekt.dziesiec a3, projekt.dziesiec a4, projekt.dziesiec a5, projekt.dziesiec a6;

-- Zapytanie 1 ZL
SELECT COUNT(*) FROM projekt.milion m INNER JOIN projekt.geotabela t 
ON mod(m.liczba,76)=(t.id_pietro);

-- Zapytanie 2 ZL
SELECT COUNT(*) FROM projekt.milion m INNER JOIN projekt.geopietro p ON
(mod(m.liczba,76)=p.id_pietro) NATURAL JOIN projekt.geoepoka NATURAL JOIN
projekt.geookres NATURAL JOIN projekt.geoera NATURAL JOIN projekt.geoeon;

-- Zapytanie 3 ZG
SELECT COUNT(*) FROM projekt.milion m WHERE 
mod(m.liczba,76) IN (SELECT id_pietro FROM projekt.geotabela 
WHERE mod(m.liczba,76) IN (id_pietro));

-- Zapytanie 4 ZG
SELECT COUNT(*) FROM projekt.milion m WHERE mod(m.liczba,76) IN
(SELECT projekt.geopietro.id_pietro FROM projekt.geopietro NATURAL JOIN projekt.geoepoka NATURAL JOIN
projekt.geookres NATURAL JOIN projekt.geoera NATURAL JOIN projekt.geoeon);

-- Nałożenie indeksów na kolumny biorące udział w złączeniach
CREATE INDEX ieon_nazwa ON projekt.geoeon(nazwa_eon);
CREATE INDEX iera_nazwa ON projekt.geoera(nazwa_era);
CREATE INDEX ieon_fk ON projekt.geoera(id_eon);
CREATE INDEX iokres_nazwa ON projekt.geookres(nazwa_okres);
CREATE INDEX iera_fk ON projekt.geookres(id_era);
CREATE INDEX iepoka_nazwa ON projekt.geoepoka(nazwa_epoka);
CREATE INDEX iokres_fk ON projekt.geoepoka(id_okres);
CREATE INDEX ipietro_nazwa ON projekt.geopietro(nazwa_pietro);
CREATE INDEX iepoka_fk ON projekt.geopietro(id_epoka);
CREATE INDEX iliczba ON projekt.milion(liczba);
CREATE INDEX icyfra ON projekt.milion(cyfra);
CREATE INDEX ibit ON projekt.milion(bit);
CREATE INDEX itabela ON projekt.geotabela(id_eon, id_era, id_okres, id_epoka, 
nazwa_eon, nazwa_era, nazwa_okres, nazwa_epoka, nazwa_pietro);
