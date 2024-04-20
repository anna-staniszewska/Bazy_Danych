-- 1. Utworzenie bazy danych o nazwie "firma2"
CREATE DATABASE firma2; 

-- 2. Utworzenie schematu o nazwie "ksiegowosc"
CREATE SCHEMA ksiegowosc; 

-- 3. Dodanie do schematu 5 tabel: "pracownicy", "godziny", "pensje", "premie", "wynagrodzenia"
CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika VARCHAR(6) PRIMARY KEY,
	imie VARCHAR(40) NOT NULL,
	nazwisko VARCHAR(40) NOT NULL,
	adres VARCHAR(50) NOT NULL,
	telefon CHAR(9) NOT NULL,
);

CREATE TABLE ksiegowosc.godziny (
	id_godziny VARCHAR(3) PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin SMALLINT NOT NULL,
	id_pracownika VARCHAR(6) NOT NULL,
);

CREATE TABLE ksiegowosc.pensje (
	id_pensji VARCHAR(4) PRIMARY KEY,
	stanowisko VARCHAR(30) NOT NULL,
	kwota DECIMAL(7,2) NOT NULL,
);

CREATE TABLE ksiegowosc.premie (
	id_premii VARCHAR(4) PRIMARY KEY,
	rodzaj VARCHAR(40) NOT NULL,
	kwota DECIMAL(5,2) NOT NULL,
);

CREATE TABLE ksiegowosc.wynagrodzenia (
	id_wynagrodzenia VARCHAR(3) PRIMARY KEY,
	data DATE NOT NULL,
	id_pracownika VARCHAR(6) NOT NULL,
	id_godziny VARCHAR(3) NOT NULL,
	id_pensji VARCHAR(4) NOT NULL,
	id_premii VARCHAR(4),
);

-- 3b. Utworzenie klucz�w obcych
ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);

-- 3c. Utworzenie komentarz�w dla ka�dej tabeli
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "pracownicy"',
@value = N'Informacja o danych osobowych pracownik�w.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pracownicy';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "godziny"',
@value = N'Informacja o miesi�cu przepracowanym przez danego pracownika: data, liczba godzin.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'godziny';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "pensje"',
@value = N'Informacja o wysoko�ci pensji dla danego stanowiska.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pensje';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "premie"',
@value = N'Informacja o rodzaju i wysoko�ci premii.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'premie';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "wynagrodzenia"',
@value = N'Informacja o wysoko�ci wynagrodzenia, kt�re zawiera pensj� i premi� dla ka�dego pracownika.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'wynagrodzenia';
GO

-- 4. Dodanie po 10 rekord�w dla ka�dej tabeli
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL1', 'Adam', 'Koj', '31-867 Krak�w ul. al. Mickiewicza 15', 546875375);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL2', 'Ewa', 'Koc', '22-005 Warszawa ul. Maki 22/34', 468558497);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL3', 'Stefan', 'Maj', '32-890 Bochnia ul. Zwierzyniecka 5', 412148854);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL4', 'Mateusz', 'Kowalski', '32-768 Wieliczka ul. Dobczycka 78/1', 889614225);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL5', 'Katarzyna', 'Nowak', '33-657 Niepo�omice ul. D�browskiej 80', 458874785);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL6', 'Jan', 'Adamczyk', '30-059 Krak�w ul. Prosta 65/45', 775781658);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL7', 'Weronika', 'Kula', '35-890 Katowice ul. Magnoliowa 1b', 995845756);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL8', 'Filip', 'Las', '70-388 Lublin ul. Zak�tek 3/49', 654785441);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL9', 'Natalia', 'Drabek', '31-098 Krak�w ul. Kr�tka 56', 658598745);
INSERT INTO ksiegowosc.pracownicy VALUES ('EMPL10', 'Wojciech', 'Maj', '90-001 ��d� ul. D�browskiej 3a', 971384527);

