<?php
defined('_JEXEC') or die('Restricted access'); 
function a_tag($link,$popup='igen',$popup_width='600',$popup_height='500')
{
	if($popup=='popup' or $popup=='igen')
	{
	$a_tag= '<a class="modal-button" href="'.$link.'" onclick="IeCursorFix(); return false;" rel="{handler: \'iframe\', size: {x: '.$popup_width.', y: '.$popup_height.'}}">';
	}
	else
	{
	$a_tag= '<a href="'.$link.'" >';
	}
	//$a_tag['vege']='</a>';	
 return $a_tag;
}
function form_kuld()
{
$onclick='document.forms[\''.$formnev.'\'].submit()';
echo $onclick;
}

class LinkDiv 
{
//style----------------
public $style_float='style=" border-style:solid; border-width:1px; -moz-border-radius:15px 5px  5px 5px ; border-radius:15px 5px  5px 5px ;  margin:5px; padding:5px 10px 5px 10px; height:20px; width:auto; background-color:rgba(212,224,232,0.1); cursor: pointer; position:relative; overflow:hidden;';
public $style_sorba='style=" margin:5px; padding:2px 5px 2px 2px;
background-color:rgba(212,224,232,0.1);cursor: pointer; position:relative;';
public $rendez=' float:left;'; //display:inline; vagy float:left;
public $aktiv='nem';

public $aktiv_style='border-color:red;color:red;';
public $passziv_style='border-color:gray; color:gray;';
public $osztaly=null;
//egyéb-----------------------------
public $formnev='random';
public $infostyle=' style="position:relative;top:-5px;left:-5px;margin:5px;float:left;"';
public $clear_div='<div style=" clear:both;" ></div>';
public $link='';
public $div_id=null;
public $tartalom=null;
//popup--------------------------------
public $popup='nem';
public $popup_width=650;
public $popup_height=500;
//tool----------------------
public $tool_text='';
public $tool_link=null;
public $tool_width=650;
public $tool_height=500;

function a_tag()
{
//if(empty($popup)){$popup=$this->popup;}
//if(empty($link)){$link=$this->link;}
	if($this->popup=='nem')
	{
	$a_tag='<a href="'.$this->link.'" >';
	}
	else
	{
	$a_tag='<a class="modal-button" href="'.$this->link.'" onclick="IeCursorFix(); return false;" rel="{handler: \'iframe\', size: {x: '.$this->popup_width.', y: '.$this->popup_height.'}}">';
	}
		
 return $a_tag;

}

function info($tool_text)
{$info='<span class="editlinktip hasTip" title="'.$tool_text.'" ><img src="/includes/js/ThemeOffice/tooltip.png" border="0" alt="Tooltip"/></span>';
 echo $info;
//return $info;
}
function div_adatok()
{
if(!empty($this->div_id))
{
$id=' id="'.$this->div_id.'"';
$name=' name="'.$this->div_id.'"';
}	
//stílus indítása (inline esetén csak szöveg nincs border) Figyelem! ez legyen az első!
if($this->rendez==' float:left;')
{$style=$style.$this->style_float;}
else
{$style=$style.$this->style_sorba;}
// aktív vagy passzív hozzáfűzése a stílushoz
if($this->aktiv=='igen')
{$style=$style.$this->aktiv_style;}
else
{$style=$style.$this->passziv_style;}
// float vagy inline hozzáfűzése a stílushoz és a stílus lezárása (")Figyelem! ez legyen az utolsó!
$style=$style.$this->rendez.'"';
// ha van megadva  stílus osztály akkor  
if(!empty($this->osztaly)){$style=$this->osztaly;}
return $id.$name.$style;
}
//egy div-etz jeleneít meg ami kattinthatóvá tehető és toltipes info is megjeleníthető
function doboz($tartalom,$on_click='')
{
//$div_adatok=$this->div_adatok();
echo  '<div '.$this->div_adatok().$on_click.' >';
	if($this->tool_text!='')
	{
	echo '<div '.$this->infostyle.' >';
	$this->info($this->tool_text);
	echo '</div>';
	}
echo $tartalom.'</div>'; 
}
// link-ként működő div tolltippel
function link_div($tartalom)
{
if($this->link==substr($_SERVER['REQUEST_URI'], 1))
{$this->aktiv='igen';}else{$this->aktiv='nem';}
$kattint=$this->a_tag();
echo $kattint.'$kattint';
$kattint.$this->doboz($tartalom).'</a>'; 
}
//egy formot állít elő és egy divet ami elküldi a form adatait
function post_div($tartalom,$hidden_nev,$hidden_ertek,$link='#',$formnev='random')
{
$formnev=hidden_form($hidden_nev,$hidden_ertek,$link='#',$formnev='random');
$on_click=' onclick="document.forms[\''.$formnev.'\'].submit()"';
// ha van $div_id  az lesz a div id és name tulajdonsága is.
$this->doboz($tartalom,$on_click); 
}

function div_listaz($rowtomb,$adatmezo='nev',$link='',$azonosito='itemid',$tartalom_fuggveny='')
{
echo'<div style=" clear:both;" ></div>';
foreach($rowtomb as $row)
{
if(empty($tartalom_fuggveny))
{$tartalom=$row[$adatmezo];}
else
{$tartalom=$tartalom_fuggveny($row);}
//print_r($row);
if(!empty($row['domain'])){$domain='http://'.$row['domain'].'/';}
$this->link=$domain.$link.'&'.$azonosito.'='.$row['id'];
$this->link_div($tartalom);
}
echo'<div style=" clear:both;" ></div>';
}
function post_div_listaz($rowtomb,$hidden_nev,$aktiv_ertek,$felirat_mezo='',$ertek_mezo='',$link='#',$formnev='random')
{
//$felirat_mezo= a $row tömb feliratot  tartalmazo mezője ha ures akkor nem associativ tömbként kezeli a row tömbot.(sima felsorolás)
//$ertek= a $row tömb erteket  tartalmazo mezője
echo'<div style=" clear:both;" ></div>';
foreach($rowtomb as $row)
{
if(empty($felirat_mezo))
{$row_felirat=$row;$row_ertek=$row;}
else
{$row_felirat=$row[$felirat];$row_ertek=$row[$ertek_mezo];}
if($aktiv_ertek==$row_ertek)
{$this->aktiv='igen';}else{$this->aktiv='nem';}
$this->post_div($row_felirat,$hidden_nev,$row_ertek,$link='#',$formnev='random');
}
echo'<div style=" clear:both;" ></div>';
}
}
//linkdiv osztaly vége*****************************
function link_div_general($tartalom,$link='',$popup='nem',$tool_text='',$aktiv='igen',$osztaly=null,$rendez=' float:left;',$div_id='')
{
$linkdiv = new LinkDiv; 
$linkdiv->tartalom=$tartalom;$linkdiv->link=$link;$linkdiv->tool_text=$tool_text;$linkdiv->div_id=$div_id;$linkdiv->popup=$popup;$linkdiv->aktiv=$aktiv;$linkdiv->osztaly=$osztaly;$linkdiv->rendez=$rendez;
$linkdiv->link_div_obj($tartalom);
}

