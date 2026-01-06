// js/frageboegen_auswertung.js

document.addEventListener("DOMContentLoaded", () => {

    // Alle Fragebogen-Formulare auf der Seite
    const forms = document.querySelectorAll("form.survey-form");

    forms.forEach(form => {
        form.addEventListener("submit", (e) => {
            e.preventDefault(); // Formular nicht abschicken

            const formData = new FormData(form);
            let totalPoints = 0;

            // Punkte summieren: jede Antwort hat data-points-Attribut
            form.querySelectorAll("input[type=radio]:checked").forEach(input => {
                const points = parseInt(input.dataset.points || "0", 10);
                totalPoints += points;
            });

            // Ergebnis-Bereich erstellen oder updaten
            let resultDiv = form.querySelector(".survey-result");
            if (!resultDiv) {
                resultDiv = document.createElement("div");
                resultDiv.classList.add("survey-result");
                resultDiv.style.marginTop = "20px";
                resultDiv.style.padding = "10px";
                resultDiv.style.border = "1px solid #ccc";
                resultDiv.style.borderRadius = "8px";
                form.appendChild(resultDiv);
            }

            // Ergebnis berechnen (einfacher Key je nach Punkte)
            let resultKey = "";
            const type = form.dataset.type; // z.B. 'skin_type' oder 'prevention'
            if(type === "skin_type") {
                if(totalPoints <= 8) resultKey = "normale_haut";
                else if(totalPoints <= 11) resultKey = "trockene_haut";
                else if(totalPoints <= 14) resultKey = "fettige_haut";
                else if(totalPoints <= 17) resultKey = "mischhaut";
                else resultKey = "empfindliche_haut";
            } else if(type === "prevention") {
                if(totalPoints <= 8) resultKey = "gesund";
                else if(totalPoints <= 11) resultKey = "rosazea";
                else if(totalPoints <= 14) resultKey = "akne";
                else if(totalPoints <= 17) resultKey = "ekzem";
                else resultKey = "allergisch";
            }

            // Ergebnis anzeigen
            resultDiv.innerHTML = `
                <h3>Ergebnis: ${resultKey.replace("_", " ")}</h3>
                <p>Du hast ${totalPoints} Punkte erreicht.</p>
            `;

            // Optional: Balken visualisieren
            const maxPoints = 30; // Max Punkte anpassen
            const percent = Math.round((totalPoints / maxPoints) * 100);
            let bar = document.createElement("div");
            bar.style.width = "100%";
            bar.style.background = "#ddd";
            bar.style.borderRadius = "8px";
            bar.style.marginTop = "10px";
            let inner = document.createElement("div");
            inner.style.width = percent + "%";
            inner.style.height = "20px";
            inner.style.background = "#4CAF50";
            inner.style.borderRadius = "8px";
            bar.appendChild(inner);
            resultDiv.appendChild(bar);

        });
    });

});
