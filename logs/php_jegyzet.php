<?
//viszaperjelezés**************************************************
//1 get_magic_quotes_gpc() példa (automatikus addslash)-------------------
if (!get_magic_quotes_gpc()) {
    $lastname = addslashes($_POST['lastname']);
} else {
    $lastname = $_POST['lastname'];
}

//1 addslashes() példa---------------
$str = "A neved O'reilly?";
// Kimenet: A neved O\'reilly?
echo addslashes($str);
// stripslashes--------------------------
<?php
$str = "A neved O\'reilly?";

// Kimenet: A neved O'reilly?
echo stripslashes($str);
//rekurzív stripslashes--------------------------
$tomb = array("f\\'oo", "b\\'ar", array("fo\\'o", "b\\'ar"));
$tomb = stripslashes_deep($tomb);

//mysql------------------------------------------------------
UDPATE table
 SET mezo = CONCAT(mezo, 'plusz szöveg') WHERE `ContactName` = "Maria Anders"
 
mysql> SELECT REPLACE('www.mysql.com', 'w', 'Ww');
        -> 'WwWwWw.mysql.com'
UPDATE your_table
SET your_field = REPLACE(your_field, 'articles/updates/', 'articles/news/')
WHERE your_field LIKE '%articles/updates/%'		
		
mysql> SELECT REVERSE('abc');
        -> 'cba'	
DELETE FROM tutorials_tbl
        WHERE tutorial_id=3		