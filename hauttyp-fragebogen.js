const fragen = [
  "Wie fühlt sich Ihre Haut nach dem Waschen an?",
  "Wie sieht Ihre Stirn, Nase und Kinn im Laufe des Tages aus?",
  "Haben Sie häufig Rötungen, Juckreiz oder Reizungen?",
  "Wie reagieren Sie auf neue Hautpflegeprodukte?",
  "Wie oft haben Sie Pickel oder Unreinheiten?",
  "Wie fühlen sich Ihre Wangen im Vergleich zur Stirn/Nase an?"
];

const fragebogenContainer = document.getElementById("fragebogen");

fetch('get_antworten.php?typ=hauttyp')
  .then(res => res.json())
  .then(antworten => {
    fragen.forEach((frageText, index) => {
      const div = document.createElement("div");
      div.classList.add("frage");
      div.innerHTML = `<p>${index + 1}. ${frageText}</p>`;

      antworten[index + 1].forEach(opt => {
        const label = document.createElement("label");
        label.innerHTML = `<input type="radio" name="frage${index}" value="${opt.punkte}"> ${opt.text}`;
        div.appendChild(label);
        div.appendChild(document.createElement("br"));
      });

      fragebogenContainer.appendChild(div);
    });
  })
  .catch(err => console.error(err));

// Ergebnisberechnung
document.getElementById("submitButton").addEventListener("click", () => {
  let summe = 0;
  fragen.forEach((_, i) => {
    const selected = document.querySelector(`input[name="frage${i}"]:checked`);
    if (selected) summe += parseInt(selected.value);
  });

  // Tipps aus JS oder via PHP/DB abrufen
  // Beispiel JS:
  const tipps = [
    { min:6, max:8, hauttyp:"Normale Haut", empfehlung:"...", vermeiden:"..." },
    { min:9, max:11, hauttyp:"Trockene Haut", empfehlung:"...", vermeiden:"..." },
    { min:12, max:14, hauttyp:"Fettige Haut", empfehlung:"...", vermeiden:"..." },
    { min:15, max:17, hauttyp:"Mischhaut", empfehlung:"...", vermeiden:"..." },
    { min:18, max:99, hauttyp:"Empfindliche Haut", empfehlung:"...", vermeiden:"..." }
  ];

  const tipp = tipps.find(t => summe >= t.min && summe <= t.max);
  if (tipp) {
    alert(`Ihr Hauttyp: ${tipp.hauttyp}\n\nEmpfehlungen: ${tipp.empfehlung}\n\nZu vermeiden: ${tipp.vermeiden}`);
  } else {
    alert("Bitte beantworten Sie alle Fragen.");
  }
});
