<?php
function fb_alap($app_id='218324098211541'){
?>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/hu_HU/all.js#xfbml=1&appId=<?php echo $app_id; ?>";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<?php
}

function fb_sav(){
global $param;
if($param['fb']!=true){fb_alap($param['fb_app_id']); $param['fb']=true;}
?>
<div class="fb-like" data-href="" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
<div class="fb-comments" data-href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']; ?>" data-width="<?php echo $param['fb_width']; ?>" data-numposts="<?php echo $param['fb_num-posts']; ?>" data-colorscheme="light"></div>
<?php
}
function cikk_megjelenit_full($adat_tomb){
?>
<div id="cikk_<?php echo $adat_tomb['id'];?>" class="cikk" style="overflow:hidden;position: relative" tip="rtext" >
	<h1><?php echo $adat_tomb['cim'];?></h1>
	<div id="rtext_intro<?php echo $adat_tomb['id'];?>" style="min-height:50px;font-height:20px" class="rtext_intro mezo szerk"><h3>
	<?php echo $adat_tomb['intro'];?></h3></div>
	<div id="rtext_html<?php echo $adat_tomb['id'];?>" style="min-height:50px;font-height:20px" class="rtext_html mezo szerk"><div id="aru_foto_contener_<?php echo $adat_tomb['id'];?>" class="foto_contener" style="float:left;margin-right:10px;overflow:hidden;" ><img id="aru_foto_<?php echo $adat_tomb['id'];?>" src="<?php echo $adat_tomb['media'];?>" style="max-height:450px;max-width:350px;" alt=""  class="szerk" /></div>
	<?php echo $adat_tomb['szoveg'];?></div>
</div>
<?php
}

function admin_sav($tip,$adat_tomb){
?>
<div id="<?php echo $tip;?>_admin_<?php echo $adat_tomb['id'];?>" class="<?php echo $tip;?>_admin" style="">
<img src="<?php echo $adat_tomb['foto'];?>" class="admin_image" />
</div>
<?php
}

function cikk_megjelenit_lista($adat_tomb){
?>
<div id="cikk_ <?php echo $adat_tomb['id']; ?> " onclick="modal_nyit_link('index.php?com=cikk&id=<?php echo $adat_tomb['id']; ?>&tmpl=no',800,600);"  class="cikklista" tip="aruk" >
<div class="foto_contener" ><img src="<?php echo $adat_tomb['media'];?>" alt=""  class="foto szerk" /></div>
	<div  class="cim mezo szerk" ><center><?php echo $adat_tomb['cim'];?></center></div>
	<div  class="html">
		
		<div class="intro mezo szerk"><?php echo $adat_tomb['intro'];?></div><div class=""><?php echo substr($adat_tomb['szoveg'], 0, 400);?>...</div>
		
	</div>
		<div style="clear:both"></div>
</div>
<?php
}
?>
<style type="text/css">
.foto{
max-height:160px;
max-width:192px;
}
.foto_contener{
float:left;margin-right:10px;overflow:hidden;
}

.cim{
/*background-color: #f8f7f7;*/

text-align:center;
color: #4E74B1;
font-size: 20px;
font-weight: bold;
}
.cikklista{
cursor:pointer; overflow:hidden;position: relative;margin:5px;background-color: #fcfffa; padding: 20px; color: #27442a; font-size: 14px; line-height: 1.5em; -webkit-border-radius: 8px; -moz-border-radius: 8px; border-radius: 8px; -moz-box-shadow: 0px 0px 8px 0px #4E74B1; -webkit-box-shadow: 0px 0px 8px 0px #4E74B1; box-shadow: 0px 0px 8px 0px #4E74B1;
height:160px;
margin-bottom:10px;
}
.intro{
color: #21314A;
margin:10px;
font-size: 16px;
font-weight: bold;
height:auto;
}
</style>