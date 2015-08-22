<?php

//DNS_A  == ipv4
//DNS_AAAA == ipv6

//get my own IP address (trick):
$result = dns_get_record('myip.opendns.com',DNS_A,$authns, $addtl);//doesn't work unless I can specify which DNS server to use ie. 208.67.222.220#53
//see: https://serverfault.com/questions/89114/finding-the-public-ip-address-in-a-shell-script
//
$result = dns_get_record('opendns.com',DNS_A,$authns, $addtl);
echo "Result = ";
print_r($result);
echo "Auth NS = ";
print_r($authns);
echo "Additional = ";
print_r($addtl);

?>

