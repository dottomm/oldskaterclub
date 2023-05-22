<?php

// Connects to your Database
include 'common/useful_stuff.php';
if (!db_connect())
	die();
	
	
	$image_id=getvar("image_id");
	$name=getvar("name");
	$hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);

$out=getvar("out");
$link=getvar("link");
					
				
//Adds to the click count for a particular link
$update=mysql_query("UPDATE documents SET count=count+1  WHERE doc_id=$doc_id")or die(mysql_error());




//Retrieves information
$data = mysql_query("SELECT * FROM images WHERE image_id=$image_id	") or die(mysql_error());			
$info = mysql_fetch_array($data);

//Inserts visitor information into Visitors table
$ok=mysql_query("INSERT into visitors (doc_id,  datetime,hostname)
				VALUES ('{$doc_id}',NOW(),'{$hostname}')") or die(mysql_error());
 if($ok)
 {
//redirects them to the link they clicked
header( "Location:" .$info['link'] );
}
	
?> 