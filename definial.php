<?php 
//GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}
//állandók--------------------------------
define("DS", "/"); define("_MOTTO", "igen");






define("PATH_SITE", $_SERVER['DOCUMENT_ROOT']);
//file elérések----------------------------------------------------

define('MEDIA', 'media/');define('USEREK', 'media/');
define('IKONOK', 'media/kepek/');define('KEPEK', 'media/kepek/');
define('SAJAT_MAPPA','lib/');define('LIB','lib/');
define('PLUGINOK_PATH','app/pluginok/');
define('COM_PATH','app/com/');
define('COM','app/com/');
define('LANG_DIR','language/');
define('MODULOK_PATH','app/modulok/');
define('JOGOK', SAJAT_MAPPA.'jogok.php');
define('KERET_PHP',SAJAT_MAPPA.'keret.php');
define('ADATOK_PHP',SAJAT_MAPPA.'adatok.php');
define('DB_FGV',SAJAT_MAPPA.'db_fgv.php');
define('ADMIN_FGV',COM.'/admin/helper/admin_fgv.php');
define('ALTALANOS_FGV',SAJAT_MAPPA.'altalanos_fgv.php');

class MoConfig {

//public static $felhasznalonev = 'pnet354_motto001';
//public static $jelszo = 'motto6814';
//public static $adatbazis = 'pnet354_motto001_fejleszt';
private $host = 'localhost';
private $felhasznalonev = 'root';
private $jelszo = '';
private $adatbazis = 'fejleszt';

    function __construct(){
        try {
            $db = new PDO("mysql:dbname=".$this->adatbazis.";host=".$this->$host,$this->$felhasznalonev, MoConfig::$jelszo, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''));
            //$db->pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
        } catch (PDOException $e) {
            die(GOB::$hiba['pdo']="Adatbazis kapcsolodasi hiba: ".$e->getMessage());
            return false;
        }
        return $db;
    }
}
//globális változók-------------------------------------------------------------
class GOB {
    public static $mailfrom= 'motto001@gmail.com';
    public static $fromnev= 'Admin';
    public static $offline = 'nem'; //igen bekapcsolja az offline módot
    public static $offline_message = 'Weblapunk fejlesztés alatt.';
public static $tmpl='szovetseg3'; //alap template
public static $com='cikk';		// alap com
protected static $user=Array();
protected static $jog=Array();
protected static $admin_tomb=array(62);
protected static $szerzo_tomb=array(228);
protected static $moderator_tomb=array(247,228);
static $itemjog=Array();
static $pagejog=Array();
static $hiba=array();
static $param=array();
static $alias=array();
static $head_tomb=array(); //$head_tomb['js'],$head_tomb['css'],$head_tomb['og'], $head_tomb['meta'],
static $modul_tomb=array();
static $keret_tomb=array();
public static function get_user($useradat='all'){
if($useradat=='all'){return self::$user;}else{return self::$user[$useradat];
}}
public static function get_jog($jog='all'){
if($jog=='all'){return self::$jog;}else{return self::$jog[$jog];
}}}
GOB::$param['tmpl']['admin']='admin';
GOB::$param['tmpl']['cikk']='szovetseg3';
GOB::$param['title']='infolapok';
GOB::$com='cikk';
GOB::$param['start']='index.php?com=cikk&csid=1&id=10';
GOB::$param['fb']=false; // be van e töltve az alap fb script
GOB::$param['fb_app_id']='218324098211541';
GOB::$param['fb_width']='700';
GOB::$param['fb_num-posts']='10';

//print_r(GOB::$param); fghfgh
		
//GOB::$keret_tomb['sidebar1']=['rss'];
