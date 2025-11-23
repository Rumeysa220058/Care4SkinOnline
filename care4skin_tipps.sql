CREATE TABLE tipps_hauttyp (
    id INT PRIMARY KEY AUTO_INCREMENT,
    punkte_min INT NOT NULL,
    punkte_max INT NOT NULL,
    hauttyp VARCHAR(50) NOT NULL,
    empfehlung TEXT NOT NULL,
    vermeiden_produkte TEXT NOT NULL
);
INSERT INTO tipps_hauttyp (punkte_min, punkte_max, hauttyp, empfehlung, vermeiden_produkte) VALUES

-- 6–8 Punkte: Normale Haut
(6, 8, 'Normale Haut',
 'Sie haben eine normale Haut. Ihre Haut befindet sich im Gleichgewicht. Verwenden Sie milde und feuchtigkeitsspendende Pflegeprodukte, die die Haut nicht übermäßig belasten. Reinigen Sie Ihr Gesicht sanft, ohne zu aggressive Peelings oder Reinigungsmittel. Schützen Sie Ihre Haut täglich mit einer Sonnencreme, um Schäden durch Sonnenlicht zu vermeiden. Achten Sie auf eine ausgewogene Ernährung und ausreichend Flüssigkeit, um die Haut von innen zu unterstützen.',
 'Produkte mit stark reizenden Duftstoffen, Alkohol, aggressive chemische Peelings, sehr schwere Cremes'),

-- 9–11 Punkte: Trockene Haut
(9, 11, 'Trockene Haut',
 'Sie haben eine trockene Haut. Ihre Haut benötigt besonders viel Feuchtigkeit und Schutz. Verwenden Sie reichhaltige Cremes oder Lotionen, die die Hautbarriere stärken, z. B. mit Hyaluronsäure oder Ceramiden. Vermeiden Sie heißes Wasser beim Waschen, da dies die Haut zusätzlich austrocknet. Trinken Sie ausreichend Wasser und achten Sie auf eine feuchtigkeitsspendende Umgebung, z. B. mit einem Luftbefeuchter.',
 'Produkte mit Alkohol, Sulfaten (Sodium Lauryl Sulfate), Parfüm, aggressive chemische Peelings, stark austrocknende Reinigungsmittel'),

-- 12–14 Punkte: Fettige Haut
(12, 14, 'Fettige Haut',
 'Sie haben eine fettige Haut. Bei fettiger Haut sollten Sie leichte, nicht komedogene Pflegeprodukte verwenden, die die Poren nicht verstopfen. Reinigen Sie Ihre Haut regelmäßig, aber nicht zu aggressiv, da dies die Talgproduktion steigern kann. Produkte mit Salicylsäure oder anderen milden, ölregulierenden Wirkstoffen können helfen, Unreinheiten vorzubeugen. Achten Sie darauf, die Haut nicht zu stark zu entfetten, damit sie weiterhin geschützt bleibt.',
 'Sehr ölige Cremes, Produkte mit Silikonen, sehr schwere oder fettige Pflegeprodukte, stark parfümierte Produkte'),

-- 15–17 Punkte: Mischhaut
(15, 17, 'Mischhaut',
 'Sie haben eine Mischhaut. Mischhaut benötigt unterschiedliche Pflege je nach Gesichtszone. Verwenden Sie leichtere, ölfreie Produkte auf der T-Zone, um Glanz zu reduzieren, und reichhaltigere Cremes auf trockenen Wangen. Sanfte Reinigung und ausgleichende Seren können helfen, die Haut im Gleichgewicht zu halten. Achten Sie darauf, dass Sie keine zu starken Reinigungs- oder Pflegeprodukte auf trockene Bereiche auftragen.',
 'Zu reichhaltige Cremes auf fettigen Bereichen, stark austrocknende Produkte, aggressive Peelings'),

-- 18+ Punkte: Empfindliche Haut
(18, 99, 'Empfindliche Haut',
 'Sie haben eine empfindliche Haut. Empfindliche Haut reagiert leicht auf Reize wie Duftstoffe, Alkohol oder aggressive Inhaltsstoffe. Verwenden Sie daher nur pH-neutrale und reizfreie Pflegeprodukte. Testen Sie neue Produkte zuerst auf einer kleinen Hautstelle, bevor Sie das ganze Gesicht eincremen. Beruhigende Wirkstoffe wie Panthenol, Niacinamid oder Ceramide können Rötungen reduzieren. Schützen Sie Ihre Haut täglich mit einer milden Sonnencreme ohne chemische Filter.',
 'Parfümierte Produkte, ätherische Öle, Alkohol, aggressive chemische Peelings, stark parfümierte oder synthetische Farbstoffe');


