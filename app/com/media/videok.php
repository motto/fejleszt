<?php
 //defined( '_MOTTO' ) or die( 'Restricted access' )

//print_r($js_tomb);ű

?> 

vidók
  <form id="form1" enctype="multipart/form-data" method="post" action="Uploadify.php">
    <div class="row">
      <label for="fileToUpload">Select a File to Upload</label><br />
      <!--<input type=file multiple name="fileToUpload" id="fileToUpload" onchange="fileSelected();"/>-->
	   <input type="file" multiple="true"  name="fileToUpload" id="fileToUpload" onchange="fileSelected();" />
	    <input type="button" onclick="feltolt()" value="Upload" />
    </div>
    <div id="upcontener"></div>
	
    <div id="fileType"></div>
    <div class="row">
     
    </div>
   <div style="display:none;">
		<div id="upalap" class="upalap" style="float:left;" >
			<div class="upkep"><img class="upikon" src=""/></div>
			<div class="progressNumber"><progress id='' class="pr" max="100" value="41"></progress></div>
		</div>
	</div>
<style>
	progress {
  width: 120px;
  height: 5px;}
  	.upikon{
  max-width: 120px; max-height: 120px;}
</style>
  </form>

<div id="katt" class="gomb sor" onclick="beszur2();return false;">beszur</div>
<div id="katt2" class="gomb sor" onclick="listafrissit();">frissit</div>		
<div id="mediacontener" class="keret" >
	<div id="katt3" class="gomb sor task" onclick="valto('taszkos','taskok');">Kiválasztott file-ok</div>
	<div id="katt2" class="gomb sor task" onclick="valto('taszkos','feltolt');">Feltöltés</div>
	<div style="clear:both;"></div>
	
	<div id="feltolt" class="taszkos rejtett keret">
		<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true">
		</form>
	</div>
	<div id="taskok" class="taszkos keret" >
	</div>
<div id="menusor" class="" >
	<div class="listakontener" onclick="betolt('kozos_ufdhtgdalnnruz');">
		<div class="listathumb">
			<img class="listakep" src="http://proba.infolapok.hu/kepek/64/kozos.png">
		</div>
		<div class="listanev">Közös</div>
	</div>
	<div class="listakontener" onclick="betolt('sajat_ufdhtgdalnnruz');">
		<div class="listathumb">
			<img class="listakep" src="http://proba.infolapok.hu/kepek/64/home.png">
		</div>
		<div class="listanev">Home</div>
	</div>
	<div class="listakontener" style="width:120px;">
		<form><input id="ujmappa_input" type="text" value="ujmappa"></form>
		<div id="katt4" style="margin:1px 1px 1px 10px; position:relative; top:-10px " class="gomb sor" onclick="ujmappa();">mappakészít</div>
	</div>
</div>

<div id="filelistazo" class="keret" ></div>	
</div>	
	<div id="katt" class="gomb sor" onclick="adat_megjelenit();">adatok</div>	
<div id="hiddencontener" style="display: none;">
<!--szerkesztő form  -->
<div id="szerk_form">
<table>
	<tr>
		<td><div class="felirat">filenev</div></td><td><input type="text" size="35" class="filenev"  /></td>
	</tr>
	<tr>
		<td><div class="felirat">cím</div></td><td><input type="text" class="cim"  /></td>
	</tr>
	<tr>
		<td><div class="felirat">privát</div></td><td><input type="text" class="cim"  /></td>
	</tr>
</table>
	 <textarea name="megjegyzes" id="megjegyzes" cols="25" rows="3"></textarea>
</div>

<!--file listazo div  -->
<div id="fileid_" class="listakontener">
	<div  class="ikondiv torol" onclick="torol('userek/100/62/615074_n.jpg','file')">
		<img  class="" width="24px" height="24px" src="http://proba.infolapok.hu/kepek/64/torol_ikon.png">
	</div>	
	<div  class="listadiv" onclick="kijelol('fileid_2','userek/100/62/','615_39n.jpg');">
		<div class="listathumb">
			<img id="kepalap" class="listakep" src="">
		</div>
		<div  id="lista1">
		<div  id="listanevalap" onclick="jjj" class="listanev"><script type="text/javascript">var id='sasga'</script> &{mmm.id};	
		</div></div>
	</div>
</div>

			
</div>
<div style="clear:both;"></div>
<div id="info">	
</div>	
	<script type="text/javascript">
	
	
	
//***************************GLOBÁLIS VÁLTOZÓK**********************************

