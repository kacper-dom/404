<?php

$dbPath = __DIR__ . '/../data.db';
$pdo = new PDO("sqlite:" . $dbPath);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$lecturer = isset($_GET['lecturer']) ? trim($_GET['lecturer']) : '';

$query = "
    SELECT
        z.ScheduleID,
        z.Start,
        z.End,
        s.RoomNumber,
        s.Department,
        pr.Name AS Subject,
        pr.SubjectType AS SubjectType,
        g.GroupNumber
    FROM
        schedule z
    JOIN 
        rooms s ON z.RoomID = s.RoomID
    JOIN 
        subjects pr ON z.SubjectID = pr.SubjectID
    JOIN 
        groups g ON z.GroupID = g.GroupID
    WHERE
        z.LecturerID = (SELECT LecturerID FROM lecturers WHERE FullName LIKE :lecturer);
";

$stmt = $pdo->prepare($query);

$stmt->bindValue(':lecturer', '%' . $lecturer . '%', PDO::PARAM_STR);

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

include __DIR__ . '/../templates/lecturer_results.php';
?>
