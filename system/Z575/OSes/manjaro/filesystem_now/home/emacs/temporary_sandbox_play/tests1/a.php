<?php
$hash = '$5$lalalalalalalala$crypt.output.here';
var_dump(substr_compare($hash, '$5$a', 2)); # int(34)
var_dump(substr_compare($hash, '$5$a', 2, 3)); # int(0)
var_dump(PHP_VERSION); # string(6) "5.3.14"
$mystring = 'image/jpeg';
$findme   = 'image/';
$pos = strpos($mystring, $findme);
if ($pos !== false) {
  echo "$pos" . PHP_EOL;
}

$mystring = 'image/jpeg';
$findme   = 'image/a';
$pos = strpos($mystring, $findme);
if ($pos !== false) {//found at index 0 or more; but only when found!
  echo "found at: $pos" . PHP_EOL;
}else{
  echo "NOT" . PHP_EOL;
}

?>
