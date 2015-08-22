<?php
function in_arrayi($needle, $haystack) {//ok this isn't gonna work to my satisfaction, so using foreach instead! and assumed strict is on, unless both things to compare are strings, in which case case insensitive!
//src: https://php.net/manual/en/function.in-array.php#89256
//and src: https://php.net/manual/en/function.in-array.php#96198
  //return in_array(strtolower($needle), array_map('strtolower', $haystack));
  //$flipped_haystack = array_flip(array_map('strtolower', $haystack));
#  $flipped_haystack = array_flip($haystack);//XXX: array_flip(): Can only flip STRING and INTEGER values!
//  $flipped_haystack = 
#  $flipped_haystack = array_change_key_case($flipped_haystack, CASE_LOWER);
#  print_r($flipped_haystack);
#  return isset($flipped_haystack[strtolower($needle)]) || array_key_exists(strtolower($needle),$flipped_haystack);
/* XXX: note
$search_array = array('first' => null, 'second' => 4);
// returns false
isset($search_array['first']);
// returns true
array_key_exists('first', $search_array);
 */
  if (is_string($needle)) {
    $needle = strtolower($needle);
  }
  foreach($haystack as $k => $v) {
    if (($v === $needle) || ((is_string($v)) && (strtolower($v) === $needle))) {
      return TRUE;
    }
  }
  return FALSE;
} 

$os = array("Mac", "NT", "Irix", "Linux", null, 0,'1');

if (in_arrayi("Irix", $os)) {
    echo "Got Irix" . PHP_EOL;
}

if (in_arrayi("mac", $os)) {
    echo "Got mac" . PHP_EOL;
}

if (in_arrayi(1, $os)) {
    echo "Got 1" . PHP_EOL;
}

if (in_arrayi(false, $os)) {
    echo "Got false" . PHP_EOL;
}

if (in_arrayi(false, array(false,'1'))) {
    echo "Got false2" . PHP_EOL;
}

if (in_arrayi(null, array(null))) {
    echo "Got null2" . PHP_EOL;
}

?>

