<?php
defined('_JEXEC') or die('Restricted access'); 
$tasktomb=array('pub','unpub','torol','szerkesztment','szerkeszt','hiba','listaz');
$tabla='aa_webhelyek';
$wtipustomb=w_tipustomb($domainadat);
$tipus=tipus($wtipustomb,$mezoertek);
//$mezoertek='';
$admin = new Admin;
$admin->tabla1=$tabla;
$admin->tabla2='aa_lapok';
$admin->tabla3='aa_bejegyzesek';
$admin->pub_mezo1='w_pub';
$admin->azonosito_mezo2='webhelyid';
$admin->itemadatok(); //ha van itemid feltölti a $itemadatok tömböt 
$admin->jogok();//létrehozza a $alapjogok és a $jog tömböket
$task=$admin->alap_taskok(); //admin fuggvenyek.php 
$itemid=$admin->itemid;
$itemadatok=$admin->itemadatok;
$jog=$admin->jog;
$ugyfelid=$admin->ugyfelid;
$alapjogok=$admin->alapjogok;
$domain_csid=$admin->domain_csid;
//print_r($jog);
//print_r($alapjogok);

//listázás********************************************
if($task=='listaz')
{
uj_ikon($jog,$meret);
info_ikon('index.php',$meret);
echo '<div style="clear:both;"></div>';

echo '<h2>Webhely lista</h2>';
$query = "SELECT * FROM $tabla WHERE userid='".$ugyfelid."' and domain_csid='".$domainadat['domain_csid']."'"; 
			$db->setQuery($query); 
			$rowtomb= $db->loadAssoclist();
			//print_r($rowtomb);
//más domainen lévő webhelyek-------------			
$query = "SELECT * FROM $tabla WHERE userid='".$ugyfelid."' and domain_csid<>'".$domainadat['domain_csid']."'"; 
			$db->setQuery($query); 
			$rowtomb2= $db->loadAssoclist();
	$webhelylink='index.php?option=com_admin&ftask=webhelyadmin&fcsid=profil&task=szerkeszt&ajanlo='.$ugyfelid;		
	if(!empty($rowtomb))
	{			
	echo '<h5>Ezen a domainen elkészült webhelyek listája,rákattintva szerkeszthetők a beállítasaik.</h5> ';
	$webhelylista = new LinkDiv ;
	$webhelylista->style_float='style=" border-style:solid; border-width:1px; -moz-border-radius:15px 5px  5px 5px ; border-radius:15px 5px  5px 5px ;  margin:5px; padding:5px 10px 5px 10px;
	height:60px; width:250px; background-color:rgba(212,224,232,0.1); cursor: pointer; position:relative; overflow:hidden;';
	$webhelylista->div_listaz($rowtomb,'',$link='index.php?option=com_admin&fcsid=profil&csid=wa_szerk&ftask=webhelyadmin&task=szerkeszt',$azonosito='itemid',$tartalom_fuggveny='webhely_div');
	
	}else{echo '<h5>Ezen a domainen még nincs létrehozva webhelyed.</h5> ';}
	if(!empty($rowtomb2))
	{			
	echo '<h5>Más domainen elkészült webhelyeid listája.</h5
	> ';
	$webhelylista->div_listaz($rowtomb2,'',$link='index.php?option=com_admin&fcsid=profil&csid=wa_szerk&ftask=webhelyadmin&task=szerkeszt',$azonosito='itemid',$tartalom_fuggveny='webhely_div');	
	}
}
	
