<script type="text/javascript">
$( document ).ready(function() {
// Handler for .ready() called.

$( "#elkuld").click(function() {
//alert('hhhhhhhh');
$('#szoveg').val($('#szerkeszto').html());
$("#kep_form").submit(); return false;
});
});
</script>

<?php
include_once 'lib/ikonok.php';

class Media{

public $dir=null;
public $tabla='files';

function __construct()	
{
$this->dir=UserAdatok::dir();
}
 function szerk(){ 
 $sql="select * from files where id='".$_GET['id']."'";
$adatok=Lekerdez::assoc_sor($sql);
//print_r($adatok);
echo '<div id="elkuld" style="position:relative;left:-200px;">'.Ikon::ment($id,32).'</div>';
echo '<div style="clear:both;"></div>';
echo '<h1>Kép szerkesztés</h1>	
<img id="foto_elonezet" src="'.$adatok['dir'].'thumb/'.$adatok['file_nev'].'" height="200" width="200" />
<form id="kep_form" action="'. Link::get_cserel($_SERVER['REQUEST_URI'],'task=ment&id='.$adatok['id']).'" method="POST">
<table align="left" border="0" cellspacing="0" cellpadding="3">
<tr><td>Név:</td><td><input type="text" name="cim" size="50" maxlength="50" value="'.$adatok['cim'].'"></td><td></td></tr>
<tr><td>Kategóriák:</td><td><input type="text" size="50" name="meta" maxlength="200" value="'.$adatok['meta'].'"></td><td></td></tr>
<tr><td>Leiras:</td><td><textarea name="intro" rows="4" cols="50">'.$adatok['intro'].'</textarea></td><td></td></tr>
</table>
</form>';
//</br><input type="submit" value="feltolt">
 }
  function torol($id){ 
global $userid; 
$sql="SELECT file_nev,tip FROM ".$this->tabla." WHERE id='".$_GET['id']."'";
$fileadat=Lekerdez::assoc_sor($sql);
if($fileadat['tip']=='kep')
{
unlink($fileadat['dir'].$fileadat['file_nev']);
unlink($fileadat['dir'].'thumb/'.$fileadat['file_nev']);
}
if($fileadat['tip']=='video')
{
unlink($fileadat['dir'].$fileadat['file_nev']);

}
 $sql="DELETE FROM ".$this->tabla." WHERE id = $id";
 Lekerdez::parancs($sql);
 //$this->listaz();
 }
  function ment(){ 
 Feltolt::update_ment($this->tabla,'cim,meta,intro',$_GET['id']);
 
 }
  function listaz(){ 
global $userid,$jog;
if($jog['admin']==true){$sql="SELECT * FROM ".$this->tabla ;}else{$sql="SELECT * FROM ".$this->tabla." WHERE user_id='$userid'";}
$adattomb=Lekerdez::assoc_tomb($sql);
$listazo= new ListazoWiev;
if($_GET['beszur']==''){$listazo->feltolt_wiev();}
if(!empty($adattomb)){
foreach ($adattomb as $adatok){
if($_GET['beszur']==''){
 if($adatok['tip']=='kep'){$listazo->kep_megjelenit($adatok);}
 if($adatok['tip']=='video'){$listazo->video_megjelenit($adatok);}
 }
 else
 {
  if($adatok['tip']=='kep'){$listazo->kep_beszur($adatok);}
 //if($adatok['tip']=='video'){$listazo->video_megjelenit($adatok);}
 
 }
 }
 }
 
 }
 }
 
 ?> 

