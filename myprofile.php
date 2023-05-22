<?php
include 'common/useful_stuff.php';
if (!db_connect())
	die();
if ($_uid == 0){
	header("location:login.php");
	die();
}




$photo = getvar("photo");
$name = getvar("name");

$image_id = getvar("image_id");
//$image_newname = (substring($img_row['name'],4));
include 'common/header.php';

include 'common/user_query.php';

$thispage = "{$row['username']}";

?>
<div id='content'>

<h2><?php echo "$thispage <small><a href='edit_profile.php'>Edit</a></small>" ?></h2>

<p><?php echo "{$row['firstName']} {$row['lastName']}  ";?></p> 

<p><?php echo "{$row['address']} <br />{$row['city']} {$row['state']}  <br />{$row['country']}";?></p>

<p><?php echo "<a href='mailto:{$row['email']}'>{$row['email']}</a> ";?></p>

<p><?php include 'common/user_img_query.php';?></p>

	



<?php include 'common/footer.php';?>

</div>