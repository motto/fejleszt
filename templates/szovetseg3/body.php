<body>
<div id="art-main">
<nav class="art-nav clearfix">
    <ul class="art-hmenu"><li> <?php   global $keret; $keret->modul_becsatol('fomenu'); 
								//include MODULOK_PATH.'fomenu/fomenu.php'; 
								?></li></ul> 
</nav>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
<div class="art-layout-cell art-sidebar1 clearfix"><div class="art-vmenublock clearfix">
 <?php  global $keret; $keret->sav_becsatol('sidebar1');  ?>
</div></div>
<div class="art-layout-cell art-content clearfix">
   <article class="art-post art-article">
                              
                                                
                <div class="art-postcontent art-postcontent-0 clearfix"><div class="art-content-layout">
 
</div>
<div class="art-content-layout">
    <div class="art-content-layout-row">
 	<?php $keret->tartalom_general();?>
    </div>
</div>
</div>
</article>
</div> 

                </div>
            </div><footer class="art-footer clearfix">
<p>Copyright © 2014. All Rights Reserved.</p>
</footer>

  </div>
</div>
</body>
</html>