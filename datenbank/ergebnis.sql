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
(6, 8, 'Normale Haut',
'Ihre Haut ist gut ausbalanciert und zeigt weder ausgeprägte Trockenheit noch übermäßige Fettigkeit. Die Talgproduktion funktioniert gleichmäßig, die Poren sind meist fein und das Hautbild wirkt insgesamt ruhig und ebenmäßig.\n\n• Ausgeglichene Talgproduktion\n• Kaum Unreinheiten oder Rötungen\n• Feine Porenstruktur\n• Stabile und intakte Hautbarriere',
'Diese Inhaltsstoffe unterstützen den gesunden Hautzustand und helfen, die natürliche Schutzfunktion der Haut langfristig zu erhalten.\n• Aloe Vera – beruhigend und feuchtigkeitsspendend\n• Vitamin E – schützt vor freien Radikalen\n• Jojobaöl – unterstützt die Hautbarriere\n• Panthenol – fördert die Regeneration',
'Diese Stoffe können die Haut unnötig reizen oder das natürliche Gleichgewicht stören.\n• Starke chemische oder mechanische Peelings\n• Hoher Alkoholanteil\n• Sulfate\n• Menthol\n• Aggressive Tenside\n• Ätherische Öle in hoher Konzentration'),

(9, 11, 'Trockene Haut',
'Ihre Haut produziert zu wenig Talg, verliert dadurch schnell Feuchtigkeit und kann sich gespannt, rau oder schuppig anfühlen. Eine regelmäßige, sanfte Pflege sollte die Hautbarriere stärken und den Feuchtigkeitsverlust minimieren.\n• Geringe Talgproduktion\n• Spannungsgefühle\n• Schuppige oder raue Stellen\n• Empfindliche Stellen, die leicht gereizt werden\n• Geschwächte Hautbarriere',
'Feuchtigkeitsspendende und rückfettende Inhaltsstoffe sind besonders wichtig, um die Haut zu beruhigen und die Barriere zu stärken.\n• Hyaluronsäure – bindet Wasser und spendet Feuchtigkeit\n• Sheabutter – rückfettend und schützend\n• Glycerin – hält Feuchtigkeit in der Haut\n• Ceramide – stärken die Hautbarriere\n• Panthenol – beruhigt und regeneriert',
'Diese Stoffe können die Haut zusätzlich austrocknen oder reizen.\n• Alkohol\n• Intensive Duftstoffe\n• Sulfate und aggressive Tenside\n• Menthol oder stark kühlende Stoffe'),

(12, 14, 'Fettige Haut',
'Ihre Haut produziert vermehrt Talg, wodurch die Haut glänzend wirken kann und sich die Poren vergrößern. Dies kann die Entstehung von Pickeln und Unreinheiten begünstigen. Ziel der Pflege ist es, die Talgproduktion auszugleichen und die Haut nicht zusätzlich auszutrocknen.\n• Erhöhte Talgproduktion\n• Glänzende Hautpartien\n• Vergrößerte Poren\n• Neigung zu Mitessern und Pickeln\n• Empfindlichkeit gegenüber stark fettenden Produkten',
'Regulierende und leichte Inhaltsstoffe helfen, das Hautbild auszugleichen, ohne die Haut zu reizen.\n• Salicylsäure – porenreinigend\n• Niacinamid – reguliert Talgproduktion\n• Zink – entzündungshemmend\n• Leichte Gel-Texturen – nicht okklusiv\n• Feuchtigkeitsspendende, nicht fettende Inhaltsstoffe',
'Diese Stoffe können die Poren verstopfen und das Hautbild verschlechtern.\n• Schwere oder stark fettende Cremes\n• Mineralöle\n• Komedogene Stoffe\n• Silikone in hoher Konzentration\n• Aggressive Peelings'),

(15, 17, 'Mischhaut',
'Ihre Haut zeigt unterschiedliche Bedürfnisse: Die T-Zone ist häufig fettig und neigt zu Glanz und Unreinheiten, während die Wangenpartien eher trocken oder normal sind. Ziel der Pflege ist es, das Hautbild auszugleichen und sowohl fettige als auch trockene Bereiche zu versorgen.\n• Fettige T-Zone\n• Trockene oder normale Wangen\n• Unterschiedliche Pflegeanforderungen\n• Neigung zu Mitessern in der T-Zone\n• Spannungsgefühle in trockenen Bereichen',
'Eine ausgleichende, leichte Pflege ist ideal, um die Haut zu beruhigen und zu stabilisieren.\n• Niacinamid – reguliert Talgproduktion und beruhigt\n• Panthenol – feuchtigkeitsspendend und regenerierend\n• Aloe Vera – beruhigend und reizlindernd\n• Leichte, nicht fettende Texturen\n• Feuchtigkeitsspendende Inhaltsstoffe',
'Folgende Stoffe können das Hautbild verschlechtern oder die Haut zusätzlich reizen.\n• Stark fettende Cremes\n• Alkoholhaltige Produkte\n• Aggressive Peelings\n• Duftstoffe\n• Mineralöle in schweren Formulierungen'),

