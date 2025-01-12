<?php

$dbPath = __DIR__ . '/../data.db';
$pdo = new PDO("sqlite:" . $dbPath);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$room = isset($_GET['room']) ? trim($_GET['room']) : '';

if (!empty($room))
{
    $query = "SELECT
        z.ScheduleID,
        z.Start,
        z.End,
        p.FullName AS Lecturer,
        s.RoomNumber,
        pr.Name AS Subject,
        pr.SubjectType AS SubjectType
    FROM
        schedule z
    JOIN lecturers p ON z.LecturerID = p.LecturerID
    JOIN rooms s ON z.RoomID = s.RoomID
    JOIN subjects pr ON z.SubjectID = pr.SubjectID
    WHERE
        s.RoomNumber LIKE :room;

    ";

    $stmt = $pdo->prepare($query);
    $stmt->bindValue(':room', '%' . $room . '%', PDO::PARAM_STR); // % umożliwia wyszukiwanie częściowe

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
}
else
{
    $results = [];
}

include __DIR__ . '/../templates/room_results.php';
?>
