<?php
$user_id=getvar("user_id");

if ($_uid == 0){
	echo"<p>&nbsp;</p>
	<div class='badge'>
	<p>&nbsp;</p>
<p>Welcome to Old Skater Club </p>
<p> <a href='register.php'>Sign Up Here</a></p>
			</div>
			<p>&nbsp;</p>";
		} else{
	

//query user info 
	$res=mysql_query("Select * from users where user_id={$row['user_id']}");
			$row=mysql_fetch_assoc($res);
			echo"
			<div class='alert alert-info'>
You are logged in as is {$row['firstName']} {$row['lastName']}
<br><small> Not {$row['firstName']} {$row['lastName']}? <br /><a href='logout.php'><em>Log out</em></a></span></small>
			</div>
	
	<hr>
"
;
}
