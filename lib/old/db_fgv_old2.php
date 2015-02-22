<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );
//tip:html,text,slashed  long:all,szam
function text_formaz($text,$tip='text',$long=250){
switch ($tip) {
    case 'html':
    $text = htmlspecialchars($text); //scripteket eltávolítja
        break;
    case 'text':
      $text = htmlspecialchars($text); //scripteket eltávolítja
	  $text = strip_tags($text);		//html elemeket eltávolítja
        break;
	}
if($long!='all'){$text=substr($text, 0, $long);}; 
return $text;	
}	

function post_slashel($input){	
if (get_magic_quotes_gpc()){$input = stripslashes($input);}  
 $input = mysql_real_escape_string($input);  
 return $input;
}	
	

function text_ellenor($text,$long=50,$tip=''){
$regex='a-z';
if (eregi($regex, $text)) {   
    // A minta illeszkedik, csak a megadott karaktereket tartalmazza a sztring  
} else {  
    // A sztringben van(nak) nem megengedett karakter(ek)  
}
   $text1 = htmlspecialchars($text); //scripteket eltávolítja
	  $text2 = strip_tags($text);		//html elemeket eltávolítja
  $text3=substr($text, 0, $long); //elvágja a sztringet
  if( $text1!=$text or  $text2!=$text or $text3!=$text){return false ;}else{return true;}
}

function post_tomb_ker($nev_tomb,$tip='slashed'){
// $nev_tomb=['id','nev'];
foreach($nev_tomb as $nev){$post_tomb[]=post_ker($nev,$tip);}
return $post_tomb;
}


class Adatbazis
{
public $db=null;


function __construct(){
try {
				$this->db = new PDO("mysql:dbname=".MoConfig::$adatbazis.";host=".MoConfig::$host,MoConfig::$felhasznalonev, MoConfig::$jelszo, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''));
			} catch (PDOException $e) {
				die($hiba['pdo']="Adatbazis kapcsolodasi hiba: ".$e->getMessage());
				return false;
			}
}
function assoc_tomb($sql){
$sth = $this->db->prepare($sql);
$sth->execute();
 while($row = $sth->fetch(PDO::FETCH_ASSOC)) {
     $eredmeny_tomb[]= $row;
  }


//$eredmeny_tomb = $sth->fetchAll();  // sorszámozottan is és associatívan is tárolja a mezőket (duplán)
return $eredmeny_tomb;
}
function assoc_sor($sql){
//$sql="SELECT * FROM tabla";
$eredm = $this->db->query($sql);
return $eredm->fetch(PDO::FETCH_ASSOC);

}
function parancs($sql){
//$sql="SELECT * FROM tabla";
$eredm = $this->db->query($sql);
return $eredm;

}

}

class Lekerdez {

function parancs($sql)
{global $db;
$result= $db->parancs($sql);
 return $result; 
}

function torol_sor($tabla,$id) 
{
global $db;
$sql="DELETE FROM $tabla WHERE id = '$id'";
$result= $db->parancs($sql);
 return $result; 
}
function data_insert($tabla,$key_value){ //$key_value='id:3,nev:ggg'
global $db;
if(is_array($mezok)){$mezotomb=$mezok;}else{$mezotomb=explode(',',$mezok);}
foreach ($mezotomb as $mezo){
$ertek=$ertek."'". post_ker($mezo,$tip)."',"; 
$clm=$clm.$mezo.","; 

}
$clm2=rtrim($clm);
$ertek2=rtrim($ertek);
$sql="INSERT INTO $tabla ($clm2) VALUES ($ertek2)";
$result= $db->parancs($sql);
return $result;
}
function post_data_insert($tabla,$mezok,$tip='slashed'){ //$tip html-nél bennhagyja html elemeket
global $db;
if(is_array($mezok)){$mezotomb=$mezok;}else{$mezotomb=explode(',',$mezok);}
foreach ($mezotomb as $mezo){
$ertek=$ertek."'". post_ker($mezo,$tip)."',"; 
$clm=$clm.$mezo.","; 
}
$clm2=rtrim($clm);
$ertek2=rtrim($ertek);
$sql="INSERT INTO $tabla ($clm2) VALUES ($ertek2)";
$result= $db->parancs($sql);
return $result;
}


//Feltolt::update_ment('userek','foto,name,pubname,leiras,cimke',$userid);
function data_update($tabla,$mezok,$id=''){
$mezotomb=explode(',',$mezok);
foreach ($mezotomb as $mezo){$setek=$setek.$mezo."='".$_POST[$mezo]."', ";}

//$setek2=rtrim($setek);
$setek2 = substr($setek, 0, -2); 
$sql="UPDATE $tabla SET $setek2 WHERE id='$id'";
//echo $sql;
$con = mysql_connect(MoConfig::$host,MoConfig::$felhasznalonev,MoConfig::$jelszo);
mysql_select_db(MoConfig::$adatbazis) ;$result = mysql_query($sql);
//$ob=new Adatbazis;$result=$ob->parancs($sql); return $result;

}


// régi kompatibiltási funkciók
function adat_ir($sql,$ir='nem')
{global $db;
$result= $db->parancs($sql);
 return $result;}
function beszur($sql,$ir='igen')
{global $db;
$result= $db->parancs($sql);
 return $result;}

function assoc_sor($sql)
{global $db;
$result= $db->assoc_sor($sql);
 return $result;}

function assoc_tomb($sql)
{global $db;
$result= $db->assoc_tomb($sql);
 return $result;}
}


