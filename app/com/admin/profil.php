<?php 
GOB::$head_tomb['js'][]='lib/js/jquery-1.9.1.min.js';
GOB::$head_tomb['js'][]='app/pluginok/popup/modal/modal.js';
GOB::$head_tomb['css'][]='app/pluginok/popup/modal/modal.css';
$userid=GOB::get_user('id');
function alap($adatok){
?>
<script type="text/javascript">
function beszur(kep,mezo){
$('#'+mezo+'_elonezet').attr('src',kep);
$('#'+mezo).val(kep);
}

</script>	
	<a href="index.php?com=login&login=valtoztat&tmpl=admin" class="active">regisztrációs adatok</a>	   		
<h1>Alap adatok</h1>	
<img id="foto_elonezet" src="<?php echo $adatok['foto']; ?>" height="200" width="200" />
<form action="index.php?com=admin&ftask=profil&task=ment" method="POST">
<table align="left" border="0" cellspacing="0" cellpadding="3">
<tr><td>Nyitó kép:</td><td><input type="text" id="foto" name="foto" maxlength="30" value="<?php echo $adatok['foto']; ?>"></td><td>
<div class="modal"  onclick="modal_nyit_link('index.php?com=media&keret=0&beszur=foto',600,600);" >képválaszt</div>
</td></tr>
<tr><td>Név:</td><td><input type="text" name="name" maxlength="30" value="<?php echo $adatok['name']; ?>"></td><td></td></tr>
<tr><td>Publikus név:</td><td><input type="text" name="pubnev" maxlength="30" value="<?php echo $adatok['pubnev']; ?>"></td><td></td></tr>
<tr><td>Bemutat:</td><td><textarea name="leiras" rows="4" cols="50"><?php echo $adatok['leiras']; ?></textarea></td><td></td></tr>

<tr><td>Címkék:</td><td><input type="text" name="cimke" maxlength="50" value="<?php echo $adatok['cimke']; ?>"></td><td></td></tr>
</table>
</br><input type="submit" value="feltolt">
</form>
<?php }


$sql="SELECT * FROM userek WHERE id='$userid'";

switch ($_GET['task']){
	case 'ment':
//Feltolt::update_ment('userek','foto,name,pubnev,leiras,cimke',$userid);
$adatok=DB::assoc_sor($sql);
alap($adatok);
			break;
	case 'szerk':

			break;
	default:
 	$adatok=DB::assoc_sor($sql);
	alap($adatok);
	
}
?>	
