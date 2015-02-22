<?php

//include(JPATH_SITE.DS.'fuggvenyek'.DS.'kozossegi.php'); content
//proba------------------------------------------------------------------------------
global  $keret;
$keret->head_tomb['js'][]=PLUGINOK.'izzycolor/izzycolor.js';	
class Editor {
var $editor_images='app/pluginok/editor/ico/';
var $editor_id='szerkeszto';
var $tartalom='';
var$width=820;
var $minheight=400;
function general(){
?>			    		    
<style type="text/css">
.vezerlo
{position:relative; float:right; top:-20px; cursor:pointer;}
.editor{
color:black;
	border-bottom: 1px solid black;
	background-color: #F0F0F0;
	width: <?php echo $this->width; ?>px;
	padding: 5px;}
</style>
<script type="text/javascript">

$('#betuszin').change(function(){
var $szin11=$('#betuszin').val();
//colorbeallít('betuszin',$szin1);
$('#betuszin').css('background',$szin11)});

$('#hilight').change(function(){
var $szin22=$('#hilight').val();
//alert($szin2+'gdhdghs');
//colorbeallít('hilight',$szin22);
$('#hilight').css('background',$szin22);
});


function foto_cserel(){
kep_beszur_akcio='foto';
modal_nyit_link('http://<?php echo $_SERVER['HTTP_HOST']; ?>/index.php?com=media&keret=0','600','600')
}




//adatker(succes_function,webcim,kuldadat);	
function tartalom_szurkit(){
			var block_page = $('<div id="block_page" class="szurkit"></div>');
			//alert(block_page);			
			$(block_page).appendTo('#tartalom');
			$('#block_page').click(function(){editor_bezar();$('.szurkit').fadeOut().remove();});
		}

// editor******** html_beszur **************************************************************************************************

function betuszin_beallit(){
var szin=$('#betuszin').val();
action1('forecolor',szin);
}
function hilight_beallit(){
var $szin2=$('#hilight').val();
action1('hilitecolor',$szin2);
}		
		
function prompt2(t)
{
	t = prompt(t);
	if (t == null) return false;
	return t;
}
function action1(a,p)
{
	document.getElementById('<?php echo $this->editor_id; ?>').focus();

	if (p == null) p = false;
	else if (p == false) return false;
	
	document.execCommand(a,false,p);
	//document.getElementById('de77_editor').write('gggggggggg');
}

function action(a,p)
{
	document.getElementById('<?php echo $this->editor_id; ?>').focus();

	if (p == null) p = false;
	else if (p == false) return false;
	
	document.execCommand(a,false,p);
	//document.getElementById('de77_editor').write('gggggggggg');
}
function replaceSelectedText(replacementText){
    var sel, range;
    if (window.getSelection) {
        sel = window.getSelection();
        if (sel.rangeCount) {
            range = sel.getRangeAt(0);
            range.deleteContents();
            range.insertNode(document.createTextNode(replacementText));
        }
    } else if (document.selection && document.selection.createRange) {
        range = document.selection.createRange();
        range.text = replacementText;
    }
}

//atcaret -----------------------------------
function html_beszur(szoveg){ 
if(kep_beszur_akcio=="foto"){
$('#'+szerkeszto_contener_id).attr('src',szoveg);
$.ajax({
type: "POST",
url: "http://<?php echo $_SERVER['HTTP_HOST']; ?>/index.php?com=alap&task=fotoment&ftask=json&keret=json",
dataType: "text",
scriptCharset: "utf-8" ,
contentType: "application/x-www-form-urlencoded;charset=UTF-8",
data: {"szerkeszto_contener_id": szerkeszto_contener_id,"src" : szoveg, "tip" : "aru" }
}).done(function(data2){
//alert(uzenet);
});	

}else{action1('inserthtml', '<img height="300px" width="192px" src="/'+szoveg+'" >');}
//alert('<img src="/'+szoveg+'">');
}


function kiir(){ 
alert(szerkeszto_id);
}

//szerkeszto elküldése
/*
$('#cikk').submit(function() 
{
  $('#szoveg').val($('#szerkeszto').html());
});*/
</script>

<div id="de77_<?php echo $this->editor_id; ?>">
<div class="editor" style="width:<?php echo $this->width; ?>px;"  id="de77_toolbar_<?php echo $this->editor_id; ?>">
	<img src="<?php echo $this->editor_images; ?>delete.png" onclick="action1('removeFormat')" title="formázás megszüntetése" alt="formázás megszüntetése">
	<img src=" <?php echo $this->editor_images; ?>bold.png" onclick="action1('bold')" title="bold" alt="bold">
	<!--<img src="<?php echo $this->editor_images; ?>bold.png" onclick="replaceSelectedText('fffffffffff')" title="bold" alt="bold">-->
	<!--<img id="jjj"src="<?php echo $this->editor_images; ?>italic.png" onclick="$.fn.colorpicker();" title="italic" alt="italic">-->
	<img src="<?php echo $this->editor_images; ?>underline.png" onclick="action1('underline');" title="underline" alt="underline">
	<img src="<?php echo $this->editor_images; ?>strikethrough.png" onclick="action1('strikethrough')" title="strikethrough" alt="strikethrough">		 
	<img src="<?php echo $this->editor_images; ?>link.png" onclick="action1('createLink',prompt2('URL?'))" title="link" alt="link">
	<img src="<?php echo $this->editor_images; ?>unlink.png" onclick="action1('unlink')" title="unlink" alt="unlink">	
	<img src="<?php echo $this->editor_images; ?>h1.png" onclick="action1('heading', 'h1')" title="h1" alt="h1">
	<img src="<?php echo $this->editor_images; ?>h2.png" onclick="action1('heading', 'h2')" title="h1" alt="h2"> 
	<img src="<?php echo $this->editor_images; ?>h3.png" onclick="action1('heading', 'h3')" title="h1" alt="h3"> 
	<img src="<?php echo $this->editor_images; ?>h4.png" onclick="action1('heading', 'h4')" title="h1" alt="h4"> 
	<img src="<?php echo $this->editor_images; ?>h5.png" onclick="action1('heading', 'h5')" title="h1" alt="h5"> 
	<!--<img src="<?php echo $this->editor_images; ?>h6.png" onclick="action1('heading', 'h6')" title="h1" alt="h6"> --> 
	<img src="<?php echo $this->editor_images; ?>paragraph.png" onclick="action1('insertparagraph')" title="paragraph" alt="paragraph">
	<select onChange="action1('heading',this.value)">
		<option value="h1">Heading 1
		<option value="h2">Heading 2
		<option value="h3">Heading 3
		<option value="h4">Heading 4
		<option value="h5">Heading 5
		<option value="h6">Heading 6
		<option value="p">Paragraph									
	</select>
	<img src="<?php echo $this->editor_images; ?>image.png" onclick="modal_nyit_link('index.php?com=media&keret=0&beszur=media&editor=szerkeszto',600,600);" title="image" alt="image">
	
	<img src="<?php echo $this->editor_images; ?>hr.png" onclick="action1('inserthorizontalrule')" title="hr" alt="hr">
	<img src="<?php echo $this->editor_images; ?>undo.png" onclick="action1('undo')" title="undo" alt="undo">
	
	<img src="<?php echo $this->editor_images; ?>redo.png" onclick="action1('redo')" title="redo" alt="redo">
	
	<!--
	<img src="<?php echo $this->editor_images; ?>fontcolor.png" onclick="action1('forecolor','red')" title="fontcolor" alt="fontcolor">
	<img src="<?php echo $this->editor_images; ?>hilightcolor.png" onclick="action1('hilitecolor',prompt2('Color?'))" title="hilightcolor" alt="hilightcolor">
	<input type="text" value="red" class="izzyColor" onclick="iColorShow('hilight','icp_hilight');" id="hilight" style="width: 60px;" maxlength="10" size="12">
	-->
	<input type="text" value="blue"  class="izzyColor betuszin" id="betuszin" style="width: 60px;" maxlength="10" size="12">
	<img src="<?php echo $this->editor_images; ?>fontcolor.png" onclick="betuszin_beallit();" title="fontcolor" alt="fontcolor">
	<input type="text" value="red" class="izzyColor" id="hilight" style="width: 60px;" maxlength="10" size="12">
	<img src="<?php echo $this->editor_images; ?>hilightcolor.png" onclick="hilight_beallit();" title="hilightcolor" alt="hilightcolor">
	<img src="<?php echo $this->editor_images; ?>increase.png" onclick="action1('increasefontsize')" title="increase" alt="increase">
	<img src="<?php echo $this->editor_images; ?>decrease.png" onclick="action1('decreasefontsize')" title="decrease" alt="decrease">
	
	<select onchange="action1('fontname', this.value)">
		<option style="font-family:Courier New">Courier New
		<option style="font-familyTimes New Roman">Times New Roman
		<option style="font-family:Tahoma">Tahoma
		<option style="font-family:Verdana" value="Verdana">Verdana
		<option style="font-family:Georgia">Georgia
		<option style="font-family:Impact">Impact
	</select>
	<select onchange="action1('FontSize', this.value)">
		<option value="1">10
		<option value="2">13
		<option value="3">16
		<option value="4">18
		<option value="5">24
		<option value="6">32
		<option value="7">48
	</select>
	<img src="<?php echo $this->editor_images; ?>subscript.png" onclick="action1('subscript')" title="subscript" alt="subscript">
	<img src="<?php echo $this->editor_images; ?>superscript.png" onclick="action1('superscript')" title="superscript" alt="superscript">
	
	<img src="<?php echo $this->editor_images; ?>paste.png" onclick="action1('paste')" title="paste" alt="paste">
	<img src="<?php echo $this->editor_images; ?>cut.png" onclick="action1('cut')" title="cut" alt="cut">
	<img src="<?php echo $this->editor_images; ?>copy.gif" onclick="action1('copy')" title="copy" alt="copy">
	
	<img src="<?php echo $this->editor_images; ?>left.png" onclick="action1('justifyleft')" title="left" alt="left">
	<img src="<?php echo $this->editor_images; ?>right.png" onclick="action1('justifyright')" title="right" alt="right">
	<img src="<?php echo $this->editor_images; ?>center.png" onclick="action1('justifycenter')" title="center" alt="center">
	<img src="<?php echo $this->editor_images; ?>justify.png" onclick="action1('justifyfull')" title="justify" alt="justify">
	
	<img src="<?php echo $this->editor_images; ?>ol.png" onclick="action1('insertorderedlist')" title="ol" alt="ol">
	<img src="<?php echo $this->editor_images; ?>ul.png" onclick="action1('insertunorderedlist')" title="ul" alt="ul">
	
	<img src="<?php echo $this->editor_images; ?>html.png" onclick="action1('inserthtml', prompt2('HTML?'))" title="html" alt="html">
	
	<img src="<?php echo $this->editor_images; ?>indent.png" onclick="action1('indent')" title="indent" alt="indent">
	<img src="<?php echo $this->editor_images; ?>outdent.png" onclick="action1('outdent')" title="outdent" alt="outdent">
	
	<img src="<?php echo $this->editor_images; ?>delete.png" onclick="action1('delete')" title="delete" alt="delete">
	
</div>
<div contenteditable="true" class="editor" style="width:<?php echo $this->width; ?>px;min-height:500px;" id="<?php echo $this->editor_id ;?>"><?php echo $this->tartalom ?></div>
</div>
<?php
}}
?>
<!--
<div contenteditable="true" class="editor" id="editor">Example text</div>

