<!DOCTYPE html>
<html dir="ltr" lang="hu-HU">
<head>
    <meta charset="utf-8">
    <title> <?php echo $title;?>	</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
  <link href='http://fonts.googleapis.com/css?family=Slackey' rel='stylesheet' type='text/css'/>
  <!--<link type="text/css" rel="stylesheet" href="css/reset.css" />-->
  <link type="text/css" rel="stylesheet" href="com/slot/css/slot.css" />
    <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
   <link rel="stylesheet" href="templates/sajat2/style.css" media="screen">
    <!--[if lte IE 7]><link rel="stylesheet" href="style.ie7.css" media="screen" /><![endif]-->
   <link rel="stylesheet" href="templates/sajat2/style.responsive.css" media="all">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Sans&amp;subset=latin">
	 <!--<script src="jquery.js"></script>
    <script src="script.js"></script>
    <script src="script.responsive.js"></script>-->
 <meta property= "og:image" content= "<?php echo $og_image;?>" />
  <meta property= "og:description" content= "<?php echo $og_description;?>" /> 
   <meta property= "og:title" content= "<?php echo $og_title;?>" /> 
     <meta property= "og:url" content= "<?php echo $og_url;?>" /> 
<?php
//$css_tomb[]='templates/sajat2/style.responsive.css';
//$css_tomb[]='templates/sajat2/style.css';
//$css_tomb[]='http://fonts.googleapis.com/css?family=Droid+Sans&amp;subset=latin';
//$js_tomb[]='pluginok/slider/nivo/jquery.nivo.slider.pack.js';
$keret->fejlec_general();
?>   
<style>.art-content .art-postcontent-0 .layout-item-0 { margin-bottom: 10px;  }
.art-content .art-postcontent-0 .layout-item-1 { border-right-style:solid;border-right-width:0px;border-right-color:#615D69; padding-right: 10px;padding-left: 10px;  }
.ie7 .post .layout-cell {border:none !important; padding:0 !important; }
.ie6 .post .layout-cell {border:none !important; padding:0 !important; }

</style>
</head>
<body>
<div id="art-main">
<header class="art-header clearfix">
	<div class="art-shapes"><center>
		<h5 class="art-headline" style="font-size:24px; color:white;" data-left="35.77%"> MINDIG CSODÁLKOZTAM ,MIÉRT NEM CSINÁL MÁR VALAKI VALAMIT.</br>MAJD RÁJÖTTEM ,HOGY ÉN IS EGY VALAKI VAGYOK!  </h5></center>
		<div class="art-object1201188790" data-left="97.94%"></div>
	</div>                   
</header>
<div class="art-sheet clearfix">
<nav class="art-nav clearfix">
    <ul class="art-hmenu">
	<?php $keret->position('felsomenu');?>	
	</ul> 
</nav>
<div class="art-layout-wrapper clearfix">
<div class="art-content-layout">
<div class="art-content-layout-row">
 <div class="art-layout-cell art-sidebar1 clearfix">

 <!--
 
 http://graph.facebook.com/menkuotto
 https://www.facebook.com/feeds/page.php?id=313759868795554&format=rss20
 
 <div id="fb-root"></div> 
 <script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/hu_HU/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>
 -->
 <?php
 function post_beagyaz($fb_id){
 ?>
 <div class="fb-post" data-href="https://www.facebook.com/<?php echo $fb_id;?>" data-width="250"><div class="fb-xfbml-parse-ignore"></div></div>
  <?php
 }
 


$bejegyzesek = array ("permalink.php?story_fbid=321615578009983&amp;id=313759868795554","permalink.php?story_fbid=320373678134173&amp;id=313759868795554","permalink.php?story_fbid=319601931544681&amp;id=313759868795554","lmpjaszbereny/posts/388977691218752","permalink.php?story_fbid=317176655120542&amp;id=313759868795554","permalink.php?story_fbid=316611958510345&amp;id=313759868795554","permalink.php?story_fbid=315004532004421&amp;id=313759868795554","permalink.php?story_fbid=320985558072985&amp;id=313759868795554");
for ($i = 1; $i <= 3; $i++) {
$key=array_rand($bejegyzesek);
post_beagyaz($bejegyzesek[$key]);
unset($bejegyzesek[$key]); //törli a tömbből az elemet
}
 ?>
<!--


<div class="fb-post" data-href="https://www.facebook.com/permalink.php?story_fbid=321615578009983&amp;id=313759868795554" data-width="250"><div class="fb-xfbml-parse-ignore"></div></div>

<div class="fb-post" data-href="http://flashandbones.tumblr.com/post/96868135946" data-width="250"><div class="fb-xfbml-parse-ignore"></div></div>
<div class="fb-post" data-href="https://www.facebook.com/permalink.php?story_fbid=320985558072985&amp;id=313759868795554" data-width="250"><div class="fb-xfbml-parse-ignore"></div></div>
-->

 
 
 
 
 
<?php //$keret->position('balsav');?>

</div>
<!------ content ----------------------------------->
 <div class="art-layout-cell art-content clearfix">
 <article class="art-post art-article">
                             <!--- főcím   <div class="art-postmetadataheader">
                                        <h2 class="art-postheader"><span class="art-postheadericon">Home</span></h2>
                                 </div>--------------->
                                                
 <div class="art-postcontent art-postcontent-0 clearfix">
	<div class="art-content-layout-wrapper layout-item-0">
		<div class="art-content-layout">
				<?php global $tartalom; echo $tartalom;?>
		</div>
	</div>
</div>
</article>
</div>
                    </div>
                </div>
            </div>
    </div>
<footer class="art-footer clearfix">
  <div class="art-footer-inner">
<p><a href="#">Link1</a> | <a href="#">Link2</a> | <a href="#">Link3</a></p>
<p>Copyright © 2013. All Rights Reserved.</p>
    <p class="art-page-footer">
        <span id="art-footnote-links"><a href="http://www.artisteer.com/" target="_blank">Web Template</a> created with Artisteer.</span>
    </p>
  </div>
</footer>

</div>
 

</body></html>