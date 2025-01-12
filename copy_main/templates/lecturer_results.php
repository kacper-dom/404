<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wyniki wyszukiwania - Prowadzący</title>
</head>
<body>
<h1>Wyniki wyszukiwania dla prowadzącego</h1>
<?php if (empty($results)): ?>
    <p>Brak wyników dla podanego prowadzącego.</p>
<?php else: ?>
    <table border="1">
        <thead>
        <tr>
            <th>Start</th>
            <th>End</th>
            <th>Przedmiot</th>
            <th>Typ Zajęć</th>
            <th>Numer Sali</th>
            <th>Wydział</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($results as $row): ?>
            <tr>
                <td><?= htmlspecialchars($row['Start']) ?></td>
                <td><?= htmlspecialchars($row['End']) ?></td>
                <td><?= htmlspecialchars($row['Przedmiot']) ?></td>
                <td><?= htmlspecialchars($row['TypZajec']) ?></td>
                <td><?= htmlspecialchars($row['NumerSali']) ?></td>
                <td><?= htmlspecialchars($row['Wydzial']) ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
</body>
</html>
