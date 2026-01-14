<?php

$host = getenv("MYSQLHOST");        // Railway Variable für Host
$port = getenv("MYSQLPORT");        // Railway Variable für Port
$db   = getenv("MYSQLDATABASE");    // Railway Variable für Datenbank
$user = getenv("MYSQLUSER");        // Railway Variable für Username
$pass = getenv("MYSQLPASSWORD");    // Railway Variable für Passwort

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
