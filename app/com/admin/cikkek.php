<?php 

//echo Link::src_thumb($kk);
$alap_link=Link :: kiszed($_SERVER['REQUEST_URI'],'task,id');
GOB::$param['tmpl']='templates/admin';
include 'app/com/admin/helper/admin_fgv.php';
$app_id='11';
$id=$_GET['id'];
$task=$_GET['task'];
$mezok['itemek']=['id','userid' ,'userid' ,'userid' ,'userid' ,'userid'];
$mezok['userek']['sorrend']=['width'=>'20'];
$mezok['userek']['id']=['width'=>'20','feltolt'=>'no','feltolt'=>'no'];
$mezok['userek']['id']=['width'=>'20'];
$lang_cikk=[
'11_order'=>'Sorrend!',
'11_foto'=>'Foto',
'11_passwd_nomatch'=>'A jelszó nem jó próbálja újra!'
];
LANG::$lang_tomb=array_merge(LANG::$lang_tomb, $lang_login);

$tabla['id']=[tartalom][param];
$tabla['id']=['id']['width'=>'20'];

$tabla['sorrend']=['width'=>'20'];

$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'id');
$fejlec_tomb[]=array('mezo'=>'sorrend','felirat'=>'sor');
$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'Del','func'=>'torol_ikon','rendez'=>'no');
$fejlec_tomb[]=array('mezo'=>'media','felirat'=>'Foto','func'=>'foto','rendez'=>'no','szerk'=>'foto','hoszz'=>200);
$fejlec_tomb[]=array('mezo'=>'kat','felirat'=>'Kategoria','szerk'=>'text_mezo','hoszz'=>200);
$fejlec_tomb[]=array('mezo'=>'cim','felirat'=>'Cím','trim'=>'30','szerk'=>'text_mezo','hoszz'=>100 );
$fejlec_tomb[]=array('mezo'=>'intro','felirat'=>'intro','trim'=>'30','szerk'=>'text','hoszz'=>250 );
$fejlec_tomb[]=array('mezo'=>'szoveg','felirat'=>'Szöveg','szerk'=>'editor','trim'=>'30','rendez'=>'no',);
//$fejlec_tomb[]=array('mezo'=>'email','felirat'=>'Mail','func'=>'szerk_ikon','rendez'=>'no');
//$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'Szerk','func'=>'szerk_ikon');
$fejlec_tomb[]=array('mezo'=>'pub','felirat'=>'Pub','func'=>'Pub_ikon','rendez'=>'no','szerk'=>'radio','value'=>'igen,nem');
$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'Szerk','func'=>'szerk_ikon');
$taskok= new Taskok; $taskok->fejlec_tomb=$fejlec_tomb;$taskok->tabla=$tabla;$taskok->id=$id; $taskok->userid=$userid; $taskok->jog=$jog;
function szerk_nezet($adatok){
//print_r($adatok);
include 'app/com/admin/nezet/cikk.php';
}
switch ($task){
case 'ment':
	if(empty($id)){$id=$taskok->uj();}
	$taskok->ment($id);
	if($hiba['ment']==''){
	echo Ikon::uj($id,32).'<div style="clear:both"></div>';
	$taskok->tablazat();}else{print_r($hiba['ment']);$taskok->szerk($id,$_POST);}
			break;
case 'szerk':
	$taskok->szerk($id);
			break;
case 'del':
	echo Ikon::uj($id,32).'<div style="clear:both"></div>';
	$taskok->del($id);
	echo $taskok->tablazat();
			break;
case 'pub':
	$taskok->pub($id);
	echo Ikon::uj($id,32).'<div style="clear:both"></div>';
	echo $taskok->tablazat();
			break;
case 'unpub':
	echo Ikon::uj($id,32).'<div style="clear:both"></div>';
		$taskok->unpub($id);
	echo $taskok->tablazat();
			break;			
default:
echo '<div style="position:relative;left:-250px;">'.Ikon::uj($id,32).'</div><div style="clear:both"></div>';
 echo $taskok->tablazat();
	
}

if(!empty($hiba))print_r($hiba);

?>


