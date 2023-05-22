<? ob_start(); ?>
<?php

include 'common/useful_stuff.php';
$thispage = "Detail";

if (!db_connect())
	die();

if ($_uid == 0){
	header("location:login.php");
	die();
}

include 'common/header.php';
    include 'common/user_query.php';


$errorString ="";
$doit  =getvar("doit");
$photo = getvar("photo");
$name = getvar("name");
$image_id = getvar("image_id");
$user_id = getvar("user_id");
$username = getvar("username");
$comment =getvar("comment");

//$image_newname = (substring($img_row['name'],4));


//comment form insert 
if($doit == "yes"){
	$errors = array();

if($comment==""){
	$errors[]="No Comment Entered";
	}

	if ((count($errors) > 0)) {
		$errorString = '<div class="alert alert-error"><p> <a href="javascript:history.go(-1)">Go back</a> <br />There was an error processing the form. </p>';
		$errorString .= '<ul>';
		foreach($errors as $error)
				$errorString .= "<li>$error</li>";
					
		$errorString .= '</ul></div>';
		$errorString .=  "<p style='color:#D42222; font-size:.8em;'>Please correct the above error(s) and try again </p>";
				
}else{

$sql=mysql_query ("INSERT INTO comments
				(user_id, image_id, comment, comment_day_time)
				values
				('{$_uid}', '{$image_id}', '{$comment}', 'NOW();')");
 
	HEADER("LOCATION:img_detail.php?image_id={$image_id}");

		}
	}



?>
<div class='row-fluid'>

	    

<?php
//query user info 
	$img_query_res=mysql_query("Select i.image_id, i.user_id, i.name, i.photo_who , i.photo_when , i.photo_where ,u.user_id from images i 
								inner join users u on i.user_id=u.user_id where i.image_id='{$image_id}'");
	$img_row=mysql_fetch_assoc($img_query_res);

			echo"
			$errorString
    <div id='content'>  

		<div id='frame'>

			<p align='center'>

			<button type='button' class='btn btn-default btn-lg'>
				<span class='glyphicon glyphicon-thumbs-up'>Like</span>
			</button>

		<a href='user_profile.php?user_id={$img_row['user_id']}'>
			<button type='button' class='btn btn-default btn-lg'>
						<span class='glyphicon glyphicon-thumbs-up'>Photo Stream</span>
			</button>
		</a>
			
			<button type='button' class='btn btn-default btn-lg'>
					<span class='glyphicon glyphicon-thumbs-up'>Share</span>
			</button>


			</p>

			<p><img src='images/{$img_row['name']}' class='img_responsive' width='425' align='center'> <br /> 
			{$img_row['photo_who']} <br /> 
			{$img_row['photo_where']} <br /> 
			{$img_row['photo_when']}</p>
			<p><a href='likecount.php?image_id={$img_row['image_id']}' > </a></p> 

		<form action='{$_SERVER['PHP_SELF']}' method='post'>
		<input type='hidden' name='doit' value='yes'>
	<input type='hidden' name='image_id' value='{$img_row['image_id']}'>
		<input type='text' name='comment' value='{$comment}' placeholder='comment'> 
		
		<button type='submit' class='btn btn-default btn-lg'>
		<span class='glyphicon glyphicon-thumbs-up'>Comment</span>
		</button></form>
	</div>

                               
                               
			";


			//query comments 
	$comment_res=mysql_query("Select * from comments 
								inner join users on comments.user_id=users.user_id
							where image_id={$image_id}");
	if (mysql_num_rows($comment_res)===0){
//if no records say so
		echo "<p class='comment'>No Comments</p></div>
";
}else{
			while($comment_row=mysql_fetch_assoc($comment_res)){
			echo"		


<p class='comment'>	{$comment_row['comment']} &ndash; <span class='muted' style='font-size:.8em;'><a href='user_profile.php?user_id={$comment_row['user_id']}'>{$comment_row['username']}</a> {$comment_row['comment_day_time']}</span></p>
	
	
                             
";
	}
}
        echo"                            </div>
";                     

    include 'common/footer.php';
		
	
	



