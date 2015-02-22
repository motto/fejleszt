<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );
$szam_tomb=array('első','második' ,'harmadik' ,'negyedik' ,'ötödik' ,'hatodik' ,'nyolcadik','kilencedik','tizedik');
$nyelv_tomb=array('hu','en' ,'de' ,'fr' ,'pr' ,'cz' );
$kat_id_tomb=array('1','2' ,'3');
$user_id_tomb=array('62','228' ,'247');
$x=mt_rand(0,40);
srand ((float) microtime() * 10000000);

for ($i = 1; $i <= 10; $i++) {
	foreach ($szam_tomb as $szam){
	$nyelv = array_rand ($nyelv_tomb);
	$katid = array_rand ($kat_id_tomb);
	$userid = array_rand ($user_id_tomb);
	$marvan[]=$nyelv;
	$cim=$nyelv.'-'.$szam.'-'.$szam_tomb[$i];
	$intro=$nyelv.'-'.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i];
$id= DB::beszur("INSERT INTO item (userid,katid,pub,time) VALUES ($userid,$katid,0,NOW())");
$id2= DB::beszur("INSERT INTO item_lang (itemid,nyelv,cim,intro) VALUES ($id,$cim,$intro)");
		for ($k = 1; $k <= 3; $k++) {
		$x=mt_rand(0,2);
		
			if($x==1){
			do {
			$nyelv = array_rand ($nyelv_tomb);
			} while (!is_array($nyelv,$marvan));
			$marvan[]=$nyelv;
			
			$cim=$nyelv.'-'.$szam.'-'.$szam_tomb[$i];
			$intro=$nyelv.'-'.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i];
			}
		$id= DB::beszur("INSERT INTO item (userid,katid,pub,time) VALUES ($userid,$katid,0,NOW())");
		$id2= DB::beszur("INSERT INTO item_lang (itemid,nyelv,cim,intro) VALUES ($id,$cim,$intro)");
		}
	$marvan=null;	
	}


}

?>