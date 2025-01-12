<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wyniki wyszukiwania - Student</title>
</head>
<body>
<h1>Wyniki wyszukiwania dla studenta</h1>
<?php if (empty($results)): ?>
    <p>Brak wyników dla podanego studenta.</p>
<?php else: ?>
    <table border="1" cellpadding="5px" cellspacing="0px">
        <thead>
        <tr>
            <th>Start</th>
            <th>End</th>
            <th>Subject</th>
            <th>Type</th>
            <th>Room Number</th>
            <th>Department</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($results as $row): ?>
            <tr>
                <td><?= htmlspecialchars($row['Start']) ?></td>
                <td><?= htmlspecialchars($row['End']) ?></td>
                <td><?= htmlspecialchars($row['Subject']) ?></td>
                <td><?= htmlspecialchars($row['SubjectType']) ?></td>
                <td><?= htmlspecialchars($row['RoomNumber']) ?></td>
                <td><?= htmlspecialchars($row['Department']) ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
</body>
</html>
