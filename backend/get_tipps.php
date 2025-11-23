<?php
// CORS HEADER - GANZ OBEN!
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=utf-8");

// Dein bestehender Code...
$pdo = new PDO("mysql:host=localhost;dbname=care4skin;charset=utf8", "root", "");
$stmt = $pdo->query("SELECT * FROM tipps_hauttyp");
$tipps = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($tipps);
?>