<?php
defined( '_MOTTO' ) or die( 'Restricted access' );
/*
class UserAdatok 

$user=UserAdatok($id,$mezok='');
előállítja az $user->adatok; assoc tömböt; a $mezok változóban lehet megadni hogy milyen mezőket tartalmazzon,(ha nincs megadva:email,username) plusz tartalmazza az user könyvtárt $user->adatok['dir']
----------------------------------
class WebhelyAdatok
*/

class UserAdatok extends GOB {	
public $id = null;
public $mezok = 'id,name,email,username,foto,intro';
public $adatok= null;

function frissit($id,$mezok='')	
{
$this->id=$id;
If($mezok!=''){$this->mezok=$mezok;}
$this->adatleker();
$this->dir();
parent::$user=$this->adatok; 
}
function __construct($id,$mezok=''){
$this->frissit($id,$mezok);
}
function adatleker()	
{
$sql="SELECT ".$this->mezok." FROM userek WHERE id='".$this->id."'";
  $this->adatok=DB::assoc_sor($sql); 

}

function dir()	
{
 $userdir=MEDIA.$this->id.'/';
  $this->adatok['dir']=$userdir;
}
}
//webheyadatok
class WebhelyAdatok{
public $wehelyid = 0;
public  $webhelyadat= null;

function __construct()	
{
	if(isset($_GET['w'])){$this->wehelyid=$_GET['w'];} //ha érkezik webhelyid beállítja
	if($this->wehelyid!=0){$this->webhelyadat=$this->adatok();} // lekérdezi a webhelyadatokat
	if(empty($this->webhelyadat)){$this->wehelyid=0;} //ha nincs olyan visszaállítja a webhelyidet 0-ra 
	
}
function adatok()	
{
$sql="SELECT * FROM webhelyek WHERE id='".$this->wehelyid."'";
 $eredmeny=DB::assoc_sor($sql); 
 return $eredmeny;
}
}
class Adatlog{
static function ment()	
{
 $beszurt_id= DB::beszur("INSERT INTO stat (ip,url,ref,kliens,user_id,ido) VALUES ('".$_SERVER['REMOTE_ADDR']."','".$_SERVER['REQUEST_URI']."','".$_SERVER['HTTP_REFERER']."','".$_SERVER['HTTP_USER_AGENT']."','$userid',NOW())");	
}
}	
?>