<?php 
include 'common/useful_stuff.php';
if (!db_connect())	die();
$thispage = "Home";

include 'common/header.php';
include 'common/user_query.php';    

$photo_who = getvar("photo_who");
$photo_where = getvar("photo_where");
$photo_when = getvar("photo_when");
$description = getvar("description");
$comment_count = getvar("comment_count");

echo"    
<div id='content'> 
   <p>&nbsp;</p>    
    &nbsp; &nbsp; <button class='btn btn-custom' btn-lg' >    
   <img src='site-images/small-camera.jpeg' width='20px'>
   <a href='photo-form.php' style='color:#fff; font-weight:bold; font-size:1.3em'><stront>Share Photo</strong></a> </button></p>
   <p align='right' style='margin-top:-36px;'><a href=''>Send an invitation to join Old Skaters Club</a></p>    

   <div class='row' >
<p>&nbsp;</p>
   ";	//query user info 	//count comments per image
      
      $img_query_res=mysql_query("SELECT i.*, COUNT(c.image_id) AS commentsCount
      FROM images AS i
      LEFT JOIN comments AS c ON ( c.image_id = i.image_id )
      GROUP BY i.image_id");		

      while($img_row=mysql_fetch_assoc($img_query_res)){
   	
echo"
           <div class='span' >	<a href='img_detail.php?image_id={$img_row['image_id']}'>
   			
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
   			<?php include 'common/footer.php';