var get_fo=<?php echo "'".$_GET['fo']."';";?>;
var get_nav=<?php echo "'".$_GET['nav']."';";?>;
var host=<?php echo "'".$_SERVER['HTTP_HOST']."';";?>;
var inputmezo=<?php echo "'".$_GET['inputmezo']."';";?>;
var editor=<?php echo "'".$_GET['editor']."';";?>;
var filetemp=''; // szerkesztés előtt ide menti a file div tartalmát
var beszur_num=1;
var jelolt='';

//var nav_tomb = new Array();
//var dir_tomb= new Array();	
var file_tomb = new Array();//associativ tömb a fájlok tartalmazó div-ek azonosítóival	
var mappa = '';	
//var path = '';	
var aktiv_task = '';
var json_tomb = new Array();	
var kijelolt_tomb = new Array();
//***************************************************************
function beszur2(){
if(inputmezo!=''){
window.parent.document.getElementById(inputmezo).value = jelolt;
}else{
//$('#box').insertAtCaret("[Before selection]", "[after]");  
parent.html_beszur(jelolt); 
}
parent.modal_bezar();
}

$(document).ready(function(){ 
listafrissit();	 
//upload();
});
//******************* NÉZETEK ************************************************

// file--------------------------------------------------------	

function file_megjelenit(id2,path,nev){
//alert('hhhhhhhhhh');
 //if(typeof(id2)==='undefined') id2 = 800; 
d=$('<div/>', { id:'fileid_'+id2,'class':'listakontener'});
	$('<div/>',{ id: 'ikonlistazo_'+id2, 'class':'ikonlistazo'}).appendTo(d);
	$('<div/>',{ id: 'listadiv_'+id2, 'class':'listadiv'}).appendTo(d); 
		//.click(function(){kijelol(id,path,nev);});
		$('<div/>',{ id: 'listathumb_'+id2, 'class':'listathumb'}).appendTo(d.children('#listadiv_'+id2))
			.html('<img id="kepalap" class="listakep" src="'+path+nev+'">');
		$('<div/>',{'class':'listanev'}).appendTo(d.children('#listadiv_'+id2))
			.html(nev);	
//alert(d);	 		
return d;
}
function file_megjelenit_lista(id,path,nev){
var d3 =file_megjelenit(id,path,nev);
	if(get_fo=='sajat'){
	$(torol_ikon(id,path,nev)).appendTo(d3.children('#ikonlistazo_'+id));
	}
//$(d3.children('#listadiv_'+id)).click(function(){kijelol(id,path,nev);});
 //$(d3).find('.listanev').click(function(){kijelol(id,path,nev);});
	  $(d3).find('#listadiv_'+id).click(function(){kijelol(id,path,nev);});
return d3;	
}
function file_megjelenit_kijelolt(id,path,nev){
d3=file_megjelenit(id,path,nev);
 $(d3).find('#ikondiv_'+id).click(function(){alert(id,path,nev);});
 $(szerkeszt_ikon(id,path,nev)).appendTo($(d3).find('.ikonlistazo'));
 $(pub_ikon(id,path,nev)).appendTo($(d3).find('.ikonlistazo'));
return d3;	
}
function file_szerkeszt(id,path,nev){ 
//var filetemp=$('#fileid_'+id+'jelolt').html();
//alert('#fileid_'+id);
$('#fileid_'+id).css({"width": "100%" ,"height": "120px"});
$('#szerkeszt_'+id).remove();
$('#pub_'+id).remove();
 $(ment_ikon(id,path,nev)).appendTo($('#fileid_'+id).find('.ikonlistazo'));
 var form=$('#szerk_form').clone(true).attr('id','szerk_form'+id);
  //var form=$('#szerk_form').html();
 $('#fileid_'+id).find('.listadiv').css('float','left');
 $(form).insertAfter($('#fileid_'+id).find('.listadiv'));
 $('#gg_'+id).html(form);
//$('#fileid_'+id.find('.ikonlistazo')).css( "width", "100%" );
return d3;	
}
function file_szerkesztment(id,path,nev){
$('#'+id).html(filetemp);
}