CREATE TABLE tipps_hautkrankheiten (
    id INT PRIMARY KEY AUTO_INCREMENT,
    punkte_min INT NOT NULL,
    punkte_max INT NOT NULL,
    hautproblem VARCHAR(50) NOT NULL,   -- z. B. "Akne", "Rosazea"
    empfehlung TEXT NOT NULL,
    vermeiden_produkte TEXT NOT NULL
);

INSERT INTO tipps_hautkrankheiten (punkte_min, punkte_max, hautproblem, empfehlung, vermeiden_produkte) VALUES

-- 6–8 Punkte: gesunde Haut
(6, 8, 'Gesunde Haut',
 'Sie haben eine gesunde Haut ohne größere Probleme. Die Haut ist im Gleichgewicht und reagiert kaum auf äußere Reize. Eine sanfte tägliche Reinigung, leichte Feuchtigkeitspflege und regelmäßiger Sonnenschutz tragen dazu bei, das natürliche Gleichgewicht der Haut zu erhalten. Vermeiden Sie aggressive Reinigungsmittel oder stark reizende Substanzen, um Irritationen zu verhindern.',
 'Stark reizende Substanzen, aggressive chemische Peelings, stark parfümierte Kosmetik, sehr heiße Duschen, alkoholhaltige Reinigungsmittel'),

-- 9–11 Punkte: Rosazea
(9, 11, 'Rosazea',
 'Sie haben eine Haut, die zu Rötungen und Rosazea neigt. Die Haut reagiert empfindlich auf Hitze, Stress oder bestimmte Substanzen. Milde, reizfreie Reinigungsmittel und beruhigende Inhaltsstoffe wie Panthenol oder Niacinamid können helfen, Rötungen zu reduzieren. Schützen Sie die Haut vor extremer Sonneneinstrahlung und testen Sie neue Produkte vorsichtig.',
 'Alkoholhaltige Substanzen, scharfe Peelings, stark parfümierte Mittel, ätherische Öle, aggressive Reinigungsmittel'),

-- 12–14 Punkte: Akne / unreine Haut
(12, 14, 'Akne / unreine Haut',
 'Sie haben eine Haut, die zu Akne oder Unreinheiten neigt. Regelmäßige, sanfte Reinigung und leichte, nicht komedogene Pflegeprodukte unterstützen die Haut. Inhaltsstoffe wie Salicylsäure können helfen, Entzündungen zu reduzieren. Vermeiden Sie sehr ölige oder stark parfümierte Mittel, um die Poren nicht zu verstopfen.',
 'Sehr schwere oder ölige Substanzen, stark parfümierte Mittel, aggressive Peelings'),

-- 15–17 Punkte: Ekzem / trockene Haut
(15, 17, 'Ekzem / trockene Haut',
 'Sie haben eine trockene Haut, die zu Ekzemen oder Spannungsgefühlen neigt. Verwenden Sie reichhaltige, beruhigende Pflege, die die Hautbarriere unterstützt, z. B. mit neutralen Fetten oder feuchtigkeitsspendenden Stoffen. Vermeiden Sie austrocknende Reinigungsmittel oder stark reizende Substanzen. Halten Sie die Haut gut mit Feuchtigkeit versorgt und schützen Sie sie vor Kälte und Wind.',
 'Alkoholhaltige Mittel, aggressive Seifen, stark parfümierte Substanzen, austrocknende Reinigungsmittel, starke Peelings'),

-- 18+ Punkte: Allergische Reaktion / sehr empfindliche Haut
(18, 99, 'Sehr empfindliche Haut / Allergische Reaktionen',
 'Sie haben eine sehr empfindliche Haut, die stark auf äußere Reize reagiert. Verwenden Sie nur hypoallergene, reizfreie Substanzen ohne Duftstoffe oder Farbstoffe. Testen Sie neue Mittel zunächst auf einer kleinen Hautstelle. Beruhigende Inhaltsstoffe wie Ceramide oder Panthenol können helfen, Reizungen zu reduzieren. Schützen Sie die Haut vor extremen Temperaturen und mechanischen Reizen.',
 'Parfümierte Substanzen, ätherische Öle, Alkohol, aggressive chemische Peelings, synthetische Farbstoffe, stark reizende Mittel, sehr heiße Duschen');
