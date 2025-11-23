<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=utf-8");

$pdo = new PDO("mysql:host=localhost;dbname=care4skin;charset=utf8", "root", "");

$stmt = $pdo->query("SELECT * FROM tipps_hautkrankheiten");
$tipps = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($tipps);
?>