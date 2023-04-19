CREATE DATABASE firma; -- 1. Utworzenie bazy danych o nazwie "firma"

CREATE SCHEMA rozliczenia; -- 2. Utworzenie schematu o nazwie "rozliczenia"

-- 3. Dodanie do schematu 4 tabel: "pracownicy", "godziny", "pensje", "premie"
CREATE TABLE rozliczenia.pracownicy (
	id_pracownika INT PRIMARY KEY NOT NULL,
	imie VARCHAR(40) NOT NULL,
	nazwisko VARCHAR(40) NOT NULL,
	adres VARCHAR(50) NOT NULL,
	telefon CHAR(9) NOT NULL,
);

CREATE TABLE rozliczenia.godziny (
	id_godziny INT PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	liczba_godzin SMALLINT NOT NULL,
	id_pracownika INT NOT NULL,
);

CREATE TABLE rozliczenia.pensje (
	id_pensji INT PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(30),
	kwota DECIMAL(7,2) NOT NULL,
	id_premii INT NOT NULL,
);

CREATE TABLE rozliczenia.premie (
	id_premii INT PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(40),
	kwota DECIMAL(5,2) NOT NULL,
);

-- 3d. Utworzenie kluczów obcych
ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

-- 4. Dodanie po 10 rekordów dla ka¿dej tabeli
INSERT INTO rozliczenia.pracownicy VALUES (1, 'Adam', 'Koj', '31-867 Kraków ul. al. Mickiewicza 15', 546875375);
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Ewa', 'Koc', '22-005 Warszawa ul. Maki 22/34', 468558497);
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Stefan', 'Maj', '32-890 Bochnia ul. Zwierzyniecka 5', 412148854);
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Mateusz', 'Kowalski', '32-768 Wieliczka ul. Dobczycka 78/1', 889614225);
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Katarzyna', 'Nowak', '33-657 Niepo³omice ul. D¹browskiej 80', 458874785);
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Jan', 'Adamczyk', '30-059 Kraków ul. Prosta 65/45', 775781658);
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Weronika', 'Kula', '35-890 Katowice ul. Magnoliowa 1b', 995845756);
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Filip', 'Las', '70-388 Lublin ul. Zak¹tek 3/49', 654785441);
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Natalia', 'Drabek', '31-098 Kraków ul. Krótka 56', 658598745);
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Wojciech', 'Maj', '90-001 £ódŸ ul. D¹browskiej 3a', 971384527);

INSERT INTO rozliczenia.godziny VALUES (1, '2023-03-23', 7, 1);
INSERT INTO rozliczenia.godziny VALUES (2, '2023-03-23', 10, 5);
INSERT INTO rozliczenia.godziny VALUES (3, '2023-03-24', 8, 4);
INSERT INTO rozliczenia.godziny VALUES (4, '2023-03-24', 8, 9);
INSERT INTO rozliczenia.godziny VALUES (5, '2023-03-30', 7, 1);
INSERT INTO rozliczenia.godziny VALUES (6, '2023-03-30', 12, 10);
INSERT INTO rozliczenia.godziny VALUES (7, '2023-03-15', 9, 5);
INSERT INTO rozliczenia.godziny VALUES (8, '2023-03-16', 9, 6);
INSERT INTO rozliczenia.godziny VALUES (9, '2023-04-08', 8, 8);
INSERT INTO rozliczenia.godziny VALUES (10, '2023-04-08', 8, 2);

INSERT INTO rozliczenia.premie VALUES (1, 'regulaminowa', 50.00);
INSERT INTO rozliczenia.premie VALUES (2, 'uznaniowa', 100.00);
INSERT INTO rozliczenia.premie VALUES (3, 'motywacyjna', 150.00);
INSERT INTO rozliczenia.premie VALUES (4, 'zadaniowa', 200.00);
INSERT INTO rozliczenia.premie VALUES (5, 'prowizyjna', 100.00);
INSERT INTO rozliczenia.premie VALUES (6, 'indywidualna', 300.00);
INSERT INTO rozliczenia.premie VALUES (7, 'zespo³owa', 100.00);
INSERT INTO rozliczenia.premie VALUES (8, 'frekwencyjna', 130.00);
INSERT INTO rozliczenia.premie VALUES (9, 'wynikowa', 400.00);
INSERT INTO rozliczenia.premie VALUES (10, 'œwi¹teczna', 200.00);

INSERT INTO rozliczenia.pensje VALUES (1, 'szef kuchni', 4000.0, 4);
INSERT INTO rozliczenia.pensje VALUES (2, 'kelner/ka', 3000.0, 2);
INSERT INTO rozliczenia.pensje VALUES (3, 'ochroniarz', 2500.0, 6);
INSERT INTO rozliczenia.pensje VALUES (4, 'pomocnik kuchenny', 3500.0, 5);
INSERT INTO rozliczenia.pensje VALUES (5, 'ksiêgowa', 4200.0, 4);
INSERT INTO rozliczenia.pensje VALUES (6, 'informatyk', 2200.0, 1);
INSERT INTO rozliczenia.pensje VALUES (7, 'kadrowy/a', 4200.0, 8);
INSERT INTO rozliczenia.pensje VALUES (8, 'kierownik', 4500.0, 3);
INSERT INTO rozliczenia.pensje VALUES (9, 'w³aœciciel', 6000.0, 3);
INSERT INTO rozliczenia.pensje VALUES (10, 'zastêpca w³aœciciela', 5500.0, 7);

-- 5. Wyœwietlenie nazwisk i adresów pracowników
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

-- 6. 
SELECT DATEPART(weekday, data) AS dzien_tygodnia, DATEPART(month, data) AS miesiac FROM rozliczenia.godziny; -- Konwersja daty na dzieñ tygodnia i numer miesi¹ca
ALTER TABLE rozliczenia.godziny ADD dzien_tygodnia SMALLINT; -- Dodanie tych dwóch danych jako nowe kolumny do tabeli "godziny"
ALTER TABLE rozliczenia.godziny ADD miesiac SMALLINT;	

-- 7. 
EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto'; -- Zmiana nazwy atrybutu "kwota" na "kwota_brutto"
ALTER TABLE rozliczenia.pensje ADD kwota_netto DECIMAL(7,2); -- Dodanie nowego atrybutu o nazwie "kwota_netto" do tabeli "pensje"
UPDATE rozliczenia.pensje SET kwota_netto = 0.77*kwota_brutto; -- Obliczenie wartoœci kwoty netto
SELECT kwota_brutto, kwota_netto FROM rozliczenia.pensje; -- Wyœwietlenie kwot: brutto i netto z tabeli "pensje"