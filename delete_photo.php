<?php
include 'common/useful_stuff.php';
if (!db_connect())
	die();
//if user is logged in)
if ($_uid == 0){
	header("location:login.php");
	die();
}


$image_id = getvar("image_id");

$query="delete from images where image_id={$image_id}";
mysql_query($query);
if (!$query) {
    die('Invalid query: ' . mysql_error());
}
echo"
<h2>Photo Deleted</h2>
<h3>Image Deleted <a href='myprofile.php'>Go Back</a></p>

";
