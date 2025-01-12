<?php
// index.php
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/public/assets/style.css">
    <title>Lepszy Plan ZUT 2025</title>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="public/assets/logo-zut.svg" alt="Logo ZUT w Szczecinie">
    </div>
    <div class="main-content">
        <div class="sidebar">
            <form method="get" action="index.php">
                <input type="text" name="teacher" placeholder="Podaj nazwisko" id="teacher">
                <input type="text" name="room" placeholder="Podaj salę" id="room">
                <input type="text" name="subject" placeholder="Podaj przedmiot" id="subject">
                <input type="text" name="group" placeholder="Podaj grupę" id="group">
                <input type="text" name="studentId" placeholder="Podaj numer albumu" id="studentId">
                <button type="submit" name="action" value="search">Wyszukaj</button>
                <button type="reset" class="clear">Wyczyść filtry</button>
            </form>
        </div>

        <div class="calendar">
            <div class="calendar-header">
                <button>&#8592;</button>
                <button>&#8594;</button>
                <button>Dzisiaj</button>
                <div class="view-buttons">
                    <button>Dzień</button>
                    <button>Tydzień</button>
                    <button>Miesiąc</button>
                    <button>Semestr</button>
                </div>
            </div>

            <div class="calendar-body">
                <?php
                if (!empty($_GET['teacher']))
                {
                    include __DIR__ . '/model/searchByLecturer.php';
                }
                elseif (!empty($_GET['studentId']))
                {
                    include __DIR__ . '/model/searchByStudent.php';
                }
                elseif (!empty($_GET['room']))
                {
                    include __DIR__ . '/model/searchByRoom.php';
                }
                elseif (!empty($_GET['subject']))
                {
                    include __DIR__ . '/model/searchBySubject.php';
                }
                elseif (!empty($_GET['group']))
                {
                    include __DIR__ . '/model/searchByGroup.php';
                }
                else
                {
                    for ($hour = 7; $hour <= 21; $hour++) {
                        echo '<div class="row">';
                        echo '<div class="time-slot">' . str_pad($hour, 2, '0', STR_PAD_LEFT) . ':00</div>';
                        echo '<div class="calendar-cell"></div>';
                        echo '</div>';
                    }
                }
                ?>
            </div>
        </div>
    </div>
</div>
</body>
</html>
