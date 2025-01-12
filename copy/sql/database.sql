
CREATE TABLE grupy (
                       GrupyID INTEGER PRIMARY KEY AUTOINCREMENT,
                       NumerGrupy TEXT NOT NULL
);

-- Tabela 'prowadzacy'
CREATE TABLE prowadzacy (
                            ProwadzacyID INTEGER PRIMARY KEY AUTOINCREMENT,
                            ImieNazwisko TEXT NOT NULL
);

-- Tabela 'przedmioty'
CREATE TABLE przedmioty (
                            PrzedmiotyID INTEGER PRIMARY KEY AUTOINCREMENT,
                            Nazwa TEXT NOT NULL,
                            TypZajec TEXT NOT NULL
);

-- Tabela 'sale'
CREATE TABLE sale (
                      SaleID INTEGER PRIMARY KEY AUTOINCREMENT,
                      NumerSali TEXT NOT NULL,
                      Wydzial TEXT NOT NULL
);

-- Tabela 'studenci'
CREATE TABLE studenci (
                          NumerAlbumu TEXT PRIMARY KEY
);

-- Tabela 'studencigrupy'
CREATE TABLE studencigrupy (
                               NumerAlbumu TEXT NOT NULL,
                               GrupaID INTEGER NOT NULL,
                               PRIMARY KEY (NumerAlbumu, GrupaID),
                               FOREIGN KEY (NumerAlbumu) REFERENCES studenci (NumerAlbumu),
                               FOREIGN KEY (GrupaID) REFERENCES grupy (GrupyID)
);

-- Tabela 'zajecia'
CREATE TABLE zajecia (
                         ZajeciaID INTEGER PRIMARY KEY AUTOINCREMENT,
                         Start DATETIME NOT NULL,
                         End DATETIME NOT NULL,
                         ProwadzacyID INTEGER NOT NULL,
                         SalaID INTEGER NOT NULL,
                         PrzedmiotID INTEGER NOT NULL,
                         GrupaID INTEGER NOT NULL,
                         FOREIGN KEY (ProwadzacyID) REFERENCES prowadzacy (ProwadzacyID),
                         FOREIGN KEY (SalaID) REFERENCES sale (SaleID),
                         FOREIGN KEY (PrzedmiotID) REFERENCES przedmioty (PrzedmiotyID),
                         FOREIGN KEY (GrupaID) REFERENCES grupy (GrupyID)
);

insert into studenci(NumerAlbumu)
VALUES
    ('53699'),
    ('53900'),
    ('51038'),
    ('53809');

insert into studencigrupy (NumerAlbumu, GrupaID)
values
('53699', '7'),
('53809', '7'),
('53699', '1'),
('53809', '1'),
('51038', '1'),
('53699', '2'),
('53699', '3'),
('53809', '4'),
('53699', '5'),
('51038', '5'),
('53809', '8'),
('51038', '8');

-- Wstawianie danych do tabel
-- 1. Dane do tabeli 'grupy'
INSERT INTO grupy (NumerGrupy) VALUES
                                   ('S1_I_L_330'),
                                   ('S1_I_5 sem._W'),
                                   ('33_PO3_Ai1_L_330'),
                                   ('33_PO3_Ai1_W'),
                                   ('GA/I K/M'),
                                   ('S1_I_A_223'),
                                   ('SJO/WI/s.5/Maz+Ban/l'),
                                   ('S1_I_W_33');

-- 2. Dane do tabeli 'prowadzacy'
INSERT INTO prowadzacy (ImieNazwisko) VALUES
                                          ('Luiza Fabisiak'),
                                          ('Grzegorz Śliwiński'),
                                          ('Paweł Bandur'),
                                          ('Artur Karczmarczyk'),
                                          ('Dominik Ciesiołkiewicz'),
                                          ('Tomasz Nitzler'),
                                          ('Piotr Polak'),
                                          ('Jacek Klimaszewski'),
                                          ('Kamil Bortko'),
                                          ('Anna Maziarz');

