 <?php 

GOB::$head_tomb['css'][]='app/pluginok/tooltip/tooltip.css';
global $keret;$keret->modul_becsatol('login');
if (GOB::get_user('id')!=0){
if(isset($_GET['ftask'])){include COM_PATH.'admin/'.$_GET['ftask'].'.php';}
else{include COM_PATH.'admin/cikkek.php';}
}
//if(GOB::$com=='admin' and GOB::get_jog('stat')!='admin'){die('nincs admin jog');}
?>