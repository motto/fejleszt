<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );
//példa:
//$fejlec='egyes:Eggyes,ketes:Kettes'; //előbb a mzőnév aztán a felirat
//$adat_tomb[]=array('egyes'=>'sdfsdfsd','ketes'=>'hhhhhhh');
//$adat_tomb[]=array('egyes'=>'klllll','ketes'=>'fooooooo');
//echo TablaGyors::general($fejlec,$adat_tomb);
// vagy:    $tabla= new Tabla;
//			$tabla->fejlec=$fejlec;
//			$tabla->adat_tomb=$adat_tomb;
//  		echo $tabla->general()


//assoc_tomb($string,$tagolo1=',',$tagolo2=':')
// fölösleges szóközök eltávolítása: $string = preg_replace('/\s+/',' ',$string);
//$string = preg_replace('/[\s]+/', '-', $string);//ekkor ha több szünet van egymás mellett, akkor is 1 db mínusz jel lesz belőle.
function clean($value) {
// If magic quotes not turned on add slashes.
if(!get_magic_quotes_gpc())
// Adds the slashes.
{ $value = addslashes($value); }
// Strip any tags from the value.
$value = strip_tags($value);
// Return the value out of the function.
return $value;
}

class Ikon
{
//function general($elemszam=1,$lapoz='',$elotte='')
function ikonsor($ikonok,$id,$float='')
{
$ikonomb=explode(',',$ikonok);
foreach ($ikonomb as $ikon){
$hhhh=$hhhh.Ikon::$ikon($id);
}
if($float=='lezar'){$hhhh=$hhhh.'<div style="clear:both;"></div>';} return $hhhh; }

function torol($id,$float='')
{
$param='meret:32,felirat:Törlés,kep:torol.png,task:torol,id:'.$id;
$hhhh=Alap::gyors('AlapIkon',$param,'ikon');
if($float=='lezar'){$hhhh=$hhhh.'<div style="clear:both;"></div>';} return $hhhh; }

function tabla_szerk($id,$float='')
{$param='meret|16,kep|edit.png,task|edit,style|float:left;,id|'.$id;
$hhhh=Alap::gyors('AlapIkon',$param,'ikon','|');return $hhhh; return $hhhh;}
function tabla_ment($id,$float='')
{$param='meret:16,kep:edit.png,task:edit,id:'.$id;
$hhhh=Alap::gyors('AlapIkon',$param,'ikon');return $hhhh; return $hhhh;}


function szerk($id,$float='')
{
$param='meret:32,felirat:Szerkeszt,kep:edit.png,task:edit,id:'.$id;
$hhhh=Alap::gyors('AlapIkon',$param,'ikon');return $hhhh;
 if($float=='lezar'){$hhhh=$hhhh.'<div style="clear:both;"></div>';} return $hhhh;}

function uj($id,$float='')
{
$param='meret:32,felirat:Szerkeszt,kep:edit.png,task:edit,id:'.$id;
$hhhh=Alap::gyors('AlapIkon',$param,'ikon');return $hhhh; 
if($float=='lezar'){$hhhh=$hhhh.'<div style="clear:both;"></div>';} return $hhhh;}

function tilt($id,$float='')
{
$param='meret:32,felirat:Tilt,kep:published.png,task:tilt,id:'.$id;
$hhhh=Alap::gyors('AlapIkon',$param,'ikon');return $hhhh;
 if($float=='lezar'){$hhhh=$hhhh.'<div style="clear:both;"></div>';}return $hhhh;}

function enged($id,$float='')
{
$param='meret:32,felirat:Szerkeszt,kep:edit.png,task:edit,id:'.$id;
$hhhh=Alap::gyors('AlapIkon',$param,'ikon');return $hhhh;
 if($float=='lezar'){$hhhh=$hhhh.'<div style="clear:both;"></div>';}return $hhhh;}
}


