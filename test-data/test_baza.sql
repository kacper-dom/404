/* testowa czesc */
INSERT INTO students (StudentNumber)
VALUES ('00000');

INSERT INTO groups (GroupNumber)
VALUES ('group1'), ('group2'), ('group3');

INSERT INTO studentgroups (StudentNumber, GroupID)
SELECT '00000', GroupID
FROM groups
WHERE GroupNumber IN ('group1', 'group2', 'group3');

INSERT INTO subjects (Name, SubjectType)
VALUES 
    ('subject1', 'Testowy'), ('subject2', 'Testowy'), ('subject3', 'Testowy'),
    ('subject4', 'Testowy'), ('subject5', 'Testowy'), ('subject6', 'Testowy'),
    ('subject7', 'Testowy'), ('subject8', 'Testowy'), ('subject9', 'Testowy');

INSERT INTO lecturers (FullName)
VALUES 
    ('lecturer1'), ('lecturer2'), ('lecturer3'),
    ('lecturer4'), ('lecturer5'), ('lecturer6'),
    ('lecturer7'), ('lecturer8'), ('lecturer9');

INSERT INTO rooms (RoomNumber, Department)
VALUES ('TestowyRoom', 'TestowyDepartment');

INSERT INTO schedule (Start, End, LecturerID, RoomID, SubjectID, GroupID)
VALUES
    ('2025-01-12 08:00:00', '2025-01-12 09:30:00', 1, 1, 1, 1),
    ('2025-01-14 08:00:00', '2025-01-14 09:30:00', 2, 1, 2, 1),
    ('2025-01-16 08:00:00', '2025-01-16 09:30:00', 3, 1, 3, 1),

    ('2025-01-12 10:00:00', '2025-01-12 11:30:00', 4, 1, 4, 2),
    ('2025-01-14 10:00:00', '2025-01-14 11:30:00', 5, 1, 5, 2),
    ('2025-01-16 10:00:00', '2025-01-16 11:30:00', 6, 1, 6, 2),

    ('2025-01-12 12:00:00', '2025-01-12 13:30:00', 7, 1, 7, 3),
    ('2025-01-14 12:00:00', '2025-01-14 13:30:00', 8, 1, 8, 3),
    ('2025-01-16 12:00:00', '2025-01-16 13:30:00', 9, 1, 9, 3);