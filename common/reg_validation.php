<?php





function checkFirstName($fname){
	if(!preg_match("^[a-zA-Z\.\-&',\/\\ ]{1,50}$^" ,$fname))
		return False;
	else
		return True;
}

function checkLastName($lname){
	if(!preg_match("^[a-zA-Z\.\-&',\/\\ ]{1,50}$^" , $lname))
		return False;
	else
		return True;
}

function checkStreetAddress($address){
	if(!preg_match("^[a-zA-Z\.\-&',\/\\ ]{1,100}$^", $address))
		return False;
	else
		return True;
}

function checkCity($city){
	if(!preg_match("^[a-zA-Z\.\-&',\/\\ ]{1,50}$^", $city))
		return False;
	else
		return True;
}

function checkState($state){
	if(!preg_match("^[a-zA-Z\.\-&',\/\\ ]{1,50}$^", $state))
		return False;
	else
		return True;
}

function checkZip($zip){
	if(!preg_match("^[0-9]{5}$^", $zip))
		return False;
	else
		return True;
}


function checkEmail($email){
	if (!preg_match("/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)*.([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/" ,$email ) )		
		return false;
	else
		return true;
}