-- 3. Dane do tabeli 'przedmioty'
INSERT INTO przedmioty (Nazwa, TypZajec) VALUES
                                             ('Podstawy ochrony informacji', 'Laboratorium'),
                                             ('Podstawy ochrony informacji', 'Wykład'),
                                             ('Sieci komputerowe', 'Laboratorium'),
                                             ('Sieci komputerowe', 'Wykład'),
                                             ('Język niemiecki 2', 'Lektorat'),
                                             ('Aplikacje internetowe 1', 'Laboratorium'),
                                             ('Aplikacje internetowe 1', 'Wykład'),
                                             ('Wychowanie fizyczne 1', 'Audytoryjne'),
                                             ('Metody numeryczne 1', 'Audytoryjne'),
                                             ('Sztuczna inteligencja', 'Laboratorium'),
                                             ('Zarządzanie informacją 2', 'Laboratorium'),
                                             ('Zarządzanie informacją 2', 'Wykład');

-- 4. Dane do tabeli 'sale'
INSERT INTO sale (NumerSali, Wydzial) VALUES
                                          ('WI WI2-120', 'Wydział Informatyki'),
                                          ('WI WI1-215', 'Wydział Informatyki'),
                                          ('WI WI1-303', 'Wydział Informatyki'),
                                          ('IiJM BMW 222', 'Inny Wydział'),
                                          ('WI WI1-307', 'Wydział Informatyki'),
                                          ('WI WI1-013', 'Wydział Informatyki'),
                                          ('WI WI1-129', 'Wydział Informatyki'),
                                          ('WI WI1-304', 'Wydział Informatyki'),
                                          ('WI WI1-309', 'Wydział Informatyki'),
                                          ('SWFiS_HS_Sektor II', 'Sportowy Obiekt');

-- 5. Dane do tabeli 'zajecia'
INSERT INTO zajecia (Start, End, ProwadzacyID, SalaID, PrzedmiotID, GrupaID) VALUES
                                                                                 ('2024-12-09 14:15:00', '2024-12-09 16:00:00', 1, 1, 1, 1),
                                                                                 ('2024-12-09 16:15:00', '2024-12-09 18:00:00', 2, 2, 3, 2),
                                                                                 ('2024-12-10 08:15:00', '2024-12-10 10:00:00', 3, 3, 5, 3),
                                                                                 ('2024-12-10 10:15:00', '2024-12-10 12:00:00', 4, 4, 6, 4),
                                                                                 ('2024-12-11 14:15:00', '2024-12-11 16:00:00', 5, 5, 10, 5),
                                                                                 ('2024-12-12 08:15:00', '2024-12-12 10:00:00', 6, 6, 12, 6),
                                                                                 ('2024-12-12 10:15:00', '2024-12-12 12:00:00', 7, 7, 9, 7),
                                                                                 ('2024-12-13 14:15:00', '2024-12-13 16:00:00', 8, 1, 1, 1),
                                                                                 ('2024-12-13 16:15:00', '2024-12-13 18:00:00', 2, 2, 4, 2),
                                                                                 ('2024-12-14 08:15:00', '2024-12-14 10:00:00', 3, 3, 5, 3),
                                                                                 ('2024-12-14 10:15:00', '2024-12-14 12:00:00', 4, 4, 6, 4),
                                                                                 ('2024-12-15 14:15:00', '2024-12-15 16:00:00', 5, 5, 10, 5),
                                                                                 ('2024-12-16 08:15:00', '2024-12-16 10:00:00', 6, 6, 12, 6),
                                                                                 ('2024-12-16 10:15:00', '2024-12-16 12:00:00', 7, 7, 9, 7),
                                                                                 ('2024-12-17 14:15:00', '2024-12-17 16:00:00', 9, 1, 1, 1),
                                                                                 ('2024-12-17 16:15:00', '2024-12-17 18:00:00', 8, 2, 4, 2);

