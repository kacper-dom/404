<?php
// templates/search_results.php
if (!empty($results)) {
    echo "<table>";
    echo "<thead><tr><th>Godzina</th><th>Przedmiot</th><th>Sala</th><th>Wykładowca</th><th>Grupa</th><th>Numer Albumu</th></tr></thead>";
    echo "<tbody>";
    foreach ($results as $row) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['Start']) . " - " . htmlspecialchars($row['End']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Przedmiot']) . "</td>";
        echo "<td>" . htmlspecialchars($row['NumerSali']) . "</td>";
        echo "<td>" . htmlspecialchars($row['ImieNazwisko']) . "</td>";
        echo "<td>" . htmlspecialchars($row['NumerGrupy']) . "</td>";
        echo "<td>" . htmlspecialchars($row['NumerAlbumu']) . "</td>";
        echo "</tr>";
    }
    echo "</tbody>";
    echo "</table>";
} else {
    echo "<p>Brak wyników do wyświetlenia.</p>";
}
?>
