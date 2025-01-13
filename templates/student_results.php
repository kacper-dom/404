<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wyniki wyszukiwania - Student</title>
    <link rel="stylesheet" href="/public/assets/style_templates.css">
</head>
<body>
    <div id="student_results">
        <?php if (empty($results)): ?>
            <p>Brak wyników do wyświetlenia.</p>
        <?php else: ?>
            <div class="calendar-right">
                <?php foreach ($results as $row):
                    $startTime = strtotime($row['Start']);
                    $endTime = strtotime($row['End']);
                    $duration = ($endTime - $startTime) / 60;
                    $startHour = date('H', $startTime);
                    $startMinute = date('i', $startTime);
                    $topOffset = (($startHour - 7) * 60 + $startMinute) * (70 / 60);
                    $height = ($duration * (70 / 60));

                    $subjectTypeClass = '';
                    switch (strtolower($row['SubjectType'])) {
                        case 'testowy':
                            $subjectTypeClass = 'type-testowy';
                            break;
                        case 'laboratorium':
                            $subjectTypeClass = 'type-laboratorium';
                            break;
                        case 'wykład':
                            $subjectTypeClass = 'type-wykladowy';
                            break;
                        case 'audytoryjne':
                            $subjectTypeClass = 'type-audytoryjne';
                            break;
                        case 'lektorat':
                            $subjectTypeClass = 'type-lektorat';
                            break;
                        default:
                            $subjectTypeClass = 'type-testowy';
                    }
                    ?>
                    <div class="event-block <?= $subjectTypeClass ?>" style="top: <?= $topOffset ?>px; height: <?= $height ?>px;">
                <span style="font-size: 14px;">
                    <?= date('H:i', $startTime) ?> - <?= date('H:i', $endTime) ?>
                </span><br>
                        <strong style="font-size: 16px;">
                            <?= htmlspecialchars($row['Subject']) ?> (<?= htmlspecialchars($row['SubjectType']) ?>)
                        </strong><br>
                        <span style="font-size: 14px;">
                    <?= htmlspecialchars($row['RoomNumber']) ?> (<?= htmlspecialchars($row['Department']) ?>)
                </span>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</body>
</html>
