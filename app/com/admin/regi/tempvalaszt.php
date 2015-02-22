<?php

$db =& JFactory::getDBO();
$session = JFactory::getSession();
echo '<h3>Kattints rá a megfelelő kinézetre!</h3>';
//echo '(Ha ne változik a weblap frissítsd az oldalt!)';
$nemkell=array('beez','rhuk_milkyway','system','sarok3_flash_kf_piros','ja_purity','Untitled','Untitled2','cukisag_1');
$dirname='templates';	
	$dir_handle = opendir($dirname);
		while($file = readdir($dir_handle)) {
				if ($file != "." && $file != "..")
				{
						if (is_dir($dirname."/".$file))  // ha könyvtár akkor megjeleníti a benne lévőthumbnailt
						{
							if(!in_array($file,$nemkell))
							{
							echo '<div style="float:left;margin:3px;border-style:solid;
	border-width:1px; height:165px; width:204px; overflow:hidden;">';	
							echo '<a href="index.php?option=com_admin&fcsid=profil&csid=a4&ftask=tempvalaszt&webhelyid='.$_GET['webhelyid'].'&skin='.$file.'&ajanlo='.$ugyfelid.'"><image src="'.$dirname.'/'.$file.'/template_thumbnail.png "/></a>';
							echo $file;
							echo '</div>';
							}
						}
				}
				//else
						//deldir($dirname.'/'.$file);  // ha könyvtár, meghívja saját magát és így tovább...
				//}
		}
		closedir($dir_handle);

?>			    		    