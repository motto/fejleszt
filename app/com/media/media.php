<?php
 //defined( '_MOTTO' ) or die( 'Restricted access' );
global  $keret;
global  $userid;

if(empty($userid)){ $joghiba='Ehhez a funkcióhoz be kell jelenkezni!';}
if(!empty($joghiba)){ echo $joghiba;}
else{
$keret->head_tomb['js'][]='lib/js/jquery-1.9.1.min.js';
$keret->head_tomb['js'][]='app/com/media/multi_up.js'; // saját file feltöltő
$keret->head_tomb['js'][]='app/com/media/video.js';  //video lejátszó előképes
$keret->head_tomb['css'][]='app/com/media/media.css'; 
$keret->head_tomb['js'][]='app/pluginok/popup/modal/modal.js';
$keret->head_tomb['css'][]='app/pluginok/popup/modal/modal.css';
include "app/com/media/wiev.php";
include "app/com/media/helper.php";
//echo Link::get_cserel($_SERVER['REQUEST_URI'],'task=torol&id='.$adatok['id']).'&tip=kep';
//echo $userid.'_'.mktime().'_'.rand(1, 999);
$media= new Media;
if($_GET['task2']=='json')
{
switch ($_GET['task']){
	case 'feltolt':
	include "app/com/media/upload.php";
			break;
	
	default: listaz();	
	}

}
else
{
switch ($_GET['task']){
case 'upload':
	include "app/com/media/upload.php";
			break;
	case 'torol':
		$media-> torol($_GET['id']);
		 $media->listaz();	
			break;
	case 'szerk':
		 $media->szerk();
			break;
	case 'ment':
		$media-> ment();
		 $media->listaz();	
			break;
	default: $media->listaz();
	}
}}
//global  $hiba;
//print_r($hiba);
?> 

