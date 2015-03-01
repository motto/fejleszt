<?php
//defined( '_MOTTO' ) or die( 'Restricted access' );
/*
Link::kiszed('index.phph=rrr&task=123&h=erfwer&ffg=sdfs','task,h,lll');
Link::kiszed(link,'task,id'); //ha a linkben nincs kérdőjel mögé tesz egy ?gt=0 -t
Link::src_thumb($src)  //képnév elé illeszti a thumb/ -ot
*/
//tömbkezelő függvények-------------------------------------------------
class TOMB {
static function char_to_assoc($string,$tagolo1=',',$tagolo2=':')
{
//pl.:$string='class:hhh,id:azon,name:név'
$tomb=[];
$tx1=explode($tagolo1,$string);
foreach($tx1 as $mezo){
$tx2=explode($tagolo2,$mezo);
$tomb[$tx2[0]]=$tx2[1];
}
return $tomb;
}
function kiir($tomb){
foreach($tomb as $elem){
if(is_array($elem)){self::kiir($elem);}else{echo $elem."\n </br>";}}
}
}

//Ős osztály-------------------------------
class Os{
{
    private $pr1;
    protected $pr2;
    protected $param;

    function __construct($paramtomb){$this->frissit();}

    function frissit($paramtomb)
    {
        foreach ($paramtomb as $key=>$param) {
            $this->$key=$param;

        }

    }


}}

//osztályok létrehozása (object factory)-------------------------------
class OBJ{
  protected static  $obj=null;
    function __construct(){
     $this->obj= self::gyors($osztaly,$param,$fugveny='',$tagolo1=',',$tagolo2=':');
     return $this->obj;
    }
//pl.:$param='class:hhh,id:azon,name:név' Obj::gyors($osztaly,$param,'megjelenit')
    static function gyors($osztaly,$param,$fugveny='',$tagolo1=',',$tagolo2=':') //stringből tölti fel az osztály változókat
    {

    $ujobj=new $osztaly;
        if(is_array($param)){$param2=$param;}else{
     $param2=TOMB::char_to_assoc($param,$tagolo1,$tagolo2);
        }
        foreach($param2 as $kulcs => $ertek){$ujobj->$kulcs=$ertek;}
    //ha van függvény azzal hanincs az objektummal tér vissza
        if($fugveny==''){return $ujobj;}else{return $ujobj->$fugveny();}
        return $ujobj;
    }

}

//karakter láncok kezelélse---------------------------------------------------

class Karatkter {

function webnev_fuggveny($string,$hosz=20)
{ $hungarianABC = array( 'á','é','í','ó','ö','ő','ú','ü','ű','Á','É','Í','Ó','Ö','Ő','Ú','Ü','Ű','&','#','@','$','%','/','\\');
 $englishABC = array( 'a','e','i','o','o','o','u','u','u','A','E','I','O','O','O','U','U','U','e','e','e','e','e','e','e');
$string=str_replace($hungarianABC, $englishABC, $string);
$webabc = array( 'a','e','i','o','u','b','c','d','f','g','h','j','k','l','m','n','p','_','q','r','s','z','v','w','x','y','t','0','1','2','3','4','5','6','7','8','9');
$string = strtolower( $string);
$string=str_replace(' ', '_', $string);$string=str_replace('-', '_', $string);$string=str_replace(',', '_', $string);$string=str_replace('+', '_', $string); $string=str_replace('___', '_', $string);$string=str_replace('__', '_', $string);
  for ($n = 0; $n < strlen($string); ++$n)
  {if($n<$hosz){if (in_array($string{$n},$webabc)){$webnev=$webnev.$string{$n};}}}
	  return $webnev;
}

}
//link kezelő-------------------------------------
class Link {
// a kép neve elé teszi a /thumb-ot (thumb elérési útját állítja elő
function src_thumb($src)
{ 
///$path_parts = pathinfo('/www/htdocs/inc/lib.inc.php');
 //$path_parts['dirname'] /www/htdocs/inc
 //$path_parts['basename'] lib.inc.php
 //$path_parts['extension'] php
 //$path_parts['filename'] lib.inc
 $path_parts = pathinfo($src);
 $ujsrc=$path_parts['dirname'].'/thumb/'.$path_parts['basename'];
 return  $ujsrc;
}

	
function kiszed($link,$kiszed1)
{
if(is_array($kiszed1)){$kiszed=$kiszed1;}else{$kiszed=explode(',',$kiszed1);}
$linktomb1=explode('?',$link);
if(empty($linktomb1[1])){$link2=$link.'?gt=0'; GOB::$hiba['link'][]='Link::kiszed:linkben nincs kérdőjel';
}else{
	$linktomb=explode('&',$linktomb1[1]);
	if(is_array($linktomb))
	{
		foreach($linktomb as $tag)
		{
		$altag=explode('=',$tag);
		if( in_array($altag[0],$kiszed))//if($altag[0]!=$kiszed)
		{}else{
		if($get_resz==''){$kotojel='?';}else{$kotojel='&';}
		$get_resz=$get_resz.$kotojel.$altag[0].'='.$altag[1];}
		}
	}else{$get_resz='?'.$altag[0].'='.$altag[1];}
$link2=$linktomb1[0].$get_resz;	
}

return $link2; 
}
function get_cserel($link,$cserel)
{
//$cserel pl.: $cserel='task=ment&id=1'

$kiszed1=explode('&',$cserel);
foreach($kiszed1 as $kiszed2){$kiszed3=explode('=',$kiszed2);$kiszedtomb[]=$kiszed3[0];}
$link2=Link::kiszed($link,$kiszedtomb);
//megnézni hogy vane már get érték és ettől függően vagy ? vagy & jellel fűzni össze
if (strpos($link,'?') === false){$link2=$link2.'?'.$cserel;}else{$link2=$link2.'&'.$cserel;}
//echo $link2;
return $link2; 
}

}
class Hiba {	
function tombbe($tip,$hiba)
{
global $hiba;
$hiba[$tip][]=$hiba;
}
function beir($tip,$hiba)
{
global $hiba;
$hiba[$tip][]=$hiba;
}
}


	
?>