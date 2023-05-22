<p>&nbsp;</p>
<p>&nbsp;</p>
<?php
$user_id=getvar("user_id");

if ($_uid == 0){
	echo"
<span style='float:right; margin-top:-40px;'>
 
    <span style='padding-right:2em;'>
        <button type='button' class='btn btn-default btn-lg'>
        <a href='login.php' style='color:#000;'>Log In</a> 
    </span>
        </button> </span> | 
    <span style='padding-left:1em;'>
        <button type='button' class='btn btn-custom btn-lg' >
    <a href='register.php' style='color:#fff;'><strong>Sign Up</strong></a>

        </button>
    <p>&nbsp;</p>
    <p><input type='text' placeholder='search'></p>
    </span>

</span>

    ";
		} else {
	

//query user info 
	$res=mysql_query("Select * from users where user_id=$_uid");
			$row=mysql_fetch_assoc($res);
			echo"
            <span style='float:right; margin-top:-40px;'>
            <p><button type='button' class='btn btn-default btn-lg' >
            <a href='logout.php' style='color:#000;'>Log out</a>
            </button></p>
            <p><input type='text' placeholder='search'></p>
            </span>
		";
			}
echo" 
    <ul id='nav'>";
    
    // if user is logged in)
    if ($_uid > 0){
        
        echo "
        <li> <a href='myprofile.php'>MY PROFILE</a></li>
        <li><a href='index.php'>HOME</a></li>
        <li><a href ='whats_osc.php'>WHAT&#39;S OLD SKATERS CLUB?</a></li>
        
        <li><a href ='shoposc.php'>SHOP</a></li>
        <li><a href ='collect.php'>COLLECTORS CORNER</a></li>
        <li><a href ='events.php'>EVENTS</a></li>
    

        </ul>
        </div>
        ";
        
    }
    
    
    // not logged in
    else {
        echo "
        

        <li><a href='index.php'>HOME</a></li>
        <li><a href ='whats_osc.php'>WHAT&#39;S OLD SKATERS CLUB?</a></li>

        <li><a href ='shoposc.php'>SHOP</a></li>
        <li><a href ='collect.php'>COLLECTORS CORNER</a></li>
        <li><a href ='events.php'>EVENTS</a></li>
        </ul>
        </div>
";
    }
   