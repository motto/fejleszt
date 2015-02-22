<?php
 //defined( '_MOTTO' ) or die( 'Restricted access' );
global $keret;
$keret->head_tomb['js'][]='app/com/media/multi_up.js';

//print_r($js_tomb);ű

?> 
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
		<img  class="" width="24px" height="24px" src="kepek/64/torol.png">
	</div>	
	<div  class="listadiv" onclick="kijelol();">
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

var get_dir=<?php echo "'".$_GET['d']."';";?>; //dir
var get_nav=<?php echo "'".$_GET['nav']."';";?>;
var host=<?php echo "'".$_SERVER['HTTP_HOST']."';";?>;
var inputmezo=<?php echo "'".$_GET['inputmezo']."';";?>;
var editor=<?php echo "'".$_GET['editor']."';";?>;
var filetemp=''; // szerkesztés előtt ide menti a file div tartalmát
var beszur_num=1;
var jelolt='';

