<?php
session_start();
ob_start();
// GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}    új mappa és erre átnevezni

include 'definial.php';
include DB_FGV;  //adatbázis
//$user=new UserAdatok('228');
//echo 'userdir: '.$user->adatok['dir'];

include ALTALANOS_FGV;
include JOGOK; // zonosítás jogosultságok
include KERET_PHP;
include ADATOK_PHP; //user és webhelyadatok
$head_tomb['js'][]='lib/js/jquery-1.9.1.min.js';
$head_tomb['js'][='pluginok/popup/modal/modal.js';
$head_tomb['css'][='pluginok/popup/modal/modal.css';

//     MoConfig::$alap_com='alap'; //itt lehet beállítani az alapértelmezett componenst a (definial.php)
if($_GET['tmpl']!=''){$tmpl='templates/'.$_GET['tmpl'];}
$webhelyadatok=new WebhelyAdatok; //adatok.php
$user=new Azonosit; //jogok php
$userid=$user->userid; 
$user=new UserAdatok;  //adatok.php
$user->id=$userid; //az azonosító beállítása user adatokat létrejo objektum
//echo '--------------'.UserAdatok::dir();
$useradatok=$user->adatok=$user->adatleker(); //alapvető user adatok feltöltése (név, email)

//jogok-------------------------------------------
if(in_array($userid,$admin_tomb)){$jog['admin']=true;$jog['del']=true;$jog['pub']=9;$jog['mail']=true;$jog['szerk']=true;$jog['uj']=true;}
if($_GET['com']=='admin' and $jog['admin']!=true){header('Location:http://'.$_SERVER['HTTP_HOST'].'/'.$kezdo_link);}



if($task=='kapcs_kuld'){$jog['mail']=true;}
$keret=new Keret; //keret.php
$keret->tartalom_general();
$tartalom=ob_get_contents();
ob_clean();
if($_GET['keret']=='0')
{
$keret->fejlec_general(WEBHELYNEV);
echo'<body>';
echo $tartalom;
echo'</body></html>';
}else if($_GET['keret']=='json'){			
echo $tartalom;
}else{			
include $tmpl.'/index.php';
}
Adatlog::ment()	; //Elmenti az oldallekérés adatait (ADATOK_PHP)
ob_end_flush();
?>