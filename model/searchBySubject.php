<?php
// Ustawienie połączenia z bazą danych
$dbPath = __DIR__ . '/../data.db';
$pdo = new PDO("sqlite:" . $dbPath);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Walidacja i oczyszczanie danych wejściowych
$subjectName = isset($_GET['subject']) ? trim($_GET['subject']) : '';
$teacherName = isset($_GET['teacherName']) ? trim($_GET['teacherName']) : '';
$room = isset($_GET['room']) ? trim($_GET['room']) : '';
$group = isset($_GET['group']) ? trim($_GET['group']) : '';
$studentId = isset($_GET['studentId']) ? trim($_GET['studentId']) : '';

// Konstrukcja zapytania SQL
$query = "
    SELECT 
        z.ScheduleID,
        z.Start,
        z.End,
        p.FullName AS Lecturer,
        s.RoomNumber,
        pr.Name AS Subject,
        pr.SubjectType AS SubjectType,
        g.GroupNumber
    FROM
        schedule z
    JOIN 
        lecturers p ON z.LecturerID = p.LecturerID
    JOIN 
        rooms s ON z.RoomID = s.RoomID
    JOIN 
        subjects pr ON z.SubjectID = pr.SubjectID
    JOIN 
        groups g ON z.GroupID = g.GroupID
    WHERE
        pr.Name LIKE :subjectName;

";

if (!empty($teacherName)) {
    $query .= " AND p.ImieNazwisko LIKE :teacherName";
}

if (!empty($room))
{
    $query .= " AND s.NumerSali LIKE :room";
}

if (!empty($group))
{
    $query .= " AND g.NumerGrupy LIKE :group";
}

$stmt = $pdo->prepare($query);

$stmt->bindValue(':subjectName', '%' . $subjectName . '%', PDO::PARAM_STR);

if (!empty($teacherName))
{
    $stmt->bindValue(':teacherName', '%' . $teacherName . '%', PDO::PARAM_STR);
}
if (!empty($room))
{
    $stmt->bindValue(':room', '%' . $room . '%', PDO::PARAM_STR);
}
if (!empty($group))
{
    $stmt->bindValue(':group', '%' . $group . '%', PDO::PARAM_STR);
}

try
{
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

}
catch (Exception $e)
{
    echo "Błąd zapytania: " . $e->getMessage();
    $results = [];
}

include __DIR__ . '/../templates/subject_results.php';
?>
