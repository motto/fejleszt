<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
//echo LN::$REG['STR_MIN_MAX']; Jászberényben az érparton saroktelken,lévő ház. A fürdőszoba szerelvényezése új, a burkolás még hátra van. A fő elektromosa rendszer újra vezetékelve. A kazánt, már ellopták. Kályhával fűthető.Az egyik szoba parkettás a másik linőleumos A konyha padlólapozva,a veranda zárt bővített.
$str='<title><<ccccccccccc>></title><<(.*?)>> <title>fffffffbfgbfgbf</title>';

preg_match_all("/<<(.*?)>>/", $str, $match); //$match[1] tömbbe gyújti  a  <<>> közti elemeket
preg_match_all("/<title>(.*?)<\/title>/", $str, $match);
//print_r($match[1]);

include 'lib/db_fgv.php';
include 'lib/altalanos_fgv.php';
class MoConfig {

//public static $felhasznalonev = 'pnet354_motto001';
//public static $jelszo = 'motto6814';
//public static $adatbazis = 'pnet354_motto001_fejleszt';
public static $host = 'localhost';
public static $felhasznalonev = 'root';
public static $jelszo = '';
public static $adatbazis = 'fejleszt';
public static $mailfrom= 'motto001@gmail.com';
public static $fromnev= 'Admin'; 
public static $offline = 'nem'; //igen bekapcsolja az offline módot
public static $offline_message = 'Weblapunk fejlesztés alatt.';
}
class GOB{
public static $hiba =[];
}
class LANG{
public static function ECH($input){echo $input;}
}
$db=DB::connect();
//$sql='select * from userek';
//$sql="INSERT INTO ajanlasok (domain) VALUES ('ttgggg------ttjjj')";
//echo DB::assoc_sor($sql['id']);
//DB::torol_sor('ajanlasok ','14') ;
//DB::torol_tobb_sor('ajanlasok',['tjjj','ttgg',],'domain') ;
//echo $id;
print_r(GOB::$hiba);
DB:parancs("INSERT INTO item (foto,time) VALUES ('sfgwefrtwe',NOW;)");

$data=ADAT::postbol_datatomb('username,email,password,pass2');
print_r($data);
//$data=ADAT::slashed_datatomb($data,'user','email,pass1,pass2') ;
//print_r($data);
//$id=ADAT::beszur_tombbol(tábla,adattömb,mezők='username,email,password') ;
//ADAT::frissit_tombbol('userek',$data,'279','username,email,password');
//echo $id;
echo Link::kiszed('index.php?rrr&task=123&h=erfwer&ffg=sdfs','task');

?>
<!DOCTYPE html>
<html dir="ltr" lang="hu-HU"><head>
    <meta charset="utf-8"/>
</head>
<body>
<h1>Regisztrálás</h1>

<form action="" method="POST">
<table align="left" border="0" cellspacing="0" cellpadding="3">
<tr><td><?php LANG::ECH('USER NAME');?>:</td><td><input type="text" name="username" maxlength="30" value="<?php echo $data['username']; ?>"></td><td></td></tr>
<tr><td>Email:</td><td><input type="text" name="email" maxlength="50" value="<?php echo $data['email']; ?>"></td><td></td></tr>
<tr><td><?php LANG::ECH('PASSWD');?>:</td><td><input type="password" name="password" maxlength="30" value="<?php echo $data['password']; ?>"></td><td></td></tr>
<tr><td><?php LANG::ECH('PASSWD');?> <?php LANG::ECH('REPEAT');?>:</td><td><input type="password" name="pass2" maxlength="30" value="<?php echo $data['pass2']; ?>"></td><td></td></tr>

<tr><td colspan="2" align="right">
<input type="submit" value="Regidztrál"></td></tr>
<!--<tr><td colspan="2" align="left"><a href="main.php">Back to Main</a></td></tr>-->
</table>
</form>
</body>
<html>
