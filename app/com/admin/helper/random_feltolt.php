<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );
$szam_tomb=array('első','második' ,'harmadik' ,'negyedik' ,'ötödik' ,'hatodik' ,'nyolcadik','kilencedik','tizedik');
$nyelv_tomb=array('hu','en' ,'de' ,'fr' ,'pr' ,'cz' );
$x=mt_rand(0,40);
srand ((float) microtime() * 10000000);

for ($i = 1; $i <= 10; $i++) {
	foreach ($szam_tomb as $szam){
	$nyelv = array_rand ($nyelv_tomb);
	$marvan[]=$nyelv;
	$cim=$nyelv.'-'.$szam.'-'.$szam_tomb[$i];
	$intro=$nyelv.'-'.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i].' ............. '.$szam.'-'.$szam_tomb[$i];

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

		}
	$marvan=null;	
	}


}

?>