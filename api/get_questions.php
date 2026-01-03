<?php
header('Content-Type: application/json; charset=utf-8');
// Fehler anzeigen nur für Debugging (später auskommentieren oder auf 0 setzen)
ini_set('display_errors', 1);
error_reporting(E_ALL);

// DB einbinden
require __DIR__ . "/db.php"; // db.php liegt im gleichen Ordner (api/)

// Survey Parameter aus URL auslesen
$survey = isset($_GET['survey']) ? $_GET['survey'] : 'prevention';

// Tabelle auswählen und SQL mit Alias für JS-Freundlichkeit
if ($survey === "skin") {
    $sql = "SELECT
                ssq_id AS id,
                ssq_question AS question,
                ssq_option_a AS option_a, ssq_points_a AS points_a,
                ssq_option_b AS option_b, ssq_points_b AS points_b,
                ssq_option_c AS option_c, ssq_points_c AS points_c,
                ssq_option_d AS option_d, ssq_points_d AS points_d,
                ssq_option_e AS option_e, ssq_points_e AS points_e
            FROM ssq_survey_skin_type_questions";
} else {
    $sql = "SELECT
                spq_id AS id,
                spq_question AS question,
                spq_option_a AS option_a, spq_points_a AS points_a,
                spq_option_b AS option_b, spq_points_b AS points_b,
                spq_option_c AS option_c, spq_points_c AS points_c,
                spq_option_d AS option_d, spq_points_d AS points_d,
                spq_option_e AS option_e, spq_points_e AS points_e
            FROM spq_survey_prevention_questions";
}

// SQL ausführen
$stmt = $pdo->query($sql);

// JSON ausgeben
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
