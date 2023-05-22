<?php

include 'common/useful_stuff.php';
if (!db_connect())	die();
$thispage='Events';

include 'common/header.php';
include 'common/user_query.php';    




echo"    
<div id='content'> 

<h1>$thispage</h1> 
<a href='addevent.php'>Add Event</a>



</div>
";

 include 'common/footer.php';