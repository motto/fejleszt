

<?php
$tabla='files';
$feltolt_mezo='fileToUpload';
$user_dir = UserAdatok::dir();
global $userid;
global $hiba;
echo '---------------------------';
if ($_FILES[$feltolt_mezo]['error'] > 0) {
  $hiba['feltolt'][]=$_FILES[$feltolt_mezo]['error'];
} else {
$cim=$_FILES[$feltolt_mezo]['name'];
$fileParts = pathinfo($_FILES[$feltolt_mezo]['name']); 
$tempFile = $_FILES[$feltolt_mezo]['tmp_name'];
// echo "File type: " . $_FILES[$feltolt_mezo]['type'] ;
//echo "File size: " . ($_FILES[$feltolt_mezo]['size'] ;
//$fileExtension = strrchr($_FILES[$feltolt_mezo]['name'], ".");
$kep_tipusok = array('jpg','jpeg','gif','png'); 
$video_tipusok = array('avi','mpeg','flv','mp4','wmv'); 
$doc_tipusok = array('doc','txt','csv'); 
//$egyeb_tipusok = array(); 
if(!is_dir($user_dir)){mkdir($user_dir, 0777);}
require_once('app/com/media/image_manipulator.php');

if (!empty($_FILES) ) {
//kép feltöltés-----------------------------------------------------------
if (in_array($fileParts['extension'],$kep_tipusok)) {

	$targetFolder = $_SERVER['DOCUMENT_ROOT'].'/'.$user_dir;
	if(!is_dir($targetFolder)){mkdir($targetFolder, 0777);}
	$targetFolder_thumb = $user_dir.'/thumb';
	if(!is_dir($targetFolder_thumb)){mkdir($targetFolder_thumb, 0777);}
	$manipulator = new ImageManipulator( $tempFile);
		$newImage = $manipulator->resample(800,800);
		$filenev=$manipulator->uni_nev().'.'.$fileParts['extension'];
		$manipulator->save($targetFolder.'/' .$newNamePrefix.$filenev);
		$newImage = $manipulator->resample(100,100);
		$manipulator->save($targetFolder_thumb.'/'.$newNamePrefix.$filenev);
		//$manipulator->save('kepek/' . $newNamePrefix . $_FILES['Filedata']['name']);
		//move_uploaded_file($tempFile,$targetFile);
		//echo '1';
	$sql="INSERT INTO $tabla ( user_id,dir,tip,file_nev,cim,datum) VALUES ('$userid', '$user_dir','kep','$filenev','$cim',NOW())";
	Lekerdez::adat_ir($sql,'igen');
//video feltöltés-----------------------------------------------------------
	} else if (in_array($fileParts['extension'],$video_tipusok)){
	$targetFolder = $user_dir.'/'.'videok';
	if(!is_dir($targetFolder)){mkdir($targetFolder, 0777);}
	$filenev=ImageManipulator::uni_nev().'.'.$fileParts['extension'];
	move_uploaded_file($tempFile, $targetFolder.'/'.$filenev);	
	$sql="INSERT INTO $tabla ( user_id,dir,tip,file_nev,cim,datum) VALUES ('$userid', '$user_dir','video','$filenev','$cim',NOW())";
	Lekerdez::adat_ir($sql,'igen');
	
	}else{$hiba['feltolt'][]='Invalid file type';}
}
}
?>