//könyvtár---------------------------------------------------------
function dir_megjelenit(id,path,nev){
d=$('<div/>', { id:id+nev, 'class':'listakontener'});
$('<div/>').appendTo(d).attr('class','ikonlistazo');
$('<div/>',{ 'class':'listadiv'}).appendTo(d); 
	$('<div/>',{'class':'listathumb'}).appendTo($(d).find('.listadiv'))
			.html('<img id="kepalap" class="listakep" src="kepek/64/dir.png">');
		$('<div/>',{'class':'listanev'}).appendTo($(d).find('.listadiv'))
			.html(nev);	
if(get_fo=='sajat'){
	$(torol_ikon(id,path,nev)).appendTo($(d).find('.ikonlistazo'));
	}
 $(d).find('.listadiv').click(function(){betolt(nev);});	
return d;
}
//ikon-------------------------------------------------------------
function torol_ikon(id,path,nev){

ddd=$('<div/>',{ id: 'torol_'+id, 'class':'ikondiv'})
	.html('<img  width="24px" height="24px" src="/kepek/64/torol_ikon.png">')
	.click(function(){torol(path+nev,'file');})
	;
return ddd;			
}	
function ment_ikon(id,path,nev){

ddd=$('<div/>',{ id: 'ment_'+id, 'class':'ikondiv'})
	.html('<img  width="24px" height="24px" src="/kepek/64/save.png">')
	.click(function(){alert('ment');})
	;
return ddd;			
}
function szerkeszt_ikon(id,path,nev){

ddd=$('<div/>',{ id: 'szerkeszt_'+id, 'class':'ikondiv'})
	.html('<img  width="24px" height="24px" src="/kepek/64/edit.png">')
	.click(function(){file_szerkeszt(id,path,nev);})
	;
return ddd;			
}
function pub_ikon(id,path,nev){

ddd=$('<div/>',{ id: 'pub_'+id, 'class':'ikondiv'})
	.html('<img  width="24px" height="24px" src="/kepek/64/unpublished_64.png">')
	.click(function(){alert('file');})
	;
return ddd;			
}	
// listázás***************************************************************
function lista_megjelenit(){
// listázó tömb  tartalmának törlése---------------
$('#filelistazo').html('');
// ha almappában vagyunk 'fel' ikon megjelenítése
if(json_tomb.nav!='')
{$('#filelistazo').html('<div id="fel-ikon" onclick="betolt(\'fel_ufdhtgdalnnruz\');" class="listadiv"><div class="listathumb"><img class="listakep" src="http://'+host+'/kepek/64/dir_fel.png"/></div><div class="listanev">Fel</div></div>');}
//könyvtárak megjelenítése---------------------------------------
	for(var a = 0, n = json_tomb.dir.length; a < n; a++){
	if(json_tomb.dir[a]=='thumb' || json_tomb.dir[a]=='ikon' ){} //ezeket nem jeleníti meg
	else{$('#filelistazo').append(dir_megjelenit(a,json_tomb.path,json_tomb.dir[a]));}
	}
//fileok megjelenítése---------------------------------------	
	for(var a = 0, n = json_tomb.file.length; a < n; a++){
	$('#filelistazo').append(file_megjelenit_lista(a,json_tomb.path,json_tomb.file[a]));
	//$('#filelistazo').append(json_tomb.path);
	file_tomb[a]={'div_id': 'fileid_'+a,'path_nev':json_tomb.path+json_tomb.file[a]}
	}
}
//task ablakai közötti váltás-----------------------------------------------
function valto(osztaly,kivetel){
$('.'+osztaly).css( "display", "none" );
	if($.isArray(kivetel)){
	for(var a = 0, n = kivetel.length; a < n; a++){
			$('#'+kivetel[a]).css( "display", "block" );
		}
	}else{
	$('#'+kivetel).css( "display", "block" )
	}	
if(kivetel=='feltolt'){upload(); aktiv_task='feltolt';}else{aktiv_task='kivalaszt';}
}	
//*********************** JSON ************************************

function listafrissit(){
cim='/index.php?com=media&ftask=listazo&keret=json&fo='+get_fo+'&nav='+get_nav;
succes_function=function(data2){
	json_tomb=data2 ;
	get_fo=	json_tomb.fo;
	get_nav=json_tomb.nav;
	lista_megjelenit();
	}
adatker(succes_function,cim);
if(aktiv_task=='feltolt'){upload();}
};	
	
