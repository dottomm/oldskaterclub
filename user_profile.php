<?php
include 'common/useful_stuff.php';
if (!db_connect())
	die();

if ($_uid == 0){
	header("location:login.php");
	die();
}
include 'common/header.php';
    include 'common/user_query.php';


$photo = getvar("photo");
$name = getvar("name");
$image_id = getvar("image_id");
$user_id = getvar("user_id");
$username = getvar("username");
//$image_newname = (substring($img_row['name'],4));


?>
<div id='content'>

<div class='row-fluid'>
<?php //query user info
$poster_query=mysql_query("Select user_id, username,firstName, lastName from users where user_id='{$user_id}'");
								$poster_row=mysql_fetch_assoc($poster_query);
								$thispage = "{$poster_row['username']}";

?>
<h2><?php echo "$thispage photostream"; ?></h2>


<p><?php echo "<a href='mailto:{$row['email']}'>{$row['email']}</a> ";?></p>


<?php
//query user info 
	$img_query_res=mysql_query("Select * from images where user_id='{$poster_row['user_id']}'");
		while($img_row=mysql_fetch_assoc($img_query_res)){
			echo"
				 <div class='span' '>	<a href='img_detail.php?image_id={$img_row['image_id']}'>
   			
            <img src='images/{$img_row['name']}' class='img_responsive' width='300'></a> <br />
  
            <strong> {$img_row['photo_who']} |  {$img_row['photo_where']} | {$img_row['photo_when']} </strong> <br />
      $comment_count
            <span style='color:#ccc'>{$img_row['description']} </span> <br />
            {$img_row['commentsCount']}
            <a href='img_detail.php?image_id={$img_row['image_id']}'>Comment</a>

            </div> ";
		}
	
?>	
</div>
</div>
<?php include 'common/footer.php';?>
<p>&nbsp;</p>


