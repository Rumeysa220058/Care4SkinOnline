// surveyLogic.test.js
const { calculateTotalPoints, allQuestionsAnswered, normalizeBar } = require("./surveyLogic");

test("calculateTotalPoints summiert richtig", () => {
  expect(calculateTotalPoints([1, 2, 3])).toBe(6);
});

test("allQuestionsAnswered erkennt vollständige Antworten", () => {
  expect(allQuestionsAnswered(5, 5)).toBe(true);
  expect(allQuestionsAnswered(5, 3)).toBe(false);
});

test("normalizeBar gibt richtigen Wert für skin zurück", () => {
  expect(normalizeBar("skin", "trocken")).toBe(15);
  expect(normalizeBar("skin", "normal")).toBe(40);
});

test("normalizeBar gibt richtigen Wert für prevention zurück", () => {
  expect(normalizeBar("prevention", "stabil")).toBe(20);
  expect(normalizeBar("prevention", "empfindlich")).toBe(80);
});
