/*
Button klicken → Weiterleitung starten
Optional: Werte aus Formularen / Auswahl speichern
*/

// Wartet, bis die HTML-Seite geladen ist
document.addEventListener('DOMContentLoaded', function() {
    // Alle Buttons abrufen
    const hauttypButton = document.querySelector('.hauttyp .fragebogen-button');
    const hautproblemeButton = document.querySelector('.hautkrankheiten .fragebogen-button');

    // Klick-Event für Hauttyp-Test
    hauttypButton.onclick = function() {
        // Optional: hier Werte aus Formularen speichern
        window.location.href = 'hauttyp-fragebogen.html';
    };

    // Klick-Event für Hautprobleme-Test
    hautproblemeButton.onclick = function() {
        // Optional: hier Werte aus Formularen speichern
        window.location.href = 'hautprobleme-fragebogen.html';
    };
});
