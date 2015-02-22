<?php
session_start();
ob_start();
//8388500*173
// GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}    új mappa és erre átnevezni
//error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
error_reporting(E_ERROR | E_WARNING | E_PARSE);

include_once 'definial.php';
include_once 'lib/lang.php';
include_once LIB.'ellenor.php';
// adatbázis elérés------------------------------------------------------
include_once DB_FGV;  //adatbázis
$db=DB::connect();
include_once ADATOK_PHP; //user és webhelyadatok
include_once JOGOK; // azzonosítás jogosultságok

//azonosítás jogok--------------------------------------------------
$azonosit= new Azonosit; //session-be írja az useridet vagy nullát
$us=new UserAdatok($_SESSION['userid']); //feltölti a GOB::$user tömböt
//$us->frissit($id,$mezok='') // useradatok frissítése plusz mezők lekérése
JOG::frissit($_SESSION['userid']); //GOB::$jog tömmbe írja a jogokat

// ha offline mód---------------------------------------------------------
if(MoConfig::$offline=='igen'){
				if($jogok_gt['stat']!='admin'){die(MoConfig::$offline_message);
				return false;
				}
}	
//echo GOB::get_user('id');
//print_r(GOB::get_user());
//print_r(GOB::get_jog());
include_once ALTALANOS_FGV;
include_once KERET_PHP;

//com meghatározás alap,get---------------------------------------------
if(isset($_GET['com'])){GOB::$com=$_GET['com'];}
//template meghatározás alap,com, get---------------------------------------
if(isset(GOB::$param['tmpl'][GOB::$com])){GOB::$tmpl=GOB::$param['tmpl'][GOB::$com];}
if(isset($_GET['tmpl'])){GOB::$tmpl=$_GET['tmpl'];}

//ha admin a com de nincs dmin jog-------------------------------------
//if(GOB::$com=='admin' and GOB::get_jog('stat')!='admin'){die('nincs admin jog');}


if(GOB::$tmpl=='json'){include COM_PATH.GOB::$com.'/json.php';
}else{
$keret=new Keret; //keret.php
include 'templates/'.GOB::$tmpl.'/body.php';
$tartalom=ob_get_contents();
ob_clean();
include 'templates/'.GOB::$tmpl.'/head.php';
echo $tartalom;
}
//Adatlog::ment()	; //Elmenti az oldallekérés adatait (ADATOK_PHP)

ob_end_flush();
?>