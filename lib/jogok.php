<?php
defined( '_MOTTO' ) or die( 'Restricted access' );
class Azonosit
{
public $userid=0;
function __construct()	
{
if(!isset($_SESSION['userid'])) {$_SESSION['userid']=0;}	
if(isset($_POST['belep'])){$this->belep();}
if(isset($_POST['kilep'])){$this->kilep();}
}


function kilep()
{
if(isset($_COOKIE['cook_sess_id'])){
         setcookie("cook_sess_id", "", time()-COOKIE_EXPIRE, COOKIE_PATH);
      }
      unset($_SESSION['userid']);   
}
function belep()
{

$jelszo = md5($_POST['passwd']);
//$username =TEXT::post_slashel($_POST['username']); //db_fgv.php
$username =$_POST['username'];
 $sql = "SELECT id,username,password FROM userek WHERE username = '$username'";
 $useradat=DB::assoc_sor($sql);
  if($jelszo == $useradat['password']){$_SESSION['userid']= $useradat['id']; } 
  else{GOB::$hiba['ident'][]= LANG::RET('ERR_PASSWD');// LANG::ECH('ERR_PASSWD');
  }
 // return $userid;
}
	   	   
}

class UserJog { //a paraméterben megadott id-ű felhasználó általános jogosultságait állapítja meg (szint, statusz)
$szerzo_tomb=[];
$moderator_tomb=[];
$admin_tomb=[];
private  $szint="";
private  $fogalt_set=['user','szerzo','moderator','admin'];
private $statusz="";
function __construct($userid=0)
{
$this->frissit($userid);
}
function frissit($userid)
{
$szerzo_tomb=GOB::$szerzo_tomb;
$moderator_tomb=GOB::$moderator_tomb;
$admin_tomb=GOB::$admin_tomb;

	if($userid>0){$this->statusz['user']=true;$this->szint='1';
		if(in_array($userid,$this->szerzo_tomb)){$this->statusz['szerzo']=true;$this->szint='11';}
		if(in_array($userid,$this->moderator_tomb)){$this->statusz['moderator']=true;$this->szint='21';}
		if(in_array($userid,$this->admin_tomb)){$this->statusz['admin']=true;$this->szint='31';}

	}else{$this->statusz['anonim']=true;GOB::$this->szint='0';}
	
//parent::$jog=$jog; 
}
function set_statusz($g='user'){if(!in_array($g,$this->tiltott_set)){$this->statusz[]=$g;}}
function get_statusz($g='user'){return $this->statusz[$g];}
function get_szint($g='user'){return $this->szint;}
}
class ItemLathat{
function __construct($user,$item_tomb)
{
$this->frissit($user,$item_tomb);
}

public function frissit($user,$item_tomb){ 
$this->szint=$user->szint;
$this->statusz=$user->statusz;
$this->item_tomb=$item_tomb;
if($item_tomb['userid']==$user->id){$this->statusz['owner']=true;}
$jog['del']=get_deljog() ;
}


}
class ItemJog{    //a felhasználó admin jogait állapítja meg a az adott itemen
$szint='';
$statusz=[];
$item_tomb=[];
$jog=[];
function __construct($user,$item_tomb)
{
$this->frissit($user,$item_tomb);
}

public function frissit($user,$item_tomb){ 
$this->szint=$user->szint;
$this->statusz=$user->statusz;
$this->item_tomb=$item_tomb;
if($item_tomb['userid']==$user->id){$this->statusz['owner']=true;}
$jog['del']=get_deljog() ;
}

public function get_deljog() 
{
$result=false;
if($this->statusz['admin'] or $this->statusz['owner']){$result=true;}
//if($hiba and $result){GOB::$hiba['jog'][]=LANG::RET('NO DELJOG');}
return $result;
}
public  function get_pubjog() 
{
$result=false;
if($this->statusz['admin'] or $this->statusz['moderator'] or $this->statusz['owner'] ){$result=true;}
if( $this->szint<= $this->item_tomb['pub']){$result=false;}
//if($hiba && $result){GOB::$hiba['jog'][]=LANG::RET('NO PUBJOG');}
return $result;
}
public function get_unpubjog() 
{
$result=false;
if($this->statusz['admin'] or $this->statusz['moderator'] or $this->statusz['owner'] ){$result=true;}
//if($hiba && $result){GOB::$hiba['jog'][]=LANG::RET('NO UNPUBJOG');}
return $result;
}



public function get_editjog() 
{
global $jog; 
if($this->statusz['owner']){$result=true;}
//if($hiba && $result){GOB::$hiba['jog'][]=LANG::RET('NO EDITJOG');}
return $result;
}
public static function get_makejog() 
{
$result=true;
if($this->statusz['szint']>10){$result=true;}
return $result;
}
}


