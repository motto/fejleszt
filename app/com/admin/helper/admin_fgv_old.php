<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );


include 'lib/tabla_fgv.php';
include 'lib/ikonok.php';
class TASK{
static public $param=[];
static public $adatok=[];
static public $alias=[];

static function szerk($id='',$adatok=''){
if(empty($id)){$id=$this->id;}
	if(empty($adatok)){
	//$mezok=fejlecbol_mezok($this->fejlec_tomb);
	$sql= "select * from ".$this->tabla." where id='".$id."'";
	$adatok=Lekerdez::assoc_sor($sql);
	}	szerk_nezet($adatok);	
}
static function listaz($adatok){
foreach ($adatok as $adat){
item_megjelenit($adat);
}
}

static function del($id) 
{
DB::torol_sor($this->tabla,$this->id);	
}
static function pub($id) 
{
Lekerdez::parancs("UPDATE ".$this->tabla." SET pub=0 where id='".$id."'");	
}
static function unpub($id) 
{
Lekerdez::parancs("UPDATE ".$this->tabla." SET pub=1 where id='".$id."'");	
}
function uj() 
{
$id=Lekerdez::beszur("INSERT INTO ".$this->tabla." (user_id,datum) VALUES ('$this->userid',NOW())");	
return $id;

}
static function ment($adatok,$mezok,$id='') 
{
if($id==''){$id=uj();}

	foreach($mezok as $tabla=>$rekord){
		foreach($rekord as $mezo){
		$mezonev=$mezo['mezo'];
		$mezoertek=addslashes($_POST[$mezonev]);
				if(!empty($mezo['szerk']) and !in_array($mezonev,$marvolt)){
					if($frissit==''){$frissit= $mezonev.'=\''.$mezoertek.'\'';}
					else{
					$frissit=$frissit.' , '.$mezonev.'=\''.$mezoertek.'\'';}
				}
			$marvolt[]=$mezonev;
			}
		Lekerdez::parancs("UPDATE ".$tabla." SET $frissit where id='".$id."'");	
		}
	//echo "UPDATE ".$this->tabla." SET $frissit where id='".$id."'";	
	

}

}








function kep_beszur_js(){ //kép előnézetet jelenít meg és baírja egy input nezőbe (pl.:profil)
$dd='<script type="text/javascript">
function beszur(kep,mezo){
$(\'#\'+mezo+\'_elonezet\').attr(\'src\',kep);
$(\'#\'+mezo).val(kep)}
</script>';
return $dd;
}
//ikonok-----------------------------------------------------------
function torol_ikon($ertek,$id){return Ikon::torol($id,16,$felirat='');}
function ment_ikon($ertek,$id){return Ikon::torol($id,16,$felirat='');}
function szerk_ikon($ertek,$id){return Ikon::szerk($id,16,$felirat='');}
function email_ikon($ertek,$id){
$dd='<div class="modal"  onclick="modal_nyit_link(\'index.php?com=mail&keret=0&toid='.$id.'&mail='.$ertek.'\',600,600);" ><img style="position:relative;top:5px;left:5px;margin:-5px;" src="kepek/16/mail_zold.png" width="24" height"24"></div>';
return $dd;
}

function pub_ikon($ertek,$id){
if($ertek==0){return Ikon::unpub($id,16,$felirat='');}
else{return Ikon::pub($id,16,$felirat='');}
}
function foto($ertek,$id){
$dd=$dd.'<div class="tooltip modal" onclick="modal_nyit_link(\'index.php?com=cikk&keret=0&id='.$id.'\',700,600);"> '; 
$dd=$dd.'<img style="position:relative;top:5px;left:5px;margin:-5px;" width="32px" height="32px" src="'.Link::src_thumb($ertek).'" />';
$dd=$dd.'<span><img style="" width="320px" height="320px" src="'.$ertek.'" /></span>';
$dd=$dd.'</div>';
return $dd;
}  
function fejlecbol_mezok($fejlec_tomb) 
{
foreach ($fejlec_tomb as $fejlec){$result=$result.',';}
 return ltrim($result, ","); 
}
class Input 
{
function text_mezo($mezo_nev,$mezoertek){
echo '<input type="text" name="'.$mezo_nev.'" value="'.$mezoertek.'" />';

}

}


//taskok--------------------------------------------------------
class Taskok 
{
// lekérdezendő tábla adatok--------
public $tabla=null;
public $userid=null;
public $id=null;
public $jog=null;
public $fejlec_tomb=null;
public $adat_tomb=null; //ha feltoltjük csak alaptáblát generál ha üres a tábla osztály előállítja a fejlec tömbből

function __construct(){

}

function tablazat() 
{
//if(empty($this->adat_tomb)){$tabla1= new Tabla;}else{$tabla1= new AlapTabla; $tabla1->adat_tomb=$this->adat_tomb; }
$tabla1= new Tabla;
$tabla1->tabla1=$this->tabla;
 $tabla1->fejlec_tomb=$this->fejlec_tomb; 
//$zz= $tabla1->general();
echo $tabla1->general();
}

}
/*
UPDATE  `pnet354_motto001_fejleszt`.`cikk` SET  `szoveg` =  'EREWRWEREW' WHERE  `cikk`.`id` =4;
UPDATE  cikk SET  szoveg =  'EREWRWEREW' WHERE  id =6;
UPDATE  cikk SET  szoveg =  'EREWRWEREW' WHERE  id ='6'
UPDATE cikk SET media = '' AND kat = '' AND cim = 'ojloii' AND intro = '' AND szoveg='' AND pub='' where id = '2'
*/
/*
function task_vallaszto() 
{
$tasktomb=array('alap','del','ment');
$task=$this->task;
if(in_array($task,$tasktomb)){$this->$task();
}else{
if(function_exists($task)){$task();}else{global $hiba; $hiba['nincs'][]='hianyzo megjelenito függveny:'.$task;}
}
}
*/

	
?>