<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wyniki wyszukiwania - Sala</title>
</head>
<body>
<h1>Wyniki wyszukiwania dla sali</h1>
<?php if (empty($results)): ?>
    <p>Brak wyników dla podanej sali.</p>
<?php else: ?>
    <table border="1">
        <thead>
        <tr>
            <th>Start</th>
            <th>End</th>
            <th>Lecturer</th>
            <th>Subject</th>
            <th>SubjectType</th>
            <th>Room Number</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($results as $row): ?>
            <tr>
                <td><?= htmlspecialchars($row['Start']) ?></td>
                <td><?= htmlspecialchars($row['End']) ?></td>
                <td><?= htmlspecialchars($row['Lecturer']) ?></td>
                <td><?= htmlspecialchars($row['Subject']) ?></td>
                <td><?= htmlspecialchars($row['SubjectType']) ?></td>
                <td><?= htmlspecialchars($row['RoomNumber']) ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
</body>
</html>
