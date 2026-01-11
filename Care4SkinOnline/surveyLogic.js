// surveyLogic.js

// Funktion zum Summieren von Punkten
function calculateTotalPoints(selectedPoints) {
  return selectedPoints.reduce((sum, p) => sum + p, 0);
}

// Prüfen, ob alle Fragen beantwortet wurden
function allQuestionsAnswered(totalQuestions, answeredQuestions) {
  return answeredQuestions >= totalQuestions;
}

// Balkenwert berechnen
function normalizeBar(survey, type) {
  let normalized = 50;
  type = type.toLowerCase();

  if (survey === "skin") {
    if (type.includes("trocken")) normalized = 15;
    else if (type.includes("normal")) normalized = 40;
    else if (type.includes("misch")) normalized = 60;
    else if (type.includes("fett")) normalized = 85;
  } else {
    if (type.includes("stabil")) normalized = 20;
    else if (type.includes("leicht")) normalized = 45;
    else if (type.includes("empfindlich")) normalized = 80;
  }

  return normalized;
}

module.exports = { calculateTotalPoints, allQuestionsAnswered, normalizeBar };
