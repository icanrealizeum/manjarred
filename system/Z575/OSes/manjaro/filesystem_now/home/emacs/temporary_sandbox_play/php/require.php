<?php

function something() {
  require "r1.php";
  echo $a . PHP_EOL;
}

function something3() {
  require "r1.php";
  echo 's3: ' . $a . PHP_EOL; // won't work with require_once because it's already require'd in prev. function; so: PHP Notice:  Undefined variable: a in /home/emacs/temporary_sandbox_play/php/require.php on line 10
}
something();
something3();

?>
