<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );


include 'lib/tabla_fgv.php';
include 'lib/ikonok.php';
/*
SELECT személy.vezetéknév, személy.keresztnév, rendelés.rendelési_szám
FROM személy
INNER JOIN rendelések
ON személy.személy_azonosító=rendelés.azonosító
ORDER BY személy.keresztnév*/
//taskok--------------------------------------------------------
class Task 
{
$uj_sql="";$frissit_sql="";$torol_sql="";$pub_sql="";$unpub_sql="";
// lekérdezendő tábla adatok--------
public static  $mezok=[];//$mezok[]='tabla1',['mezo1','mezo2'],'key';
public static  $alias=[];//$alias=['mezo1'=>'alias1','mezo2'=>'alias']
public static  $adat_tomb=[]; 
public static function get_jog(){
return true;
}


public static function szerk(){
	szerk_nezet(self::$adatok);
}

public static function del($id) 
{
	foreach (self::$mezok as $mezo){
	DB::torol_sor($mezo[0],$id,$mezo[2]);
	}	
}
public static function pub($id,$pubszint='1') 
{
if(Task::get_pubjog($id,self::$mezok[0][0])){DB::parancs("UPDATE ".self::$mezok[0][0]." SET pub=0 where id='".$id."'");}else{GOB::$hiba['jog'][]='Nincs publikálási jog';}	
}
public static function unpub($id,$pubszint='1') 
{
	if(Task::get_unpubjog($id,self::$mezok[0][0])){DB::parancs("UPDATE ".self::$mezok[0][0]." SET pub=$pubszint where id='".$id."'");}else{GOB::$hiba['jog'][]='Nincs unpublikálási jog';}		
	}
public static function uj() 
{
$userid=GOB::get_user('id');
$id=DB::beszur("INSERT INTO ".$mezok[0][0]." (userid,datum) VALUES ('$userid',NOW())");	
return $id;

}
public static function ment($id='') 
{
$marvolt=array();
//if($id==''){$id=$this->id;}

	foreach($this->fejlec_tomb as $mezo){
	$mezonev=$mezo['mezo'];
	$mezoertek=addslashes($_POST[$mezonev]);
			if(!empty($mezo['szerk']) and !in_array($mezonev,$marvolt)){
				if($frissit==''){$frissit= $mezonev.'=\''.$mezoertek.'\'';}
				else{
				$frissit=$frissit.' , '.$mezonev.'=\''.$mezoertek.'\'';}
			}
		$marvolt[]=$mezonev;
		}
	//echo "UPDATE ".$this->tabla." SET $frissit where id='".$id."'";	
Lekerdez::parancs("UPDATE ".$this->tabla." SET $frissit where id='".$id."'");	

}
}	
?>