<?php

$host = getenv("MYSQLHOST");        // Variable für Host
$port = getenv("MYSQLPORT");        // Variable für Port
$db   = getenv("MYSQLDATABASE");    // Variable für Datenbank
$user = getenv("MYSQLUSER");        // Variable für Username
$pass = getenv("MYSQLPASSWORD");    // Variable für Passwort


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

//diesen Teil beim Hosting verwendet

//<?php

//$host = "mysql80.local:3307";   // MySQL Server (lokal)
//$db   = "u242260db2";          // Datenbankname
//$user = "u242260db2";         // Standard XAMPP Benutzer
//$pass = "123456";            // Standard XAMPP Passwort (leer)

//try {
//    $pdo = new PDO(
//        "mysql:host=$host;dbname=$db;charset=utf8",
//        $user,
//        $pass
//    );
//} catch (PDOException $e) {
//    die("Datenbankverbindung fehlgeschlagen");
//}

