<?php 
class DB
{
static public function connect(){
try {
				$db =  new PDO("mysql:host=localhost;dbname=fejleszt", 'root', '',array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''));
				//$db->pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
			} catch (PDOException $e) {
				die("Adatbazis kapcsolodasi hiba: ".$e->getMessage());
				return false;
			}
	return $db;		
}
static public function parancs($sql){
$sth =self::alap($sql);
}
static public function alap($sql){
global $db;
$sth = $db->prepare($sql);
$sth->execute();
		//GOB::$hiba][]="assoc_tomb: ".$sth->errorInfo(); nem jó!!!
		//tömbhöz nem lehet hozzáfűzni	stringet!!!!!!!!!!!!!!!!!
		$h=$sth->errorInfo();
		//echo 'ffffffffffffffffffffff:'.$h[2].'</br>';
		if(!empty($h[2])){print_r($sth->errorInfo());	}

return $sth;
}


static public function beszur($sql){
global $db;
$sth =self::alap($sql);
return $db->lastInsertId();
}


}

$db=DB::connect();
$szam_tomb=array('első','második' ,'harmadik' ,'negyedik' ,'ötödik' ,'hatodik' ,'nyolcadik','kilencedik','tizedik');
$nyelv_tomb=array('hu','en' ,'de' ,'fr' ,'pr' ,'cz' );
$kat_id_tomb=array('1','2' ,'3');
$user_id_tomb=array('62','228' ,'247');
//$x=mt_rand(0,40);
srand ((float) microtime() * 10000000);

for ($i = 1; $i <= 2; $i++) {
	foreach ($szam_tomb as $szam){
	$nyelv = $nyelv_tomb[array_rand($nyelv_tomb)];
	$katid = $kat_id_tomb[array_rand($kat_id_tomb)];
	$userid = $user_id_tomb[array_rand($user_id_tomb)];
	$marvan[]=$nyelv;
	$cim=$nyelv.$szam;
	$intro=$nyelv.'-'.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i];
//$id=3;	
$id= DB::beszur("INSERT INTO item (userid,katid,pub,time) VALUES ($userid,$katid,0,NOW())");
//echo "INSERT INTO item_lang (itemid,nyelv,cim,bev) VALUES ($id,$nyelv,$cim,$intro)";
$sql="INSERT INTO item_lang (itemid,nyelv,cim,bev) VALUES ('".$id."','".$nyelv."','".$cim."','".$intro."')";
$idn2= DB::beszur($sql);

	for ($k = 1; $k <= 4; $k++) {
		$x=mt_rand(0,3);
		
			if($x>1){
			do {
			$nyelv = $nyelv_tomb[array_rand($nyelv_tomb)];
			} while (in_array($nyelv,$marvan));
			$marvan[]=$nyelv;
			
			$cim=$nyelv.'-'.$szam.'-'.$szam_tomb[$i];
			$intro=$nyelv.'-'.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i];
			//echo "INSERT INTO item_lang (itemid,nyelv,cim,intro) VALUES ($id,$nyelv,$cim,$intro)";
			$sql="INSERT INTO item_lang (itemid,nyelv,cim,bev) VALUES ('".$id."','".$nyelv."','".$cim."','".$intro."')";
			$idn2= DB::beszur($sql);
			
			}
		
		}

	$marvan=null;	
	}


}
//print_R(GOB::$hiba['pdo']);
?>