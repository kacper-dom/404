<?php

$dbPath = __DIR__ . '/../data.db';
$pdo = new PDO("sqlite:" . $dbPath);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$studentId = isset($_GET['studentId']) ? trim($_GET['studentId']) : '';

if (!empty($studentId))
{
    $query = "
        SELECT 
            z.Start, 
            z.End, 
            pr.Name AS Subject, 
            pr.SubjectType AS SubjectType,
            s.RoomNumber,
            s.Department
        FROM 
            schedule z
        JOIN 
            subjects pr ON z.SubjectID = pr.SubjectID
        JOIN 
            rooms s ON z.RoomID = s.RoomID
        JOIN 
            studentgroups sg ON sg.GroupID = z.GroupID
        WHERE 
            sg.StudentNumber = :studentId;
    ";

    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':studentId', $studentId, PDO::PARAM_STR);

    $stmt->execute();

    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
else
{
    $results = [];
}

include __DIR__ . '/../templates/student_results.php';
?>
