
  let tipps = []; // globale Variable für Tipps

fetch("get_tipps.php")
  .then(res => res.json())
  .then(data => {
    tipps = data; // jetzt hast du die Tipps aus der DB
  })
  .catch(err => console.error("Fehler beim Laden der Tipps:", err));


const fragen = [
  "Wie fühlt sich Ihre Haut nach dem Waschen an?",
  "Wie sieht Ihre Stirn, Nase und Kinn im Laufe des Tages aus?",
  "Haben Sie häufig Rötungen, Juckreiz oder Reizungen?",
  "Wie reagieren Sie auf neue Hautpflegeprodukte?",
  "Wie oft haben Sie Pickel oder Unreinheiten?",
  "Wie fühlen sich Ihre Wangen im Vergleich zur Stirn/Nase an?"
];

const antworten = [
  ["Normal","Trocken","Fettig","Mischhaut","Empfindlich"],
  ["Keine Veränderung","Leicht trocken","Leicht fettig","Sehr wechselhaft","Rötungen/Juckreiz"],
  ["Nie","Selten","Manchmal","Oft","Sehr oft"],
  ["Kein Problem","Leicht empfindlich","Manchmal gereizt","Häufig gereizt","Sehr empfindlich"],
  ["Nie","Selten","Manchmal","Oft","Sehr oft"],
  ["Weicher als Stirn/Nase","Gleich wie Stirn/Nase","Leicht härter","Deutlich härter","Sehr unterschiedlich"]
];

/*
const tipps = [
  { 
    min: 6, 
    max: 8, 
    hauttyp: "Normale Haut", 
    empfehlung: "Ihre Haut ist im Gleichgewicht und zeigt weder zu viel Trockenheit noch übermäßigen Fettgehalt. Reinigen Sie sie regelmäßig, jedoch sanft, um die natürliche Schutzbarriere nicht zu stören. Achten Sie auf eine ausgewogene Hautpflege, die die Feuchtigkeit erhält, aber nicht beschwert. Schützen Sie Ihre Haut täglich vor intensiver Sonneneinstrahlung. Beobachten Sie, wie Ihre Haut auf verschiedene Produkte reagiert, und passen Sie die Pflege nur bei Bedarf an.", 
    vermeiden: "Vermeiden Sie stark reizende Produkte, aggressive Peelings oder stark alkoholhaltige Mittel, die das natürliche Gleichgewicht der Haut stören könnten. Verwenden Sie keine extremen Reinigungsmethoden oder zu viele unterschiedliche Pflegeprodukte gleichzeitig. Achten Sie darauf, dass die Haut nicht übermäßig strapaziert wird. Verzichten Sie auf Produkte mit sehr starkem Duft, die die Haut reizen könnten. Vermeiden Sie auch stark austrocknende Reinigungsmittel, die die Feuchtigkeit entziehen." 
  },
  { 
    min: 9, 
    max: 11, 
    hauttyp: "Trockene Haut", 
    empfehlung: "Ihre Haut neigt zu Spannungsgefühlen und benötigt regelmäßige Feuchtigkeitspflege. Reinigen Sie die Haut sanft und vermeiden Sie heißes Wasser, da dies die Haut weiter austrocknet. Nutzen Sie Produkte, die die Hautbarriere unterstützen und die natürliche Feuchtigkeit bewahren. Achten Sie darauf, die Haut nicht zu stark zu rubbeln oder mechanisch zu beanspruchen. Trinken Sie ausreichend Wasser, um die Haut von innen zu unterstützen und ihre Elastizität zu erhalten.", 
    vermeiden: "Vermeiden Sie Produkte mit hohem Alkoholanteil, aggressive chemische Peelings oder stark entfettende Seifen. Verzichten Sie auf stark parfümierte Mittel, die die Haut reizen könnten. Benutzen Sie keine sehr heißen Duschen oder Bäder, die die Haut zusätzlich austrocknen. Vermeiden Sie stark ölige Cremes, die die Poren belasten könnten. Verzichten Sie auf übermäßige Sonneneinstrahlung ohne Schutz, da trockene Haut schneller schädigt." 
  },
  { 
    min: 12, 
    max: 14, 
    hauttyp: "Fettige Haut", 
    empfehlung: "Ihre Haut produziert mehr Talg, was zu Glanz und verstopften Poren führen kann. Reinigen Sie die Haut regelmäßig, aber nicht zu aggressiv, um die Talgproduktion nicht zusätzlich anzuregen. Verwenden Sie leichte Pflegeprodukte, die die Haut nicht beschweren. Achten Sie auf Produkte, die die Haut mattieren, ohne sie auszutrocknen. Beobachten Sie, welche Pflege die Poren frei hält und die Haut beruhigt, um ein Gleichgewicht zu finden.", 
    vermeiden: "Vermeiden Sie sehr ölige oder sehr schwere Cremes, die die Poren verstopfen könnten. Verzichten Sie auf stark parfümierte Produkte, die Hautreizungen hervorrufen können. Nutzen Sie keine extrem austrocknenden Reinigungsmittel, da diese die Talgproduktion steigern können. Vermeiden Sie übermäßiges Peeling, das die Haut irritiert. Verzichten Sie auf Produkte mit zu viel Silikon, die die Haut beschweren könnten." 
  },
  { 
    min: 15, 
    max: 17, 
    hauttyp: "Mischhaut", 
    empfehlung: "Ihre Haut zeigt unterschiedliche Bedürfnisse je nach Zone: meist fettig in der T-Zone und trocken an den Wangen. Verwenden Sie unterschiedliche Pflegeprodukte für die verschiedenen Hautbereiche, um ein Gleichgewicht zu schaffen. Reinigen Sie die Haut sanft und vermeiden Sie aggressive Mittel, die eine Zone austrocknen oder die andere belasten. Achten Sie darauf, dass die Haut in allen Bereichen ausreichend Feuchtigkeit bekommt. Beobachten Sie die Reaktionen der Haut und passen Sie die Pflege an, wenn bestimmte Zonen übermäßig glänzen oder spannen.", 
    vermeiden: "Vermeiden Sie zu schwere Cremes auf den fettigen Bereichen und stark austrocknende Mittel auf trockenen Partien. Verzichten Sie auf stark reizende Produkte, die die Haut aus dem Gleichgewicht bringen. Nutzen Sie keine extrem ölhaltigen Produkte, die die Poren verstopfen. Vermeiden Sie aggressive Peelings, die unterschiedliche Hautzonen unterschiedlich belasten. Verzichten Sie auf Produkte, die die Haut in der einen Zone zu stark entfetten und in der anderen Zone zu stark belasten." 
  },
  { 
    min: 18, 
    max: 99, 
    hauttyp: "Empfindliche Haut", 
    empfehlung: "Ihre Haut reagiert leicht auf äußere Reize, daher ist besonders sanfte Pflege wichtig. Verwenden Sie nur sehr milde, pH-neutrale Produkte und testen Sie neue Pflegeprodukte zunächst auf einer kleinen Hautstelle. Achten Sie darauf, die Haut nicht zu stark zu reiben oder mechanisch zu beanspruchen. Schützen Sie die Haut vor extremen Temperaturen, starkem Wind oder direkter Sonne. Beobachten Sie die Hautreaktionen genau, um Reizungen frühzeitig zu erkennen und zu vermeiden.", 
    vermeiden: "Vermeiden Sie parfümierte, aggressive oder stark reizende Produkte, die Rötungen oder Irritationen auslösen können. Verzichten Sie auf übermäßige Peelings oder stark chemische Reinigungsmittel. Nutzen Sie keine stark alkoholhaltigen Produkte. Vermeiden Sie Produkte mit ätherischen Ölen, die zu Reizungen führen können. Achten Sie darauf, die Haut nicht mit zu vielen unterschiedlichen Produkten gleichzeitig zu belasten." 
  }
]; */