//szerkesztés**************************************	
if($task=='szerkeszt')
{

//ikonok-------------------------------
design($jog,$meret,$itemid);
lapok($jog,$meret);
torol_ikon($itemid,$jog,$meret);
uj_ikon($jog,$meret);
listaz_ikon($jog,$meret);
info_ikon('index.php',$meret);
pub_ikon($jog,$itemadatok['w_pub'],$itemid,$meret);
echo '<div style="clear:both;"></div>';
if(empty($itemid))
{if($jog['letrehoz']=='ok'){$szerkeszt='ok';}
}else
{if($jog['szerkeszt']=='ok'){$szerkeszt='ok';}}
//print_r($jog);
if($szerkeszt=='ok')
{
$proba= new LinkDiv ; 
$proba->post_div_listaz($wtipustomb,'tipus',$tipus,'','',$link='#',$formnev='random');	
	//ha nem volt sikertelen a felvétel a mezőértékek lekérdezése ha sikertelen volt akkor a $mezo=$_POST------------
	$bovites_ertek=bovites();		
	//echo 'bővítés érték:'.$bovites_ertek.'<br/>';
	//form----------------------------------------------------------------------------------	
$editor = JFactory::getEditor();
$editor->display( 'szoveg1','szoveg1','650', '300', '75', '20', false) ;
$mezok='';
$tool_text['foto']='Itt lehet logót feltölteni a webhelyhez, a kép beszúrása gombbal, vagy internetes linket is lehet ide másolni. (csak képét) Az itt beállított kép jelenki meg a facebook-on ha a lapnak nincs más alapértelmezett képe. Ha van akkor is választaható megosztáskor ajánláskor.';
$tool_text['nev']='Ez a név fog megjelenni az ajánló oldalmenüben.(csak az első 24 karakter.) Valamint a facebook bejegyzéseken.';
$tool_text['nev_m']='Igenre állítva megjelenik a név minden oldalon.';	
$tool_text['email']='A rendszer üzeneteket az ide beírt email címekre továbbítja a weblap.Lehet több is vesszővel elválasztva. Ha üresen marad akkor a webhely tulajdonos címére';	
$tool_text['varos']='A város név a területi keresőhöz klell(ha egy bizonyos város x kilométeres körzetében keresnek). Ha nem ad meg város nevet nem szerepel a keresési találatok között';
$tool_text['konyvtar']='képfeltöltés esetén ez lessz a webhely alapértelmezett könyvtára.Ha nem létezik a a weblap létrehozza, a különleges karaktereket,ékezetes betűket eltávolítja. ';		
$tool_text['cim']='elsősorban térkép megjelenítéshez kell. Városnevet nem de irányítószámot lehet írni.';
$tool_text['szlogen_m']='Ha igenre van állítva minden lap tetején megjelenik a webhely szlogenje. Ha nemre akkor csak az ajánlásokban (pl.: facebook megosztás). Ha a lapnak is van szlogenje akkor az jelenik meg';
$tool_text['perdom']='Itt lehet beállítani hogy milyen címen legyen elérhető a weblap. A '.$_SERVER['HTTP_HOST'].'/  utáni részt lehet megadni. amennyiben még nincs ilyen cím. Ha van újra kell próbálkozni. Nem szabad különleges karakter és szóközt használni. Némelyik böngészőnél a nagybetű és az ékezetes betű is probléma. ';
if($tipus1=='áruház')
{$mezofelirat_tomb['nev']='Áruház név: ';}else{$mezofelirat_tomb['nev']='Webhely név: ';}
			
		$form1 = new Formelemek;
		$form1->tooltext=$tool_text;
		$form1->mezoertek=$itemadatok;
		//$form1->bovites_ertek=$bovites_ertek;
		$form1->bovites_ertek=$bovites_ertek;
	//	id 	domain 	w_csid 	perdom 	userid 	nev 	email 	nev_m 	foto 	foto_m 	szlogen 	szlogen_m 	tipus 	laptipus 	banner 	tmpl 	adminok 	moderatorok 	szerzok 	userek 	tltott_szerzok 	feltolt_jog 	tiltott 	enged 	lathat_jog 	w_pub 	modify 	datum 	fizetve
			if(!empty($itemid)){$w_link='&itemid='.$itemid.'';}
			$form1->formeleje('index.php?option=com_admin&ftask=webhelyadmin&fcsid=profil'.$w_link.$ajanlolink.'&task=szerkesztment');
			$form1->size=30;
			$mezok=$form1->kepbeszurbutton_mezobe($mezok,2,'Kép tallózás','Logo feltöltés',$ugyfelid );
			
			//echo ' <table class="admintable">';
			$form1->size=50;
			//$mezok=$form1->input($mezofelirat_tomb,'nev',$mezok);
			$laptipus=explode(',',$domainadat['eng_laptipus']);
		
			$mezok=$form1->checkbox('Engedélyezett laptipusok:','laptipus',$laptipus,$mezok,3);
		
			$mezok=$form1->input('Név','nev',$mezok,1); 
			if($webhelyadat['perdom']!='aa')
			{$mezok=$form1->input('Webcim http://'.$_SERVER['HTTP_HOST'].'/ ','perdom',$mezok,1);}
		
			//echo'$mezok '.$mezok;
			$mezok=$form1->input('Főcím','focim',$mezok,2);
			//echo'$mezok '.$mezok;
			$mezok=$form1->input('Szlogen: ','szlogen',$mezok,2);
			//radio($felirat,$nev,$valaszt,$mezok='')
		//echo'$mezok '.$mezok;
			$megjelenit=array('logo','főcím','slogen');
			$mezok=$form1->checkbox('Megjelenítés:','pub',$megjelenit,$mezok,3);
			
			$mezok=$form1->input('Email: ','email',$mezok,2);
			$form1->input('Kép könyvtár: ','konyvtar',$mezok,3);
			if($bovites_ertek==3){$mezok=$mezok.',konyvtar/konyvtar';}
			//echo'$mezok '.$mezok;
			// ha áruház a tipus akkor a bővít értéknek megfelelően jelenik meg ha nem akkor nem jelenik meg
			if($tipus1=='áruház'){$t1=1;$t2=2;$t3=3;}else{$t1='no';$t2='no';$t3='no';}
			//echo '$mezok'.$mezok;
			$mezok=$form1->input('Cím: ','cim',$mezok,$t2);
			$mezok=$form1->input('Város: ','varos',$mezok,$t2);
			
			$form1->admintable='nem'; echo '</table>';
			//hidden mezok------------------------------------------
			$hidden_tomb[]= array('domain_csid',$domain_csid,'beir');
			$hidden_tomb[]= array('domain',$_SERVER['HTTP_HOST'],'beir');
			//$hidden_tomb[]= array('modify',$ido,'beir');
			$hidden_tomb[]= array('tipus',$tipus,'beir');
			//gombok------------------------------------------------------------
			$felirat_tomb[]='Feltölt';$felirat_tomb[]='Feltölt újat kezd';$felirat_tomb[]='Mégsem';
			echo'$mezok '.$mezok;
			$mezok=$form1->formvege($felirat_tomb,$mezok,$hidden_tomb);
			echo'$mezok '.$mezok;
}else{$task='hiba';$hiba='Szerkesztési jogosultság nem megfelelő';}			
}

if($task=='hiba')
{
//echo '$itemid-----------------------'.$itemid;
echo '<h3>'.$hiba.'</h3>';
}