<div class="addtoany_share_save_container"><div class="a2a_kit a2a_target addtoany_list" id="wpa2a_2"><a class="a2a_button_facebook_like addtoany_special_service" data-href="http://kaslerarpad.hu/?p=3790"></a><a class="a2a_button_facebook" href="http://www.addtoany.com/add_to/facebook?linkurl=http%3A%2F%2Fkaslerarpad.hu%2F%3Fp%3D3790&amp;linkname=AZ%20%C3%8DT%C3%89LKEZ%C3%89S%20%C3%81LLAPOT%C3%81R%C3%93L" title="Facebook" rel="nofollow" target="_blank"><img src="http://kaslerarpad.hu/wp-content/plugins/add-to-any/icons/facebook.png" width="16" height="16" alt="Facebook"/></a><a class="a2a_button_twitter_tweet addtoany_special_service" data-count="none" data-url="http://kaslerarpad.hu/?p=3790" data-text="AZ ÍTÉLKEZÉS ÁLLAPOTÁRÓL"></a><a class="a2a_button_google_plusone addtoany_special_service" data-annotation="none" data-href="http://kaslerarpad.hu/?p=3790"></a><a class="a2a_dd addtoany_share_save" href="http://www.addtoany.com/share_save" style="background:url(http://kaslerarpad.hu/wp-content/plugins/add-to-any/favicon.png) no-repeat scroll 9px 0px !important;padding:0 0 0 30px;display:inline-block;height:16px;line-height:16px;vertical-align:middle">Megosztás</a></div></div>	
-->




<!--<script type="text/javascript" src="http://proba.infolapok.hu/editor/scriptek.js"></script>	-->