class AlapIkon 
{
public $height=null;
public $width=null;
public $felirat='';
public $link='';
public $style='float:right;text-align:center; margin:10px;';
public $task='';
public $src=''; //Ha nem üres felülírja a képmappa/meret/ utvonalat
public $kepmappa='kepek';
public $kep='';
public $formid='tablaform'; //az ilyen azonosítólyú form adatatitküldi el ha link az értéke linket generál az onclickre
public $id='';
public $meret=''; //az ikon mérete és az ikon méret mappája
//$link=Alap::linkbol_kiszed($_SERVER['REQUEST_URI'],'task') ;//a rendezés irányát eltávolítja 
//$link=Alap::get_cserel($link,'rmezo',$ertek['mezo']);
function ikon() 
{
$link=Alap::get_cserel($_SERVER['REQUEST_URI'],'task',$this->task);
//$link=Alap::get_cserel($link,'id',$this->id);

if($this->formid=='link'){$onclick='location.href=\''.$link.'\'';}
else
{$onclick='document.getElementById(\''.$this->formid.'\').submit()';}

if($this->width!=''){$width='width="'.$this->width.'"';} 
if($this->height!=''){$height='height="'.$this->height.'"';} 
$src='/'.$this->kepmappa.'/'; if($this->meret!=''){$src=$src.$this->meret.'/';}
if($this->src!=''){$src=$this->src;}
if($this->kep!=''){$kep='<img  src="'.$src.$this->kep.'"/>';}


$tx=$tx.'<div  class="ik" style="'.$this->style.'" '.$width.' '.$height.' onclick="'.$onclick.';">';
$tx=$tx.$kep.'<br/>'.$this->felirat.'</div>';
return $tx;
}

}