class Feltolt {
function insert_ment($tabla,$mezok){
$mezotomb=explode(',',$mezok);
foreach ($mezotomb as $mezo){
$ertek=$ertek."'".$_POST[$mezo]."',"; 
$clm=$clm.$mezo.","; 
}
$clm2=rtrim($clm);
$ertek2=rtrim($ertek);
$sql="INSERT INTO table_name ($clm2) VALUES ($ertek2)";
global $db;
$result= $db->parancs($sql);
return $result;

}
//Feltolt::update_ment('userek','foto,name,pubname,leiras,cimke',$userid);
function update_ment($tabla,$mezok,$id=''){
$mezotomb=explode(',',$mezok);
foreach ($mezotomb as $mezo){$setek=$setek.$mezo."='".$_POST[$mezo]."', ";}

//$setek2=rtrim($setek);
$setek2 = substr($setek, 0, -2); 
$sql="UPDATE $tabla SET $setek2 WHERE id='$id'";
//echo $sql;
global $db;
$result= $db->parancs($sql);
 return $result;

}}




/*
function mezonevek($table){
// a table változóban megadott tábla mezőnveivel tér vissza egy indexelt tömbben -------------
 $result =Lekerdez::parancs('SHOW COLUMNS FROM '.$table);
 // $result = mysql_query("SHOW COLUMNS FROM ". $table);
      $fieldnames=array();
      if (mysql_num_rows($result) > 0) {
        while ($row = mysql_fetch_assoc($result)) {
          $fieldnames[] = $row['Field'];
        }
      }
  return $fieldnames;
} 


function parancs($sql) 
{
$result = mysql_query($sql);
 if (!$result) {
	  global $hiba; global $userid;
       $hiba['sql'][]=array('ido'=>date("Y-m-d H:i:s") ,'userid'=>$userid,'fuggveny'=>'parancs('.$sql.')','hiba' =>mysql_error());
 }
// if(!empty(mysql_error()){$result= mysql_error();}
//echo '<br/>parancs hiba:'.mysql_error();
return $result;
}
function adat_ir($sql,$ir='nem')
{
$result = mysql_query($sql);
 if (!$result) {
	  global $hiba; global $userid;
       $hiba['sql'][]=array('ido'=>date("Y-m-d H:i:s") ,'userid'=>$userid,'fuggveny'=>'adat_ir('.$sql.','.$ir.')','hiba' =>mysql_error());
 }
if($ir=='igen'){$result= mysql_insert_id();}  

return $result;
}

function indexelt_sor($sql)
{
$result = mysql_query($sql);
 if (!$result) {
	  global $hiba; global $userid;
       $hiba['sql'][]=array('ido'=>date("Y-m-d H:i:s") ,'userid'=>$userid ,'fuggveny'=>'indexelt_sor('.$sql.')','hiba' =>mysql_error());
 }

if(!empty($result)){$eredmeny = mysql_fetch_row($result);}
return $eredmeny;
}
function indexelt_tomb($sql)
{
$result = mysql_query($sql);
 if (!$result) {
	  global $hiba; global $userid;
       $hiba['sql'][]=array('ido'=>date("Y-m-d H:i:s") ,'userid'=>$userid ,'fuggveny'=>'indexelt_sor('.$sql.','.$ir.')','hiba' =>mysql_error());
 }
	if(!empty($result))
	{
	while ($sor=mysql_fetch_row($result))
	   {
	  $eredmeny[]=$sor;
	   }
	}
return $eredmeny;	
}

function assoc_sor($sql)
{
$result = mysql_query($sql);
 if (!$result) {
	  global $hiba; global $userid;
       $hiba['sql'][]=array('ido'=>date("Y-m-d H:i:s") ,'userid'=>$userid,'fuggveny'=>'assoc_sor('.$sql.')','hiba' =>mysql_error());
 }else{if(!empty($result)){$eredmeny = mysql_fetch_assoc($result);}}
return $eredmeny;
}
function assoc_tomb($sql)
{
$result = mysql_query($sql);
 if (!$result) {
	  global $hiba; global $userid;
       $hiba['sql'][]=array('ido'=>date("Y-m-d H:i:s") ,'userid'=>$userid,'fuggveny'=>'assoc_tomb('.$sql.')','hiba' =>mysql_error());
 }else{if(!empty($result)){while ($sor=mysql_fetch_assoc($result)) { $eredmeny[]=$sor;}}}
return $eredmeny;	
}
}

*/	
?>