/*
//jogok megállapítása**********************************************
class DomainJogok
{
public $ugyfelid=null;
public $domainadat=null;
public $jog=null;
public $item_tulaj=null;
public $hiba=null;


function domain_alap() 
{
$ugyfelid=$this->ugyfelid;
$domainadat=$this->domainadat;
if(!empty($ugyfelid))
{
$domain_szerzotomb=explode(',', $domainadat['szerzok']);
if(in_array($ugyfelid,$domain_szerzotomb))	
{
$this->jog['domain_szerzo']='ok';
$this->jog['rang']=70;
}
$domain_moderatortomb=explode(',', $domainadat['moderatorok']);
if(in_array($ugyfelid,$domain_moderatortomb))	
{
$this->jog['domain_moderator']='ok';
$this->jog['rang']=80;
}
$domain_admintomb=explode(',', $domainadat['adminok']);
if(in_array($ugyfelid,$domain_admintomb))	
{
$this->jog['domain_moderator']='ok';
$this->jog['domain_admin']='ok';
$this->jog['rang']=90;
}
if($ugyfelid==$domainadat['userid'])
{
$this->jog['domain_szerzo']='ok';
$this->jog['domain_moderator']='ok';
$this->jog['domain_admin']='ok';
$this->jog['domain_tulaj']='ok';
$this->jog['rang']=100;}
}
}
function __construct() 
{
$this->domain_adatok();
$this->domain_alap();
}
function domain_szerkeszt() 
{
if($this->jog['domain_admin']=='ok'){$this->jog['domain_szerkeszt']='ok';}
return $this->jog['domain_szerkeszt']; 
}
function domain_pub() 
{
if($this->jog['domain_admin']=='ok'){$this->jog['domain_pub']='ok';}
if($this->jog['domain_tulaj']=='ok'){$this->jog['domain_rang']=80;}
return $this->jog['domain_pub']; 
}
}

//***************************************************
class  WebhelyJogok extends DomainJogok
{

public $webhely_lathat_tomb=null;
public $webhelyadat=null;
function __construct() 
{
$session = JFactory::getSession();
$this->webhelyadat=$webhelyadat=$session->get('webhelyadat');
$this->webhely_lathat_tomb=explode(',', $webhelyadat['lathatjak']);

}

function webhely_alap() 
{
$this->domain_adatok();
$this->domain_alap();
$ugyfelid=$this->ugyfelid;
$webhelyadat=$this->webhelyadat;
if(!empty($ugyfelid))
{
	$this->jog['regisztralt']='ok';
	if($this->jog['rang']<10){$this->jog['rang']=10;}
	$usertomb=explode(',', $webhelyadat['userek']);
	if(in_array($ugyfelid,$usertomb))	
	{
	$this->jog['csatlakozott']='ok';
	if($this->jog['rang']<20){$this->jog['rang']=20;}
	}
	$szerzotomb=explode(',', $webhelyadat['szerzok']);
	if(in_array($ugyfelid,$usertomb))	
	{
	$this->jog['webhely_szerzo']='ok';
	if($this->jog['rang']<30){$this->jog['rang']=30;}
	}
	$moderatortomb=explode(',', $webhelyadat['moderatorok']);
	if(in_array($ugyfelid,$moderatortomb))	
	{
	$this->jog['webhely_moderator']='ok';
	if($this->jog['rang']<40){$this->jog['rang']=40;}
	}
	$admintomb=explode(',', $webhelyadat['adminok']);
	if(in_array($ugyfelid,$admintomb))	
	{
	$this->jog['webhely_admin']='ok';
	$this->jog['webhely_moderator']='ok';
	if($this->jog['rang']<50){$this->jog['rang']=50;}
	}
	if($ugyfelid==$webhelyadat['userid'])	
	{
	$this->jog['webhely_tulaj']='ok';
	$this->jog['webhely_admin']='ok';
	$this->jog['webhely_moderator']='ok';
	$this->jog['webhely_szerzo']='ok';
	if($this->jog['rang']<60){$this->jog['rang']=60;}
	}
	$tiltott_tomb=explode(',', $webhelyadat['tiltottak']);
	if(in_array($ugyfelid,$tiltott_tomb))	
	{
	$this->jog['webhely_tiltott']='ok';
	$this->jog['webhely_szerzo']='';
	$this->jog['webhely_moderator']='';
	$this->jog['webhely_admin']='';
	$this->jog['rang']=0;
	}
}
$jog=$this->jog;	
return $jog;
}		

}
//***********************************************
class  ItemJogok 
{
public $alapjogok=null; 
public $jog=null;
public $item_lathat_tomb=null;
public $itemadat=null;
public $eng_mezo=null;

		
function __construct() 
{
if(!empty($this->ugyfelid))
{

	if($this->ugyfelid==$this->itemadat['userid'])	
	{
	$this->alapjogok['item_tulaj']='ok';
	}
//echo'itemadat[useri]'.$this->itemadat['userid'];
}

}
function alap() 
{

}
function lathat()
{
$item_lathat_tomb=explode(',', $itemadat['lathatjak']);
}


function letrehoz($ugyfelid='',$alapjogok='',$jog='',$obj='igen',$eng_mezo='')
{
if($obj=='igen')
{
$ugyfelid=$this->ugyfelid;
$eng_mezo=$this-eng_mezo;
$alapjogok=$this->alapjogok;
$jog=$this->jog;
}
	if(!empty($ugyfelid))
	{
	$jog['letrehoz']=''; $this->hiba='nincs megfelelő jogosultsága a művelethez';
	if ($eng_mezo=='tiltottak nem' and $alapjogok['tiltott']!='ok')
	{$jog['letrehoz']='ok'; $this->hiba='';}
	if ($eng_mezo=='mindenki' or  $alapjogok['webhely_admin']=='ok')
	{$jog['letrehoz']='ok';$this->hiba='';}
	
	if ($eng_mezo=='csak engedélyezettek' and $alapjogok['webhely_szerzo']=='ok')
	{$jog['letrehoz']='ok';$this->hiba='';}
	if ($eng_mezo=='csak engedélyezettek' and $alapjogok['webhely_szerzo']!='ok')
	{$jog['letrehoz']='';$this->hiba='';}
	}
$this->jog=$jog;	
return $jog;	
}

function torol($ugyfelid='',$alapjogok='',$jog='',$obj='igen')
{
if($obj=='igen')
{
$ugyfelid=$this->ugyfelid;
$alapjogok=$this->alapjogok;
$jog=$this->jog;
}
if(!empty($ugyfelid))
	{
	$jog['torol']=''; $this->hiba='nincs megfelelő jogosultsága a művelethez';
	if ( $alapjogok['domain_admin']=='ok' or $alapjogok['webhely_admin']=='ok' or $alapjogok['item_tulaj']=='ok' )
	{$jog['torol']='ok'; $this->hiba='';}
	}
$this->jog=$jog;	
return $jog;
}
function szerkeszt($ugyfelid='',$alapjogok='',$jog='',$obj='igen')
{
if($obj=='igen')
{
$ugyfelid=$this->ugyfelid;
$alapjogok=$this->alapjogok;
$jog=$this->jog;
}
//echo'$alapjogok[item_tulaj]'.$alapjogok['item_tulaj'];
if(!empty($ugyfelid))
	{
	$jog['szerkeszt']=''; $this->hiba='nincs megfelelő jogosultsága a művelethez';
	if ( $alapjogok['item_tulaj']=='ok' )
	{$jog['szerkeszt']='ok'; $this->hiba='';}
	}
$this->jog=$jog;	
return $jog;
}
function pub($ugyfelid='',$alapjogok='',$jog='',$obj='igen')
{
if($obj=='igen')
{
$ugyfelid=$this->ugyfelid;
$alapjogok=$this->alapjogok;
$jog=$this->jog;
}
if(!empty($ugyfelid))
	{
	$jog['pub']=''; $this->hiba='nincs megfelelő jogosultsága a művelethez';
	if ( $alapjogok['domain_moderator']=='ok' or $alapjogok['webhely_moderator']=='ok' or $alapjogok['item_tulaj']=='ok')
	{$jog['pub']='ok'; $this->hiba='';}
	}
$this->jog=$jog;	
return $jog;
}
function ossz_jog($ugyfelid='',$alapjogok='',$jog='',$obj='igen',$eng_mezo='')
{
if($obj=='igen')
{
$ugyfelid=$this->ugyfelid;
$eng_mezo=$this->eng_mezo;
$alapjogok=$this->alapjogok;
$jog=$this->jog;
}
$jog=ItemJogok::pub($ugyfelid,$alapjogok,$jog,$obj);
$jog=ItemJogok::szerkeszt($ugyfelid,$alapjogok,$jog,$obj);
$jog=ItemJogok::torol($ugyfelid,$alapjogok,$jog,$obj);
$jog=ItemJogok::letrehoz($ugyfelid,$alapjogok,$jog,$obj,$eng_mezo);
$this->jog=$jog;	
return $jog;
}
}
//------------------------------------------
*/