class Html
{
function param_csere($elem,$param='') 
{
return $tb;
}
function param_hozzaad($elem,$param='') 
{
return $tb;
}

function param($param='') 
{
if($param!=''){
	if(!is_array($param)){$paramtomb=Alap::param_tomb($param);}else{$paramtomb=$param;}
	foreach($paramtomb as $kulcs=>$ertek){
	if($ertek!=''){$tx=$tx.' '.$kulcs.'="'.$ertek.'"';}
	}
}
return $tb;
}

function td($tartalom,$param='') 
{
$param_kesz=' '.Html::param($param) ;
$tb='<td'.$param_kesz.'>'.$tartalom.'</td>';
return $tb;
}
function div($tartalom,$param='') 
{
$tb='<div '.$param.'>'.$tartalom.'</div>';
return $tb;
}
function imput($tartalom,$param='') 
{
$tb='<input type="checkbox" '.$param.''.$tartalom.'>';
return $tb;
}
}
class Tabla
{
public $tabla_mod='igen'; 
public $tabla_mod_lapoz=5; 
public $lapozo_id='id'; 
public $lapoz=10;
public $elotte=5; 
public $tabla='userek';
public $form='nem';
public $admin_tabla='igen';
public $sorrend_mezo='igen';
public $add_id='nem';
public $trimm='';
public $asc_img='/kepek/down.png';
public $desc_img='/kepek/up.png';
//public $fejlec='';
public $fejlec_tomb=null;
public $adat_tomb=null;
public $style='<style>.rendez_sor{background-color:rgba(0,191,255, 0.10);; margin: 1px; padding:1px; overflow:hidden;  line-height: 50%;} 	#tabla {	width: 50%; /*szélesség*/	margin-left: 25%; /*hogy jobban nézzünk ki, ne a lap szélén legyen*/	margin-right: 25%;	text-align: center; /*a táblázatban szereplő minden szöveg igazítása, kivéve a thead-et*/	}	thead {	background-color: black; /*fejléc beállításai*/color: white;	text-indent: 15px;text-align: center;}	tbody tr:nth-child(odd) { /*páratlan sorok*/	background-color: rgba(    0,191,255, 0.15); /* kék, 20% alpha */}tbody tr:nth-child(even) { /*páros sorok*/background-color: rgba(255, 0, 0, 0.15); /* red, 40% alpha */}</style>';
function mezo_general() 
{
$i=1;
if(is_array($this->adat_tomb)){
foreach ($this->adat_tomb as $mezo)
{
$tb=$tb.'<tr>';
if($this->admin_tabla=='igen'){$this->form='igen'; $tb=$tb.'<td><input type="checkbox" name="adid[]" value="'.$mezo['id'].'" /></td>';}
$k=1;
	foreach ($this->fejlec_tomb as $ertek){
	//tartalom előállítása********************************************************************************
	//$mezoertek=mysql_real_escape_string($mezo[$ertek['mezo']]);
	//html elemek kezelése------------------------------
	$mezoertek=$mezo[$ertek['mezo']];
	if($ertek['html']==''){$mezoertek=strip_tags($mezo[$ertek['mezo']]);} //alapértelmezésben az összes html tagot kiszedi a mező értékből
	elseif($ertek['html']=='igen'){$mezoertek=$mezo[$ertek['mezo']];} // ha a fejléctömben megadjuk a 'html'=>'igen' opciót nem csinál semmit
	else{$mezoertek=strip_tags($mezo[$ertek['mezo']],$ertek['html']);} // az $ertek['html']-ben (fejlec_tomb html eleme) kell megadni hogy milyen tagokat engedélyezünk pl:'html'=>'<p><a>'. ekkor a <p></p> és az <a></a> tagok megmaradnak

	//karakterek levágása ha kell-----------------------------------------
	if($ertek['trim']!=''){$tartalom=substr($mezoertek, 0, $ertek['trim']);
	}else{$tartalom=$mezoertek;}
	//függvény lefuttatása ha kell--------------------------------------------------
	if($ertek['func']!=''){$tartalom=$ertek['func']($tartalom,$mezo['id']);}
	//***************************************************************************************************************
	$azon=$i.'_'.$k;
	//input mezo--------------------------------------
	if($ertek['edit']!=''){$this->form='igen';$tart='<input type="text" name="in_'.$azon.'" style="width:'.$ertek['width'].'px" value="'.$tartalom.'"/>'; $tartalom=$tart;}
	//td generálás-------------------------------------
	if($this->add_id=='igen'){$param=$param.'id:td_'.$azon;}
	$tb=$tb.Html::td($tartalom,$param='');

	$k++;
	}	
$tb=$tb.'</tr>';
$i++;
}
}
$tb=$tb.'</table>';
return $tb;
}
function adat_tomb() 
{
foreach ($this->fejlec_tomb as $fejlec){
$fejlec1=explode('.',$fejlec['mezo']);
$mezok=$mezok.','.$fejlec1[0];
}
$trimmed_mezok = ltrim($mezok, ",");
if($_GET['rmezo']!=''){$order='order by '.$_GET['rmezo'].' '.$_GET['rir'];}
if($_GET[$this->lapozo_id]!=''){$lapozo_id=$_GET[$this->lapozo_id];}else{$lapozo_id=0;}

if($this->tabla_mod=='igen'){$indul=$lapozo_id*$this->tabla_mod_lapoz;$limit='LIMIT '.$indul.','.$this->tabla_mod_lapoz;echo $indul;}
else{$indul=$lapozo_id-$this->elotte; $limit='LIMIT '.$indul.','.$this->lapoz;}

if($indul<1){$indul=0;}
//LIMIT 0, 10
$sql="select $trimmed_mezok from $this->tabla $order $limit";
$this->adat_tomb=Lekerdez::assoc_tomb($sql);
$sql="select $trimmed_mezok from $this->tabla $order ";
$elemszam2=Lekerdez::assoc_tomb($sql);
$elemszam1= count($elemszam2);
if($this->tabla_mod=='igen'){$elemszam=$elemszam1/$this->tabla_mod_lapoz; }else{$elemszam=$elemszam1;}
return ceil($elemszam);
}

function general() 
{
$elemszam=$this->adat_tomb();
$mezo=$this->mezo_general();
$style= $this->style;
$fejlec_sor=$general.$this->th_general();
$renedezo=$general.$this->rendez_general() ;
$tb=$tb.$style;
if($this->form=='igen'){$tb=$tb.'<form id="tablaform" action="'.$_SERVER['REQUEST_URI'].'" >';}
$tb=$tb.$fejlec_sor.$renedezo.$mezo;
if($this->form=='igen'){$tb=$tb.'</form>';;}
//$param=array('elemszam'=>$elemszam,'elotte'=>$this->elotte,'lapoz'=>$this->lapoz,'lapoz_id'=>$this->lapoz_id);
//$tb=$tb.LapozoGyors::megjelenit($param);
return $tb;
}
function th_general() 
{
//if($this->fejlec_tomb==''){$this->fejlec_tomb=char_assoc_tomb($this->fejlec);}
//print_r($this->fejlec_tomb);
$tb='<table><tr>';
if($this->admin_tabla=='igen'){$tb=$tb.'<th></th>';}
foreach ($this->fejlec_tomb as $ertek)
{
$tb=$tb.'<th';
if($ertek['width']!=''){ $tb=$tb.' width="'.$ertek['width'].'" ';}
$tb=$tb.'>'.$ertek['felirat'].'</th>';}
$tb=$tb.'</tr>';
return $tb;
}
function rendez_general() 
{
$tb=$tb.'<tr>';
if($this->admin_tabla=='igen'){$tb=$tb.'<td></td>';}
foreach ($this->fejlec_tomb as $ertek)
{
$link=Alap::linkbol_kiszed($_SERVER['REQUEST_URI'],'rir') ;//a rendezés irányát eltávolítja
$link=Alap::get_cserel($link,'rmezo',$ertek['mezo']);
$asc_rendez_box='<a href="'.$link.'&rir=asc"><img src="'.$this->asc_img.'"></a>';
$desc_rendez_box='<a href="'.$link.'&rir=desc"><img src="'.$this->desc_img.'"></a>';
$tb=$tb.'<td';
$tb=$tb.' class="rendez_sor" ';
$tb=$tb.'>'.$asc_rendez_box.$desc_rendez_box;
if($ertek['edit']=='igen'){if($_GET['task']=='tszerk'){$tb=$tb.Ikon::tabla_ment($id);}else{$tb=$tb.Ikon::tabla_szerk($id);}}
$tb=$tb.'</td>';}
$tb=$tb.'</tr>';
return $tb;
}

}



