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
      resultDiv.innerHTML = `
        <h2>Dein Ergebnis</h2>
        <p><strong>${data.type}</strong></p>
        <p>${data.description}</p>
        <div style="display:flex; gap:20px; margin-top:10px;">
          <div style="flex:1; padding:10px; border:1px solid #ccc; border-radius:8px;">
            <h3>Geeignete Inhaltsstoffe</h3>
            <p>${data.recommended}</p>
          </div>
          <div style="flex:1; padding:10px; border:1px solid #ccc; border-radius:8px;">
            <h3>Zu vermeiden</h3>
            <p>${data.to_avoid}</p>
          </div>
        </div>
      `;

      resultDiv.scrollIntoView({ behavior: "smooth" });
    } catch (err) {
      console.error("Fehler beim Abrufen des Ergebnisses:", err);
    }
  });
});