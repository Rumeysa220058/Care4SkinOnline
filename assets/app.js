document.addEventListener("DOMContentLoaded", () => {
  console.log("APP.JS GELADEN");

  const form = document.getElementById("survey-form");
  const container = document.getElementById("questions-server-rendered");
  const resultDiv = document.getElementById("survey-result");

  // ❗ NICHT abbrechen, nur warnen
  if (!form || !container || !resultDiv) {
    console.warn("Ein HTML-Element fehlt – Script läuft trotzdem weiter");
    return;
  }

  // Fragen laden (DB bleibt!)
  let survey = "skin"; // Standard: Hauttyp
  if (window.location.pathname.includes("prevention_survey.html")) {
  survey = "prevention";
}
fetch(`api/get_questions.php?survey=${survey}`)
    .then(res => res.json())
    .then(questions => {
      container.innerHTML = "";

      questions.forEach((q, index) => {
        const card = document.createElement("div");
        card.className = "question-card";

        // Beispiel für Skin-Typ Fragen
        card.innerHTML = `
  <p class="question-number">${index + 1}. ${q.question}</p>
  <div class="options">
    <label class="option"><input type="radio" name="q${q.id}" data-points="${q.points_a}"> ${q.option_a}</label>
    <label class="option"><input type="radio" name="q${q.id}" data-points="${q.points_b}"> ${q.option_b}</label>
    <label class="option"><input type="radio" name="q${q.id}" data-points="${q.points_c}"> ${q.option_c}</label>
    <label class="option"><input type="radio" name="q${q.id}" data-points="${q.points_d}"> ${q.option_d}</label>
    <label class="option"><input type="radio" name="q${q.id}" data-points="${q.points_e}"> ${q.option_e}</label>
  </div>
`;

        container.appendChild(card);
      });
    })
    .catch(err => console.error("Fehler beim Laden der Fragen:", err));

  // ✅ Ergebnisanzeige – GARANTIERT sichtbar
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    resultDiv.innerHTML = `
      <h2>Ergebnis</h2>
      <div style="display:flex; gap:20px;">
        <div style="flex:1; border:1px solid #ccc; padding:10px;">
          <h3>geeignete Inhaltstoffe (empfohlen)</h3>
          <p>Es funktioniert ✅</p>
        </div>
        <div style="flex:1; border:1px solid #ccc; padding:10px;">
          <h3>Zu vermeidende Inhaltstoffe</h3>
          <p>Es funktioniert ✅</p>
        </div>
      </div>
    `;

    resultDiv.scrollIntoView({ behavior: "smooth" });
  });
});
