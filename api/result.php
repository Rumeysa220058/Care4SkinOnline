<?php
$host = 'localhost';
$db   = 'care4skin';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    die("Datenbankfehler: " . $e->getMessage());
}

$user_id = 1;

$stmt = $pdo->prepare("
    SELECT survey_type, SUM(points) AS total_points
    FROM survey_answers
    WHERE user_id = ?
    GROUP BY survey_type
");
$stmt->execute([$user_id]);
$totals = $stmt->fetchAll();

$results = [];

foreach ($totals as $row) {
    $type   = $row['survey_type'];
    $points = (int)$row['total_points'];
    $key    = '';

    if ($type === 'skin_type') {
        if ($points <= 8)       $key = 'normale_haut';
        elseif ($points <= 11)  $key = 'trockene_haut';
        elseif ($points <= 14)  $key = 'fettige_haut';
        elseif ($points <= 17)  $key = 'mischhaut';
        else                    $key = 'empfindliche_haut';
    }

    if ($type === 'prevention') {
        if ($points <= 8)       $key = 'gesund';
        elseif ($points <= 11)  $key = 'rosazea';
        elseif ($points <= 14)  $key = 'akne';
        elseif ($points <= 17)  $key = 'ekzem';
        else                    $key = 'allergisch';
    }

    $results[$type] = [
        'points' => $points,
        'result_key' => $key
    ];
}

$tips = [];

foreach ($results as $type => $data) {
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

<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<title>Care4Skin – Ergebnis</title>
<link rel="stylesheet" href="assets/styles.css">
</head>
<body>

<h1>Dein Haut-Check Ergebnis</h1>

<?php foreach ($results as $type => $data): 
$maxPoints = 30;
$percent = round(($data['points'] / $maxPoints) * 100);
?>

<h2><?= $type === 'skin_type' ? 'Hauttyp' : 'Hautprobleme & Prävention' ?></h2>

<p><strong>Punkte:</strong> <?= $data['points'] ?></p>
<p><strong>Ergebnis:</strong> <?= str_replace('_', ' ', $data['result_key']) ?></p>

<div style="background:#ddd;border-radius:8px;width:100%;margin-bottom:20px;">
    <div style="width:<?= $percent ?>%;height:20px;background:#4CAF50;border-radius:8px;"></div>
</div>

<?php if (!empty($tips[$type])): ?>

<h3>Worauf du achten solltest</h3>
<ul>
<?php foreach ($tips[$type] as $tip): ?>
<?php if ($tip['category'] === 'attention'): ?>
<li><?= htmlspecialchars($tip['content']) ?></li>
<?php endif; ?>
<?php endforeach; ?>
</ul>

<h3>Diese Inhaltsstoffe vermeiden</h3>
<ul>
<?php foreach ($tips[$type] as $tip): ?>
<?php if ($tip['category'] === 'avoid'): ?>
<li><?= htmlspecialchars($tip['content']) ?></li>
<?php endif; ?>
<?php endforeach; ?>
</ul>

<h3>Tipps für dich</h3>
<ul>
<?php foreach ($tips[$type] as $tip): ?>
<?php if ($tip['category'] === 'tips'): ?>
<li><?= htmlspecialchars($tip['content']) ?></li>
<?php endif; ?>
<?php endforeach; ?>
</ul>

<?php endif; ?>
<hr>

<?php endforeach; ?>

</body>
</html>
