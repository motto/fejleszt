<?php 
defined( '_MOTTO' ) or die( 'Restricted access' );

class Keret
{
public $head_tomb=array();

function __construct(){$this->head_tomb=GOB::$head_tomb;}

function tartalom_general()
{
include COM_PATH.GOB::$com.'/'.GOB::$com.'.php';;
}

function modul_becsatol($modul){include MODULOK_PATH.$modul.'/'.$modul.'.php';}

function sav_becsatol($position)
{
//$sql="SELECT * FROM modulok WHERE pozicio='".$position."' AND wid='".$webhelyadatok->id."'";
//$eredmeny=Lekerdez::assoc_tomb($sql);
if(is_array(GOB::$keret_tomb[$position])){
		foreach (GOB::$keret_tomb[$position] as $modul)
		{
			echo '<div class="modul" style="overflow:hidden;">';
			//if($value['cim']!=''){echo '<div class="modfejlec" >'.$value['cim'].'</div>';}
		
			include MODULOK_PATH.$modul.DS.$modul.".php";
			echo '</div>';	
		}
}
}


function js_becsatol()	
{

if(is_array($this->head_tomb['js'])){$js_tomb=array_unique($this->head_tomb['js']);
	foreach ($js_tomb as $js)
	{
	echo '<script type="text/javascript" src="'.$js.'" ></script>'."\n";
	}
}}
function css_becsatol()	{
if(is_array($this->head_tomb['css'])){$css_tomb=array_unique($this->head_tomb['css']);
	foreach ($css_tomb as $css)
	{
	//példa: $css=templates/vitruvius/styles.css
	echo '<link rel="stylesheet" href="'.$css.'" type="text/css" />'."\n";
	}
}}
function script_head(){
$script_tomb1=$this->head_tomb['script'];
if(is_array($style_tomb1)){ $script_tomb=array_unique($script_tomb1);

//if(!empty($this->head_tomb['script'])){ $script_tomb=array_unique(head_tomb['script']);
echo '<script>';
	foreach ($this->script_tomb as $script)
	{
	echo $script;
	}
echo '</script>';	
}}
function style_head()	
{
$style_tomb1=$this->head_tomb['style'];
if(is_array($style_tomb1)){ $script_tomb=array_unique($style_tomb1);
//if(!empty($this->head_tomb['style'])){ $style_tomb=array_unique(head_tomb['style']);
echo '<style type="text/css">';
	foreach ($style_tomb as $style)
	{
	echo $style;
	}
echo '</style>';	
}}
function og_head()	{
$og_tomb1=$this->head_tomb['og'];
if(is_array($style_tomb1)){ $og_tomb=array_unique($og_tomb1);
//if(!empty($this->head_tomb['og'])){ $og_tomb=array_unique(head_tomb['og']);
//<meta property="og:site_name" content="David Walsh Blog"/>
//<meta property="og:url" content="http://davidwalsh.name/facebook-meta-tags"/>
//<meta property="og:image" content="http://davidwalsh.name/wp-content/themes/klass/img/facebooklogo.png"/>
	foreach ($og_tomb as $og)
	{
	echo '<meta property="og:>'.$og[0].'" content="'.$og[1].'"/>'."\n";
	}
}
}
function egyeb_head()	{
$egyeb_head_tomb1=$this->head_tomb['egyeb_head'];
if(is_array($egyeb_head_tomb)){ $egyeb_head_tomb=array_unique($egyeb_head_tomb1);
	foreach ($egyeb_head_tomb as $egyeb_head)
	{
	echo $egyeb_head;
	}
}
}
function fejlec_general($full='nem')	
{
$this->head_tomb=GOB::$head_tomb;
$this->css_becsatol();	
$this->js_becsatol();	
$this->style_head();	
$this->script_head();
$this->og_head();
$this->egyeb_head();	
}

}

?>
