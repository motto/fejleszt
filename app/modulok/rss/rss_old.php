<?php
//<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
?>
<script type="text/javascript">
$(document).ready(function () {
function getFeed(sender, uri) {
    jQuery.getFeed({
        url: 'proxy.php?url=' + uri,
        success: function(feed) {
            jQuery(sender).append('<h2>'
            + '<a href="'
            + feed.link
            + '">'
            + feed.title
            + '</a>'
            + '</h2>');

            var html = '';

            for(var i = 0; i < feed.items.length && i < 5; i++) {

                var item = feed.items[i];

                html += '<h3>'
                + '<a href="'
                + item.link
                + '">'
                + item.title
                + '</a>'
                + '</h3>';

                html += '<div class="updated">'
                + item.updated
                + '</div>';

                html += '<div>'
                + item.description
                + '</div>';
            }

            jQuery(sender).append(html);
        }    
    });
}
 });
 
  </script> 
<div id="getanewbrowser">
  <script type="text/javascript">
    getFeed($("#getanewbrowser"), 'http://feeds.feedburner.com/getanewbrowser')
  </script>
</div>


  <script>

/*
    $('#content').socialist({
        networks: [ 
		{name:'rss',id:'https://www.facebook.com/feeds/page.php?id=313759868795554&format=rss20'},
		  {name:'facebook',id:'313759868795554'}
	
		  
		 
		/*
		 {name:'rss',id:'https://www.facebook.com/feeds/page.php?id=313759868795554&format=rss20'}
            {name:'linkedin',id:'buddy-media'},
            {name:'facebook',id:'in1dotcom'},
            {name:'pinterest',id:'potterybarn'},
            {name:'twitter',id:'in1dotcom'},
            {name:'googleplus',id:'105588557807820541973/posts'},
            {name:'rss',id:' http://feeds.feedburner.com/good/lbvp'},
            {name:'rss',id:'http://www.makebetterwebsites.com/feed/'},
            {name:'craigslist',id:'boo',areaName:'southcoast'},
            {name:'rss',id:'http://www.houzz.com/getGalleries/featured/out-rss'}
			http://www.facebook.com/feeds/friends_status.php?id=643443510&key=9fedd46a75&format=rss20&flid=77515858510  http://graph.facebook.com/313759868795554 */
			
    /*       ],
		      maxResults:20,
        isotope:false,
        random:false,
        fields:['source','heading','text','date','image','followers','likes']
    });
});*/
</script>

    <div id="content"></div>
