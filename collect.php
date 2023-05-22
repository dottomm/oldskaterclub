<?php

include 'common/useful_stuff.php';
if (!db_connect())	die();
$thispage='Collect';

include 'common/header.php';
include 'common/user_query.php';    




echo"    
<div id='content'> 

<h1>$thispage</h1>
</div>
";

 include 'common/footer.php';