<?php
// Ustawienie połączenia z bazą danych
$dbPath = __DIR__ . '/../data.db';
$pdo = new PDO("sqlite:" . $dbPath);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Walidacja i oczyszczanie danych wejściowych (NumerAlbumu)
$studentId = isset($_GET['studentId']) ? trim($_GET['studentId']) : '';

if (!empty($studentId)) {
    // Zapytanie SQL
    $query = "
        SELECT 
            z.Start, 
            z.End, 
            pr.Nazwa AS Przedmiot, 
            pr.TypZajec, 
            s.NumerSali, 
            s.Wydzial
        FROM 
            zajecia z
        JOIN 
            przedmioty pr ON z.PrzedmiotID = pr.PrzedmiotyID
        JOIN 
            sale s ON z.SalaID = s.SaleID
        JOIN 
            studencigrupy sg ON sg.GrupaID = z.GrupaID
        WHERE 
            sg.NumerAlbumu = :studentId
    ";

    // Przygotowanie zapytania
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':studentId', $studentId, PDO::PARAM_STR);

    // Wykonanie zapytania
    $stmt->execute();

    // Pobranie wyników
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $results = [];
}

// Przekazanie wyników do szablonu
include __DIR__ . '/../templates/student_results.php';
?>
