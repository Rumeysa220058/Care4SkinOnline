<?php
// DB-Verbindung
$host = 'localhost';
$db   = 'care4skin';
$user = 'root';
$pass = ''; // Passwort anpassen
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    die("Datenbankfehler: " . $e->getMessage());
}

// Benutzer-ID
$user_id = 1; // Beispiel

//  Punkte summieren
$stmt = $pdo->prepare("
    SELECT survey_type, SUM(points) AS total_points
    FROM survey_answers
    WHERE user_id = ?
    GROUP BY survey_type
");
$stmt->execute([$user_id]);
$totals = $stmt->fetchAll();

$results = [];
foreach($totals as $row){
    $type = $row['survey_type'];
    $points = (int)$row['total_points'];

    // Hauttyp
    if($type == 'skin_type'){
        if($points <= 8) $key = 'normale_haut';
        elseif($points <= 11) $key = 'trockene_haut';
        elseif($points <= 14) $key = 'fettige_haut';
        elseif($points <= 17) $key = 'mischhaut';
        else $key = 'empfindliche_haut';
    }

    // Prävention
    if($type == 'prevention'){
        if($points <= 8) $key = 'gesund';
        elseif($points <= 11) $key = 'rosazea';
        elseif($points <= 14) $key = 'akne';
        elseif($points <= 17) $key = 'ekzem';
        else $key = 'allergisch';
    }

    $results[$type] = [
        'points' => $points,
        'result_key' => $key
    ];
}

// 4️⃣ Tipps aus DB abrufen
$tips = [];
foreach($results as $type => $data){
    $stmt = $pdo->prepare("
        SELECT category, content
        FROM survey_result_tips
        WHERE survey_type = ? AND result_key = ?
        ORDER BY FIELD(category,'attention','avoid','tips')
    ");
    $stmt->execute([$type, $data['result_key']]);
    $tips[$type] = $stmt->fetchAll();
}
?>