class LapozoGyors
{
//function general($elemszam=1,$lapoz='',$elotte='')
function megjelenit($param)
{$hhhh=Alap::gyors('Lapozo',$param,'megjelenit');return $hhhh; }
}
class Lapozo 
{
public $elemszam=null;
public $lapoz=10;
public $elotte=3;
public $lapozo_id='id'; // GET-be ezt az azonosítót teszi be

public $style='<style> .lapoz{padding:3px; margin:2px; border-style:solid;cursor:pointer; border-width:1px;color:red;background-color:#C4DCE8;border-color:red;float:left;}  .lapozaktiv{ cursor:pointer;background-color:#82041A; color:#ECD4D4;} </style>';

function megjelenit()
{
if($this->elemszam>1){
$lid=$_GET[$this->lapozo_id];
$visszalid=$lid-1;
$elorelid=$lid+1;
$indul=$lid-$this->elotte;

if($indul<1){$indul=1;}

$link=Alap::linkbol_kiszed($_SERVER['REQUEST_URI'],$this->lapozo_id) ;//az aktualis listaelem azonosítóját eltávolítja
$kiir=$kiir.$this->style;
if ($lid>1)
	{
	$kiir=$kiir.='<div class="lapoz" onclick="location.href=\''.$link.'&'.$this->lapozo_id.'='.$visszalid.'\';" > << Előző </div>';	
	}
	
if(($indul+$this->lapoz)>$this->elemszam){$indul=$this->elemszam-$this->lapoz;}	
if($indul<1){$indul=1;$this->lapoz=$this->elemszam-1;}	
	for($i=0; $i<($this->lapoz+1); $i++)
	{
	$aktual_lid=$i+$indul;
	$kiir=$kiir.'<div class=" lapoz ';
	if($lid==$aktual_lid){$kiir=$kiir.' lapozaktiv ';}
	$kiir=$kiir.'" onclick="location.href=\''.$link.'&'.$this->lapozo_id.'='.$aktual_lid.'\'"> '.$aktual_lid.' </div>';
	//$i2++;
	}
	
if ($lid<$this->elemszam)
	{
	$kiir=$kiir.='<div class="lapoz" onclick="location.href=\''.$link.'&'.$this->lapozo_id.'='.$elorelid.'\'"> Következő >> </div>';	
	}
	$kiir=$kiir.='<div style="clear:both;"></div>';
return $kiir;
}				
}
}

