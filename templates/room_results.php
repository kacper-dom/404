<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wyniki wyszukiwania - Sala</title>
    <link rel="stylesheet" href="/public/assets/style_templates.css">
</head>
<body>
<?php if (empty($results)): ?>
    <p>Brak wyników dla podanej sali.</p>
<?php else: ?>
    <div class="calendar-right">
        <?php
        $groupedEvents = [];
        foreach ($results as $row) {
            $key = $row['Start'] . '-' . $row['End'];
            $groupedEvents[$key][] = $row;
        }
        foreach ($groupedEvents as $timeSlot => $events):
            $count = count($events);
            foreach ($events as $index => $row):
                $startTime = strtotime($row['Start']);
                $endTime = strtotime($row['End']);
                $duration = ($endTime - $startTime) / 60;
                $startHour = date('H', $startTime);
                $startMinute = date('i', $startTime);
                $topOffset = (($startHour - 7) * 60 + $startMinute) * (70 / 60);
                $height = ($duration * (70 / 60));
                $width = 75 / $count;
                $leftOffset = 5 + ($index * $width);

                // Kolorowanie według formy zajęć
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
                <div class="event-block <?= $subjectTypeClass ?>" style="top: <?= $topOffset ?>px; height: <?= $height ?>px; width: <?= $width ?>%; left: <?= $leftOffset ?>%;">
                    <span style="font-size: 14px;">
                        <?= date('H:i', $startTime) ?> - <?= date('H:i', $endTime) ?>
                    </span><br>
                    <strong style="font-size: 16px;">
                        <?= htmlspecialchars($row['Subject']) ?> (<?= htmlspecialchars($row['SubjectType']) ?>)
                    </strong><br>
                    <span style="font-size: 14px;">
                        Prowadzący: <?= htmlspecialchars($row['Lecturer']) ?><br>
                        Sala: <?= htmlspecialchars($row['RoomNumber']) ?>
                    </span>
                </div>
            <?php endforeach; ?>
        <?php endforeach; ?>
    </div>
<?php endif; ?>
</body>
</html>
