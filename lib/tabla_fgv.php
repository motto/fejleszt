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
	if(!is_array($param)){$paramtomb=Tomb::char_to_assoc($string,$tagolo1=',',$tagolo2=':');}else{$paramtomb=$param;}
	foreach($paramtomb as $kulcs=>$ertek){
	if($ertek!=''){$tx=$tx.' '.$kulcs.'="'.$ertek.'"';}
	}
}
return $tb;
}
//function td($tartalom,$param='') 
function td($tartalom) 
{
//$param_kesz=' '.Html::param($param) ;
//$tb='<td'.$param_kesz.'>'.$tartalom.'</td>';
$tb='<td>'.$tartalom.'</td>';
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
/*class LapozTabla extends Tabla
{
public $limit=50; //ha nulla (0) akkor mind lekérdezi
function lapozo(){
$elemszam=$elemszam1/$this->tabla_mod_lapoz;
return ceil($elemszam);
}
function sql_limit() 
{ 
//$limit=0 akkor nincs lapozás--------------------------------------------
if($this->limit==0){$limit='';$lapozo='';}else{
if($_GET[$this->lapozo_id]!=''){$lapozo_id=$_GET[$this->lapozo_id];}else{$lapozo_id=0;}

if($this->tabla_mod=='igen'){$indul=$lapozo_id*$this->tabla_mod_lapoz;$limit='LIMIT '.$indul.','.$this->tabla_mod_lapoz;echo $indul;}
else{$indul=$lapozo_id-$this->elotte; $limit='LIMIT '.$indul.','.$this->lapoz;}

if($indul<1){$indul=0;}
}
return $limit ;
}

}*/
class Tabla extends AlapTabla
{

public $elemszam=null;
public $full_elemszam=null;
public $sql='';
public $sss='';
public $tabla1='';
public $sql_mezok='';
public $sql_where=''; //WHERE id=12 AND userid=56
public $sql_where_szukit=''; //$sql_where_szukit='userid,webhelyid';
public $sql_order='';
public $sql_limit='';

function __construct()	
{}
function general() 
{ 
$this->fn_mezok(); $this->fn_order(); $this->fn_where();
$this->adat_tomb_leker();
$tb=$this->alap_general();
return $tb ; //.'full:'.$this->full_elemszam.'elem:'.$this->elemszam;
}




function fn_where() 
{ 
	if($his->sql_where==''){
		if($his->sql_where_szukit==''){
		$szukit_tomb=explode(',',$his->sql_where_szukit);
			foreach($szukit_tomb as $szukit){
			global $$szukit;
			$sql_where=$sql_where.' '.$szukit.'='.$$szukit.' AND';
			}
			$this->sql_where='WHERE '.substr($sql_where,0, -3);
		}
	}
}

function fn_order() 
{ 
//rendezés------------------------------------------------------------
if($_GET['rmezo']!=''){$this->sql_order='ORDER BY '.$_GET['rmezo'].' '.$_GET['rir'];}
}

function fn_mezok() 
{ 
//lekérdezendő mezők megállapítása----------------------------------- 
$marvan=array();
foreach ($this->fejlec_tomb as $fejlec){
	if(!in_array($fejlec['mezo'],$marvan)){
	$fejlec1=explode('.',$fejlec['mezo']);
	$mezok=$mezok.','.$fejlec1[0];
	}
$marvan[]=$fejlec['mezo'];
}
$this->sql_mezok = ltrim($mezok, ",");
}


function adat_tomb_leker() 
{ 
if($this->sql==''){
$this->sql="SELECT SQL_CALC_FOUND_ROWS $this->sql_mezok FROM $this->tabla1 $this->sql_order $this->sql_limit ";
}
$this->adat_tomb=DB::assoc_tomb($this->sql);

$rows =DB::parancs('SELECT FOUND_ROWS() AS `found_rows`;');
//$sql = "SELECT FOUND_ROWS() AS `found_rows`;";
//$rows = mysql_query($sql);
//$rows = mysql_fetch_assoc($rows);
//$this->full_elemszam = $rows['found_rows'];
$this->elemszam= count($this->adat_tomb);
}
}

class AlapTabla
{
public $asc_img='kepek/down.png';
public $desc_img='kepek/up.png';
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
	/*if($ertek['edit']!=''){$this->form='igen';$tart='<input type="text" name="in_'.$azon.'" style="width:'.$ertek['width'].'px" value="'.$tartalom.'"/>'; $tartalom=$tart;}
	//td generálás-------------------------------------
	if($this->add_id=='igen'){$param=$param.'id:td_'.$azon;}*/
	$tb=$tb.Html::td($tartalom);

	$k++;
	}	
$tb=$tb.'</tr>';
$i++;
}
}
$tb=$tb.'</table>';
return $tb;
}
public function general(){ $this->alap_general(); }

function alap_general() 
{
//$elemszam=$this->adat_tomb();
$mezo=$this->mezo_general();
$style= $this->style;
$fejlec_sor=$general.$this->th_general();
$renedezo=$general.$this->rendez_general() ;
$tb=$tb.$style;

$tb=$tb.$fejlec_sor.$renedezo.$mezo;

//$param=array('elemszam'=>$elemszam,'elotte'=>$this->elotte,'lapoz'=>$this->lapoz,'lapoz_id'=>$this->lapoz_id);
//$tb=$tb.LapozoGyors::megjelenit($param);
return $tb;
}
function th_general() 
{
//if($this->fejlec_tomb==''){$this->fejlec_tomb=char_assoc_tomb($this->fejlec);}
//print_r($this->fejlec_tomb);
$tb='<table><tr>';
//if($this->admin_tabla=='igen'){$tb=$tb.'<th></th>';}
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
//if($this->admin_tabla=='igen'){$tb=$tb.'<td></td>';}
foreach ($this->fejlec_tomb as $ertek)
{
$cserel='rmezo='.$ertek['mezo'];
$link1=Link::get_cserel($_SERVER['REQUEST_URI'],$cserel);
$link=Link::kiszed($link1,'rir');
{
if($ertek['rendez']=='no'){$asc_rendez_box='';$desc_rendez_box='';}else{
$asc_rendez_box='<a href="'.$link.'&rir=asc"><img src="'.$this->asc_img.'"></a>';
$desc_rendez_box='<a href="'.$link.'&rir=desc"><img src="'.$this->desc_img.'"></a>';}

$tb=$tb.'<td';
$tb=$tb.' class="rendez_sor" ';
$tb=$tb.'>'.$asc_rendez_box.$desc_rendez_box;
if($ertek['edit']=='igen'){if($_GET['task']=='tszerk'){$tb=$tb.Ikon::tabla_ment($id);}else{$tb=$tb.Ikon::tabla_szerk($id);}}
$tb=$tb.'</td>';}
}
$tb=$tb.'</tr>';
return $tb;
}

}
	
?>