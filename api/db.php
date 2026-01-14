<?php $host = "localhost"; // MySQL Server (lokal) 
$db = "care4skin"; // Datenbankname 
$user = "root"; // Standard XAMPP Benutzer 
$pass = ""; // Standard XAMPP Passwort (leer) 
try {
    $pdo = new PDO(
        "mysql:host=$host;port=$port;dbname=$db;charset=utf8",
        $user,
        $pass
    );
    // echo nur lokal zum Testen
} catch (PDOException $e) {
    die("Datenbankverbindung fehlgeschlagen: " . $e->getMessage());
}