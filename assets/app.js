document.addEventListener("DOMContentLoaded", () => {
  const params = new URLSearchParams(window.location.search);
  const survey = params.get("survey") || "prevention";

  const container = document.getElementById("questions-server-rendered");

  // Fetch Fragen von PHP
  fetch(`api/get_questions.php?survey=${survey}`)
    .then(res => res.json())
    .then(questions => {
      container.innerHTML = ""; // vorher leeren

      questions.forEach((q, index) => {
        const questionHTML = document.createElement("div");
        questionHTML.classList.add("question-card");

        questionHTML.innerHTML = `
          <p class="question-number">${index + 1}. ${q.question}</p>
          <div class="options">
            <label class="option"><input type="radio" name="q${q.id}" value="${q.points_a}"> ${q.option_a}</label>
            <label class="option"><input type="radio" name="q${q.id}" value="${q.points_b}"> ${q.option_b}</label>
            <label class="option"><input type="radio" name="q${q.id}" value="${q.points_c}"> ${q.option_c}</label>
            <label class="option"><input type="radio" name="q${q.id}" value="${q.points_d}"> ${q.option_d}</label>
            <label class="option"><input type="radio" name="q${q.id}" value="${q.points_e}"> ${q.option_e}</label>
          </div>
        `;

        container.appendChild(questionHTML);
      });
    })
    .catch(err => console.error("Fehler beim Laden der Fragen:", err));
});