<?php
$pdo = new PDO("mysql:host=localhost;dbname=care4skin;charset=utf8", "root", "");
$stmt = $pdo->query("SELECT * FROM tipps_hauttyp");
$tipps = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($tipps); // JSON zurückgeben
?>