INSERT INTO ksiegowosc.godziny VALUES ('H1', '2023-03-23', 170, 'EMPL1');
INSERT INTO ksiegowosc.godziny VALUES ('H2', '2023-03-23', 160, 'EMPL2');
INSERT INTO ksiegowosc.godziny VALUES ('H3', '2023-03-24', 180, 'EMPL3');
INSERT INTO ksiegowosc.godziny VALUES ('H4', '2023-03-24', 80, 'EMPL4');
INSERT INTO ksiegowosc.godziny VALUES ('H5', '2023-03-30', 170, 'EMPL5');
INSERT INTO ksiegowosc.godziny VALUES ('H6', '2023-03-30', 120, 'EMPL6');
INSERT INTO ksiegowosc.godziny VALUES ('H7', '2023-03-15', 90, 'EMPL7');
INSERT INTO ksiegowosc.godziny VALUES ('H8', '2023-03-16', 160, 'EMPL8');
INSERT INTO ksiegowosc.godziny VALUES ('H9', '2023-04-08', 140, 'EMPL9');
INSERT INTO ksiegowosc.godziny VALUES ('H10', '2023-04-08', 180, 'EMPL10');

INSERT INTO ksiegowosc.pensje VALUES ('PN1', 'szef kuchni', 4000.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN2', 'kelner/ka', 3000.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN3', 'ochroniarz', 900.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN4', 'pomocnik kuchenny', 3500.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN5', 'ksi�gowa', 4200.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN6', 'informatyk', 1150.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN7', 'kadrowy/a', 4200.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN8', 'kierownik', 4500.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN9', 'w�a�ciciel', 6000.0);
INSERT INTO ksiegowosc.pensje VALUES ('PN10', 'zast�pca w�a�ciciela', 5500.0);

INSERT INTO ksiegowosc.premie VALUES ('PR1', 'regulaminowa', 50.00);
INSERT INTO ksiegowosc.premie VALUES ('PR2', 'uznaniowa', 100.00);
INSERT INTO ksiegowosc.premie VALUES ('PR3', 'motywacyjna', 150.00);
INSERT INTO ksiegowosc.premie VALUES ('PR4', 'zadaniowa', 200.00);
INSERT INTO ksiegowosc.premie VALUES ('PR5', 'prowizyjna', 100.00);
INSERT INTO ksiegowosc.premie VALUES ('PR6', 'indywidualna', 300.00);
INSERT INTO ksiegowosc.premie VALUES ('PR7', 'zespo�owa', 100.00);
INSERT INTO ksiegowosc.premie VALUES ('PR8', 'frekwencyjna', 130.00);
INSERT INTO ksiegowosc.premie VALUES ('PR9', 'wynikowa', 400.00);
INSERT INTO ksiegowosc.premie VALUES ('PR10', '�wi�teczna', 200.00);

INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W1', '10-04-2023', 'EMPL1', 'H1', 'PN1', 'PR8');
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W2', '10-04-2023', 'EMPL2', 'H2', 'PN4', NULL);
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W3', '10-04-2023', 'EMPL3', 'H3', 'PN2', 'PR8');
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W4', '10-04-2023', 'EMPL4', 'H4', 'PN6', 'PR4');
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W5', '10-04-2023', 'EMPL5', 'H5', 'PN4', NULL);
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W6', '10-04-2023', 'EMPL6', 'H6', 'PN4', 'PR2');
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W7', '10-04-2023', 'EMPL7', 'H7', 'PN3', NULL);
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W8', '10-04-2023', 'EMPL8', 'H8', 'PN8', 'PR7');
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W9', '10-04-2023', 'EMPL9', 'H9', 'PN5', 'PR9');
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('W10', '10-04-2023', 'EMPL10', 'H10', 'PN2', 'PR8');

-- 5a. Wy�wietlenie id i nazwiska pracownik�w
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

-- 5b. Wy�wietlenie id pracownik�w, kt�rych p�aca jest wi�ksza ni� 1000
SELECT prc.id_pracownika
FROM ksiegowosc.pracownicy prc 
INNER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
INNER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
	WHERE pn.kwota > 1000;

-- 5c. Wy�wietlenie id pracownik�w nieposiadaj�cych premii, kt�rych p�aca jest wi�ksza ni� 2000
SELECT prc.id_pracownika
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT OUTER JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii
	WHERE pn.kwota > 2000 AND pr.id_premii Is NULL;

