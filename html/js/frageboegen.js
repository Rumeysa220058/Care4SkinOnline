document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen - Buttons sind bereit!");

    const fragen = [
        "Wie fühlt sich Ihre Haut nach dem Waschen an?",
        "Wie sieht Ihre Stirn, Nase und Kinn im Laufe des Tages aus?",
        "Haben Sie häufig Rötungen, Juckreiz oder Reizungen?",
        "Wie reagieren Sie auf neue Hautpflegeprodukte?",
        "Wie oft haben Sie Pickel oder Unreinheiten?",
        "Wie fühlen sich Ihre Wangen im Vergleich zur Stirn/Nase an?"
    ];

    const antworten = [
        ["Normal", "Trocken", "Fettig", "Mischhaut", "Empfindlich"],
        ["Keine Veränderung", "Leicht trocken", "Leicht fettig", "Sehr wechselhaft", "Rötungen/Juckreiz"],
        ["Nie", "Selten", "Manchmal", "Oft", "Sehr oft"],
        ["Kein Problem", "Leicht empfindlich", "Manchmal gereizt", "Häufig gereizt", "Sehr empfindlich"],
        ["Nie", "Selten", "Manchmal", "Oft", "Sehr oft"],
        ["Weicher als Stirn/Nase", "Gleich wie Stirn/Nase", "Leicht härter", "Deutlich härter", "Sehr unterschiedlich"]
    ];

    const startButton = document.getElementById("startButton");
    const fragebogenForm = document.getElementById("fragebogenForm");
    const fragebogenContainer = document.getElementById("fragebogen");
    const submitButton = document.getElementById("submitButton");
    const ergebnisDiv = document.getElementById("ergebnis");

    // Start-Button klick → Fragen anzeigen
    startButton.addEventListener("click", function() {
        console.log("Start-Button geklickt!");
        startButton.style.display = "none";
        fragebogenForm.style.display = "block";

        // Fragen dynamisch erzeugen
        fragen.forEach((frageText, index) => {
            const div = document.createElement("div");
            div.classList.add("frage");
            div.innerHTML = `<p>${index + 1}. ${frageText}</p>`;

            antworten[index].forEach((opt, i) => {
                const label = document.createElement("label");
                label.innerHTML = `<input type="radio" name="frage${index}" value="${i + 1}"> ${opt}`;
                div.appendChild(label);
                div.appendChild(document.createElement("br"));
            });

            fragebogenContainer.appendChild(div);
        });
    });

    // Ergebnis-Button MIT DATENBANK
    submitButton.addEventListener("click", function() {
        console.log("Ergebnis-Button geklickt!");
        
        let summe = 0;
        let alleBeantwortet = true;

        fragen.forEach((_, i) => {
            const selected = document.querySelector(`input[name="frage${i}"]:checked`);
            if (selected) {
                summe += parseInt(selected.value);
            } else {
                alleBeantwortet = false;
            }
        });

        if (!alleBeantwortet) {
            ergebnisDiv.innerHTML = "<p style='color: red;'>Bitte beantworten Sie alle Fragen.</p>";
            return;
        }

        console.log("Punkte gesamt: " + summe);

        // DATENBANK ABFRAGE
        fetch("http://localhost/care4skin/backend/get_tipps.php")
            .then(res => {
                if (!res.ok) {
                    throw new Error("Fehler beim Laden der Tipps");
                }
                return res.json();
            })
            .then(tipps => {
                console.log("Tipps aus DB:", tipps);
                
                const tipp = tipps.find(t => {
                    const min = parseInt(t.punkte_min);
                    const max = parseInt(t.punkte_max);
                    return summe >= min && summe <= max;
                });
                
                console.log("Gefundener Tipp:", tipp);
                
                if (tipp) {
                    console.log("ZEIGE ERGEBNIS AN!");
                    
                    // Ergebnis-DIV sichtbar machen (auch wenn Formular versteckt ist)
                    ergebnisDiv.style.display = "block";
                    ergebnisDiv.style.background = "#e8f4f8";
                    ergebnisDiv.style.padding = "20px";
                    ergebnisDiv.style.borderRadius = "10px";
                    ergebnisDiv.style.marginTop = "20px";
                    ergebnisDiv.style.border = "2px solid #a8dadc";
                    
                    ergebnisDiv.innerHTML = 
                        `<div style="font-size: 18px;">
                            <h3 style="color: #1d3557;">Ihr Hauttyp: ${tipp.hauttyp}</h3>
                            <p><strong>Empfehlungen:</strong> ${tipp.empfehlung}</p>
                            <p><strong>Zu vermeiden:</strong> ${tipp.vermeiden_produkte}</p>
                        </div>`;
                        
                    // Scroll zum Ergebnis
                    ergebnisDiv.scrollIntoView({ behavior: 'smooth' });
                } else {
                    ergebnisDiv.innerHTML = `<p>Kein passender Hauttyp für ${summe} Punkte gefunden.</p>`;
                }
            })
            .catch(err => {
                console.error("Fehler:", err);
                ergebnisDiv.innerHTML = `<p style='color: red;'>Fehler beim Laden der Daten: ${err.message}</p>`;
            });
    });

    console.log("Event Listener registriert!");
});