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
      return;
    }

    // Punkte summieren
    const totalPoints = [...container.querySelectorAll("input[type=radio]:checked")]
      .reduce((sum, input) => sum + parseInt(input.dataset.points), 0);

    const survey = form.dataset.survey || "prevention";

    try {
      const res = await fetch("api/get_result.php", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: `survey=${survey}&total_points=${totalPoints}`
      });

      const data = await res.json();

      // =========================
      // BALKEN-WERT FESTLEGEN
      // =========================
      let normalized = 50;

      if (survey === "skin") {
        const type = data.type.toLowerCase();

        if (type.includes("trocken")) normalized = 15;
        else if (type.includes("normal")) normalized = 40;
        else if (type.includes("misch")) normalized = 60;
        else if (type.includes("fett")) normalized = 85;
      } else {
        const type = data.type.toLowerCase();

        if (type.includes("stabil")) normalized = 20;
        else if (type.includes("leicht")) normalized = 45;
        else if (type.includes("empfindlich")) normalized = 80;
      }

      // =========================
      // AUSGABE
      // =========================
      resultDiv.innerHTML = `
        <h2>Dein Ergebnis</h2>
        <p><strong>${data.type}</strong></p>
        <p>${data.description}</p>

        <div class="${survey === "skin" ? "skin-bar-container" : "prevention-bar-container"}">
          <span class="${survey === "skin" ? "skin-bar-label" : "prevention-bar-label"} left">
            ${survey === "skin" ? "Trocken" : "Stabil"}
          </span>

          <div class="${survey === "skin" ? "skin-bar-wrapper" : "prevention-bar-wrapper"}">
            <div class="${survey === "skin" ? "skin-bar" : "prevention-bar"}">
              <div class="${survey === "skin" ? "skin-bar-fill" : "prevention-bar-fill"}"
                   style="width:${normalized}%;">
              </div>
            </div>
          </div>

          <span class="${survey === "skin" ? "skin-bar-label" : "prevention-bar-label"} right">
            ${survey === "skin" ? "Ölig" : "Empfindlich"}
          </span>
        </div>

        <div style="display:flex; gap:20px; margin-top:15px;">
          <div style="flex:1; padding:12px; border:1px solid #ccc; border-radius:8px;">
            <h3>Geeignete Inhaltsstoffe</h3>
            ${data.recommended.split(',').map(i => `• ${i.trim()}<br>`).join('')}
          </div>
          <div style="flex:1; padding:12px; border:1px solid #ccc; border-radius:8px;">
            <h3>Zu vermeiden</h3>
            ${data.to_avoid.split(',').map(i => `• ${i.trim()}<br>`).join('')}
          </div>
        </div>
      `;

      resultDiv.scrollIntoView({ behavior: "smooth" });

    } catch (err) {
      console.error("Fehler beim Abrufen des Ergebnisses:", err);
    }
  });
});
