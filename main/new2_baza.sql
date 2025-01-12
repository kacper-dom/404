CREATE TABLE groups (
                        GroupID INTEGER PRIMARY KEY AUTOINCREMENT,
                        GroupNumber TEXT NOT NULL
);

CREATE TABLE lecturers (
                           LecturerID INTEGER PRIMARY KEY AUTOINCREMENT,
                           FullName TEXT NOT NULL
);

CREATE TABLE subjects (
                          SubjectID INTEGER PRIMARY KEY AUTOINCREMENT,
                          Name TEXT NOT NULL,
                          SubjectType TEXT NOT NULL
);

CREATE TABLE rooms (
                       RoomID INTEGER PRIMARY KEY AUTOINCREMENT,
                       RoomNumber TEXT NOT NULL,
                       Department TEXT NOT NULL
);

CREATE TABLE students (
                          StudentNumber TEXT PRIMARY KEY
);

CREATE TABLE studentgroups (
                               StudentNumber TEXT NOT NULL,
                               GroupID INTEGER NOT NULL,
                               PRIMARY KEY (StudentNumber, GroupID),
                               FOREIGN KEY (StudentNumber) REFERENCES students (StudentNumber),
                               FOREIGN KEY (GroupID) REFERENCES groups (GroupID)
);

CREATE TABLE schedule (
                          ScheduleID INTEGER PRIMARY KEY AUTOINCREMENT,
                          Start TEXT NOT NULL,
                          End TEXT NOT NULL,
                          LecturerID INTEGER NOT NULL,
                          RoomID INTEGER NOT NULL,
                          SubjectID INTEGER NOT NULL,
                          GroupID INTEGER NOT NULL,
                          FOREIGN KEY (LecturerID) REFERENCES lecturers (LecturerID),
                          FOREIGN KEY (RoomID) REFERENCES rooms (RoomID),
                          FOREIGN KEY (SubjectID) REFERENCES subjects (SubjectID),
                          FOREIGN KEY (GroupID) REFERENCES groups (GroupID)
);


INSERT INTO students (StudentNumber)
VALUES
    ('53699'),
    ('53900'),
    ('51038'),
    ('53809');

INSERT INTO studentgroups (StudentNumber, GroupID)
VALUES
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

INSERT INTO groups (GroupNumber)
VALUES
    ('S1_I_L_330'),
    ('S1_I_5 sem._W'),
    ('33_PO3_Ai1_L_330'),
    ('33_PO3_Ai1_W'),
    ('GA/I K/M'),
    ('S1_I_A_223'),
    ('SJO/WI/s.5/Maz+Ban/l'),
    ('S1_I_W_33');

INSERT INTO lecturers (FullName)
VALUES
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

INSERT INTO subjects (Name, SubjectType)
VALUES
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

INSERT INTO rooms (RoomNumber, Department)
VALUES
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

INSERT INTO schedule (Start, End, LecturerID, RoomID, SubjectID, GroupID)
VALUES
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
    ('2024-12-17 16:15:00', '2024-12-17 18:00:00', 8, 2, 4, 2),
    ('2024-12-18 08:15:00', '2024-12-18 10:00:00', 3, 3, 5, 3),
    ('2024-12-18 10:15:00', '2024-12-18 12:00:00', 4, 4, 6, 4),
    ('2024-12-19 14:15:00', '2024-12-19 16:00:00', 5, 5, 10, 5),
    ('2024-12-20 08:15:00', '2024-12-20 10:00:00', 6, 6, 12, 6),
    ('2024-12-20 10:15:00', '2024-12-20 12:00:00', 7, 7, 9, 7),
    ('2024-12-21 14:15:00', '2024-12-21 16:00:00', 9, 1, 1, 1),
    ('2024-12-21 16:15:00', '2024-12-21 18:00:00', 8, 2, 4, 2);
