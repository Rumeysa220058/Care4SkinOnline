<?php
$pdo = new PDO("mysql:host=localhost;dbname=care4skin;charset=utf8", "root", "");
$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo "Keine Daten empfangen!";
    exit;
}

$summe = $data["summe"];
$hauttyp = $data["hauttyp"];
$empfehlung = $data["empfehlung"];
$vermeiden = $data["vermeiden"];

$stmt = $pdo->prepare("INSERT INTO hautanalyse (summe, hauttyp, empfehlung, vermeiden) VALUES (?, ?, ?, ?)");
$stmt->execute([$summe, $hauttyp, $empfehlung, $vermeiden]);

echo "Ergebnis erfolgreich gespeichert!";
?>
