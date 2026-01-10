document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("survey-form");
  const container = document.getElementById("questions-server-rendered");
  const resultDiv = document.getElementById("survey-result");

  form.addEventListener("submit", async (e) => {
    e.preventDefault();
    // Prüfen, ob alle Fragen beantwortet wurden
const totalQuestions = container.querySelectorAll(".question-card").length;
const answeredQuestions = new Set(
  [...container.querySelectorAll("input[type=radio]:checked")]
    .map(input => input.name)
).size;

if (answeredQuestions < totalQuestions) {
  resultDiv.innerHTML = `
    <p style="
      color: #b00020;
      font-weight: bold;
      background: #fdecea;
      padding: 12px;
      border-radius: 8px;
      border: 1px solid #f5c2c7;
    ">
    Bitte zuerst alle Fragen beantworten.
    </p>
  `;
  resultDiv.scrollIntoView({ behavior: "smooth" });
  return; // Ergebnis NICHT berechnen
}

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

  resultDiv.innerHTML = `
    <h2>Dein Ergebnis</h2>
    <p><strong>${data.type}</strong></p>
    <p>${data.description}</p>

    <!-- Hauttyp-Balken -->
    <div class="skin-bar-container">
      <span class="skin-bar-label left">Trocken</span>
      <div class="skin-bar-wrapper">
        <div class="skin-bar">
          <div class="skin-bar-fill" style="width: ${normalized}%;"></div>
        </div>
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

} else {
  const minPoints = 6;
  const maxPoints = 30;
  const normalized = ((totalPoints - minPoints) / (maxPoints - minPoints)) * 100;

  resultDiv.innerHTML = `
    <h2>Dein Ergebnis</h2>
    <p><strong>${data.type}</strong></p>
    <p>${data.description}</p>

    <!-- Präventions-Balken -->
    <div class="prevention-bar-container">
      <span class="prevention-bar-label left">Stabil</span>
      <div class="prevention-bar-wrapper">
        <div class="prevention-bar">
          <div class="prevention-bar-fill" style="width: ${normalized}%;"></div>
        </div>
      </div>
      <span class="prevention-bar-label right">Empfindlich</span>
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
}



      resultDiv.scrollIntoView({ behavior: "smooth" });
    } catch (err) {
      console.error("Fehler beim Abrufen des Ergebnisses:", err);
    }
  });
});