(18, 30, 'Empfindliche Haut',
'Ihre Haut reagiert besonders sensibel auf äußere Einflüsse, was sich in Rötungen, Brennen oder Juckreiz äußern kann. Selbst milde Produkte können Irritationen hervorrufen, daher sollte die Pflege möglichst reizarm und beruhigend sein.\n• Schnelle Reaktionen auf äußere Reize\n• Rötungen oder Brennen\n• Juckreiz oder Spannungsgefühle\n• Niedrige Toleranz gegenüber vielen Inhaltsstoffen\n• Neigung zu Rötungen bei Temperaturwechseln oder Stress',
'Beruhigende und reizarme Inhaltsstoffe unterstützen die Hautbarriere und lindern Irritationen.\n• Aloe Vera – beruhigend und feuchtigkeitsspendend\n• Kamille – entzündungshemmend und reizlindernd\n• Calendula – regenerierend und schützend\n• Panthenol – fördert Hautregeneration\n• Leichte, nicht fettende Texturen',
'Folgende Stoffe können die Haut stark reizen und sollten vermieden werden.\n• Duftstoffe\n• Alkohol\n• Menthol\n• Ätherische Öle in hoher Konzentration\n• Aggressive Peelings oder Reinigungsprodukte');

-- Tabelle für Präventions-Hauttypen
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
(6, 8, 'Keine oder sehr geringe Hautprobleme',
'Ihre Haut ist stabil, zeigt kaum Auffälligkeiten und ist im Allgemeinen gut gepflegt. Sie hat eine intakte Hautbarriere, nur selten treten Irritationen oder Spannungsgefühle auf, sodass der Hautzustand insgesamt gesund wirkt.\n• Stabiler Hautzustand\n• Kaum Rötungen oder Irritationen\n• Gleichmäßiges Hautbild\n• Gesunde Hautbarriere\n• Geringe Empfindlichkeit gegenüber Produkten',
'Für den Erhalt der Hautgesundheit sind milde, feuchtigkeitsspendende Inhaltsstoffe ausreichend.\n• Feuchtigkeitsspendende Wirkstoffe wie Glycerin und Hyaluronsäure\n• Antioxidantien wie Vitamin E und Vitamin C\n• Milde Reinigungsstoffe wie Syndets oder seifenfreie Reinigung\n• Leichte, nicht fettende Pflege\n• Sanfte beruhigende Substanzen wie Panthenol und Aloe Vera',
'Diese Stoffe sind bei gesunder Haut nicht notwendig und können im Übermaß sogar reizen.\n• Aggressive Wirkstoffe wie stark konzentrierte Säuren oder Retinoide\n• Häufige Peelings, mechanisch oder chemisch\n• Starke Duftstoffe, synthetisch oder hochkonzentriert\n• Alkoholhaltige Produkte, z. B. Ethanol oder Isopropylalkohol\n• Stark fettende oder okklusive Cremes, z. B. Vaseline oder dicke Mineralölprodukte'),

(9, 11, 'Rosazea',
'Ihre Haut neigt zu Rötungen und reagiert besonders empfindlich auf äußere Einflüsse wie Hitze, Kälte, Stress oder Alkohol. Die Blutgefäße sind leicht erweiterbar, wodurch Rötungen und Brennen auftreten können, und die Hautbarriere ist häufig schwächer.\n• Neigung zu Rötungen oder Hitzeausschlägen\n• Empfindliche Gefäße\n• Brennen oder Spannungsgefühle\n• Geringe Toleranz gegenüber neuen Produkten\n• Leichte Reizbarkeit durch Umweltfaktoren',
'Beruhigende, entzündungshemmende und reizarme Inhaltsstoffe unterstützen die Haut und helfen, Symptome zu lindern.\n• Aloe Vera – beruhigend und feuchtigkeitsspendend\n• Zink – entzündungshemmend und regulierend\n• Panthenol – regenerierend und schützend\n• Kamille – reizlindernd\n• Calendula – beruhigend',
'Diese Stoffe können Rötungen und Reizungen verstärken und sollten vermieden werden.\n• Alkoholhaltige Produkte\n• Menthol\n• Duftstoffe, synthetisch oder stark konzentriert\n• Starke Peelings, mechanisch oder chemisch\n• Scharfe Tenside'),

