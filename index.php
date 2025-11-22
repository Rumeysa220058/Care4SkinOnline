<?php
// Verbindung zur Datenbank
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "care4skin"; // oder "emotiva_db"

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
        <a href="index.php">Startseite</a>
        <a href="frageboegen.php">Fragebögen</a>
        <a href="impressum.php">Impressum</a>
    </nav>
</header>

<main>
    <h2>Hauttyp Analyse</h2>
    <form id="fragebogenForm" method="get" action="auswertung_hauttyp.php">
        <?php foreach($fragen as $index => $f): ?>
        <div class="frage">
            <p><?= ($index+1) . ". " . $f['frage'] ?></p>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_a'] ?>" required> <?= $f['antwort_a'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_b'] ?>"> <?= $f['antwort_b'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_c'] ?>"> <?= $f['antwort_c'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_d'] ?>"> <?= $f['antwort_d'] ?></label><br>
            <label><input type="radio" name="frage<?= $f['id'] ?>" value="<?= $f['punkte_e'] ?>"> <?= $f['antwort_e'] ?></label>
        </div>
        <hr>
        <?php endforeach; ?>
        <button type="submit">Auswertung anzeigen</button>
    </form>
</main>
</body>
</html>
