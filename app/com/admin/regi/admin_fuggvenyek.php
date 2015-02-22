<?php
defined('_JEXEC') or die('Restricted access'); 
//  admin osztály**************************************
class  Admin_old 
{
public $itemid=null;
public $itemadatok=null;
public $mezok=null;
public $jog=null;
public $ugyfelid=null;
public $pub_mezo1=null;
public $azonosito_mezo1='id';
public $azonosito_mezo2=null;
public $tabla1=null;
public $tabla2=null;
public $tabla3=null;

function itemadatok()
{
if(empty($this->itemid)){$this->itemid=$_GET['itemid'];}
	if(!empty($this->itemid))
	{
$db =& JFactory::getDBO();	
	$sql="SELECT * FROM ".$this->tabla1." WHERE id='".$this->itemid."'";
	$db->setQuery($sql);
	$itemadatok=$db->loadAssoc();
	$this->itemadatok=$itemadatok;
	}
	//echo $sql;
}
function __construct() 
{
$session = JFactory::getSession();
$this->ugyfelid=$session->get('ugyfelid');
$this->mezok=$_GET['mezok'];
}

function jogok() 
{
$session = JFactory::getSession();
$webhelyadat=$session->get('webhelyadat');
$domainadat=$session->get('domainadat');
$this->domain_csid=$domainadat['domain_csid'];

$alapjog_ob = new WebhelyJogok;	
if(empty($webhelyadat))
{$alapjog_ob->webhelyadat=$this->itemadatok;}
$this->alapjogok=$alapjog_ob->webhely_alap();
//print_r($this->itemadatok);
if($this->itemadatok['userid']==$this->ugyfelid)
{$this->alapjogok['item_tulaj']='ok';}
$jog=ItemJogok::ossz_jog($this->ugyfelid,$this->alapjogok,$jog,'nem',$domainadat['webhely_jog']);
$this->jog=$jog;
$this->jog['rang']=$this->alapjogok['rang'];
}

function ujment() 
{
	
$this->mezok=$_POST['mezok'];
$db =& JFactory::getDBO();	
$this->itemid=ujrekordkulcsal($this->tabla1,'userid',$this->ugyfelid);		
adatfrissit($this->mezok,$this->tabla1,$this->itemid,$this->ugyfelid);
$this->itemadatok();//lekérdezi és betolti az itemadatokat 
$this->jog['szerkeszt']='ok';	
	
}
function szerkesztment() 
{
$this->mezok=$_POST['mezok'];
$db =& JFactory::getDBO();		
adatfrissit($this->mezok,$this->tabla1,$this->itemid,$this->ugyfelid);
$this->itemadatok();			
}

function aktival() 
{

$db =& JFactory::getDBO();
	$query =mysql_query(  "UPDATE ".$this->tabla1." SET ".$this->pub_mezo1." = '1' WHERE ".$this->azonosito_mezo1."='".$this->itemid."'");
	$db->setQuery($query); 
		if (!empty($this->tabla2))
		{
		$query =mysql_query(  "UPDATE ".$this->tabla2." SET ".$this->pub_mezo1." = '1' WHERE ".$this->azonosito_mezo2."='".$this->itemid."'");
		$db->setQuery($query);
		}
		if (!empty($this->tabla3))
		{
		$query =mysql_query(  "UPDATE ".$this->tabla3." SET ".$this->pub_mezo1." = '1' WHERE ".$this->azonosito_mezo2."='".$this->itemid."'");
		$db->setQuery($query);
		}
}
function inaktival() 
{
$db =& JFactory::getDBO();
	$query =mysql_query(  "UPDATE ".$this->tabla1." SET  ".$this->pub_mezo1." = '".$this->alapjogok['rang']."' WHERE ".$this->azonosito_mezo1."='".$this->itemid."'");
	$db->setQuery($query);  
		if (!empty($this->tabla2))
		{
		$query =mysql_query(  "UPDATE ".$this->tabla2." SET ".$this->pub_mezo1." = '".$this->alapjogok['rang']."' WHERE ".$this->azonosito_mezo2."='".$this->itemid."'");
		$db->setQuery($query);
		}
		if (!empty($this->tabla3))
		{
		$query =mysql_query(  "UPDATE ".$this->tabla3." SET ".$this->pub_mezo1." = '".$this->alapjogok['rang']."' WHERE ".$this->azonosito_mezo2."='".$this->itemid."'");
		$db->setQuery($query);
		}
}

function torol() 
{
$db =& JFactory::getDBO();				
	$query =mysql_query(  "DELETE FROM ".$this->tabla1." WHERE ".$this->azonosito_mezo1."='".$this->itemid."'");
	$db->setQuery($query);
		if (!empty($this->tabla2))
		{
		$query =mysql_query(  "DELETE FROM ".$this->tabla2."  WHERE ".$this->azonosito_mezo2."='".$this->itemid."'");
		$db->setQuery($query);
		}
		if (!empty($this->tabla3))
		{
		$query =mysql_query(  "DELETE FROM ".$this->tabla3."  WHERE ".$this->azonosito_mezo2." ='".$this->itemid."'");
		$db->setQuery($query);
		}	
}

function alap_taskok()
{
$task=$_GET['task'];
	//aktivalas---------------------------
	if($task=='pub')
	{
	//$jog=ItemJogok::letrehoz($this->ugyfelid,$this->alapjogok,$this->jog,'nem');
		//$this->jog=$jog;
		if( $this->itemadatok[$this->pub_mezo1]<=$this->alapjogok['rang'] and $this->jog['pub']=='ok')
		{$this->aktival();}
		else
		{
		$hiba='A publikálás nem sikerült. A hiba oka:jogosultság nem megfelelő';
		}
	$task='szerkeszt';	
	}
	//inaktivalas--------------------------------------------
	if($task=='unpub')
	{	//$jog=ItemJogok::letrehoz($this->ugyfelid,$this->alapjogok,$this->jog,'nem');
		//$this->jog=$jog;
		if( $this->itemadatok[$this->pub_mezo1]<=$this->alapjogok['rang'] and $this->jog['pub']=='ok')
		{$this->inaktival();}
		else
		{
		$hiba='A visszavonás nem sikerült. A hiba oka:jogosultság nem megfelelő';		
		}
	//echo 'hiba333'.$this->itemadatok[$this->pub_mezo1].$this->alapjogok['rang'];	
	$task='szerkeszt';	
	}	
  //törlés---------------------------------------
	if ($task=='torol')
	{
	//$jog=ItemJogok::letrehoz($this->ugyfelid,$this->alapjogok,$this->jog,'nem');
		//$this->jog=$jog;	
	
		if($this->jog['torol']=='ok')
		{
		$this->torol();
		echo '<h3>A bejegyzés  és az összes hozzátartozó adatrekord törölve </h3>';		$task='listaz';$itemid='';$this->itemid=$itemid;	
		}
		else
		{
		$hiba='A törlés nem sikerült. A hiba oka:jogosultság nem megfelelő';
		$task='szerkeszt';
		}
		
	}
	
	
	if ($task=='szerkesztment')
	{
	}
$this->itemadatok();	
return $task;
}



//************************************************
//form  adatok mentése----------------------------------------------
function adathiba() 
{

}	
	
}
// egy könyvtár méretét adja vissza megabájtban---------------
function admin_total_size($dir) {  
$handle = opendir($dir);  
while($file = readdir($handle)) {  
$total = $total + filesize ($dir.$file);  
  if((is_dir($dir.$file.'/')) &&($file != '..')&&($file != '.'))  
  {  
  $total = $total + total_size($dir.$file.'/');  
  }  
}  
return $total;  
}
//tooltip------------------------------------------------------------
function toltip_admin($tooltext,$infolink,$x=650,$y=500)
{

}


