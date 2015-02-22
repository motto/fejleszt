/*
 Használat php-ben :
global  $css_tomb;
global  $js_tomb;
global  $userid;

$js_tomb[]='lib/js/jquery-1.9.1.min.js';
$js_tomb[]='pluginok/popup/modal/modal.js';
$css_tomb[]='pluginok/popup/modal/modal.css';
<div class="modal"  onclick="modal_nyit_link('http://bb.infolapok.hu/index.php?com=media&keret=json',600,600);" >modal</div>


*/
function add_block_page(){
			var block_page = $('<div class="block_page"></div>');
						
			$(block_page).appendTo('body');
		}
		 	
		 /**
		  * Creates the modal box
		  */
 function add_popup_box(tartalom){
			 var pop_up = $('<div id="mod1" class="modal_box"><a href="#" class="modal_close"></a><div class="inner_modal_box">' + tartalom+ '</div></div>');
			 $(pop_up).appendTo('.block_page');
			 			 
			 $('.modal_close').click(function(){
				$(this).parent().fadeOut().remove();
				$('.block_page').fadeOut().remove();				 
			 });
		}

function modal_bezar(){
				$('.modal_box').fadeOut().remove();
				$('.block_page').fadeOut().remove();				 
			 };



function modal_nyit(szoveg,mod_width,mod_height){
 if(typeof(mod_width)==='undefined') mod_width = 800; 
 if(typeof(mod_height)==='undefined') mod_height = 800; 
mod_width= parseInt(mod_width) ;
mod_height= parseInt(mod_height) ;
add_block_page();
add_popup_box(szoveg);
var jobb=($(document).width() - mod_width )/2;
mod_width2=mod_width+20;
//alert(mod_width2);
$('.modal_box').css({ left: jobb+'px','height': (mod_height +20)+ 'px','width': mod_width2+ 'px'});
$('.inner_modal_box').css({'height': mod_height + 'px','width':mod_width+ 'px'});
}
function modal_nyit_div(div_id,mod_width,mod_height){
var szoveg=$('#'+div_id).html();
modal_nyit(szoveg,mod_width,mod_height);
}

function modal_nyit_json(link,mod_width,mod_height){
var szoveg=$.ajax({type: "POST",dataType: "json",  url: link});
modal_nyit(szoveg,mod_width,mod_height);
}
function modal_nyit_kep(src,mod_width,mod_height){
 if(typeof(mod_width)==='undefined') mod_width = '600'; 
 if(typeof(mod_height)==='undefined') mod_height = '500'; 
var szoveg='<img src="'+src+'" width="'+mod_width+'px" height="'+mod_height+'px" />';
modal_nyit(szoveg,mod_width,mod_height);
}
function modal_nyit_media(src,tip,mod_width,mod_height){
 if(typeof(tip)==='undefined') tip = 'video'; 
 if(typeof(mod_height)==='undefined') mod_height = '500'; 
 if(typeof(mod_width)==='undefined') mod_width = '600'; 
 if(typeof(mod_height)==='undefined') mod_height = '500'; 
  if(tip=='video'){var szoveg='<video src="'+src+'" width="'+mod_width+'px" height="'+mod_height+'px" controls preload></video>';}
 else{var szoveg='<img src="'+src+'" width="'+mod_width+'px" height="'+mod_height+'px" />';}
modal_nyit(szoveg,mod_width,mod_height);
}

function modal_nyit_link(link,mod_width,mod_height){
 if(typeof(mod_width)==='undefined') mod_width = '600'; 
 if(typeof(mod_height)==='undefined') mod_height = '500'; 
var szoveg='<iframe src="'+link+'" width="'+mod_width+'" height="'+mod_height+'"></iframe>';
modal_nyit(szoveg,mod_width,mod_height);
}		