-- 5d. Wy�wietlenie id pracownik�w, kt�rych pierwsza litera imienia zaczyna si� na liter� �J�
SELECT id_pracownika FROM ksiegowosc.pracownicy prc
	WHERE prc.imie LIKE 'J%';

-- 5e. Wy�wietlenie id pracownik�w, kt�rych nazwisko zawiera liter� �n� oraz imi� ko�czy si� na liter� �a�.
SELECT id_pracownika FROM ksiegowosc.pracownicy prc
	WHERE prc.nazwisko LIKE '%n%' AND prc.imie LIKE '%a';

-- 5f. Wy�wietlenie id pracownik�w oraz liczb� ich nadgodzin
SELECT prc.id_pracownika,(g.liczba_godzin-160) AS liczba_nadgodzin
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
LEFT OUTER JOIN ksiegowosc.godziny g ON g.id_godziny = w.id_godziny;

-- 5g. Wy�wietlenie imion i nazwisk pracownik�w, kt�rych pensja zawiera si� w przedziale 1500 � 3000 PLN
SELECT prc.imie,prc.nazwisko
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
	WHERE pn.kwota BETWEEN 1500 AND 3000;

-- 5h. Wy�wietlenie imion i nazwisk pracownik�w, kt�rzy pracowali w nadgodzinach i nie otrzymali premii
SELECT prc.imie,prc.nazwisko
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
LEFT OUTER JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii
LEFT OUTER JOIN ksiegowosc.godziny g ON g.id_godziny = w.id_godziny
	WHERE g.liczba_godzin > 160 AND pr.id_premii Is NULL;

-- 5i. Sortowanie pracownik�w wed�ug pensji
SELECT prc.*, pn.kwota AS pensja
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
	ORDER BY pn.kwota;

-- 5j. Sortowanie pracownik�w wed�ug pensji i premii malej�co
SELECT prc.*, pn.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT OUTER JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii
	ORDER BY pn.kwota,pr.kwota DESC;

-- 5k.  Zliczenie i pogrupowanie pracownik�w wed�ug pola "stanowisko".
SELECT pn.stanowisko, COUNT(prc.id_pracownika) AS ilosc_pracownikow
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
	GROUP BY pn.stanowisko;

-- 5l.  Zliczenie �redniej, minimalnej i maksymalnej p�acy dla stanowiska "pomocnik kuchenny"
SELECT pn.stanowisko, AVG(pn.kwota+ISNULL(pr.kwota,0)) AS srednia, MIN(pn.kwota+ISNULL(pr.kwota,0)) AS minimalna, MAX(pn.kwota+ISNULL(pr.kwota,0)) AS maksymalna
FROM ksiegowosc.wynagrodzenia w 
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT OUTER JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii
	GROUP BY pn.stanowisko
		HAVING pn.stanowisko = 'pomocnik kuchenny';

-- 5�.  Zliczenie sumy wszystkich wynagrodze�
SELECT (SUM(pn.kwota)+SUM(pr.kwota)) AS suma_wynagrodze�
FROM ksiegowosc.wynagrodzenia w
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT OUTER JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii;

-- 5m.  Zliczenie sumy wszystkich wynagrodze� dla danego stanowiska
SELECT pn.stanowisko,(SUM(pn.kwota)+SUM(pr.kwota)) AS suma_wynagrodze�
FROM ksiegowosc.wynagrodzenia w
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT OUTER JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii
	GROUP BY pn.stanowisko;

-- 5n.  Zliczenie liczby premii przyznanych dla pracownik�w danego stanowiska
SELECT pn.stanowisko,COUNT(pr.id_premii) AS liczba_premii
FROM ksiegowosc.wynagrodzenia w
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT OUTER JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii
	GROUP BY pn.stanowisko;

-- 5�.  Usuni�cie wszystkich pracownik�w maj�cych pensj� mniejsz� ni� 1200 z�
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
GO
DELETE prc
FROM ksiegowosc.pracownicy prc 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika
LEFT OUTER JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
	WHERE pn.kwota < 1200;
GO

SELECT * FROM ksiegowosc.pracownicy;
