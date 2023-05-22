<?php
session_start(); // this line is mandatory and must be placed in first line of the script.

include 'common/useful_stuff.php';
if(!db_connect())
die();
$thispage ="Register";


$user_id=$_uid;

$firstName 	= getvar("firstName");
$lastName  	= getvar("lastName");
$address   	= getvar("address");
$city	   	= getvar("city");
$state	 	= getvar("state");
//$country 	= getvar("country");
$country 	= "USA";
$email 		= getvar("email");
$username 	= getvar("username");
$password 	= getvar("password");

$errmsg ="";
$errorString ="";
$doit  =getvar("doit");

$activationKey =  mt_rand() . mt_rand() . mt_rand() . mt_rand() . mt_rand();



 $headers = "From:info@oldskaterclub.com\r\n";
 $headers .= "Bcc: info@oldskaterclub.com\r\n";
 $headers .= "MIME-Version: 1.0\r\n";
 $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
 $mailmsg = "<html><body>";
 $mailmsg .="<p>Hi {$firstName} {$lastName} </p>";
 $mailmsg.="<p>Welcome to the Old Skater Club</p>";		

//Here is the message the user recieves
 $mailmsg="Hi {$firstName} {$lastName} 

 Thank you for joining the Old Skater Club. To confirm your registration plese http://www.dottomm.com/oldskaterclub/confirmaccount.php?activationKey=$activationKey
 Your registration has been confirmed for the Old Skater Club 

 Username: {$username}
 Password: Log-in with the Password you provided when you registered. 
http://www.dottomm.com/oldskaterclub/pwhelp.php'>Need assistance retrieving your password?";
 
 $mailmsg .= "</body></html>";

//form validation
include 'common/reg_validation.php';


if($doit == "yes"){
	$errors = array();

if (!checkFirstName ($firstName))
		$errors[]="Please enter your first name";
		
		 if (!checkLastName ($lastName))
		$errors[]="Please enter your last name";
		
		
		// if (!checkStreetAddress ($address))
		//$errors[]="Please enter your address ";
		
		
		// if (!checkCity ($city))
		//$errors[]="Please enter your city";
	
		
		//if (!checkState ($state))
		//$errors[]="Please enter your state";
		
		
		 if (!checkEmail ($email))
		$errors[]="Please enter your email address";


if ($typed_security_code = ""){
		$errors[]="Please Type In The 4 Character Security Code";
	}

if ($_POST['typed_security_code'] != $_SESSION['security_code']){
	$errors[]="The Security Code Is Not Correct, your submit will be aborted.";
				}
	// here you must abort the form submit and display the form again to let the use retype the security code
	 // I will use exit for this example

if(mysql_num_rows(mysql_query("SELECT * from users where email='$email'"))){
		$errors[]="A record with that information already exists";
}

if ((count($errors) > 0)) {
		$errorString = '<div class="alert alert-error"><p> <a href="javascript:history.go(-1)">Go back</a> <br />There was an error processing the form. </p>';
		$errorString .= '<ul>';
		foreach($errors as $error)
				$errorString .= "<li>$error</li>";
					
		$errorString .= '</ul></div>';
		$errorString .=  "<p style='color:#D42222; font-size:.8em;'>Please correct the above error(s) and try again </p>";
	
	
	}else{

$sql=mysql_query ("INSERT INTO users
		(firstName
		,lastName 
		,address
		,city
		,state
		,country
		,username
		,email
		,pass
		,activationKey
		,joined
		)

		VALUES(
				 '{$firstName}' 
				,'{$lastName}'
				,'{$address}' 
				,'{$city}' 
				,'{$state}'
				,'{$country}' 
				,'{$username}'
				,'{$email}' 
				,'{$password}'
				,'{$activationKey}'
				,NOW()
				)");

			
mail("$email", "Your Registration Confirmed", $mailmsg,"FROM:info@oldskaterclub.com");

				
header("LOCATION:index.php");
	
	
		}
	}


?>

<body  OnLoad="document.caller.firstName.focus();">
<?php				
					include 'common/header.php';
                    include 'common/user_query.php';

echo"
<div id='content'>
    <div style='margin-left:6em;'>
<p><font color='red'><b>{$errmsg}&nbsp;</b></font></p>
$errorString 
<form action='{$_SERVER['PHP_SELF']}' method='post'>

<input type='hidden' name='doit' value='yes'>
<input type='hidden' name='user_id' value='{$_uid}'>



<p><label for='firstName'>First Name</label>
<input type='text' name='firstName' value='{$firstName}' placeholder='First Name'></p>

<p><label for='lastName'>Last Name</label>
<input type='text' name='lastName' value='{$lastName}' placeholder='Last Name'></p>

<p><label for='email'>E-Mail</label>
<input type='email' name='email' value='{$email}' placeholder='Email'>


<p><label for='username'>Username</label>
<input type='text' name='username' value='{$username}' placeholder='username'>

<p><label for='password'>Password</label>
<input type='password' name='password' value='{$password}' placeholder='Password'></p>

<p>In order to submit your data, enter the code shown in the image below:<br>
<img src='security_image.php' alt='' /></p>
<p><input maxlength='10' name='typed_security_code' type='text' /></p>

<p> <button type='submit' class='btn'>Register</button>
  <button type='button' class='btn'>Cancel</button>
  </p>
    </div>
    <p>&nbsp;</p>

";
    include 'common/footer.php';
