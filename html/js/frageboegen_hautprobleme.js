document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen - Buttons sind bereit!");

    const fragen = [
        "Wie sieht Ihre Haut im Alltag meist aus?",
        "Wie reagiert Ihre Haut auf neue Produkte oder Kosmetik?",
        "Wann treten Ihre Hautprobleme am häufigsten auf?",
        "Wie fühlt sich Ihre Haut an?",
        "Haben Sie häufig Juckreiz oder Brennen?",
        "Welche Stellen sind am meisten betroffen?"
    ]; 

    
    const antworten = [
        ["Glatt und gleichmäßig", "Rötlich oder mit sichtbaren Äderchen", "Unrein mit Pickeln oder Mitessern", "Trockene, schuppige Stellen", "Gereizt, mit Juckreiz oder Brennen"],
        ["Keine Reaktion", "Brennt oder rötet sich leicht", "Wird schnell fettig und bekommt Unreinheiten", "Wird trockener oder spannt", "Wird heiß oder rötet sich an Wangen und Nase"],
        ["Eigentlich nie", "Nach Stress oder Hitze", "In der Pubertät oder bei hormonellen Veränderungen", "Bei Kälte oder nach dem Duschen", "Nach Kontakt mit bestimmten Stoffen, Cremes oder Lebensmitteln"],
        ["Glatt und normal", "Brennend oder heiß", "Fettig mit Unterlagerungen", "Rau, gespannt oder schuppig", "Juckend oder kribbelnd"],
        ["Nein, kaum", "Ja, vor allem nach bestimmten Produkten", "Nur wenn Pickel entzündet sind", "Manchmal, wenn die Haut sehr trocken ist", "Leichtes Brennen oder Wärmegefühl im Gesicht"],
        ["Keine bestimmten Stellen", "Wangen, Nase, Stirn", "Stirn, Nase, Kinn, Rücken", "Arme, Hände, Beine", "Unterschiedlich, je nach Reizstoff"]
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
        fetch("http://localhost/Care4Skin-main/backend/get_tipps_hautkrankheiten.php")
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
                    
                    ergebnisDiv.style.display = "block";
                    ergebnisDiv.style.background = "#e8f4f8";
                    ergebnisDiv.style.padding = "20px";
                    ergebnisDiv.style.borderRadius = "10px";
                    ergebnisDiv.style.marginTop = "20px";
                    ergebnisDiv.style.border = "2px solid #a8dadc";
                    
                    ergebnisDiv.innerHTML = 
                        `<div style="font-size: 18px;">
                            <h3 style="color: #1d3557;">Ihr Hautproblem: ${tipp.hautproblem}</h3>
                            <p><strong>Empfehlungen:</strong> ${tipp.empfehlung}</p>
                            <p><strong>Zu vermeiden:</strong> ${tipp.vermeiden_produkte}</p>
                        </div>`;
                        
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