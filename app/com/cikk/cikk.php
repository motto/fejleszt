<?php 
//echo 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh';
include 'app/com/cikk/cikk_wiev.php';
global $keret;$keret->head_tomb['css'][]='app/pluginok/tooltip/tooltip.css';
//data-href="<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
class Itemek{
public $tabla = 'cikk';

function __construct()	
{
global $param;
//$url = substr($_SERVER['REQUEST_URI'], 1); kék:#4E74B1 szürke:#817788
if($_GET['id']!=''){
$sql="SELECT * FROM ".$this->tabla." WHERE id='".$_GET['id']."'";
$cikk= DB::assoc_sor($sql);
cikk_megjelenit_full($cikk);
//fb OG adatok-----------------------
$head_tomb['og'][]=array('title',$cikk['cim']);
$og_url=$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
$head_tomb['og'][]=array('url',$og_url);
$head_tomb['og'][]=array('image',$cikk['media']);
if($cikk['og_intro']==''){$intro=$cikk['intro'];}else{$intro=$cikk['og_intro'];}
$head_tomb['og'][]=array('description',$intro);

}else{

$sql="SELECT * FROM cikk WHERE kat='".$_GET['kat']."' and pub='0' ORDER BY sorrend DESC";

$cikk_tomb= DB::assoc_tomb($sql);
//$cikk_tomb=Lekerdez::assoc_tomb($sql);
if(is_array($cikk_tomb)){
	foreach ($cikk_tomb as $cikk){
	cikk_megjelenit_lista($cikk);
	}
	}
}
}

}
//fb_sav();
$itemek= new Itemek;

//echo AlapAdatok::$menuadat['id'];
?>