(12, 14, 'Akne / unreine Haut',
'Ihre Haut neigt zu Entzündungen, verstopften Poren und gelegentlichen Pickeln. Meist ist die Talgproduktion erhöht, wodurch die Haut glänzt und sich Unreinheiten bilden können. Ziel der Pflege ist es, die Talgproduktion zu regulieren, Poren zu reinigen und Entzündungen zu vermeiden.\n• Erhöhte Talgproduktion\n• Pickel, Mitesser und Unreinheiten\n• Glänzende Hautpartien\n• Neigung zu entzündlichen Hautstellen\n• Empfindliche oder gereizte Hautbereiche',
'Regulierende und entzündungshemmende Inhaltsstoffe helfen, das Hautbild zu klären und die Haut zu stabilisieren.\n• Salicylsäure – porenreinigend\n• Niacinamid – reguliert Talgproduktion und beruhigt\n• Zink – entzündungshemmend\n• Leichte, nicht fettende Texturen\n• Feuchtigkeitsspendende Inhaltsstoffe, ohne die Poren zu verstopfen',
'Diese Stoffe können die Poren verstopfen oder Entzündungen fördern und sollten vermieden werden.\n• Schwere Öle\n• Fettige Cremes oder Texturen\n• Silikone in hoher Konzentration\n• Komedogene Inhaltsstoffe\n• Aggressive Peelings oder stark reizende Produkte'),

(15, 17, 'Ekzem / sehr trockene Haut',
'Ihre Haut ist stark trocken, zeigt häufig Reizungen und neigt zu Spannungsgefühlen oder Juckreiz. Die Hautbarriere ist geschwächt, wodurch die Haut Feuchtigkeit verliert und empfindlicher gegenüber äußeren Einflüssen wird. Ziel der Pflege ist es, die Haut intensiv zu pflegen, Feuchtigkeit zu spenden und die Schutzbarriere zu stärken.\n• Starke Trockenheit\n• Spannungsgefühl und Juckreiz\n• Schuppige Hautpartien\n• Geschwächte Hautbarriere\n• Hohe Empfindlichkeit gegenüber Reizen',
'Rückfettende und beruhigende Inhaltsstoffe sind notwendig, um die Haut zu regenerieren und die Barriere zu stärken.\n• Sheabutter – rückfettend und schützend\n• Ceramide – stärken die Hautbarriere\n• Panthenol – beruhigt und fördert Regeneration\n• Aloe Vera – spendet Feuchtigkeit und beruhigt\n• Milde, reizarme Pflege',
'Folgende Stoffe können die Haut zusätzlich austrocknen oder reizen und sollten vermieden werden.\n• Duftstoffe, synthetisch oder stark konzentriert\n• Alkoholhaltige Produkte\n• Menthol oder stark kühlende Inhaltsstoffe\n• Aggressive Tenside oder Peelings\n• Scharfe Reinigungsstoffe'),

(18, 30, 'Allergische Reaktion / sehr empfindliche Haut',
'Ihre Haut reagiert besonders stark auf viele Inhaltsstoffe und äußere Reize, was sich in Rötungen, Brennen, Juckreiz oder Spannungsgefühlen zeigt. Die Hautbarriere ist sehr empfindlich und kann leicht geschädigt werden. Ziel der Pflege ist es, Reizungen zu vermeiden und die Haut zu beruhigen.\n• Starke Reaktionsbereitschaft auf Inhaltsstoffe\n• Brennen, Juckreiz und Rötungen\n• Sehr empfindliche Hautbarriere\n• Hohe Empfindlichkeit gegenüber Umweltfaktoren\n• Leicht irritierbar bei neuen Produkten',
'Reizarme und beruhigende Inhaltsstoffe sind entscheidend, um die Haut zu schützen und Irritationen zu reduzieren.\n• Aloe Vera – beruhigend und feuchtigkeitsspendend\n• Kamille – entzündungshemmend und reizlindernd\n• Calendula – regenerierend und schützend\n• Panthenol – beruhigt und unterstützt Regeneration\n• Milde, leichte Texturen',
'Diese Stoffe können Hautreaktionen auslösen oder verschlimmern und sollten vermieden werden.\n• Duftstoffe, synthetisch oder stark konzentriert\n• Menthol oder stark kühlende Inhaltsstoffe\n• Alkoholhaltige Produkte\n• Aggressive Tenside oder Peelings\n• Stark fettende oder okklusive Cremes');
