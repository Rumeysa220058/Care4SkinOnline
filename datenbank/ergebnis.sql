USE care4skin;

DROP TABLE IF EXISTS ssq_survey_skin_type_questions;

CREATE TABLE ssq_survey_skin_type_questions (
    ssq_id INT AUTO_INCREMENT PRIMARY KEY,
    ssq_question TEXT NOT NULL,

    ssq_option_a TEXT NOT NULL,
    ssq_points_a INT NOT NULL,

    ssq_option_b TEXT NOT NULL,
    ssq_points_b INT NOT NULL,

    ssq_option_c TEXT NOT NULL,
    ssq_points_c INT NOT NULL,

    ssq_option_d TEXT NOT NULL,
    ssq_points_d INT NOT NULL,

    ssq_option_e TEXT NOT NULL,
    ssq_points_e INT NOT NULL
);

INSERT INTO ssq_survey_skin_type_questions
(ssq_question, ssq_option_a, ssq_points_a,
 ssq_option_b, ssq_points_b,
 ssq_option_c, ssq_points_c,
 ssq_option_d, ssq_points_d,
 ssq_option_e, ssq_points_e)
VALUES
('Wie fühlt sich Ihre Haut nach dem Waschen an?',
'Frisch und ausgeglichen', 1,
'Spannend oder trocken', 2,
'Ölig oder glänzend', 3,
'Mischung aus trocken und ölig', 4,
'Rötet oder juckt leicht', 5
),
('Wie sieht Ihre Stirn, Nase und Kinn im Laufe des Tages aus?',
'Matt und ausgeglichen', 1,
'Trocken, kaum Glanz', 2,
'Glänzend', 3,
'T-Zone glänzt, Wangen trocken', 4,
'Rötet oder juckt leicht', 5
),
('Haben Sie häufig Rötungen, Juckreiz oder Reizungen?',
'Selten', 1,
'Gelegentlich', 2,
'Oft', 5,
'Manchmal in einzelnen Bereichen', 4,
'Kaum auffällig', 3
),
('Wie reagieren Sie auf neue Hautpflegeprodukte?',
'Keine Probleme', 1,
'Gelegentlich kleine Irritationen', 2,
'Schnell Reizungen oder Rötungen', 5,
'Manche Bereiche reagieren stärker', 4,
'Keine auffällige Reaktion', 3
),
('Wie oft haben Sie Pickel oder Unreinheiten?',
'Selten', 1,
'Manchmal', 4,
'Häufig', 3,
'Kaum', 2,
'Stark unregelmäßig, oft bei Reizungen', 5
),
('Wie fühlen sich Ihre Wangen im Vergleich zur Stirn/Nase an?',
'Gleichmäßig', 1,
'Trockener als T-Zone', 4,
'Ölig wie T-Zone', 3,
'Sehr trocken', 2,
'Neigt zu Rötungen oder Juckreiz', 5
);

-- PRÄVENTION / HAUTPROBLEME (spq)
DROP TABLE IF EXISTS spq_survey_prevention_questions;

CREATE TABLE spq_survey_prevention_questions (
    spq_id INT AUTO_INCREMENT PRIMARY KEY,
    spq_question TEXT NOT NULL,

    spq_option_a TEXT NOT NULL,
    spq_points_a INT NOT NULL,

    spq_option_b TEXT NOT NULL,
    spq_points_b INT NOT NULL,

    spq_option_c TEXT NOT NULL,
    spq_points_c INT NOT NULL,

    spq_option_d TEXT NOT NULL,
    spq_points_d INT NOT NULL,

    spq_option_e TEXT NOT NULL,
    spq_points_e INT NOT NULL
);

INSERT INTO spq_survey_prevention_questions
(spq_question, spq_option_a, spq_points_a,
 spq_option_b, spq_points_b,
 spq_option_c, spq_points_c,
 spq_option_d, spq_points_d,
 spq_option_e, spq_points_e)
