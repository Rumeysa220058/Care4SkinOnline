<?php

$local = true; // setze auf false, wenn du auf Railway deployst

if ($local) {
    $host = "localhost";          // z. B. XAMPP MySQL Host
    $port = 3306;                 // Standard MySQL-Port
    $db   = "deine_lokale_db";    // Name deiner lokalen Datenbank
    $user = "root";               // XAMPP Standard: root
    $pass = "";                   // XAMPP Standard: kein Passwort
} else {
    // ---------------------------
    // Railway Verbindung
    $host = getenv("MYSQLHOST");
    $port = getenv("MYSQLPORT");
    $db   = getenv("MYSQLDATABASE");
    $user = getenv("MYSQLUSER");
    $pass = getenv("MYSQLPASSWORD");
}

// ---------------------------
// PDO-Verbindung aufbauen
try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$db;charset=utf8", $user, $pass);
    // echo "Verbindung erfolgreich!";
} catch (PDOException $e) {
    die("Fehler bei der Datenbankverbindung: " . $e->getMessage());
}
