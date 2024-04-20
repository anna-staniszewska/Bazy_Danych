-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj�c do niego kierunkowy dla Polski w nawiasie (+48).
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon VARCHAR(20);
UPDATE ksiegowosc.pracownicy SET telefon = CONCAT('(+48)',ksiegowosc.pracownicy.telefon);

-- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by� my�lnikami wg wzoru: �555-222-333�.
UPDATE ksiegowosc.pracownicy SET telefon = SUBSTRING(telefon,1,8) + '-' + SUBSTRING(telefon,9,3) + '-' + SUBSTRING(telefon,12,3);

-- c) Wy�wietl dane pracownika, kt�rego nazwisko jest najd�u�sze, u�ywaj�c du�ych liter.
SELECT UPPER(id_pracownika) AS ID_PRACOWNIKA, UPPER(imie) AS IMIE, UPPER(nazwisko) AS NAZWISKO, UPPER(adres) AS ADRES, UPPER(telefon) AS TELEFON FROM ksiegowosc.pracownicy
	WHERE LEN(nazwisko) = (SELECT MAX(LEN(nazwisko)) from ksiegowosc.pracownicy);

-- d) Wy�wietl dane pracownik�w i ich pensje zakodowane przy pomocy algorytmu md5.
ALTER TABLE ksiegowosc.pensje ALTER COLUMN kwota VARCHAR(10);
SELECT HASHBYTES('MD5', prc.id_pracownika) AS id_pracownika, HASHBYTES('MD5', prc.imie) AS imie, HASHBYTES('MD5', prc.nazwisko) AS nazwisko,
HASHBYTES('MD5', prc.adres) AS adres, HASHBYTES('MD5', prc.telefon) AS telefon, HASHBYTES('MD5', pn.kwota) AS kwota
FROM ksiegowosc.pracownicy prc 
JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji;

-- e) Wy�wietl pracownik�w, ich pensje oraz premie. Wykorzystaj z��czenie lewostronne.
SELECT prc.*, pn.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy prc 
JOIN ksiegowosc.wynagrodzenia w ON prc.id_pracownika = w.id_pracownika 
JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii;

-- f) Wygeneruj raport (zapytanie), kt�re zwr�ci w wyniki tre�� wg szablonu.
ALTER TABLE ksiegowosc.pensje ALTER COLUMN kwota DECIMAL(7,2);
SELECT 'Pracownik ' + prc.imie + ' ' + prc.nazwisko + ' w dniu ' + SUBSTRING(CAST(w.data AS char(10)),9,2) + '.' + SUBSTRING(CAST(w.data AS char(10)),6,2) 
+ '.' + SUBSTRING(CAST(w.data AS char(10)),1,4) + ' otrzyma� pensj� ca�kowit� na kwot� ' 
+ CAST(pn.kwota+ISNULL(pr.kwota,0)+CASE WHEN g.liczba_godzin <= 160 THEN 0 ELSE (g.liczba_godzin-160)*25 END AS VARCHAR(10)) + 
' z�, gdzie wynagrodzenie zasadnicze wynosi�o: ' + CAST(pn.kwota AS VARCHAR(10)) + ' z�, premia: ' + CAST(ISNULL(pr.kwota,0) AS VARCHAR(10)) + 
' z�, nadgodziny: ' + CAST(CASE WHEN g.liczba_godzin <= 160 THEN 0 ELSE (g.liczba_godzin-160)*25 END AS VARCHAR(10)) + ' z�' AS raport
FROM ksiegowosc.wynagrodzenia w 
JOIN ksiegowosc.pracownicy prc ON prc.id_pracownika = w.id_pracownika 
JOIN ksiegowosc.pensje pn ON pn.id_pensji = w.id_pensji
LEFT JOIN ksiegowosc.premie pr ON pr.id_premii = w.id_premii
JOIN ksiegowosc.godziny g ON g.id_godziny = w.id_godziny;