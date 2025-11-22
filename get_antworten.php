<?php
// Verbindung zur Datenbank
$servername = "localhost";
$username = "root";        // dein DB-User
$password = "";            // dein DB-Passwort
$dbname = "care4skin";     // dein DB-Name

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Verbindung fehlgeschlagen: " . $conn->connect_error);
}

// Alle Fragen aus der DB abrufen
$sql = "SELECT * FROM fragen_hauttyp ORDER BY id ASC";
$result = $conn->query($sql);

$fragen = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $fragen[] = $row;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hauttyp Fragebogen - Care4Skin</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <div class="logo">Care4Skin</div>
    <nav>
        <a href="index.html">Startseite</a>
        <a href="frageboegen.html">Fragebögen</a>
        <a href="impressum.html">Impressum</a>
    </nav>
</header>

<main>
    <h2>Hauttyp Analyse</h2>
    <form id="fragebogenForm">
        <?php foreach($fragen as $index => $f): ?>
        <div class="frage">
            <p><?= ($index+1) . ". " . $f['frage'] ?></p>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_a'] ?>"> <?= $f['antwort_a'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_b'] ?>"> <?= $f['antwort_b'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_c'] ?>"> <?= $f['antwort_c'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_d'] ?>"> <?= $f['antwort_d'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_e'] ?>"> <?= $f['antwort_e'] ?></label>
        </div>
        <hr>
        <?php endforeach; ?>
        <button type="button" onclick="auswerten()">Auswertung anzeigen</button>
    </form>

    <div id="ergebnis" style="margin-top:20px;"></div>
</main>

<script>
function auswerten() {
    const form = document.getElementById('fragebogenForm');
    const formData = new FormData(form);
    let summe = 0;

    for (let value of formData.values()) {
        summe += parseInt(value);
    }

    // AJAX Request an PHP senden, um Auswertung zu holen
    fetch('auswertung_hauttyp.php?punkte=' + summe)
    .then(response => response.text())
    .then(data => {
        document.getElementById('ergebnis').innerHTML = data;
    });
}
</script>

</body>
</html>
