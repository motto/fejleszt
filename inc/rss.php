<?php 
//include('FeedParser.php'); 
//$Parser     = new FeedParser();
	//$rss = fetch_rss(' https://www.facebook.com/feeds/page.php?id=313759868795554&format=rss20');

/**
 * Facebook Page Feed Parser 
 * 
 * @using cURL
 */
/**
* Facebook Page Feed Parser
*
* @using SimpleXML
*/
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



