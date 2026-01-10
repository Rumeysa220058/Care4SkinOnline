USE care4skin;

-- Tabelle für Hauttypen
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
(6, 8, 'Normale Haut', 'Ihre Haut ist gut ausbalanciert und zeigt weder ausgeprägte Trockenheit noch übermäßige Fettigkeit. Sie fühlt sich meist geschmeidig und gepflegt an. Poren sind fein sichtbar und das Hautbild wirkt gleichmäßig und gesund. Eine leichte Pflege genügt, um die natürliche Balance zu erhalten.',
'Aloe Vera, Vitamin E, Jojobaöl, Panthenol',
'chemische oder mechanische Peelings, Alkohol, Sulfate, Menthol, aggressive Tenside, Ätherische Öle'),

(9, 11, 'Trockene Haut', 'Ihre Haut produziert zu wenig Talg und verliert dadurch schnell Feuchtigkeit. Sie fühlt sich häufig gespannt oder rau an. Regelmäßige, sanfte Pflege unterstützt die Hautbarriere und vermindert Spannungsgefühle. Empfindliche Stellen sollten besonders geschont werden, um Reizungen zu vermeiden.',
'Hyaluronsäure, Sheabutter, Glycerin, Ceramide, Panthenol',
'Alkohol, Duftstoffe, Sulfate, Menthol, aggressive Tenside'),

(12, 14, 'Fettige Haut', 'Ihre Haut produziert vermehrt Talg, wodurch Glanz und vergrößerte Poren entstehen. Dies kann die Bildung von Mitessern und Pickeln begünstigen. Ziel der Pflege ist es, die Talgproduktion auszugleichen, ohne die Haut auszutrocknen. Regelmäßige, leichte Reinigung hält das Hautbild stabil.',
'Salicylsäure, Niacinamid, Zink, leichte Gel-Texturen, feuchtigkeitsspendende Inhaltsstoffe',
'stark fettende Cremes, Mineralöle, Komedogene Stoffe, Silikone, aggressive Peelings'),

(15, 17, 'Mischhaut', 'Ihre Haut zeigt unterschiedliche Bedürfnisse: T-Zone oft fettig und glänzend, Wangen meist trocken oder normal. Ziel der Pflege ist ein ausgeglichenes Hautbild, das beide Bereiche optimal versorgt. Sanfte Reinigung und gezielte Feuchtigkeitspflege sorgen für Balance. Empfindliche Zonen sollten geschützt werden.',
'Niacinamid, Panthenol, Aloe Vera, leichte Texturen, feuchtigkeitsspendende Inhaltsstoffe',
'stark fettende Cremes, Alkohol, aggressive Peelings, Duftstoffe, Mineralöle'),

(18, 30, 'Empfindliche Haut', 'Ihre Haut reagiert besonders sensibel auf äußere Einflüsse. Schon kleine Reize können Rötungen, Brennen oder Spannungsgefühle verursachen. Beruhigende und reizarme Pflege ist besonders wichtig, um Irritationen vorzubeugen. Die Hautbarriere sollte durch sanfte Produkte gestärkt werden.',
'Aloe Vera, Kamille, Calendula, Panthenol, leichte Texturen',
'Duftstoffe, Alkohol, Menthol, Ätherische Öle, aggressive Peelings');


-- Tabelle für Präventions-Hauttypen
DROP TABLE IF EXISTS  ;

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
(6, 8, 'Keine oder sehr geringe Hautprobleme', 'Ihre Haut ist stabil, zeigt kaum Auffälligkeiten und wirkt gepflegt. Sie hat eine intakte Hautbarriere und reagiert nur selten empfindlich. Sanfte Pflege unterstützt die Gesundheit der Haut langfristig und erhält das gleichmäßige Hautbild.',
'Glycerin, Hyaluronsäure, Vitamin E, Vitamin C, sanfte Reinigungsstoffe, Panthenol, Aloe Vera',
'aggressive Säuren, Retinoide, häufige Peelings, starke Duftstoffe, Alkohol, stark fettende Cremes'),

(9, 11, 'Rosazea', 'Ihre Haut neigt zu Rötungen und reagiert empfindlich auf äußere Einflüsse wie Hitze, Kälte oder Stress. Die Hautbarriere ist oft schwächer und benötigt besonders sanfte Pflege. Geeignete Produkte helfen, Rötungen und Reizungen zu minimieren und die Haut zu beruhigen.',
'Aloe Vera, Zink, Panthenol, Kamille, Calendula',
'Alkohol, Menthol, Duftstoffe, aggressive Peelings'),

(12, 14, 'Akne / unreine Haut', 'Ihre Haut neigt zu Pickeln, Mitessern und Glanz. Die Talgproduktion ist oft erhöht, was Unreinheiten begünstigt. Sanfte, regelmäßige Pflege hilft, Poren zu reinigen und Entzündungen zu vermeiden. Geeignete Produkte gleichen das Hautbild aus.',
'Salicylsäure, Niacinamid, Zink, leichte Texturen, feuchtigkeitsspendend',
'stark fettende Cremes, Silikone, komedogene Inhaltsstoffe, aggressive Peelings'),

(15, 17, 'Ekzem / sehr trockene Haut', 'Ihre Haut ist stark trocken und zeigt häufig Spannungsgefühle und Reizungen. Die Hautbarriere ist geschwächt und benötigt intensive Pflege. Geeignete feuchtigkeitsspendende Produkte helfen, Juckreiz zu lindern und die Haut zu regenerieren.',
'Sheabutter, Ceramide, Panthenol, Aloe Vera, milde Pflege',
'Duftstoffe, Alkohol, Menthol, aggressive Tenside, scharfe Reinigungsstoffe'),

(18, 30, 'Allergische Reaktion / sehr empfindliche Haut', 'Ihre Haut reagiert stark auf viele Inhaltsstoffe und äußere Reize. Schon kleine Reize führen zu Rötungen oder Juckreiz. Reizarme und beruhigende Pflege ist entscheidend, um die Haut zu schützen. Die Hautbarriere sollte gestärkt und stabilisiert werden.',
'Aloe Vera, Kamille, Calendula, Panthenol, milde Texturen',
'Duftstoffe, Alkohol, Menthol, aggressive Tenside, stark fettende Cremes');
