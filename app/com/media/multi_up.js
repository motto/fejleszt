
var feltoltve=0; 
var feltolteni=0;
function setup_reader(file,i) {
    var name = file.name;
    var reader = new FileReader();  
    reader.onload = function(e) {  
     $('#upalap'+i).find('.upikon').attr('src', e.target.result);
    }
 reader.readAsDataURL(file);
}


function fileSelected(){
$('#upcontener').html('');
 var len = document.getElementById("fileToUpload").files.length;
 feltolteni=len;
for (var i = 0, len = document.getElementById("fileToUpload").files.length; i < len; i++) {
//document.getElementById('fileSize').innerHTML = document.getElementById("fileToUpload").files[i].name;
var ikon = $('#upalap').clone().attr('id', 'upalap'+i);
	$(ikon).find('.pr').attr('id', 'pr'+i);
	$(ikon).appendTo('#upcontener');  
		//$(ikon).attr('id', 'upalap'+i);
     setup_reader(document.getElementById("fileToUpload").files[i],i)  ;

       
  
}
//document.getElementById('fileSize').innerHTML = fileInput.files[i].name;
//alert(fileInput.files[i].name);
}
//var i2=0;  
 
function obi(i){
//var i=0;
var fd = new FormData();
		
		fd.append("fileToUpload", document.getElementById('fileToUpload').files[i]);
		//eval("fd"+i+".append('fileToUpload',fileInput.files[i])"); //fd.append("fileToUpload",fileInput.files[i]);
		 var xhr = new XMLHttpRequest();
		 //eval("xhr"+i+"=new XMLHttpRequest()");
		 xhr.upload.addEventListener("progress", uploadProgress, false);
		 
		  //eval("xhr"+i+".upload.addEventListener('progress', function(){ uploadProgress(evt,"+i+"); }, false)");
		 xhr.addEventListener("load", uploadComplete, false);
		// xhr.addEventListener("error", uploadFailed, false);
		// xhr.addEventListener("abort", uploadCanceled, false);
		 //eval("xhr"+i+".open('POST', 'uploadify.php')");
		 xhr.open("POST", "index.php?com=media&task=upload&keret=json");
		 xhr.send(fd);	
		 
function uploadProgress(evt) {
 /* A fájlművelet aktuális százalékértékének kiszámítása */
 if (evt.lengthComputable) {
 var percentComplete = Math.round(evt.loaded * 100 / evt.total);
 //document.getElementById('fileType').innerHTML = percentComplete.toString() + '%';
  $('#pr'+i).attr('value',percentComplete);
 }
 else {
// document.getElementById('fileType').innerHTML = 'nem kiszámithato';
 }
 }		 
function uploadComplete(evt) {
feltoltve++;
  $('#upalap'+i).remove();
if(feltoltve==feltolteni){location.reload(); }
 }	

}



function feltolt() {
var fileInput = document.getElementById("fileToUpload"); 
if (fileInput.multiple == true) {

    for (var i = 0, len = fileInput.files.length; i < len; i++) {
      var  dd= new obi(i);
		
		
    }
	

// only one file available
} else {
    var file = fileInput.files.item(0);
}}
 function uploadProgress(evt,i) {
 /* A fájlművelet aktuális százalékértékének kiszámítása */
 if (evt.lengthComputable) {
 var percentComplete = Math.round(evt.loaded * 100 / evt.total);
 document.getElementById('fileType').innerHTML = percentComplete.toString() + '%';
  $('#pr'+i).attr('value',percentComplete);
 }
 else {
 document.getElementById('fileType').innerHTML = 'nem kiszámithato';
 }
 }



 