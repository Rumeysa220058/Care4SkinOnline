<?php
header("Access-Control-Allow-Origin: *"); // Erlaubt Zugriff von allen Domains (wichtig für fetch im Frontend)
header("Content-Type: application/json; charset=utf-8"); // Setzt den Content-Type auf JSON

$pdo = new PDO("mysql:host=localhost;dbname=care4skin;charset=utf8", "root", ""); // Verbindung zur Datenbank herstellen

$stmt = $pdo->query("SELECT * FROM tipps_hautkrankheiten"); // Alle Einträge aus der Tabelle abrufen
$tipps = $stmt->fetchAll(PDO::FETCH_ASSOC); // Ergebnisse als assoziatives Array holen, assoziatives Array = ein Array, bei dem jedem Wert ein Name (Schlüssel) zugeordnet ist, statt nur eine Nummer.
echo json_encode($tipps); // Ergebnisse als JSON kodieren und ausgeben
?>