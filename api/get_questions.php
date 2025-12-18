<?php
header('Content-Type: application/json; charset=utf-8');
// Fehler anzeigen nur für Debugging (später auskommentieren oder auf 0 setzen)
ini_set('display_errors', 1);
error_reporting(E_ALL);

// DB einbinden
require __DIR__ . "/db.php"; // db.php liegt im gleichen Ordner (api/)

// Survey Parameter aus URL auslesen
$survey = isset($_GET['survey']) ? $_GET['survey'] : 'prevention';

// Tabelle auswählen
if ($survey === "skin") {
    $table = "survey_skin_type_questions";
} else {
    $table = "survey_prevention_questions";
}

// SQL vorbereiten: alle Fragen + Optionen + Punkte
$sql = "SELECT id, question, 
               option_a, points_a, 
               option_b, points_b, 
               option_c, points_c, 
               option_d, points_d, 
               option_e, points_e 
        FROM $table";

$stmt = $pdo->query($sql);

// JSON ausgeben
header('Content-Type: application/json; charset=utf-8');
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
