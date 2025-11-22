<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "care4skin"; // oder "emotiva_db"

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Verbindung fehlgeschlagen: " . $conn->connect_error);
}

// Punkte aus dem Formular berechnen
$summe = 0;
foreach($_GET as $key => $value){
    if(str_starts_with($key, "frage")){
        $summe += intval($value);
    }
}

// Tipp aus DB abrufen
$sql = "SELECT * FROM tipps_hauttyp WHERE punkte_min <= $summe AND punkte_max >= $summe LIMIT 1";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hauttyp Ergebnis</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <div class="logo">Care4Skin</div>
    <nav>
        <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/frageboegen.css">
    <script src="js/frageboegen.js"></script>
        <a href="index.php">Startseite</a>
        <a href="frageboegen.php">Fragebögen</a>
        <a href="impressum.php">Impressum</a>
    </nav>
</header>

<main>
    <h2>Ergebnis der Hauttyp-Analyse</h2>
    <?php
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo "<h3>Ihr Hauttyp: " . $row['hauttyp'] . "</h3>";
        echo "<p><strong>Empfehlung:</strong> " . $row['empfehlung'] . "</p>";
        echo "<p><strong>Zu vermeiden:</strong> " . $row['vermeiden_produkte'] . "</p>";
    } else {
        echo "<p>Keine Auswertung gefunden.</p>";
    }
    ?>
    <a href="index.php">Zurück zum Fragebogen</a>
</main>
</body>
</html>

<?php $conn->close(); ?>
