<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <title><?php echo MoConfig::$lapnev; ?>	</title>
  <meta name="description" content="Description of your site goes here">
  <meta name="keywords" content="keyword1, keyword2, keyword3">
  <link href="templates/template_4/css/style.css" rel="stylesheet" type="text/css">
 <?php  $keret->fejlec_general();?>	
</head>
<body>
<div class="main">
<div class="page">
<div class="header">
<div class="banner">
<h1>Üdvözöljük</h1>
</div>
<div class="topmenu">
<ul>
	<?php $keret->position('felsomenu'); ?>	
</ul>
</div>
</div>
<div class="content">
<div class="content-in">
<!--
<div class="left-panel">
<h2>Categories</h2>
<div class="left-content">
<ul>
  <li><a href="#">List item (1)</a></li>
  <li><a href="#">List item (2)</a></li>
  <li><a href="#">List item (3)</a></li>
  <li><a href="#">List item (4)</a></li>
  <li><a href="#">List item (5)</a></li>
  <li><a href="#">List item (6)</a></li>
  <li><a href="#">List item (7)</a></li>
  <li><a href="#">List item (8)</a></li>
  <li><a href="#">List item (9)</a></li>
</ul>
</div>
<div class="gap"></div>
<h2>Recent Updates</h2>
<div class="left-content">
<ol>
  <li><span><strong>Lorem Ipsum is simply dummy text</strong> of the
printing and typesetting industry. Lorem Ipsum has been the.</span> <a href="#" class="more">read more...</a></li>
  <li><span><strong>Lorem Ipsum is simply</strong> dummy text of the
printing and typesetting industry.</span> <a href="#" class="more">read
more...</a></li>
</ol>
</div>
</div>-->
<?php global $tartalom; echo $tartalom;?>
</div>
</div>
<!--DO NOT Remove The Footer Links-->
<div class="footer">
<p>&copy; Copyright 2010. Designed by <a target="_blank" href="http://www.htmltemplates.net">htmltemplates.net</a></p>
<ul>
  <li style="border-left: medium none;"><a href="index.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
  <li><a href="#">Email</a></li>
  <li><a href="#">Resources</a></li>
  <li><a href="#">Links</a></li>
  <li><a href="#">Contact</a></li>
</ul>
</div>
</div>
</div>

<!--DO NOT Remove The Footer Links-->
<!--Designed by--><a href="http://www.htmltemplates.net">
<img src="images/footnote.gif" class="copyright" alt="html templates"></a>
<!--In partnership with--><a href="http://websitetemplates.net">
<img src="images/footnote.gif" class="copyright" alt="websitetemplates.net"></a>
<!--DO NOT Remove The Footer Links-->

</body></html>