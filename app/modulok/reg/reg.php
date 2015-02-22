<?php

function marvan($tabla,$mezo,$adat)
{ $sql="SELECT $mezo FROM $tabla WHERE $mezo='$adat'";
$ob=new Adatbazis;
if($ob->indexelt_sor($sql)){$hiba='már van';} 
return $hiba;} 
function kotelezo($char) 
{if(empty($char)){$hiba='Kötelező kitölteni';}return $hiba;}

function min_char($char,$charszam) 
{if(strlen($char) < $charszam){$hiba='minimum '.$charszam.' karakternek kell lennie';}return $hiba;}

function max_char($char,$charszam) 
{if(strlen($char) > $charszam){$hiba='maximum '.$charszam.' karakter lehet';}
return $hiba;}

function betu_szam($char) 
{if(!preg_match('/^[a-z0-9ÁÉŐÚÓÜÖŰáéúőüóűö]+$/i', $char)){$hiba='Nem tartalmazhat különleges karaktert, csak számot és betűt';}
return $hiba;}

function email($char) 
{$regex = "^[_+a-z0-9-]+(\.[_+a-z0-9-]+)*"."@[a-z0-9-]+(\.[a-z0-9-]{1,})*"."\.([a-z]{2,}){1}$";
if(!preg_match($regex, $char)){$hiba='Nem érvényes email cím';}
return $hiba;}


function ellenor($char,$fugvenyek) 
{
return $hiba;}
function tesztelo($func_nev,$func)
{
	echo'<h3>'.$func.':</h3>';
?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>proba.infolapok.hu</title>	
</head>
<form action="" method="POST">
<table  border="0" cellspacing="0" cellpadding="3">
<tr><td>param1:</td><td><input type="text" name="param1" size="15" maxlength="30" value="<?php echo $_POST['param1']; ?>"></td></tr>
<tr><td>param2:</td><td><input type="text" name="param2" size="15" maxlength="30" value="<?php echo $_POST['param2']; ?>"></td></tr>
<tr><td>param3:</td><td><input type="text" name="param3" size="15" maxlength="30" value="<?php echo $_POST['param3']; ?>"></td></tr>
<tr><td>param4:</td><td><input type="text" name="param4" size="15" maxlength="30" value="<?php echo $_POST['param4']; ?>"></td></tr>
<tr><td>param5:</td><td><input type="text" name="param5" size="15" maxlength="30" value="<?php echo $_POST['param5']; ?>"></td></tr>
<tr><td>param6:</td><td><input type="text" name="jparam6" size="15" maxlength="30" value="<?php echo $_POST['param6']; ?>"></td></tr>
</table>
<input type="hidden" name="tesztel" value="1">
<input type="submit" value="Login">
</form>
<?php
	if($_POST['tesztel'])
	{
	echo'<h3>A függvény futása:</h3>';
	$kiir=$func_nev($_POST['param1'],$_POST['param2'],$_POST['param3'],$_POST['param4'],$_POST['param5'],$_POST['param6']);
	echo '<br/><h3>A függvény kimenete:</h3>'.$kiir;
	}
exit;
}
?>
