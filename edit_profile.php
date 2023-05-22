<?php
include 'common/useful_stuff.php';
if (!db_connect())
	die();

if ($_uid == 0){
	header("location:login.php");
	die();
}

$thispage = "Edit Profile";

$doit  =getvar("doit");
$errmsg = "";

$user_id=$_uid;
$firstName = getvar("firstName");
$lastName = getvar("lastName");
$address = getvar("address");
$city 	= getvar("city");
$state 	= getvar("state");
$province = getvar("province");
$country = "USA";
$email 	= getvar("email");
$username = getvar("username");
$password = getvar("password");


if($doit == "yes"){


if($firstName==""){
	$errmsg="Please Enter A First Name";
	}
	else if($lastName==""){
	$errmsg="Please Enter a Last Name";
	}
	 else	{


	mysql_query ("update  users set
			 firstName='$firstName' 
			,lastName='$lastName'
			,address='$address' 
			,city='$city' 
			,state='$state'
			,country='$country'
			,email='$email' 
			,username='$username'
			,pass='$password'
			,updated=NOW()
		 			 	where user_id={$_uid}");
				
header("LOCATION:myprofile.php?user_id={$_uid}");
	
	
	}
}
	include 'common/header.php';
?>

	<div class='row-fluid'>
	    <div class='span'>		
<div class='span12'>
	<?php     include 'common/user_query.php';
?>
      <!--Body content-->
<p><font color='red'><b><?php echo"{$errmsg}&nbsp;";?></b></font></p>
<h3>Edit <?php echo "{$row['firstName']} {$row['lastName']}";?> Profile</h3>

<form action=' <?php echo"{$_SERVER['PHP_SELF']}'";?> method='post'>

<input type='hidden' name='doit' value='yes'>
<input type='hidden' name='user_id' value='<?php echo "$_uid}";?>'>

<p><label for='username'>username</label>
<input type='text' name='username' value='<?php echo "{$row['username']}";?>'></p>

<p><label for='firstName'>First Name</label>
<input type='text' name='firstName' value='<?php echo "{$row['firstName']}";?>'></p>

<p><label for='lastName'>Last Name</label>
<input type='text' name='lastName' value='<?php echo "{$row['lastName']}";?>'></p>


<p><label for='address'>Address</label>
<input type='text' name='address' value='<?php echo "{$row['address']}" ?>'>
</p>

<p><label for='city'>City/State</label>
<input type='text' name='city' value='<?php echo "{$row['city']}"?>'> <input type='text' name='state'  value='<?php echo "{$row['state']}";?>'>
</p>



<p><label for='country'>Country</label>
<input type='text' name='country' value='<?php echo "{$country}" ?>'>
</p>


<p><label for='email'>Email Address</label>
<input type='text' name='email' value='<?php echo "{$row['email']}" ?>'>
</p>

<p><label for='username'>Username</label>
<input type='text' name='username' value='<?php echo "{$row['username']}" ?>'>
</p>

<p><label for='password'>Password</label>
<input type='password' name='password' value='<?php echo "{$row['pass']}" ?>'>
</p>


<p>&nbsp;</p>
  <button type='submit' class='btn'>update profile</button>
  <button type='button' class='btn'>Cancel</button>




