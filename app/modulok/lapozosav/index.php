<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );

function lapozosav2($rekordszam,$sorszam,$get_adatok,$lapozo=4,$elo_offset=5,$uto_offset=10)
{
$get_adatok2=linkbol_kiszed($get_adatok,'sorszam');
//$elo_offset= hánylapotjelenítsen meg az aktuális lap előtt
//$uto_offset= hánylapotjelenítsen meg az aktuális lap után
if($rekordszam>$lapozo)
{
$rekordszam2=$rekordszam+1;
$lapszam=ceil($rekordszam2/$lapozo); //felfelé kerekítve
$sorszam2=$sorszam+1;
$akt_lap=ceil($sorszam2/$lapozo); //az aktuális lap

//echo $lapozo;
$offset=$elo_offset+$uto_offset;
if($lapszam>$offset)
{
	if($akt_lap>$elo_offset)
	{
	$kezdolap=$akt_lap-$elo_offset;
	$befejezolap=$akt_lap+$uto_offset;
	if($befejezolap>$lapszam){$befejezolap=$lapszam;}
	}
	else
	{$kezdolap=1;
	$befejezolap=$akt_lap+$uto_offset;
	if($befejezolap>$lapszam){$befejezolap=$lapszam;}
	}
}
else
{$kezdolap=1;$befejezolap=$lapszam;}


if ($akt_lap>1)
	{
	$lap_kezdoitem=($akt_lap*$lapozo)-(2*$lapozo);
	$kiir='<a style="padding:3px; margin:2px; border-style:solid; border-width:1px;background-color:#C4DCE8;" href="index.php?option=com_alap'.$get_adatok2.'&sorszam='.$lap_kezdoitem.'"> << Előző '.$lapozo.'</a>';
	}

	for($i=$kezdolap; $i<=$befejezolap; $i++)
	{	
	$lap_kezdoitem=(($i*$lapozo)-$lapozo);
	if($akt_lap==$i){$style='style="padding:3px; margin:2px; border-style:solid; border-width:1px;background-color:#82041A; color:#ECD4D4;"';}else{$style='style="padding:3px; margin:2px; border-style:solid; border-width:1px;background-color:#C4DCE8;"';} 
	$kiir=$kiir.'<a href="index.php?option=com_alap'.$get_adatok2.'&sorszam='.$lap_kezdoitem.'" '.$style.'> '.$i.' </a>';
	//$i2++;
	}
	
	if ($befejezolap>$akt_lap)
	{
	$lap_kezdoitem=($akt_lap*$lapozo);
	$kiir=$kiir.' <a style="padding:3px; margin:2px; border-style:solid; border-width:1px;background-color:#C4DCE8;" href="index.php?option=com_alap'.$get_adatok2.'&sorszam='.$lap_kezdoitem.'"> következő '.$lapozo.' >> </a>';
	}
}	
return $kiir;				

}


	
?>