class TablaGyors
{

function general($fejlec_tomb,$adat_tomb)
{$tabla= new Tabla;$tabla->fejlec_tomb=$fejlec_tomb;$tabla->adat_tomb=$adat_tomb;$tb=$tabla->general();return $tb;}
}

/*
class Admin
{
// lekérdezendő tábla adatok--------
public $tabla='';
public $rekord_szam=50;
public $kezdo_rekord=0;
public $rendez_mezo='id';
public $rendez_irany='asc';
public $fejlec='';

public $adat_tomb='';
//public $where='';

function __construct(){
if($_GET['rnum']!=''){$this->rekord_szam=$_GET['rnum'];}
if($_GET['rkezd']!=''){$this->kezdo_rekord=$_GET['rkezd'];}
if($_GET['rmezo']!=''){$this->rendez_mezo=$_GET['rord'];}
if($_GET['rir']!=''){$this->rendez_irany=$_GET['rir'];}
global $tabla;
$this->tabla=$tabla;
global $userid;
$this->userid=$userid;
}

function task_vallaszto() 
{
$tasktomb=array('alap','bevitel_post');
$task=$this->task;
if(in_array($task,$tasktomb)){$this->$task();
}else{
if(function_exists($task)){$task();}else{global $hiba; $hiba['nincs'][]='hianyzo megjelenito függveny:'.$task;}
}
}

function alap() 
{
//Lekerdez::assoc_tomb("select ".$this->lekerdez_mezok." from ".$this->tabla."where")
echo 'alap';
}
function bevitel_post() 
{
if($this->tabla!=''){
$mezonevek=mezonevek($this->tabla);
	foreach($mezonevek_tomb as $mezonev){
		if($_POST[$mezonev]!=''){
			if($frissit==''){$frissit= $mezonev.'=\''.$_POST[$mezonev].'\'';}
			else{
			$frissit=$frissit.', AND '.$mezonev.'=\''.$_POST[$mezonev].'\'';}
		}
	if($this->id=='' and $this->ujrekord=='igen'){
	$this->id=Lekerdez::parancs("INERT INTO ".$this->tabla." (userid,datum) VALUES ($userid,NOW())");	
	}	
	Lekerdez::parancs("UPDATE ".$this->tabla." SET $frissit where id='".$this->id."'");		
	}
}else{ global $hiba; global $userid;
       $hiba['admin'][]=array('ido'=>date("Y-m-d H:i:s") ,'userid'=>$userid,'fuggveny'=>'bevitel_post()','hiba' =>'Nincs megadva táblanév!');}
}
function bevitel_tomb() 
{

}

}
class AdminGyors
{
function parancs($sql)
{$ob=new Adatbazis;$result=$ob->parancs($sql); return $result;}
function adat_ir($sql,$ir='nem')
{$ob=new Adatbazis;$result=$ob->adat_ir($sql,$ir); return $result;}

function indexelt_sor($sql)
{$ob=new Adatbazis;$result=$ob->indexelt_sor($sql); return $result;}

function indexelt_tomb($sql)
{$ob=new Adatbazis;$result=$ob->indexelt_tomb($sql); return $result;}

function assoc_sor($sql)
{$ob=new Adatbazis;$result=$ob->assoc_sor($sql); return $result;}

function assoc_tomb($sql)
{$ob=new Adatbazis;$result=$ob->assoc_tomb($sql); return $result;}
}
*/
	
?>