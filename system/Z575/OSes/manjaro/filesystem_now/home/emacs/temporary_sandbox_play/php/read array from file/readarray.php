<?php

function readfileas_array($fname, $delims = array(PHP_EOL)) {//each line(by default) is a string element
  #multiexplode from https://php.net/manual/en/function.explode.php#111307
  $ret = file_get_contents($fname);
  if (! $ret) {
    return FALSE;
  }else{
    if (empty($delims)) {
      return FALSE;
    }
    $ret = str_replace($delims, $delims[0], $ret);//collapse all delimiters into the first one, and use the first one as the only delimiter with explode below:
    return array_filter(explode($delims[0], $ret));//ignores empty lines (+ the extra one at the end which was added regardless)
  }
}

$foo = readfileas_array("foo", array(PHP_EOL,' '));
print_r($foo);
?>
