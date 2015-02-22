<?php
class ListazoWiev {
public $link="index.php?com=media";
public $user_dir=null;
public $beszur=null;
public $beszur_mezo_id=null;

function __construct()	
{
$this->link=Link::kiszed($_SERVER['REQUEST_URI'],'task,tip,id');
$this->user_dir=UserAdatok::dir();
}

function feltolt_wiev(){ ?> 
<div id="upcontener"></div>
<div id="gombkontener">
    <div class="row">
      <label for="fileToUpload">File feltöltés:</label>
      <!--<input type=file multiple name="fileToUpload" id="fileToUpload" onchange="fileSelected();"/>-->
	   <input type="file" multiple="true"  name="fileToUpload" id="fileToUpload" onchange="fileSelected();" />
	    <input type="button" onclick="feltolt()" value="Feltöltés" />
    </div>
 </div> 
    
   <div style="display:none;">
		<div id="upalap" class="upalap" style="float:left;height:120px;width:100px; margin:5px; border:1px;border-style:solid;border-width:1px;" >
			<div class="upkep"><img width="100px" height="100px" class="upikon" src=""/></div>
			<div class="progressNumber"><progress id='' class="pr" max="100" value="10"></progress></div>
		</div>
	</div>

<?php } 
 function kep_szerkeszt($adatok)
 { ?> 
<div id="listakontener_<?php echo $adatok['id']; ?> " class="listakontener" >
	<div  class="ikondiv torol" onclick="torol('<?php echo $adatok['id']; ?> ','kep')">
		<img  class="" width="24px" height="24px" src="/kepek/64/torol_ikon.png">
	</div>
	<div  class="ikondiv szerk " onclick="szerkeszt('<?php echo $adatok['id']; ?> ','kep')">
		<img  class="" width="24px" height="24px" src="/kepek/64/torol_ikon.png">
	</div>		
	<div  class="listadiv" onclick="">
		<div class="listathumb">
			<img id="kepalap" class="listakep" src="">
		</div>
		<div  id="lista1">
		<div  id="cim" class="kepcim">	</div>
		</div>
	</div>
</div>
<?php } 

function video_megjelenit($adatok){ ?> 
<div id="listakontener_<?php echo $adatok['id'];?> " pp="id" class="listakontener">
	<div  class="ikondiv" pp="torol" onclick="">
		<a href="<?php echo Link::get_cserel($_SERVER['REQUEST_URI'],'task=torol&tip=video&id='.$adatok['id']);?>" onclick="return confirm('Az igen gombra kattintva, végérvényesen törlődik a file!')">
			<img  class="" width="24px" height="24px" src="kepek/16/torol.png">
		</a>
	</div>
	<div  class="ikondiv " pp="szerk" onclick="">
		<a href="<?php echo Link::get_cserel($_SERVER['REQUEST_URI'],'task=szerk&tip=video&id='.$adatok['id']);?>">
			<img  class="" width="24px" height="24px" src="kepek/16/edit.png">
		</a>	
	</div>		
	<div style="clear:both"></div>
		<div class="listathumb"  onclick="modal_nyit_media('<?php echo $this->dir.'/videok/'.$adatok['file_nev'];?> ',video,600,600);"  >
		<video src="<?php echo $adatok['dir'].$adatok['file_nev'];?> " width="100" height="100" controls preload></video>
		</div>
		<div >
		<div pp="nev"  id="cim" class=""><?php echo $adatok['cim'];?> 	</div>
		</div>
	
</div>
<?php } 

function kep_megjelenit($adatok){ ?> 
<div id="listakontener_<?php echo $adatok['id'];?> " pp="id" class="listakontener">
	<div  class="ikondiv" pp="torol" onclick="">
		<a href="<?php echo Link::get_cserel($_SERVER['REQUEST_URI'],'task=torol&tip=kep&id='.$adatok['id']);?>" onclick="return confirm('Az igen gombra kattintva, végérvényesen törlődik a file!')">
			<img  class="" width="24px" height="24px" src="kepek/16/torol.png">
		</a>
	</div>
	<div  class="ikondiv " pp="szerk" onclick="">
		<a href="<?php echo Link::get_cserel($_SERVER['REQUEST_URI'],'task=szerk&tip=kep&id='.$adatok['id']);?>">
			<img  class="" width="24px" height="24px" src="kepek/16/edit.png">
		</a>	
	</div>		
	<div style="clear:both"></div>
		<div class="listathumb" onclick="modal_nyit_kep('<?php  echo $adatok['dir'].$adatok['file_nev'];;?> ',600,600);"  >
			<img pp="sr" id="kepalap" class="listakep" src="<?php echo $adatok['dir'].'thumb/'.$adatok['file_nev'];?> ">
		</div>
		<div >
		<div pp="nev"  id="cim" class=""><?php echo $adatok['cim'];?> 	</div>
		</div>
	
</div>


<?php } 

function kep_beszur($adatok){ ?> 
<div id="listakontener_<?php echo $adatok['id'];?> " pp="id" class="listakontener">
<?php if ($_GET['editor']==''){$beszur="parent.beszur('".$adatok['dir'].$adatok['file_nev']."','".$_GET['beszur']."');";}else{$beszur="parent.editor_beszur('".$adatok['dir'].$adatok['file_nev']."');";} ?>
		<div class="listathumb" onclick="<?php echo  $beszur;?> parent.modal_bezar();"  >
			<img pp="sr" id="kepalap" class="listakep" src="<?php  echo $adatok['dir'].'thumb/'.$adatok['file_nev'];?> ">
		</div>
		<div >
		<div pp="nev"  id="cim" class=""><?php echo $adatok['cim'];?> 	</div>
		</div>
	
</div>



<?php } }?> 
			



