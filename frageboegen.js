// Hole das <main> Element
const content = document.getElementById('content');

// HTML nur für den Main-Bereich
const frageboegenHTML = `
  <div class="frageboegen-container">
    <h2>Wähle deinen Fragebogen</h2>
    <p>Beantworte einige Fragen und erhalte personalisierte Hautpflege-Empfehlungen</p>

    <div class="frageboegen-auswahl">
      <div class="fragebogen-karte hauttyp">
        <h3>Hauttyp Analyse</h3>
        <p>Finde heraus welcher Hauttyp du bist.</p>
        <button onclick="location.href='hauttyp-fragebogen.html'">Hauttyp Test starten</button>
      </div>

      <div class="fragebogen-karte hautkrankheiten">
        <h3>Hautprobleme & Prävention</h3>
        <p>Erhalte Tipps bei Hautproblemen.</p>
        <button onclick="location.href='hautprobleme-fragebogen.html'">Hautprobleme Test starten</button>
      </div>
    </div>
  </div>
`;

// HTML in <main> schreiben
content.innerHTML = frageboegenHTML;