VALUES
('Wie sieht Ihre Haut im Alltag meist aus?',
'Glatt und gleichmäßig', 1,
'Rötlich oder mit sichtbaren Äderchen', 2,
'Unrein mit Pickeln oder Mitessern', 3,
'Trockene, schuppige Stellen', 4,
'Gereizt, mit Juckreiz oder Brennen', 5
),
('Wie reagiert Ihre Haut auf neue Produkte oder Kosmetik?',
'Keine Reaktion', 1,
'Brennt oder rötet sich leicht', 5,
'Wird schnell fettig und bekommt Unreinheiten', 3,
'Wird trockener oder spannt', 4,
'Wird heiß oder rötet sich an Wangen und Nase', 2
),
('Wann treten Ihre Hautprobleme am häufigsten auf?',
'Eigentlich nie', 1,
'Nach Stress oder Hitze', 2,
'In der Pubertät oder bei hormonellen Veränderungen', 3,
'Bei Kälte oder nach dem Duschen', 4,
'Nach Kontakt mit bestimmten Stoffen, Cremes oder Lebensmitteln', 5
),
('Wie fühlt sich Ihre Haut an?',
'Glatt und normal', 1,
'Brennend oder heiß', 2,
'Fettig mit Unterlagerungen', 3,
'Rau, gespannt oder schuppig', 4,
'Juckend oder kribbelnd', 5
),
('Haben Sie häufig Juckreiz oder Brennen?',
'Nein, kaum', 1,
'Ja, vor allem nach bestimmten Produkten', 5,
'Manchmal, wenn die Haut sehr trocken ist', 4,
'Leichtes Brennen oder Wärmegefühl im Gesicht', 2,
'Nur wenn Pickel entzündet sind', 3
),
('Welche Stellen sind am meisten betroffen?',
'Keine bestimmten Stellen', 1,
'Wangen, Nase, Stirn', 2,
'Stirn, Nase, Kinn, Rücken', 3,
'Arme, Hände, Beine', 4,
'Unterschiedlich, je nach Reizstoff', 5
);
-- =========================
-- HAUTTYP FRAGEBOGEN
-- =========================

-- =========================
-- ERGEBNIS-TEXTE TABELLE ERSTELLEN
-- =========================
DROP TABLE IF EXISTS survey_result_tips;

CREATE TABLE survey_result_tips (
    tip_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_type ENUM('skin_type','prevention') NOT NULL,
    result_key VARCHAR(50) NOT NULL,
    category ENUM('attention','avoid','tips') NOT NULL,
    content TEXT NOT NULL
);

-- Normale Haut
INSERT INTO survey_result_tips VALUES
(NULL,'skin_type','normale_haut','attention','Pflege-Routine beibehalten'),
(NULL,'skin_type','normale_haut','attention','Haut nicht unnötig reizen'),
(NULL,'skin_type','normale_haut','avoid','Aggressive Peelings'),
(NULL,'skin_type','normale_haut','avoid','Häufige Produktwechsel'),
(NULL,'skin_type','normale_haut','tips','Sanfte Reinigung'),
(NULL,'skin_type','normale_haut','tips','Feuchtigkeitspflege'),
(NULL,'skin_type','normale_haut','tips','Sonnenschutz im Alltag');

-- Trockene Haut
INSERT INTO survey_result_tips VALUES
(NULL,'skin_type','trockene_haut','attention','Hautbarriere stärken'),
(NULL,'skin_type','trockene_haut','attention','Feuchtigkeit regelmäßig zuführen'),
(NULL,'skin_type','trockene_haut','avoid','Alkohol'),
(NULL,'skin_type','trockene_haut','avoid','Sulfate'),
(NULL,'skin_type','trockene_haut','tips','Rückfettende Reiniger'),
(NULL,'skin_type','trockene_haut','tips','Cremige Texturen'),
(NULL,'skin_type','trockene_haut','tips','Nicht zu heiß waschen');

-- Fettige Haut
INSERT INTO survey_result_tips VALUES
(NULL,'skin_type','fettige_haut','attention','Talgproduktion ausgleichen'),
(NULL,'skin_type','fettige_haut','attention','Poren nicht verstopfen'),
(NULL,'skin_type','fettige_haut','avoid','Schwere Öle'),
(NULL,'skin_type','fettige_haut','avoid','Überpflegung'),
(NULL,'skin_type','fettige_haut','tips','Leichte Gelpflege'),
(NULL,'skin_type','fettige_haut','tips','Sanfte Reinigung'),
(NULL,'skin_type','fettige_haut','tips','Nicht austrocknen');

