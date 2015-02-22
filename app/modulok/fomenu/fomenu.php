<?php
//global $webhelydatok;
//$sql="SELECT * FROM menuk WHERE webhely_id='".$webhelyadatok->id."' and pub=0 order by sorrend,id";
//$menupont_tomb= Lekerdez::assoc_tomb($sql);
$menupont_tomb[]=array('nev'=>'Főoldal','link'=>'index.php');
$menupont_tomb[]=array('nev'=>'Media','link'=>'index.php?com=media');
$menupont_tomb[]=array('nev'=>'Kapcsolat','link'=>'index.php?com=contact');
$menupont_tomb[]=array('nev'=>'Admin','link'=>'index.php?com=admin');

foreach ($menupont_tomb as $menupont)
{
/*
echo 'div class="menu_text"><a href="'.$menupont['link'].'"';
if($_SERVER['REQUEST_URI']=='/'.$menupont['link'] or $_SERVER['REQUEST_URI']==$menupont['link']){echo 'class="active"';}
 
echo 'class="menu_link">'.$menupont['nev'].'</a></div>';
*/

echo '<li><a href="'.$menupont['link'].'&csid='.$menupont['id'].'"';
if($menupont['id']==$_GET['csid']){echo 'class="active"';}
 
echo '>'.$menupont['nev'].'</a></li>';

}
/*
global $userid,$admin_tomb;
if(in_array($userid,$admin_tomb)){
$link='index.php?com=admin';
echo '<li><a href="'.$link.'"';
if($_SERVER['REQUEST_URI']=='/'.$link or $_SERVER['REQUEST_URI']==$link){echo 'class="active"';}

echo '>Admin</a></li>';

}*/
?>