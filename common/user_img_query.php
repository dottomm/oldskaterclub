<?php

if ($_uid == 0){
	echo"<p>&nbsp;</p>
	<div class='alert alert-info'>
		<p>&nbsp;</p>
		<h3>Welcome to Old Skater Club</h3>
		<p> <a href='register.php'>Sign Up Here</a></p>
	</div>
			";
		} else{
	

//query user info 
			$photo_who = getvar("photo_who");

	$img_query_res=mysql_query("Select image_id, user_id, name, photo_who, photo_where, photo_when, description from images where user_id={$_uid}");
		while($img_row=mysql_fetch_assoc($img_query_res)){
			echo"
			<div style='padding:1.3em;' >
			<span class='item'>
					<a href='img_detail.php?image_id={$img_row['image_id']}'>
					<img src='images/{$img_row['name']}' class='img_responsive' width='300'>
					</a>
					<p>{$img_row['photo_who']} | {$img_row['photo_when']}<br /> {$img_row['photo_where']}  <br /> {$img_row['description']}
					<br /> <a href='delete_photo.php?image_id={$img_row['image_id']	}'>Delete</a>
					</span>
				</div>";
		}
	}
	?>
	</div>

