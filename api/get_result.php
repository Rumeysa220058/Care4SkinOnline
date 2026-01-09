<?php
header('Content-Type: application/json; charset=utf-8');
require __DIR__ . "/db.php"; // DB-Verbindung

// Daten aus POST
$survey = isset($_POST['survey']) ? $_POST['survey'] : 'prevention';
$total_points = isset($_POST['total_points']) ? intval($_POST['total_points']) : 0;

// Tabelle auswählen
if ($survey === "skin") {
    $table = "ssr_survey_skintype_results";
    $min_col = "ssr_min_points";
    $max_col = "ssr_max_points";
    $type_col = "ssr_skin_type";
    $desc_col = "ssr_description";
    $rec_col = "ssr_recommended_ingredients";
    $avoid_col = "ssr_to_avoid_ingredients";
} else {
    $table = "spr_survey_prevention_results";
    $min_col = "spr_min_points";
    $max_col = "spr_max_points";
    $type_col = "spr_skin_condition";
    $desc_col = "spr_description";
    $rec_col = "spr_recommended_ingredients";
    $avoid_col = "spr_to_avoid_ingredients";
}

// Query: passende Kategorie für die Punktesumme finden
$sql = "SELECT * FROM $table WHERE $min_col <= :points AND $max_col >= :points LIMIT 1";
$stmt = $pdo->prepare($sql);
$stmt->execute(['points' => $total_points]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);

if ($result) {
    echo json_encode([
        'type' => $result[$type_col],
        'description' => $result[$desc_col],
        'recommended' => $result[$rec_col],
        'to_avoid' => $result[$avoid_col]
    ]);
} else {
    echo json_encode([
        'type' => 'Keine Daten gefunden',
        'description' => '',
        'recommended' => '',
        'to_avoid' => ''
    ]);
}