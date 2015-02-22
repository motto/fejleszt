<!DOCTYPE html>
<html dir="ltr" lang="hu-HU">
<head>

    <meta charset="utf-8">
    <title>Admin</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
    <link rel="stylesheet" href="/com/admin/template/style.css" media="screen">
	<?php  $keret->fejlec_general();?>	
<meta name="keywords" content="Keywords">

	<style>.art-content .art-postcontent-0 .layout-item-0 { border-top-width:1px;border-top-style:solid;border-top-color:#B5C5C9;margin-top: 5px;margin-bottom: 5px;  }
	.art-content .art-postcontent-0 .layout-item-1 { padding-right: 10px;padding-left: 10px;  }
	.ie7 .post .layout-cell {border:none !important; padding:0 !important; }
	.ie6 .post .layout-cell {border:none !important; padding:0 !important; }

	</style>
</head>
<body>
<div id="art-main">
<header class="art-header clearfix">
<div class="art-shapes">
<h1 class="art-headline" data-left="47.64%">
 <a href="#">Adminisztráció</a>
</h1>
</div>
</header>
<nav class="art-nav clearfix">
    <div class="art-nav-inner">
    <ul class="art-hmenu">
	<!-- <li><a href="home.html" class="active">Saját adatok</a></li>-->
	<li><a href="index.php?com=admin&ftask=cikkek" class="<?php if($_GET['ftask']=='cikkek') echo 'active';?>">Cikkek</a></li>
<li><a href="index.php?com=admin&ftask=userek" class="<?php if($_GET['ftask']=='userek') echo 'active';?>">Felhasználók</a></li>
<li><a href="index.php?com=admin&ftask=useradatok" class="<?php if($_GET['ftask']=='useradatok') echo 'active';?>">User adatok</a></li>
<li><a href="index.php?com=media&keret=0" class="<?php if($_GET['com']=='media') echo 'active';?>">Média</a></li>
	<!-- <li><a href="index.php?com=admin&ftask=pages">Lapok</a></li>-->
	<!-- <li><a href="index.php?com=admin&ftask=menus">Menük</a></li>-->
	<!-- <li><a href="index.php?com=admin&ftask=html">html</a></li>-->
	<!-- <li><a href="index.php?com=admin&ftask=aruk">Áruk</a></li>-->
	<!-- <li><a href="index.php?com=admin&ftask=galleris">Galériák</a></li>-->
	</ul> 
        </div>
    </nav>
<div class="art-sheet clearfix"><div class="art-layout-wrapper clearfix"><div class="art-content-layout"> 
<div class="art-content-layout-row">
<!-- balsáv------------------------------------------------------
<div class="art-layout-cell art-sidebar1 clearfix"><div class="art-block clearfix">
<div class="art-blockcontent"><div>
  <form action="#" class="art-search" method="get" name="searchform">
    <input type="text" value="" name="s" />
    <input type="submit" value="Search" name="search" class="art-search-button" />
  </form>
</div></div>

<div class="art-blockcontent"><p>Enter Block content here...</p>
	</div>
</div></div>
------>
<!-- tartalom------------------------------------------------------------>
<div class="art-layout-cell art-content clearfix">
<article class="art-post art-article">
                                
                                                
    <div class="art-postcontent art-postcontent-0 clearfix"><div class="art-content-layout">
    <div class="art-content-layout-row">
 
	  <?php global $tartalom; echo $tartalom;?>
    </div>
    </div>
                                                           
</article>
</div>
<!-- jobbsáv-------------------------------------------
<div class="art-layout-cell art-sidebar2 clearfix"><div class="art-block clearfix"></div>
<div class="art-block clearfix">
<div class="art-blockcontent"><div>
  <p>Lorem ipsum dolor sit amet. Nam sit amet sem. Mauris a ante.</p>
 
</div></div>
</div><div class="art-block clearfix">
        <div class="art-blockcontent"><div>
 
</div></div>
</div></div>
----->
</div> </div></div></div>
<footer class="art-footer clearfix">
  <div class="art-footer-inner">
<p>powered by M.Otto<a href="http://infolapok.hu/">infolapok.hu</a></p>
<p>Copyright © 2012. All Rights Reserved.</p>
<p><br></p>

 </div>
</footer>

</div>


</body></html>