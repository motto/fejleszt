<?php
include 'class.phpmailer-lite.php';

$task=$_GET['task'];
if($_POST['task']=='mailkuld'){$task='kuld';}
$toid=$_GET['toid'];
  $email = new email();

switch ($task) {
    case 'kuld':
 //mail_kuld($uzenet,$subject='',$tonev='',$to,$fromnev='',$from='mail@infolapok.hu')
       mail_kuld($_POST['uzenet'],$_POST['subject'],'','',$_POST['feladonev'],$_POST['felado']);
	  echo 'Köszönöm az üzenetet !';
	  // echo mail_kuld('sfhasfhjasdf','tghwrerewt','','','emo','emo@gmail.com');
        break;
    case 'kimeno':
        echo "i equals 1";
        break;
	   case 'bejovo':
        echo "i equals 1";
        break;	
    default:
$sql="SELECT email FROM userek WHERE id='".$_GET['toid']."'";
$itemtomb=Lekerdez::assoc_sor($sql);
//$sql="SELECT email FROM userek WHERE id='".$_GET['toid'].  "'";
//$levelektomb=Lekerdez::assoc_tomb($sql);
echo '<style> .gomb {background-color:#DCEAF9;float:left;margin:5px;padding:10px;}
</style>
';
//echo '<a href="index.php?com=mail&task=bejovo&toid='.$_GET['toid'].'"><div id="" class="gomb" >bejövő</div></a>';
//echo '<a href="index.php?com=mail&task=kimeno&toid='.$_GET['toid'].'"><div id="" class="gomb"" >kimenő</div></a>
//<div style="clear:both;" ></div>';
$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'id');
//$fejlec_tomb[]=array('mezo'=>'id','felirat'=>'Del','func'=>'torol_ikon','rendez'=>'no');
$fejlec_tomb[]=array('mezo'=>'targy','felirat'=>'tárgy','trim'=>'30' );
$fejlec_tomb[]=array('mezo'=>'uzenet','felirat'=>'Üzenet','trim'=>'30');
//$fejlec_tomb[]=array('mezo'=>'email','felirat'=>'Mail','func'=>'email_ikon','rendez'=>'no');
/*
$tabla1= new Tabla;
$tabla1->fejlec_tomb=$fejlec_tomb;
$tabla1->tabla='email';
echo $tabla1->general();*/

echo '</div>';
     
	   $email->cimemail=$itemtomb['email'];
	   if($_GET['mod']=='kapcs'){ $email->mailform($felado='van',$feladomail='van',$cimemail='nincs');}else{
	    $email->mailform($felado='nincs',$feladomail='nincs',$cimemail='van');}
        break;
}


?>