function hidden_form($hidden_nev,$hidden_ertek,$link='#',$formnev='random')
{
if($formnev=='random'){$formnev=admin_cod(12);}else{$formnev=$formnev;}

 echo '<form enctype="multipart/form-data" id="'.$formnev.'" name="'.$formnev.'" action="'.$link.'" method="post">';
 echo '<input type="hidden" id="'.$hidden_nev.'" name="'.$hidden_nev.'" value="'.$hidden_ertek.'"/>';
 echo '<input type="hidden" id="formnev" name="formnev" value="'.$formnev.'"/>';
 echo '</form>';
 return $formnev; 
}
function div_listaz($rowtomb,$adatmezo='nev',$link='',$azonosito='id',$tartalom_fuggveny='')
{
echo'<div style=" clear:both;" ></div>';

foreach($rowtomb as $row)
{
if(empty($tartalom_fuggveny))
{$tartalom=$row[$adatmezo];}
else
{$tartalom=$tartalom_fuggveny($row);}
link_div($row['id'],$link.'&itemid='.$row[$azonosito]);
}
echo'<div style=" clear:both;" ></div>';

}


function webhely_div($row)
{
//echo 'fffffffff';
if(!empty($row['foto'])){$foto=$row['foto'];}if(empty($foto)){$foto=$domainadat['foto'];}
if(empty($foto)){$foto='sajat/kepek/no_logo.png';}

if(!empty($row['szlogen'])){$szlogen=$row['szlogen'];}
if(empty($szlogen)){$szlogen=$domainadat['szlogen'];}
if(empty($szlogen)){$szlogen='Nincs szlogen';}

$tartalom='<div style="float:left;margin-right:15px;"><img style="max-height:64px; max-width:100px;" src="'.$foto.'"
/></div><div style=""><span style="color:red; font-size:9px;">'.$row['domain'].'</span><br/><span style=" font-size:16px; color:blue; font-weight:bold;">'.$row['nev'].'</span><br/>'.$szlogen.'</div>';
return $tartalom;
}

function w_tipustomb($domainadat)
{
		$wtipustomb1=explode(',',$domainadat['tipus']);
		$wtipustomb=ures_torol($wtipustomb1);	
return 	$wtipustomb	;
}
function tipus($wtipustomb,$mezoertek)
{
$session = JFactory::getSession();
if($_POST['tipus']!=''){$tipus=$_POST['tipus'];$session->set('tipus',$tipus);}
$tipus=$session->get('tipus');
		//if (empty($tipus1)){$tipus1=$mezoertek['tipus'];}
		if (empty($tipus)){
		$tipus=$wtipustomb[0];}	
return 	$tipus	;
}
function bovites()
{
$session = JFactory::getSession();
if($_POST['bovites']!='')
{$bovites=$_POST['bovites'];$session->set('bovites',$bovites);}
$bovites=$session->get('bovites');
	if($bovites==''){$bovites='egyszerű';}
	echo 'Szerkesztő mód:'.$bovites.'<br/>';
	$bovites_tomb=array('egyszerű','bővített','szakértő');
	$bovites_ertek_tomb=array('egyszerű'=>1,'bővített'=>2,'szakértő'=>3);
	$proba= new LinkDiv ;
	$proba->post_div_listaz($bovites_tomb,'bovites',$bovites,'','',$link='#',$formnev='random');	
	$bovites_ertek=$bovites_ertek_tomb[$bovites];
	return $bovites_ertek;
}
