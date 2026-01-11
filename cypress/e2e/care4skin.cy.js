describe("Care4Skin – Umfrage", () => {
  it("zeigt das Formular", () => {
    cy.visit("http://localhost/Care4SkinOnline/survey.html");

    cy.get("form", { timeout: 10000 }).should("exist");
    cy.get(".question-card", { timeout: 10000 })
      .should("have.length.at.least", 1);
  });
});
