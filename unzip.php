<?php //http://menkuotto.infolapok.hu/unzip.php?kitomorit=alap_2013_12_28.zip
//gyoker.infolapok.hu/astro/unzip.php?kitomorit=asztro2.zip
$kitomorit=$_GET['kitomorit'];
$zip = new ZipArchive;
$res = $zip->open('/astro/asztro.zip');
if ($res === TRUE) {
  $zip->extractTo('/astro');
  $zip->close();
  echo 'woot!';
} else {
  echo 'doh!';
}

?>