<?php
include 'common/useful_stuff.php';
if (!db_connect())
	die();

$thispage = "login";
$errmsg = "";
$rem =getvar("rem");
$username = getvar("username");
$user_email = getvar("email");
$pw = getvar("pw");
$doit = getvar("doit");
if ($doit == "yes"){

	if ($pw == "" || $username == ""){
		$errmsg = "You must fill in both fields!";
	}
	else {
		// go see if they are in the db
		$un = mysql_real_escape_string($username);
		$em = mysql_real_escape_string($user_email);
		$p = mysql_real_escape_string($pw);
		$res = mysql_query("select * from users where username='{$un}' and pass='{$p}'");
		$row = mysql_fetch_assoc($res);
		if (!$row){
			$errmsg = "Unknown username and password combination!";
		}
		else {
			$ttl = 0;
			if ($rem !="")
			$ttl = time() + 7*24*60*60;
			setcookie("_2014",$row['user_id'],$ttl,"/");

			$query=mysql_query("update users set lastlogin=NOW() where user_id={$row['user_id']}");

			header("location:index.php");
			die();
		}
	}
}
?>

<?php
include 'common/header.php';
 include 'common/user_query.php';


echo "
<div id='content'>
 

 <font color='red'><b>{$errmsg}&nbsp;</b></font>

<form action='{$_SERVER['PHP_SELF']}' method='post'>

<legend>Log-In</legend>
<input type='hidden' name='doit' value='yes'>

<P><label>Username</label>
<input type='text' name='username' value='{$username}'>

<label>Password<br><input type='password' name='pw' value=''></p>


<p><input type='checkbox' name='rem'> Remember Me on this computer</label></p>

<p><button type='submit' class='btn'>Log-In</button></p>

<p>&nbsp;</p>
</form>
    		</div>

";


