<?php 
$alap_link=Link :: kiszed($_SERVER['REQUEST_URI'],'task,id');
global $tmpl; $tmpl='templates/admin';
include 'com/admin/helper/admin_fgv.php';
$tabla='userek';
$id=$_GET['id'];
$task=$_GET['task'];
//if($task==''){$task=$_POST['task'];}
//if($task==''){$task='alap';}
function szinez($ertek,$id){
global $admin_tomb; if(in_array($id,$admin_tomb)){
$dd ='<span style="color:red;">'.$ertek.'</span>';
}else{$dd =$ertek;}
return $dd;
}
$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'id');
//$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'Del','func'=>'torol_ikon','rendez'=>'no');
$fejlec_tomb[]=array('mezo'=>'foto','felirat'=>'Foto','func'=>'foto','rendez'=>'no','szerk'=>'input','hoszz'=>200);
$fejlec_tomb[]=array('mezo'=>'name','felirat'=>'Név','trim'=>'30','szerk'=>'input','hoszz'=>200 );
$fejlec_tomb[]=array('mezo'=>'username','felirat'=>'Usernév','func'=>'szinez','trim'=>'30');
$fejlec_tomb[]=array('mezo'=>'email','felirat'=>'Mail','func'=>'email_ikon','rendez'=>'no');
//$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'Szerk','func'=>'szerk_ikon');
$fejlec_tomb[]=array('mezo'=>'pub','felirat'=>'Pub','func'=>'Pub_ikon','rendez'=>'no');
$taskok= new Taskok; $taskok->fejlec_tomb=$fejlec_tomb;$taskok->tabla=$tabla;$taskok->id=$id; $taskok->userid=$userid; $taskok->jog=$jog;
/*
function szerk_nezet(){
include 'com/admin/nezet/cikk.php';
}*/
switch ($task){
case 'ment':
	if($id==''){$id=$taskok->uj();}
	$taskok->ment($id);
	if($hiba['ment']==''){$taskok->tablazat();}else{print_r($hiba['ment']);szerk($id,$_POST);}
			break;
/*			
case 'szerk':
	$taskok->szerk($id);
			break;*/
case 'del':
	$taskok->id=$_GET['id'];
	$taskok->del();
	echo $taskok->tablazat();
			break;
case 'pub':
	$taskok->pub($id);
	echo $taskok->tablazat();
			break;
case 'unpub':
	$taskok->unpub($id);
	echo $taskok->tablazat();
			break;			
default:
	//if($jog['admin'])
 echo $taskok->tablazat();
	
}

if(!empty($hiba))print_r($hiba);

?>




