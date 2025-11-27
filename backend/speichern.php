<?php
$pdo = new PDO("mysql:host=localhost;dbname=care4skin;charset=utf8", "root", ""); // Verbindung zur Datenbank herstellen
$data = json_decode(file_get_contents("php://input"), true); // JSON-Daten aus dem Request-Body lesen und dekodieren (=Daten, die vom Browser oder JavaScript an den Server geschickt werden, werden vom Server gelesen und in ein Format umgewandelt, das PHP versteht.)

if (!$data) { // Überprüfen, ob Daten empfangen wurden
    echo "Keine Daten empfangen!"; // Fehlermeldung ausgeben
    exit; // Skript beenden
}

$summe = $data["summe"]; // Werte aus dem dekodierten Array extrahieren
$hauttyp = $data["hauttyp"]; // Werte aus dem dekodierten Array extrahieren
$empfehlung = $data["empfehlung"]; // Werte aus dem dekodierten Array extrahieren
$vermeiden = $data["vermeiden"]; // Werte aus dem dekodierten Array extrahieren

$stmt = $pdo->prepare("INSERT INTO hautanalyse (summe, hauttyp, empfehlung, vermeiden) VALUES (?, ?, ?, ?)"); // SQL-Statement vorbereiten
$stmt->execute([$summe, $hauttyp, $empfehlung, $vermeiden]); // SQL-Statement mit den extrahierten Werten ausführen

echo "Ergebnis erfolgreich gespeichert!"; // Erfolgsmeldung ausgeben
?>
