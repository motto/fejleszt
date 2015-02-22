<?php
class Kozossegi
{
public $ugyfelid;
public $webhelyid;
public $lapid;
public $itemid;
public $jelent_stlye='position:absolute;top: 10px;left:20px;z-index:50;';
public $email_ajanl_stlye='position:absolute;top: 10px;left:140px;';
public $face_stlye='position:absolute;top: 10px;left:260px;';
public $google_stlye='position:absolute;top: 10px;left:425px;';
public $twitter_stlye='position:absolute;top: 10px;left:480px;';
public $uzenet_stlye='position:absolute;top: 10px;left:555px;';

function __construct()
{
//$session = JFactory::getSession();
//$ugyfelid=
//$this->itemid = $_GET['itemid'];
//$this->webhelyid = $_GET['webhelyid'];
//$this->lapid = $_GET['lapid']; 

}
public function ajanlosav($userid=62)
{
$d='<div id="ajanlosav" style="float: left; font-size: 14px; background-color: #D4E0E8; padding:8px;margin:8px;height:20px; width:620px; position: relative; top:1px; ">';

$d=$d.$this->email_ajanl();
$d=$d.$this->jelent();
$d=$d.$this->face();
$d=$d.$this->google();
$d=$d.$this->twitter();
$d=$d.$this->uzenet($userid);
$d=$d.'</div>';
$d=$d. '<div style="clear:both;"></div>';
return $d;
}



public function uzenet($lapid)
{

$link='index.php?option=com_alap&ftask=email&mailtipus=uzenet&cimid='.$cimid.'&tmpl=component';

$d=$d.'<div style="'.$this->uzenet_stlye.'" ><div class="button2-left"><div class="image"><a class="iframe" href="'.$link.'"  return false;">Üzenet</a></div></div></div>';
return $d;
}


public function face()
{
$d=$d. '
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/hu_HU/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, \'script\', \'facebook-jssdk\'));</script>';

$d=$d. '<div id="fb-root"></div><div style="'.$this->face_stlye.'"><div class="fb-like"  data-send="true" data-layout="button_count" data-width="225" data-show-faces="true"></div></div>';
return $d;
}

public function google()
{
//google +1---------------------------------------------
$d=$d. '<div style="'.$this->google_stlye.'"><g:plusone size="medium" annotation="none"></g:plusone></div>
<script type="text/javascript">
  window.___gcfg = {lang: \'hu\'};

  (function() {
    var po = document.createElement(\'script\'); po.type = \'text/javascript\'; po.async = true;
    po.src = \'https://apis.google.com/js/plusone.js\';
    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>';
return $d;
}
public function twitter()
{
//twitter------------------------
$d=$d.'<div style="'.$this->twitter_stlye.'"><a href="https://twitter.com/share" class="twitter-share-button" data-lang="hu"  data-count="none">Tweet</a></div>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>';
return $d;
}

public function jelent()
{
//problémás termék-------------------------------
  $link='index.php?option=com_alap&ftask=email&mailtipus=bejelent&tmpl=component';

 $d=$d.'<div style="'.$this->jelent_stlye.'" ><div class="button2-left"><div class="image"><a class="iframe" href="'.$link.'"  return false;">Szabáytalan lap</a></div></div></div>';
 return $d;
}
public function email_ajanl()
{

 $link='index.php?option=com_alap&ftask=email&mailtipus=ajanlas&tmpl=component';

 $d=$d.'<div style="'.$this->email_ajanl_stlye.' " ><div class="button2-left"><div class="image"><a class="iframe" href="'.$link.'"  return false;">Ajánló email</a></div></div></div>';
 
return $d;
}
//facebook--------------------------------------------------
public function add_ogg($item,$lapadatok,$cim='',$szlogen='')
{
/*
//$lapadatok tömbben lennie kell foto-nak,szlogen-nek és nev-nek-------------------------
$session = JFactory::getSession();
$doc =& JFactory::getDocument();
$ogg_site=$_SERVER['HTTP_HOST'];
$perdom=$session->get('perdom');
if(!empty($perdom)){$ogg_site=$_SERVER['HTTP_HOST'].'/'.$session->get('perdom');}
$app_id='140765922724614';
//cím----------------------------------------------------
if(!empty($item['cim'])){$cim.':'.$item['cim'];	}
$oggcim=$cim;

//foto a likeoláshpz--------------------------------------------------
//<meta property="og:image" content="http://www.valami.hu/kep.png?r= print(rand(10000000,99999999)); " />
	if(!empty($item['foto']))
	{
	$foto=$item['foto'];
	$fotoeleje=substr($foto, 0, 7);
	if($fotoeleje!='http://'){$foto='http://'.$_SERVER['HTTP_HOST'].'/'.$foto;}
	$doc->addCustomTag( '<meta property="og:image" content="'.$foto.'" />');
	}
	if(!empty($item['video']))
	{
	$linktomb = explode("/", $item['video']);
	$videolink =array_pop( $linktomb);
	//http://youtu.be/03DfxKeKczE
	//http://i1.ytimg.com/vi/'.$videolink.'/mqdefault.jpg">
	//$d=$d. '<iframe  width="210" height="172" src="http://www.youtube.com/embed/'.$videolink.'" frameborder="0"  allowfullscreen></iframe>';
	$foto='http://i1.ytimg.com/vi/'.$videolink.'/mqdefault.jpg';
	$doc->addCustomTag( '<meta property="og:image" content="'.$foto.'" />');
	}

	if(!empty($item['szoveg']))
	{
	$pattern = "/<img(?:[^\>]*) src=\"?'?`?((?:\/?(?:[^\>]*)\/?)?[^string_]?[[:alnum:]]+\..{3})\"?'?`?(?:[^>]*)\>/i";
	$matches = preg_match_all($pattern, $item['szoveg'], $keplinkek);
	//$foto=$keplinkek[1][0];
	//!!! $keplinkek[0]= az alt tagokat tartalmazo tömb $keplinkek[1]= az src-t tartalmazo tömb !!!!!!!!!!!!!!!!!!!!!!
		foreach ($keplinkek[1] as $keplink)
		{
		$foto=$keplink;
		$fotoeleje=substr($foto, 0, 7);
		if($fotoeleje!='http://'){$foto='http://'.$_SERVER['HTTP_HOST'].'/'.$foto;}
		$doc->addCustomTag( '<meta property="og:image" content="'.$foto.'" />');
		}
	}
	if($session->get('domainlogo')!='')
	{
	$foto=$session->get('domainlogo');
	$fotoeleje=substr($foto, 0, 7);
	if($fotoeleje!='http://'){$foto='http://'.$_SERVER['HTTP_HOST'].'/'.$foto;}
	$doc->addCustomTag( '<meta property="og:image" content="'.$foto.'" />');
	}
	if($session->get('webhelylogo')!='')
	{
	$foto=$session->get('webhelylogo');
	$fotoeleje=substr($foto, 0, 7);
	if($fotoeleje!='http://'){$foto='http://'.$_SERVER['HTTP_HOST'].'/'.$foto;}
	$doc->addCustomTag( '<meta property="og:image" content="'.$foto.'" />');
	}
	if(!empty($lapadatok['foto']))
	{
	$foto=$lapadatok['foto'];
	$fotoeleje=substr($foto, 0, 7);
	if($fotoeleje!='http://'){$foto='http://'.$_SERVER['HTTP_HOST'].'/'.$foto;}
	$doc->addCustomTag( '<meta property="og:image" content="'.$foto.'" />');
	}

//szöveg a likeoláshoz
if(!empty($item['kepalairas']))
{$ogg_leir=substr($item['kepalairas'], 0, 340);}
if(empty($ogg_leir))
{
if(!empty($item['szoveg']))
{
$string = strip_tags($item['szoveg']); //html elemek eltávolítása
$ogg_leir=substr($string,0,340);}
}

if(empty($ogg_leir))
{
$ogg_leir=$szlogen;
}
if(empty($ogg_leir))
{
$ogg_leir='Legyen saját weblapja,webáruháza! Teljes körű webmegoldások: infolapok.hu';
}

$doc->addCustomTag( ' <meta property="og:title" content="'.$oggcim.'" />');
$doc->addCustomTag( '<meta property="og:type" content="website"/>');
//$doc->addCustomTag( '<meta property="og:url" content="'.$ogg_site.$_SERVER['REQUEST_URI'].'" />');
$doc->addCustomTag( '<meta property="og:description" content="'.$ogg_leir.'" />');
$doc->addCustomTag( '<meta property="og:site_name" content="'.$ogg_site.'" />');
$doc->addCustomTag( '<meta property="fb:app_id" content="'.$app_id.'" />');
*/
}
}

?>