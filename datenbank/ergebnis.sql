//ergebnis.sql


USE care4skin;

DROP TABLE IF EXISTS ssr_survey_skintype_results;

CREATE TABLE ssr_survey_skintype_results (
    ssr_id INT AUTO_INCREMENT PRIMARY KEY,
    ssr_min_points INT NOT NULL,
    ssr_max_points INT NOT NULL,
    ssr_skin_type VARCHAR(50) NOT NULL,
    ssr_description TEXT,
    ssr_recommended_ingredients TEXT,
    ssr_to_avoid_ingredients TEXT
);

INSERT INTO ssr_survey_skintype_results
(ssr_min_points, ssr_max_points, ssr_skin_type, ssr_description, ssr_recommended_ingredients, ssr_to_avoid_ingredients)
VALUES
(6, 8, 'Normale Haut', 'Ihre Haut ist ausgewogen und benötigt wenig Pflege.',
 'Aloe Vera, Vitamin E, Jojobaöl',
 'Starke Peelings, Alkoholhaltige Produkte, Menthol'),
(9, 11, 'Trockene Haut', 'Ihre Haut ist trocken und benötigt viel Feuchtigkeit.',
 'Hyaluronsäure, Sheabutter, Glycerin',
 'Alkohol, Duftstoffe, Sulfate'),
(12, 14, 'Fettige Haut', 'Ihre Haut neigt zu Öligkeit und Unreinheiten.',
 'Salicylsäure, Teebaumöl, Niacinamid',
 'Fette Cremes, Silikone, Mineralöle'),
(15, 17, 'Mischhaut', 'Ihre Haut ist unterschiedlich – T-Zone ölig, Wangen trocken.',
 'Leichte Feuchtigkeitscremes, Niacinamid, Panthenol',
 'Stark fettende Produkte, Alkohol, Menthol'),
(18, 30, 'Empfindliche Haut', 'Ihre Haut reagiert leicht auf äußere Reize.',
 'Aloe Vera, Calendula, Kamille',
 'Alkohol, Menthol, Duftstoffe');

 DROP TABLE IF EXISTS spr_survey_prevention_results;

CREATE TABLE spr_survey_prevention_results (
    spr_id INT AUTO_INCREMENT PRIMARY KEY,
    spr_min_points INT NOT NULL,
    spr_max_points INT NOT NULL,
    spr_skin_condition VARCHAR(100) NOT NULL,
    spr_description TEXT,
    spr_recommended_ingredients TEXT,
    spr_to_avoid_ingredients TEXT
);

INSERT INTO spr_survey_prevention_results
(spr_min_points, spr_max_points, spr_skin_condition, spr_description, spr_recommended_ingredients, spr_to_avoid_ingredients)
VALUES
(6, 8, 'Keine oder sehr geringe Hautprobleme', 'Ihre Haut ist weitgehend gesund.',
 'Sanfte Pflege, Feuchtigkeit, Vitamin E',
 'Starke Peelings, aggressive Produkte, Duftstoffe'),
(9, 11, 'Rosazea', 'Ihre Haut reagiert empfindlich auf Hitze, Stress oder Alkohol.',
 'Beruhigende Cremes, Zink, Aloe Vera',
 'Alkohol, scharfe Produkte, Menthol'),
(12, 14, 'Akne / unreine Haut', 'Neigung zu Pickeln, Mitessern oder fettiger Haut.',
 'Salicylsäure, Teebaumöl, Niacinamid',
 'Fette Cremes, schwere Öle, Silikone'),
(15, 17, 'Ekzem / trockene Haut', 'Häufig Spannung, Schuppen oder Reizungen.',
 'Sheabutter, Ceramide, Panthenol',
 'Duftstoffe, aggressive Seifen, Alkohol'),
(18, 30, 'Allergische Reaktion / sehr empfindliche Haut', 'Ihre Haut reagiert stark auf äußere Reize.',
 'Calendula, Aloe Vera, Kamille',
 'Parfum, Alkohol, Menthol');

