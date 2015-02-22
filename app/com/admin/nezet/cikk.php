<?php 

//$alap_link=Link :: kiszed($_SERVER['REQUEST_URI'],'task,id');

//global $tmpl; $tmpl='templates/admin';
include 'app/pluginok/editor/editor.php';

echo '<div id="elkuld" style="position:relative;left:-200px;">'.Ikon::ment($id,32).'</div>';
echo '<div style="clear:both;"></div>';
$sql= "select * from menuk where pozicio='felsőmenü' and kategoria<>'' ";
$menu_tomb=Lekerdez::assoc_tomb($sql);
echo '<h1>Cikk szerkesztés</h1>	';
echo '<h3>Kattints arra a menüpontra  amelyikben meg szeretnéd jeleníteni a cikket:</h3>	';
foreach($menu_tomb as $menu){echo GyorsGomb::general($menu['kategoria'],$menu['nev']);}
echo '<div style="clear:both;"></div>';
?>
<script type="text/javascript">

function beszur(kep,mezo){
$('#'+mezo+'_elonezet').attr('src',kep);
$('#'+mezo).val(kep);
}

function editor_beszur(kep){
action1('inserthtml', '<img style="max-height:500px; max-width:500px; margin:20px;" src="/'+kep+'" align="left" >');
}
$( document ).ready(function() {
// Handler for .ready() called.

$( "#elkuld").click(function() {
//alert('hhhhhhhh');
$('#szoveg').val($('#szerkeszto').html());
$("#cikk_form").submit(); return false;
});
});
$( ".gomb").click(function() {
$(".gomb").css('color','black');
$('#'+this.id).css('color','red');
$('#kat').val(this.id);
});

</script>	
<style>   		
  table#mytable,
table#mytable td
{
    border: none !important;
}
</style>
<div style="cursor:pointer;color:white;float:left;height:220px; width:220px;background-color:black; margin:10px;" onclick="modal_nyit_link('index.php?com=media&keret=0&beszur=media',600,600);" ><img id="media_elonezet" src="<?php echo $adatok['media']; ?>"  style="max-height:210px;max-width:210px;"/>Kattints ide!</div>
<div class="modal" style="color:blue;font:size:18px;" onclick="modal_nyit_link('index.php?com=media&keret=0&beszur=media',600,600);" >Képválasztás ide kattintva,</div> Kép feltöltés, szerkesztés a média menüpontban lehetséges.
<form id="cikk_form" action="index.php?com=admin&ftask=cikkek&task=ment&id=<?php echo $_GET['id']; ?>" method="POST">
<table id="mytable" align="left" border="0" cellspacing="0" cellpadding="3">
<tr><td>Nyitó kép:</td><td><input type="text" id="media" name="media" style="width:500px;" maxlength="30" value="<?php echo $adatok['media']; ?>"></td></tr>
<tr><td>Cím:</td><td><input type="text" name="cim" size="35px" style="width:500px;" maxlength="50" value="<?php echo $adatok['cim']; ?>"></td></tr>
<tr><td>Bevezető:</td><td><textarea id="intro" rows="4" cols="50" name="intro"><?php echo $adatok['intro']; ?></textarea></td></tr>
<tr><td>Menüpont:</td><td><input type="text" style="width:500px;" id="kat" name="kat" maxlength="50" value="<?php echo $adatok['kat']; ?>"></td></tr>
<tr><td>sorrend:</td><td><input type="text" style="width:500px;" name="sorrend" maxlength="50" value="<?php echo $adatok['sorrend']; ?>"></td></tr>
</table>
<div  style="clear:both;"></div>
cikk:
<?php $szerkeszto= new Editor; $szerkeszto->tartalom=$adatok['szoveg']; $szerkeszto->general(); ?>
<input id="szoveg" type="hidden" name="szoveg" value="">
<!--<input id="pub" type="hidden" name="pub" value="<?php //echo $adatok['pub']; ?>">
</br><input type="submit" value="feltolt">-->
</form>

