<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
//$sql="INSERT INTO item_lang (itemid,nyelv,cim,uuuu) VALUES ($id,$nyelv,$cim,$uuu)";
//$idn2= DB::beszur($sql);
//$result=DB::assoc_sor("CALL GetCC4('id')");
//print_r($result);
//print_R(GOB::$hiba);
$sql="SELECT i.id,i.userid,i.userid,i.time,l.cim,l.bev
FROM item i
LEFT OUTER JOIN item_lang l ON i.id = l.itemid WHERE nyelv='en' limit 10";
//$result=DB::assoc_tomb($sql);
$result=DB::assoc_tomb('CALL getdata9("hu","AND userid=\'62\' limit 2")');
print_r($result);
print_R(GOB::$hiba);

BEGIN
FIND_IN_SET('b','a,b,c,d');
 END 
  mysql> SELECT SUBSTRING_INDEX('www.mysql.com', '.', 2);
        -> 'www.mysql'
mysql> SELECT SUBSTRING_INDEX('www.mysql.com', '.', -2);
        -> 'mysql.com'