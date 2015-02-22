var kep_tmp ='';
var kep1 ='';
var kep2 = ''; 
var kep3 = '';
var pontszam=0;
$.fn.villog = function() {
	for($i=1; $i<5; $i++){
	this.fadeTo(100, 0.1).fadeTo(200, 1.0); 
	}
} 
function polg_vk(vkk){
var vk='. vk';
if(vkk=='Polgármester jelölt'){vk='';}
return vk;
}
function slot_vk(vkk){
var vk=vkk;
if(vkk=='Polgármester jelölt'){vk='';}
return vk;
}
function porget(){  
$.ajax({
type: "POST",
url: "com/slot/json.php?task=porget",
dataType: "text",
scriptCharset: "utf-8" ,
data: { "sav": "ossz"} 
}).done(function(data22){
	data33 = JSON.parse(data22);
setTimeout(function(){$('#sav1').html('<image style="margin:0px;" src="/com/slot/img/'+data33.kep1+'"/><div class="vk">'+slot_vk(data33.vk1)+'</div>');},500);	
setTimeout(function(){$('#sav2').html('<image style="margin:0px;" src="/com/slot/img/'+data33.kep2+'"/><div class="vk">'+slot_vk(data33.vk2)+'</div>');},700);	
setTimeout(function(){$('#sav3').html('<image style="margin:0px;"  src="/com/slot/img/'+data33.kep3+'"/><div class="vk">'+slot_vk(data33.vk3)+'</div>');},100);
setTimeout(function(){


$('#nev1').html(data33.nev1+' '+data33.vk1+polg_vk(data33.vk1));
if(data33.csoport1=='s' ){$('#nev1').css("color","red").villog();}else{$('#nev1').css("color","")}
$('#nev2').html(data33.nev2+' '+data33.vk2+polg_vk(data33.vk2));
if(data33.csoport2=='s' ){$('#nev2').css("color","red").villog();}else{$('#nev2').css("color","")}
$('#nev3').html(data33.nev3+' '+data33.vk3+polg_vk(data33.vk3));
if(data33.csoport3=='s' ){$('#nev3').css("color","red").villog();}else{$('#nev3').css("color","")}
if(data33.csoport1==data33.csoport2 && data33.csoport2==data33.csoport3){if(data33.csoport1!='s'){$('#nev1').villog();$('#nev2').villog();$('#nev3').villog();}}

$('#uzeno').html(data33.uzenet+'<div> pontszám: '+data33.pont+'</div>');
pontszam=pontszam+parseInt(data33.pont);
$('#pontszam').html(pontszam);
},1200); 
	
//if(data33.csoport=='s'){$('#sav'+data33.i).css('border-color','blue');
});
}
/*
function uzenet_ker(){  
 var t=$('#sav').html();
$.ajax({
type: "POST",
url: "json.php?task=uzenetker",
dataType: "text",
scriptCharset: "utf-8" ,
data: { "kep1": t} 
}).done(function(data22){
	data33 = JSON.parse(data22);
$('#uzeno').html(data33.uzenet);
});
}
*/



function start_slot( ) {

$('#sav1').html('');
$('#sav2').html('');
$('#sav3').html('');
//setTimeout(porget(1),1000);
porget();
}
	