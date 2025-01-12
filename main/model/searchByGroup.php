<?php

$dbPath = __DIR__ . '/../data.db';
$pdo = new PDO("sqlite:" . $dbPath);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$group = isset($_GET['group']) ? trim($_GET['group']) : '';

$query = "
    SELECT 
        z.ScheduleID,
        z.Start,
        z.End,
        p.FullName AS Lecturer,
        s.RoomNumber,
        pr.Name AS Subject,
        pr.SubjectType AS SubjectType
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
        g.GroupNumber LIKE :group;
";

$stmt = $pdo->prepare($query);

$stmt->bindValue(':group', '%' . $group . '%', PDO::PARAM_STR);

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

include __DIR__ . '/../templates/group_results.php';
?>
