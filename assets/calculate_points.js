document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("survey-form");
  const container = document.getElementById("questions-server-rendered");
  const resultDiv = document.getElementById("survey-result");

  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    // Punkte summieren
    const totalPoints = [...container.querySelectorAll("input[type=radio]:checked")]
      .reduce((sum, input) => sum + parseInt(input.dataset.points), 0);

    // Survey-Typ aus hidden input oder URL
    const survey = form.dataset.survey || 'prevention';

    // Ergebnis vom Server abrufen
    try {
      const res = await fetch("api/get_result.php", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: `survey=${survey}&total_points=${totalPoints}`
      });

      const data = await res.json();

      // Ergebnis anzeigen
// Ergebnis anzeigen
if (survey === 'skin') {
  const minPoints = 6;
  const maxPoints = 30;
  const normalized = ((totalPoints - minPoints) / (maxPoints - minPoints)) * 100;

  // HTML erzeugen
  resultDiv.innerHTML = `
    <h2>Dein Ergebnis</h2>
    <p><strong>${data.type}</strong></p>
    <p>${data.description}</p>

    <!-- Hauttyp-Balken -->
    <div class="skin-bar-container">
      <span class="skin-bar-label left">Trocken</span>
      <div class="skin-bar">
        <div class="skin-bar-fill"></div>
      </div>
      <span class="skin-bar-label right">Ölig</span>
    </div>

    <div style="display:flex; gap:20px; margin-top:10px;">
      <div style="flex:1; padding:10px; border:1px solid #ccc; border-radius:8px;">
        <h3>Geeignete Inhaltsstoffe</h3>
        <div>
          ${data.recommended.split(',').map(i => `• ${i.trim()}<br>`).join('')}
        </div>
      </div>
      <div style="flex:1; padding:10px; border:1px solid #ccc; border-radius:8px;">
        <h3>Zu vermeiden</h3>
        <div>
          ${data.to_avoid.split(',').map(i => `• ${i.trim()}<br>`).join('')}
        </div>
      </div>
    </div>
  `;

  // Balken füllen und Prozentanzeige setzen
  const barFill = resultDiv.querySelector('.skin-bar-fill');
  if (barFill) {
  barFill.style.width = normalized + '%';
  barFill.textContent = Math.round(normalized) + '%'; // Prozentzahl bleibt
}
}

else {
  // Präventions-Umfrage bleibt unverändert
  resultDiv.innerHTML = `
    <h2>Dein Ergebnis</h2>
    <p><strong>${data.type}</strong></p>
    <p>${data.description}</p>
    <div style="display:flex; gap:20px; margin-top:10px;">
      <div style="flex:1; padding:10px; border:1px solid #ccc; border-radius:8px;">
        <h3>Geeignete Inhaltsstoffe</h3>
        <div>
          ${data.recommended.split(',').map(i => `• ${i.trim()}<br>`).join('')}
        </div>
      </div>
      <div style="flex:1; padding:10px; border:1px solid #ccc; border-radius:8px;">
        <h3>Zu vermeiden</h3>
        <div>
          ${data.to_avoid.split(',').map(i => `• ${i.trim()}<br>`).join('')}
        </div>
      </div>
    </div>
  `;
}

      resultDiv.scrollIntoView({ behavior: "smooth" });
    } catch (err) {
      console.error("Fehler beim Abrufen des Ergebnisses:", err);
    }
  });
});