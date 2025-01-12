<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wyniki wyszukiwania - Przedmiot</title>
</head>
<body>
<h1>Wyniki wyszukiwania dla przedmiotu</h1>
<?php if (empty($results)): ?>
    <p>Brak wyników dla podanego przedmiotu.</p>
<?php else: ?>
    <table border="1">
        <thead>
        <tr>
            <th>Start</th>
            <th>End</th>
            <th>Lecturer</th>
            <th>Room Number</th>
            <th>Group Number</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($results as $row): ?>
            <tr>
                <td><?= htmlspecialchars($row['Start']) ?></td>
                <td><?= htmlspecialchars($row['End']) ?></td>
                <td><?= htmlspecialchars($row['Lecturer']) ?></td>
                <td><?= htmlspecialchars($row['RoomNumber']) ?></td>
                <td><?= htmlspecialchars($row['GroupNumber']) ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
</body>
</html>
