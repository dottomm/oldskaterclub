<?php

include 'common/useful_stuff.php';

if (!db_connect())
	die();
	
$thispage='Confirm Account';
$activationKey=getvar("activationKey");



$query=mysql_query("update users set status='confirmed', activationKey='NULL'
where activationkey={$activationKey}");

header("LOCATION:success.php");







?>