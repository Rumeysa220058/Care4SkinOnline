<?php
 
$host = "mysql80.local:3307";   // MySQL Server (lokal)
$db   = "u242260db2";   // Datenbankname
$user = "u242260db2";        // Standard XAMPP Benutzer
$pass = "123456";            // Standard XAMPP Passwort (leer)
 
try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$db;charset=utf8",
        $user,
        $pass
    );
} catch (PDOException $e) {
    die("Datenbankverbindung fehlgeschlagen");
}
 