Wyświetlenie wszystkich zajęć z ich szczegółami:

SELECT 
    z.ZajeciaID,
    z.Start,
    z.End,
    p.Imie AS ProwadzacyImie,
    p.Nazwisko AS ProwadzacyNazwisko,
    s.NumerSali,
    s.Wydzial,
    pr.Nazwa AS Przedmiot,
    pr.TypZajec,
    g.NumerGrupy
FROM 
    zajecia z
JOIN 
    prowadzacy p ON z.ProwadzacyID = p.ProwadzacyID
JOIN 
    sale s ON z.SalaID = s.SaleID
JOIN 
    przedmioty pr ON z.PrzedmiotID = pr.PrzedmiotyID
JOIN 
    grupy g ON z.GrupaID = g.GrupyID;


Wyświetlenie zajęć prowadzonych w konkretnej sali:

SELECT 
    z.ZajeciaID,
    z.Start,
    z.End,
    p.Imie AS ProwadzacyImie,
    p.Nazwisko AS ProwadzacyNazwisko,
    pr.Nazwa AS Przedmiot,
    pr.TypZajec
FROM 
    zajecia z
JOIN 
    prowadzacy p ON z.ProwadzacyID = p.ProwadzacyID
JOIN 
    przedmioty pr ON z.PrzedmiotID = pr.PrzedmiotyID
WHERE 
    z.SalaID = (SELECT SaleID FROM sale WHERE NumerSali = 'WI WI1-215');


Wyświetlenie zajęć dla konkretnej grupy:

SELECT 
    z.ZajeciaID,
    z.Start,
    z.End,
    p.Imie AS ProwadzacyImie,
    p.Nazwisko AS ProwadzacyNazwisko,
    s.NumerSali,
    pr.Nazwa AS Przedmiot,
    pr.TypZajec
FROM 
    zajecia z
JOIN 
    prowadzacy p ON z.ProwadzacyID = p.ProwadzacyID
JOIN 
    sale s ON z.SalaID = s.SaleID
JOIN 
    przedmioty pr ON z.PrzedmiotID = pr.PrzedmiotyID
WHERE 
    z.GrupaID = (SELECT GrupyID FROM grupy WHERE NumerGrupy = 'S1_I_L_330');


Wyświetlenie wszystkich zajęć prowadzonych przez danego prowadzącego:

SELECT 
    z.ZajeciaID,
    z.Start,
    z.End,
    s.NumerSali,
    s.Wydzial,
    pr.Nazwa AS Przedmiot,
    pr.TypZajec,
    g.NumerGrupy
FROM 
    zajecia z
JOIN 
    sale s ON z.SalaID = s.SaleID
JOIN 
    przedmioty pr ON z.PrzedmiotID = pr.PrzedmiotyID
JOIN 
    grupy g ON z.GrupaID = g.GrupyID
WHERE 
    z.ProwadzacyID = (SELECT ProwadzacyID FROM prowadzacy WHERE Imie = 'Luiza' AND Nazwisko = 'Fabisiak');

Liczba zajęć w danym przedziale czasowym:

SELECT 
    COUNT(*) AS LiczbaZajec
FROM 
    zajecia
WHERE 
    Start >= '2024-12-10 00:00:00' AND End <= '2024-12-10 23:59:59';

6. Wyświetlenie zajęć trwających dłużej niż 2 godziny:

Copy code
SELECT 
    z.ZajeciaID,
    z.Start,
    z.End,
    p.Imie AS ProwadzacyImie,
    p.Nazwisko AS ProwadzacyNazwisko,
    pr.Nazwa AS Przedmiot,
    TIMESTAMPDIFF(MINUTE, z.Start, z.End) AS CzasTrwania
FROM 
    zajecia z
JOIN 
    prowadzacy p ON z.ProwadzacyID = p.ProwadzacyID
JOIN 
    przedmioty pr ON z.PrzedmiotID = pr.PrzedmiotyID
WHERE 
    TIMESTAMPDIFF(MINUTE, z.Start, z.End) > 120;

7. Wyświetlenie wszystkich zajęć posortowanych wg prowadzących:


Copy code
SELECT 
    p.Imie AS ProwadzacyImie,
    p.Nazwisko AS ProwadzacyNazwisko,
    z.Start,
    z.End,
    pr.Nazwa AS Przedmiot,
    g.NumerGrupy
FROM 
    zajecia z
JOIN 
    prowadzacy p ON z.ProwadzacyID = p.ProwadzacyID
JOIN 
    przedmioty pr ON z.PrzedmiotID = pr.PrzedmiotyID
JOIN 
    grupy g ON z.GrupaID = g.GrupyID
ORDER BY 
    p.Nazwisko, z.Start;

8. Wyświetlenie sal, w których odbywa się najwięcej zajęć:


Copy code
SELECT 
    s.NumerSali,
    s.Wydzial,
    COUNT(z.ZajeciaID) AS LiczbaZajec
FROM 
    zajecia z
JOIN 
    sale s ON z.SalaID = s.SaleID
GROUP BY 
    s.NumerSali, s.Wydzial
ORDER BY 
    LiczbaZajec DESC;

9. Wyświetlenie grupy, która ma najwięcej zajęć:


Copy code
SELECT 
    g.NumerGrupy,
    COUNT(z.ZajeciaID) AS LiczbaZajec
FROM 
    zajecia z
JOIN 
    grupy g ON z.GrupaID = g.GrupyID
GROUP BY 
    g.NumerGrupy
ORDER BY 
    LiczbaZajec DESC
LIMIT 1;

10. Wyświetlenie wszystkich zajęć dla konkretnego przedmiotu:


Copy code
SELECT 
    z.ZajeciaID,
    z.Start,
    z.End,
    p.Imie AS ProwadzacyImie,
    p.Nazwisko AS ProwadzacyNazwisko,
    s.NumerSali,
    g.NumerGrupy
FROM 
    zajecia z
JOIN 
    prowadzacy p ON z.ProwadzacyID = p.ProwadzacyID
JOIN 
    sale s ON z.SalaID = s.SaleID
JOIN 
    grupy g ON z.GrupaID = g.GrupyID
WHERE 
    z.PrzedmiotID = (SELECT PrzedmiotyID FROM przedmioty WHERE Nazwa = 'Sieci komputerowe')
