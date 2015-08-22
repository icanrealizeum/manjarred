<?php

echo microtime(TRUE)."\n";
$m= microtime(TRUE)*1000;
echo $m . "\n";
echo date('l jS \of F Y h:i:s A',$m / 1000) . "\n";
?>

