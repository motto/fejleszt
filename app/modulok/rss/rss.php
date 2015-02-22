<?php
//<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
// http://index.hu/24ora/rss/
// https://www.facebook.com/feeds/page.php?id=313759868795554&format=rss20
//GOB::$modul_tomb['rss']=['szabaly'=>'all',
	GOB::$head_tomb['js']=MODULOK_PATH.'/rss/jquery.jfeed.js';
	GOB::$head_tomb['js']=MODULOK_PATH.'/rss/jquery.socialist.js';
	GOB::$head_tomb['css']=MODULOK_PATH.'/rss/jquery.socialist.css';

function fb_parse_feed( $page_id, $no = 5 ) {
// You need to query the feed as a browser.
ini_set('user_agent', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.9) Gecko/20071025 Firefox/2.0.0.9');
// URL to the Facebook page's RSS feed.
$rss_url = 'http://www.facebook.com/feeds/page.php?id=' . $page_id . '&format=rss20';
$xml = simplexml_load_file( $rss_url );
$out = '';
$i = 1;
foreach( $xml->channel->item as $item ){
$out .= '<div class="entry">';
$out .= '<h3 class="title"><a href="' . $item->link . '">' . $item->title . '</a></h3>';
$out .= '<div class="meta">' . $item->pubDate . ' by '. $item->author .'</div>';
$out .= '<div class="content">' . $item->description . '</div></div>';
if( $i == $no ) break;
$i++;
}
echo $out;
} 
fb_parse_feed('313759868795554', '5' );	
