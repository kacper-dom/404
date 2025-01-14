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