const startButton = document.getElementById("startButton");
const fragebogenForm = document.getElementById("fragebogenForm");
const fragebogenContainer = document.getElementById("fragebogen");
const submitButton = document.getElementById("submitButton");
const ergebnisDiv = document.getElementById("ergebnis");

// Start-Button klick → Fragen anzeigen
startButton.addEventListener("click", () => {
  startButton.style.display = "none"; // Button ausblenden
  fragebogenForm.style.display = "block"; // Formular einblenden

  // Fragen dynamisch erzeugen
  fragen.forEach((frageText, index) => {
    const div = document.createElement("div");
    div.classList.add("frage");
    div.innerHTML = `<p>${index + 1}. ${frageText}</p>`;

    antworten[index].forEach((opt, i) => {
      const label = document.createElement("label");
      label.innerHTML = `<input type="radio" name="frage${index}" value="${i+1}"> ${opt}`;
      div.appendChild(label);
      div.appendChild(document.createElement("br"));
    });

    fragebogenContainer.appendChild(div);
  });
});

// Ergebnis-Button
submitButton.addEventListener("click", () => {
  let summe = 0;
  fragen.forEach((_, i) => {
    const selected = document.querySelector(`input[name="frage${i}"]:checked`);
    if (selected) summe += parseInt(selected.value);
  });

  const tipp = tipps.find(t => summe >= t.min && summe <= t.max);

  if (tipp) {
    ergebnisDiv.innerHTML = `
      <h3>Ihr Hauttyp: ${tipp.hauttyp}</h3>
      <p><strong>Empfehlungen:</strong> ${tipp.empfehlung}</p>
      <p><strong>Zu vermeiden:</strong> ${tipp.vermeiden}</p>
    `;
  } else {
    ergebnisDiv.innerHTML = "<p>Bitte beantworten Sie alle Fragen.</p>";
  }
});
