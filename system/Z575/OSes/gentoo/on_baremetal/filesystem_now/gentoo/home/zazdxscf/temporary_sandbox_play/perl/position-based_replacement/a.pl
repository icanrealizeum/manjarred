#!/usr/bin/perl


#src: http://www.perlmonks.org/?abspart=1;displaytype=displaycode;node_id=889734;part=1
#main src: http://www.perlmonks.org/?node_id=889729


#echo "$E" | openssl base64 | tr '[:upper:]' '[:lower:]' | openssl base64 -d
#orig is echo "$E" | openssl base64
$orig   = 'RW1hbnVlbCBDemlyYWkK';;
$lowerc = lc($orig);; #'rw1hbnvlbcbdemlyywkk';;
my @pos = (0,1,6,9,10,11,16,17,19);
$final = $lowerc;

substr( $final, $_, 1 ) =~ tr[a-z][A-Z] for (@pos);;#0,1,6,9,10,11,16,17,19;;

print $orig,"\n";;
print $lowerc,"\n";;
print $final,"\n";;
if ($orig eq $final) { #NOT == !!!!
  print "OK!\n"
} else {
  print "FAILed!\n"
}

print("FINAL: ",$lowerc,' ');
foreach $i (@pos){printf("%x",$i); };
print "\n";


