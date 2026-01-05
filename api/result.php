<?php
include 'calculate.php'; // berechnet Punkte und holt Tipps
?>
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<title>Haut-Check Ergebnis</title>
<style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    .balken-container { width: 100%; background: #ddd; border-radius: 8px; margin: 10px 0; }
    .balken { height: 20px; background: #4CAF50; border-radius: 8px; }
    h2 { margin-top: 40px; }
    ul { list-style-type: square; margin-left: 20px; }
</style>
</head>
<body>

<h1>Dein Haut-Check Ergebnis</h1>

<?php foreach($results as $type => $data): 
    $maxPoints = 30; // Max Punkte anpassen, falls anders
    $percent = round(($data['points']/$maxPoints)*100);
?>
<h2><?= $type == 'skin_type' ? 'Hauttyp' : 'Hautprobleme' ?> (<?= $data['points'] ?> Punkte)</h2>

<div class="balken-container">
    <div class="balken" style="width: <?= $percent ?>%;"></div>
</div>
<p>Du hast zu <?= $percent ?>% <?= str_replace('_',' ',$data['result_key']) ?></p>

<?php if(!empty($tips[$type])): ?>
<h3>Worauf du achten solltest:</h3>
<ul>
<?php foreach($tips[$type] as $tip): ?>
<?php if($tip['category'] == 'attention'): ?>
<li><?= $tip['content'] ?></li>
<?php endif; ?>
<?php endforeach; ?>
</ul>

<h3>Inhaltsstoffe, die du vermeiden solltest:</h3>
<ul>
<?php foreach($tips[$type] as $tip): ?>
<?php if($tip['category'] == 'avoid'): ?>
<li><?= $tip['content'] ?></li>
<?php endif; ?>
<?php endforeach; ?>
</ul>

<h3>Tipps:</h3>
<ul>
<?php foreach($tips[$type] as $tip): ?>
<?php if($tip['category'] == 'tips'): ?>
<li><?= $tip['content'] ?></li>
<?php endif; ?>
<?php endforeach; ?>
</ul>
<?php endif; ?>

<?php endforeach; ?>

</body>
</html>
