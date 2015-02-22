<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );
global  $css_tomb;
global  $js_tomb; 
$js_tomb[]='lib/js/jquery-1.9.1.min.js';
$js_tomb[]='pluginok/popup/modal/modal.js';
$css_tomb[]='pluginok/popup/modal/modal.css';
$css_tomb[]='pluginok/tooltip/tooltip.css';

include_once 'lib/sajat/tabla_fgv.php';
include_once 'lib/sajat/ikonok.php';
global $tmpl,$hiba,$userid,$jog;

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

function email_ikon($ertek,$id){
$dd='<div class="modal"  onclick="modal_nyit_link(\'index.php?com=mail&keret=0&toid='.$id.'&mail='.$ertek.'\',600,600);" ><img style="position:relative;top:5px;left:5px;margin:-5px;" src="kepek/16/mail_zold.png" width="24" height"24"></div>';
return $dd;
}

function pub_ikon($ertek,$id){
global $admin_tomb;
	if(!in_array($id,$admin_tomb)){
		if($ertek==0){return Ikon::unpub($id,16,$felirat='');}
		else{return Ikon::pub($id,16,$felirat='');}
	}
}
function foto($ertek,$id){
$dd=$dd.'<div class="tooltip modal" onclick="modal_nyit_link(\'index.php?com=alap&keret=0&id='.$id.'\',700,600);"> '; 
$dd=$dd.'<img style="position:relative;top:5px;left:5px;margin:-5px;" width="32px" height="32px" src="'.$ertek.'" />';
$dd=$dd.'<span><img style="" width="320px" height="320px" src="'.$ertek.'" /></span>';
$dd=$dd.'</div>';
return $dd;
}  
function fejlecbol_mezok($fejlec_tomb) 
{
foreach ($fejlec_tomb as $fejlec){$result=$result.',';}
 return ltrim($result, ","); 
}
/*
class Input 
{
function text_mezo($mezo_nev,$mezoertek){
echo '<input type="text" name="'.$mezo_nev.'" value="'.$mezoertek.'" />';

}
function foto($mezo_nev,$mezoertek){
echo 'foto';

}
function editor($mezo_nev,$mezoertek){
echo 'edito';

}
function radio($mezo_nev,$mezoertek){
echo 'radio';

}
}

*/



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

function szerk($id='',$adatok=''){
if(empty($id)){$id=$this->id;}
	if(empty($adatok)){
	$mezok=fejlecbol_mezok($this->fejlec_tomb);
	$sql= "select $mezok from ".$this->tabla." where id='".$id."'";
	$adatok=Lekerdez::assoc_sor($sql);
	}
	szerk_nezet($adatok);
	
}
/*
function szerk_mezo_general($fejlec_tomb,$adatok){
foreach ($fejlec_tomb as $fejlec){
echo'-----------------';
}
}
*/
function del() 
{
Lekerdez::torol_sor($this->tabla,$this->id);	
}
function pub($id) 
{
Lekerdez::parancs("UPDATE ".$this->tabla." SET pub=0 where id='".$id."'");	
}
function unpub($id) 
{
Lekerdez::parancs("UPDATE ".$this->tabla." SET pub=1 where id='".$id."'");	
}
function uj() 
{
$this->id=Lekerdez::parancs("INERT INTO ".$this->tabla." (user_id,datum) VALUES ('".$this->userid."',NOW())");	
return $this->id;
}
function ment($id='') 
{
if($id=''){$id=$this->id;}
$marvolt=array();
//$mezonevek=mezonevek($this->tabla);
	foreach($this->fejlec_tomb as $mezo){
	if(!empty($mezo['szerk'])){
	$mezonev=$mezo['mezo'];
		if(!in_array($mezonev,$marvolt)){
			if($frissit==''){$frissit= $mezonev.'=\''.$_POST[$mezonev].'\'';}
			else{
			$frissit=$frissit.', AND '.$mezonev.'=\''.$_POST[$mezonev].'\'';}
			}
		$marvolt[]=	$mezonev;
		}
		}		
	Lekerdez::parancs("UPDATE ".$this->tabla." SET $frissit where id='".$id."'");		
	}
}




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