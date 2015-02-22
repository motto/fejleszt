<?php
defined('_JEXEC') or die('Restricted access'); 
  
 //total size függvény használata------------------------------------------------- 
/*$total = total_size(JPATH_SITE.DS.'sajat/');  
$total = $total / 1048576;  
$total = round($total,2);  
echo "A sajat könyvtár mérete : <B>" . $total." MB</B>"; */
function sajat_link_tasknelkul($itemmel='igen')
{
if($itemmel=='nem'){$nemkelltomb[]='itemid';}
$nemkelltomb[]='task';
// a kérdőjelek mentén feldartabolja a linket és eltvolitja a 'task'-ot tartalmazó részeket.
$link=substr($_SERVER['REQUEST_URI'], 1);
$linktomb=explode('&',$link) ;
$k=1;
	foreach($linktomb as $linkdarab)
	{
	$linkdarab2=explode('=',$linkdarab) ;
	if (!in_array($linkdarab2[0],$nemkelltomb))
	{
	if($k==1){$ujlink=$linkdarab;}else{$ujlink=$ujlink.'&'.$linkdarab;}
	$k=2;
	}
	}
//$ujlink=$_SERVER['HTTP_HOST'].'/'.$ujlink;	
return $ujlink;	
}

class Ikonok 
{
public $confirm=null;
public $link=null;
public $itemid=null;
public $task=null;
//public $jog=null;
public $meret=48;
public $font_size=9;
public $kep_nev=null;
public $felirat=null;
public $style='style="float:right;text-align:center; margin:10px;"';
public $popup=null; //ha 'igen' kattintáskor az ikon popupot nyit. 
public $popup_width=650;
public $popup_height=500;
public $tooltitle='';//Tooltip title::This is the tooltip text



function a_tag($link='',$popup='',$width=650,$height=500)
{
//if(empty($popup)){$popup=$this->popup;}
//if(empty($link)){$link=$this->link;}
if(!empty($link))
{
	if($popup=='popup' or $popup=='igen')
	{
	$a_tag['eleje']= '<a class="modal-button" href="'.$link.'" onclick="IeCursorFix(); return false;" rel="{handler: \'iframe\', size: {x: '.$width.', y: '.$height.'}}">';
	}
	else
	{
	$a_tag['eleje']= '<a href="'.$link.'" >';
	}
	$a_tag['vege']='</a>';
}	
 return $a_tag;
}

function ikon()
{
$link=$this->link;
if(empty($link) and !empty($this->task))
{
	if(empty($this->itemid))
	{$link=sajat_link_tasknelkul().'&task='.$this->task;}
	else
	{$link=sajat_link_tasknelkul('nem').'&task='.$this->task.'&itemid='.$this->itemid;}
}	
$a_tag=Ikonok::a_tag($link,$this->popup);
$kep_style='class="ik" style="width:'.$this->meret.'px; height:'.$this->meret.'px;"';
	if(!empty($this->confirm))
	{//$confirm1='onclick="return confirm(\''.$this->confirm.'\'); " ';}
	echo'<div '.$this->style.' '.$confirm1.'>';
		if(!empty($this->tooltitle))
		{echo'<span class="editlinktip hasTip" title="'.$this->tooltitle.'" >';}
		echo $a_tag['eleje'].'<img  src="/sajat/kepek/'.$this->kep_nev.'_'.$this->meret.'.png " '.$kep_style.' />';
	if(!empty($this->tooltitle))
	{echo'	</span>';}
	echo $a_tag['vege'].'<br/>';
	if($this->meret>24)
	{echo '<span style="font-size:'.$this->font_size.'px;"> '.$this->felirat.'</span></div>';}	
}	
}

function uni_ikon($popup='',$link='',$task='',$kep_nev='',$felirat='',$confirm='',$meret='',$tooltitle='',$jog='nemkell')
{
if($jog=='ok' or $jog=='nemkell')
{
$uni_ikon=new Ikonok;
if(!empty($popup)){$uni_ikon->popup=$popup;} 
if(!empty($link)){$uni_ikon->link=$link;} 
if(!empty($task)){$uni_ikon->task=$task;} 
if(!empty($kep_nev)){$uni_ikon->kep_nev=$kep_nev;} 
if(!empty($felirat)){$uni_ikon->felirat=$felirat;} 
if(!empty($confirm)){$uni_ikon->confirm=$confirm;}
if(!empty($meret)){$uni_ikon->meret=$meret;}
if(!empty($tooltitle)){$uni_ikon->tooltitle=$tooltitle;}
$uni_ikon->ikon();	
}
}
function info_ikon($link='',$meret='')
{ 
$info_ikon=new Ikonok;
$info_ikon->kep_nev='help';
$info_ikon->popup='igen';
if(!empty($meret)){$info_ikon->meret=$meret;}
$info_ikon->felirat='segítség';
$info_ikon->link=$link;
$info_ikon->ikon();
}
function listaz_ikon($jog='',$meret='')
{
$task=$_GET['task']	;
if($task!='listaz')
{
	$listaz_ikon=new Ikonok;
	$listaz_ikon->kep_nev='list';	
	if(!empty($meret)){$listaz_ikon->meret=$meret;}
	$listaz_ikon->felirat='listaz';
	$listaz_ikon->link=sajat_link_tasknelkul('nem').'&task=listaz';
	$listaz_ikon->ikon();
}
	
}

function torol_ikon($itemid,$jog='',$meret='')
{
	if($jog['torol']=='ok' and !empty($itemid))
	{
	$torol_ikon=new Ikonok;
	$torol_ikon->kep_nev='torol_ikon';
	$torol_ikon->task='torol';
	$torol_ikon->itemid=$itemid;
	$torol_ikon->confirm='Figyelem! Az Ok gombra kattintva az elem végérvényesen törölve lesz.';	
	if(!empty($meret)){$torol_ikon->meret=$meret;}
	$torol_ikon->felirat='Töröl';
	$torol_ikon->ikon();
	}
	
}

function uj_ikon($jog='',$meret='')
{
if($jog['letrehoz']=='ok')
	{
	$link=sajat_link_tasknelkul('nem');
	$link=$link.'&task=szerkeszt';
	$uj_ikon=new Ikonok;
	$uj_ikon->kep_nev='add';
	$uj_ikon->itemid='';
	$uj_ikon->link=$link;	
	if(!empty($meret)){$uj_ikon->meret=$meret;}
	$uj_ikon->felirat='Létrehozás';
	$uj_ikon->ikon();
	}
	
}
function lapok($jog='',$meret='')
{
if($jog['szerkeszt']=='ok')
	{
	$uj_ikon=new Ikonok;
	$uj_ikon->kep_nev='pages';
	$uj_ikon->link='index.php?option=com_admin&fcsid=profil&csid=wa_szerk&ftask=lapadmin&task=listaz';	
	if(!empty($meret)){$uj_ikon->meret=$meret;}
	$uj_ikon->felirat='Lapok';
	$uj_ikon->ikon();
	}
	
}
function design($jog='',$meret='',$webhelyid)
{
if($jog['szerkeszt']=='ok')
	{
	$uj_ikon=new Ikonok;
	$uj_ikon->kep_nev='themes';
	$uj_ikon->link='index.php?option=com_admin&fcsid=profil&csid=wa_szerk&webhelyid='.$webhelyid.'&ftask=tempvalaszt&task=listaz';	
	if(!empty($meret)){$uj_ikon->meret=$meret;}
	$uj_ikon->felirat='Design';
	$uj_ikon->ikon();
	}
	
}

function szerkeszt_ikon($itemid,$jog,$meret='')
{
$task=$_GET['task']	;
if($task!='szerkeszt')
{
	if($jog['szerkeszt']=='ok')
	{
		if(!empty($itemid))
		{
		$szerkeszt_ikon=new Ikonok;
		$szerkeszt_ikon->kep_nev='edit';
		$szerkeszt_ikon->task='szerkeszt';
		$szerkeszt_ikon->itemid=$itemid;	
		if(!empty($meret)){$szerkeszt_ikon->meret=$meret;}
		$szerkeszt_ikon->felirat='Szerkeszt';
		$szerkeszt_ikon->ikon();
		}
	}
}	
}
function unpublikal($itemid,$meret='')
{
$publikal_ikon=new Ikonok;
$publikal_ikon->task='unpub';
$publikal_ikon->itemid=$itemid;
$publikal_ikon->kep_nev='published';
if(!empty($meret)){$publikal_ikon->meret=$meret;}
$publikal_ikon->felirat='Letiltás';
 $publikal_ikon->ikon();		
}	
function publikal($itemid,$meret='')
{
$unpublikal_ikon=new Ikonok;
$unpublikal_ikon->kep_nev='unpublished';
if(!empty($meret)){$unpublikal_ikon->meret=$meret;}
if($unpublikal_ikon->meret>24)
{$unpublikal_ikon->felirat='Engedé-<br/>lyezés';}
$unpublikal_ikon->link=sajat_link_tasknelkul().'&task=pub&itemid='.$itemid;	
	$unpublikal_ikon->ikon();
}
function tiltott_ikon($meret='')
{
$tiltott_ikon=new Ikonok;
$tiltott_ikon->kep_nev='unpublished';
$tiltott_ikon->link='';	
if(!empty($meret)){$tiltott_ikon->meret=$meret;}
if($tiltott_ikon->meret>24)
{$tiltott_ikon->felirat='Letiltva';}
$tiltott_ikon->ikon();
}
function pub_ikon($jog,$pub_mezo,$itemid,$meret='')
{
//echo '$pub_mezo'.$pub_mezo;
	if($jog['pub']=='ok' and !empty($itemid))
	{
		if($pub_mezo<10)
		{unpublikal($itemid,$meret);}
		else
		{if($pub_mezo>$jog['rang'])
			{tiltott_ikon($meret);}
			else
			{publikal($itemid,$meret);}
		}
	}
}
function alap_szerk_ikonok($tasktomb,$jog,$pub_mezo,$itemid,$infolink,$meret='')
{ 
if(in_array('pub',$tasktomb))
{pub_ikon($jog,$webhelyadat['w-pub'],$itemid);}
if(in_array('torol',$tasktomb))
{torol_ikon($itemid,$jog,$meret='');}
if(in_array('szerkeszt',$tasktomb))
{szerkeszt_ikon($itemid,$jog,$meret='');
listaz_ikon($jog,$meret='');}	
uj_ikon($jog,$meret);
if(!empty($infolink))
{info_ikon($infolink,$meret='');}	
}
function alap_listaz_ikonok($tasktomb,$jog,$pub_mezo,$itemid,$infolink,$meret='')
{ 
uj_ikon($jog,$meret);
if(!empty($infolink))
{info_ikon($infolink,$meret='');}	
}
class JsToHiddenDiv 
{
public $hidden_id=null;
public $cimek=null;
public $style=' border-style:solid; border-width:1px; border-color:gray; -moz-border-radius:15px 5px  5px 5px ; border-radius:15px 5px  5px 5px ; float:left; margin:5px; padding:5px 10px 5px 10px; height:20px; width:auto; background-color:rgba(212,224,232,0.1); cursor: pointer; position:relative; overflow:hidden;';
public $style_aktiv=' border-style:solid; border-width:1px; border-color:red; -moz-border-radius:15px 5px  5px 5px ; border-radius:15px 5px  5px 5px ; float:left; margin:5px; padding:5px 10px 5px 10px; height:20px; width:auto; background-color:rgba(212,224,232,0.1); cursor: pointer; position:relative; overflow:hidden;';
//var cim;
	//var hidden_id;document.getElementById(hidden_id).value = cim;
	//var html_cim;
function divlista($cimek='',$hidden_id='')
{
if(!is_array($cimek))
{
$cimek=explode(',',$domainadat['tipus']);
$cimtomb=ures_torol($wtipustomb1);
}
else{$cimtomb=$cimek;}
echo '<script type="text/javascript">
	
	function hiddenvaltas(elso){ document.getElementById(elso).style.color=\'red\';}
	</script>';
foreach ($cimtomb as $cim)
{
$html_cim=webnev_fuggvenyek($cim);
echo '<div id="'.$html_cim.'" style="'.$this->style.'" onclick=" hiddenvaltas(\''.$html_cim.'\'); ">'.$cim.'</div>';
}
echo '<div style="clear:both;"></div>';
}
}


/*
class LinkDiv 
{
public $style='style=" border-style:solid; border-width:1px; border-color:rgba(212,224,232,0.1); -moz-border-radius:15px 5px  5px 5px ; border-radius:15px 5px  5px 5px ; float:left; margin:5px; padding:5px 10px 5px 10px; height:20px; width:auto; background-color:rgba(212,224,232,0.1); cursor: pointer; position:relative; overflow:hidden;"';
public $osztaly='class="linkes" ';
public $cursor=' cursor: pointer;';
public $formnev='random';
public $infostyle=' style="position:absolute;top:5px;left:5px;"';
public $clear_div='<div style=" clear:both;" ></div>';
public $infolink='proba.infolapok.hu';
public $infowidth=650;
public $infoheight=500;
public $onclick='window.location.href=\'#\'';
function link_div($tartalom,$link='',$info='',$id='',$name='')
{
$kattint=' onclick="window.location.href=\''.$link
.'\'" ';	
echo '<div '.$id.$name.$this->osztaly.$kattint.$this->style.' >';
	if($info!='')
	{
	echo '<div '.$this->infostyle.' >';
	echo '<span class="editlinktip hasTip" title="'.$info.'" >
<a class="modal-button" href="'.$this->infolink.'" onclick="IeCursorFix(); return false;" rel="{handler: \'iframe\', size: {x: '.$this->infowidth.', y: '.$this->infoheight.'}}"><img src="/includes/js/ThemeOffice/tooltip.png" border="0" alt="Tooltip"/></a></span>';
	echo '</div>';
	}
echo $tartalom.'</div>'; 

}
}

class LinkdivListaz extends LinkDiv 
{
function webhely_listaz($rowtomb,$link='index.php?option=com_admin&ftask=webhelyadmin&fcsid=profil&task=szerkeszt&webhelyid=',$ajanlo='62')
{
//echo'<div style=" clear:both;" ></div>';

foreach($rowtomb as $row)
{
if(!empty($row['foto'])){$foto=$row['foto'];}if(empty($foto)){$foto=$domainadat['foto'];}
if(empty($foto)){$foto='sajat/kepek/no_logo.png';}

if(!empty($row['szlogen'])){$szlogen=$row['szlogen'];}
if(empty($szlogen)){$szlogen=$domainadat['szlogen'];}
if(empty($szlogen)){$szlogen='Nincs szlogen';}

$tartalom='<div style="float:left;margin-right:15px;"><img style="max-height:64px; max-width:100px;" src="'.$foto.'"
/></div><div style=""><span style="color:red; font-size:9px;">'.$row['domain'].'</span><br/><span style=" font-size:16px; color:blue; font-weight:bold;">'.$row['nev'].'</span><br/>'.$szlogen.'</div>';

$this->link_div($tartalom,'window.location.href=\'http://'.$row['domain'].'/'.$link.$row['id'].'\'');
}
echo $this->clear_div;
}
}
class PostDiv extends LinkDiv 
{
function post_link_div($tartalom,$hidden_nev='',$hidden_ertek='',$action='',$info='',$id='',$name='',$formnev='random',$pluszmezo='')
{
if($this->formnev=='random'){$formnev=admin_cod(12);}else{$formnev=$formnev;}
$formnev=admin_cod(12);
//$style=$this->stilus();
$onclick='document.forms[\''.$formnev.'\'].submit()';
$this->link_div($tartalom,$onclick,$info,$id,$name); 

 echo '<form enctype="multipart/form-data" id="'.$formnev.'" name="'.$formnev.'" action="'.$action.'" method="post">';
 echo $pluszmezo;
 if($hidden_nev!=''){ echo '<input type="hidden" id="'.$hidden_nev.'" name="'.$hidden_nev.'" value="'.$hidden_ertek.'"/>';}
 echo '<input type="hidden" id="formnev" name="formnev" value="'.$formnev.'"/>';
 echo '</form>';
}
}

class PostdivListaz extends PostDiv 
{
//$mezoertek_tipus-t a $mezoertek['tipus'] helyett van;
function tipus($wtipustomb,$mezoertek_tipus)
{
		$tipus1=$_POST['tipus1'];
		if (empty($tipus1)){$tipus1=$mezoertek_tipus;}
		if (empty($tipus1)){$tipus1=$wtipustomb[0];}
		if (empty($tipus1)){$tipus1='lapcsoport';}	
return 	$tipus1	;
}

function tipuslista($wtipustomb,$post_ertek,$hidden_nev='tipus1',$hidden_ertek='',$action='',$info='',$id='',$name='',$formnev='random',$pluszmezo='')
{
//$tipus1=$this->link_div($tartalom,$onclick,$info,$id,$name);
$old_color=$this->border_color;
echo $this->clear_div;
	foreach($wtipustomb as $wtipus)
	{
		if($post_ertek==$wtipus){$this->border_color='red;';}
	$this->post_link_div($wtipus,$hidden_nev,$wtipus,$action,$info,$id,$name,'random','');	
		if($post_ertek==$wtipus){$this->border_color=$old_color;}
	}
echo $this->clear_div;	
}
}*/