//***********************FILE KEZELÉS****************************
//új mappa----------------------------------------
function ujmappa(mappa){
var ujmappanev=$('#ujmappa_input').val();
var kuldadat={'dirnev': ujmappanev };
cim='/index.php?com=media&task=ujmappa&ftask=listazo&keret=json&fo='+get_fo+'&nav='+get_nav;
//cim='/com/media/listazo.php?fo='+get_fo+'&nav='+get_nav+'&task=ujmappa'
succes_function=function(data2){
	json_tomb=data2 ; 
	get_fo=	json_tomb.fo;
	get_nav=json_tomb.nav;
	//$('#info').html('<div>kuldott:'+data2.kuldott+'</div>');
	lista_megjelenit();
	}
		
adatker(succes_function,cim,kuldadat);
};
//törlés------------------------------------------------------------
function torol(path,tipus){
 if(typeof(tipus)==='undefined') tipus = 'file';
 if(tipus == 'file'){var megerosit='Biztos hogy törölni akarod a '+path+' filet? ';
 }else{var megerosit='Biztos hogy törölni akarod a '+path+' könyvtárat és teljes tartalmát? ';}
 
 if (confirm(megerosit)) {
		cim2='/index.php?com=media&task=torol&ftask=listazo&keret=json&fo='+get_fo+'&nav='+get_nav;	
		 //cim2='/com/media/listazo.php?fo='+get_fo+'&nav='+get_nav+'&tipus='+tipus+'&task=torol';
		 var kuldadat2={'filetorol': path};
		succes_function2=function(data2){
		json_tomb=data2 ; 
		get_fo=	json_tomb.fo;
		get_nav=json_tomb.nav;
		lista_megjelenit();
		};
		
	adatker(succes_function2,cim2,kuldadat2);
		//alert('törölve');
    }
	//return false;
}

//mappa navigálás------------------------------------------					
function betolt(mappa){
if(mappa=='fel_ufdhtgdalnnruz'){json_tomb.nav_tomb.pop();
}else if (mappa=='sajat_ufdhtgdalnnruz'){
get_fo='sajat'; json_tomb.nav_tomb.length = 0;
}else if (mappa=='kozos_ufdhtgdalnnruz'){
get_fo='kozos'; json_tomb.nav_tomb.length = 0;
}else{
json_tomb.nav_tomb.push(mappa);
}

get_nav = json_tomb.nav_tomb.join('/');

//alert('gg'+get_nav);
listafrissit();
valto('taszkos','taskok');
//lista_megjelenit();
}

//$.fn.kijelol = function(filenev,path){--- ---------------------	
function kijelol(div_id,path,nev){
var path_nev = path+nev;
if( beszur_num==1){
 $('#taskok').html(file_megjelenit_kijelolt(div_id+'_jelolt',path,nev));
jelolt=path_nev;
$('.listakontener').css({'background-color':''});
$('#fileid_'+div_id).css({'background-color':'orange','font-weight':'bold'});
}else{
var kivoltjelolve = 'nem';
for(var a = 0, n = kijelolt_tomb.length; a < n; a++)
{
	if(kijelolt_tomb[a]['path_nev']==path_nev){
	kivoltjelolve = 'igen'; kijelolt_tomb.splice(a, 1);
		$('#fileid_'+div_id+'_jelolt').remove();
		$('#fileid_'+div_id).css({'background-color':'','font-weight':'bold'});
	}

}
	if(kivoltjelolve == 'nem'){
		kijelolt_tomb.push({'div_id': 'fileid_'+div_id+'_jelolt','path_nev':path_nev}); $('#taskok').append(file_megjelenit_kijelolt(div_id+'_jelolt',path,nev));
		$('#fileid_'+div_id).css({'background-color':'orange','font-weight':'bold'});
	if(kijelolt_tomb.length > beszur_num){// ha kijelölés korlátozás van megadva törli a kijelolt tömb első elemét és a hozzá tartozó divet	
	}
	}
}}

//************************* FELTÖLTÉS**********************************************
function  upload(){
			$('#file_upload').uploadify({
				'formData'     : {
					'timestamp' : '<?php echo $timestamp;?>',
					'path'     : json_tomb.path
				},
				'onQueueComplete' : function(queueData){
	          listafrissit();
				},
				'onUploadSuccess' : function(file, data, response) {
				var d = new Date();
				var n = d.getTime(); 
				$('#feltolt').append(file_megjelenit_kijelolt(n,json_tomb.path,file.name));
				//alert('The file ' + file.name + ' was successfully uploaded with a response of ' + n + ':' + data);
				} ,
				'swf'      : 'com/media/uploadify/uploadify.swf',
				'uploader' : 'com/media/uploadify/uploadify.php'
			});
		};

		
// csak hibakeresésre van, változókat ír ki az info divbe--------------------------------------
function adat_megjelenit(){
$('#info').html('<div>jelolt:'+jelolt+'</div>');
}


			
	</script>
	
</body>
</html>