-- Mischhaut
INSERT INTO survey_result_tips VALUES
(NULL,'skin_type','mischhaut','attention','Zonen getrennt pflegen'),
(NULL,'skin_type','mischhaut','attention','Balance finden'),
(NULL,'skin_type','mischhaut','avoid','Zu reichhaltige Produkte'),
(NULL,'skin_type','mischhaut','avoid','Aggressive Reiniger'),
(NULL,'skin_type','mischhaut','tips','Leichte Feuchtigkeitspflege'),
(NULL,'skin_type','mischhaut','tips','Gezielte Pflege nach Bedarf');

-- Empfindliche Haut
INSERT INTO survey_result_tips VALUES
(NULL,'skin_type','empfindliche_haut','attention','Reizarme Pflegeroutine'),
(NULL,'skin_type','empfindliche_haut','attention','Wenige Produkte gleichzeitig'),
(NULL,'skin_type','empfindliche_haut','attention','Haut nicht überpflegen'),
(NULL,'skin_type','empfindliche_haut','avoid','Alkohol (Alcohol Denat.)'),
(NULL,'skin_type','empfindliche_haut','avoid','Duftstoffe'),
(NULL,'skin_type','empfindliche_haut','avoid','Ätherische Öle'),
(NULL,'skin_type','empfindliche_haut','tips','Milde Reinigung'),
(NULL,'skin_type','empfindliche_haut','tips','Kurze Inhaltsstofflisten'),
(NULL,'skin_type','empfindliche_haut','tips','Sonnenschutz täglich');

-- =========================
-- PRÄVENTIONS / HAUTPROBLEME FRAGEBOGEN
-- =========================

-- Keine oder sehr geringe Hautprobleme
INSERT INTO survey_result_tips VALUES
(NULL,'prevention','gesund','attention','Regelmäßige Hautpflege beibehalten'),
(NULL,'prevention','gesund','attention','Reizungen vermeiden'),
(NULL,'prevention','gesund','avoid','Aggressive Produkte'),
(NULL,'prevention','gesund','avoid','Häufige Produktwechsel'),
(NULL,'prevention','gesund','tips','Sanfte Reinigung'),
(NULL,'prevention','gesund','tips','Feuchtigkeitspflege'),
(NULL,'prevention','gesund','tips','Sonnenschutz täglich');

-- Rosazea
INSERT INTO survey_result_tips VALUES
(NULL,'prevention','rosazea','attention','Reize minimieren'),
(NULL,'prevention','rosazea','attention','Haut beruhigen'),
(NULL,'prevention','rosazea','avoid','Alkohol'),
(NULL,'prevention','rosazea','avoid','Menthol'),
(NULL,'prevention','rosazea','tips','Kühlende Pflege'),
(NULL,'prevention','rosazea','tips','Konsequenter Sonnenschutz');

-- Akne / unreine Haut
INSERT INTO survey_result_tips VALUES
(NULL,'prevention','akne','attention','Poren sauber halten'),
(NULL,'prevention','akne','attention','Nicht ausdrücken'),
(NULL,'prevention','akne','avoid','Komödogene Stoffe'),
(NULL,'prevention','akne','avoid','Schwere Öle'),
(NULL,'prevention','akne','tips','Leichte Pflege'),
(NULL,'prevention','akne','tips','Regelmäßige Reinigung');

-- Ekzem / trockene Haut
INSERT INTO survey_result_tips VALUES
(NULL,'prevention','ekzem','attention','Haut intensiv pflegen'),
(NULL,'prevention','ekzem','attention','Reizstoffe meiden'),
(NULL,'prevention','ekzem','avoid','Duftstoffe'),
(NULL,'prevention','ekzem','avoid','Alkohol'),
(NULL,'prevention','ekzem','tips','Rückfettende Pflege'),
(NULL,'prevention','ekzem','tips','Schonende Reinigung');

-- Allergische Reaktion / sehr empfindliche Haut
INSERT INTO survey_result_tips VALUES
(NULL,'prevention','allergisch','attention','Neue Produkte testen'),
(NULL,'prevention','allergisch','attention','Haut beruhigen'),
(NULL,'prevention','allergisch','avoid','Duftstoffe'),
(NULL,'prevention','allergisch','avoid','Konservierungsstoffe'),
(NULL,'prevention','allergisch','tips','Minimalistische Pflege'),
(NULL,'prevention','allergisch','tips','Dermatologisch getestet');


