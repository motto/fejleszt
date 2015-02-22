<?php
//<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
// http://index.hu/24ora/rss/
// https://www.facebook.com/feeds/page.php?id=313759868795554&format=rss20

?>
<script type="text/javascript">

$(document).ready(function()
{
$.ajax({
//type: "GET", //POST-al cross domain hibát jelez
dataType:"jsonp",
url: " http://index.hu/24ora/rss/"
//data: { name: "John", location: "Boston" }
})
.done(function( xml ) {
// $("#result").append(xml)
  $(xml).find("item").each(function()
  {
    //$("#result").append($(this).attr("pubDate") + "<br />");
	  $("#result").append($(this).find("pubDate").text());
  $("#result").append(": " + $(this).find("title").text() + "<br />");
  });
});
});
function parseXml(xml)
{
  //find every Tutorial and print the author
  $(xml).find("title").each(function()
  {
    $("#result").append($(this).attr("author") + "<br />");
  });

  // Output:
  // The Reddest
  // The Hairiest
  // The Tallest
  // The Fattest
}
</script>

<h1>jFeed - jQuery feed parser e</h1>
<div id="result" ></div>