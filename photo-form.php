<?php
    
    include 'common/useful_stuff.php';
    if (!db_connect())
	die();
    if ($_uid == 0){
        header("location:login.php");
        die();
    }
    include 'common/header.php';
    include 'common/user_query.php';
    
    $name = getvar("name");
    $photo_who = getvar("photo_who");
    $photo_where = getvar("photo_where");
    $description = getvar("description");
    
    echo "
    <div id='content'>
    <p>&nbsp;</p>

    
	<p><form action='upload_photo.php' method='post' enctype='multipart/form-data' >
        <p style='font-style:italic;'>jpeg file required</p>
	<input type='hidden' name='doit' value='yes'>
    <input type='file' name='uploadfile' value='$name' required ='required'/>
    
    <p><input type='text' name='photo_who' value='{$photo_who}' placeholder='Who'></p>
    
    <p><input type='text' name='photo_where' value='{$photo_where}' placeholder='Where'></p>
    
    <p><select name='photo_when'>
    <option value=''>When</option>
    <option value='1980'>1980</option>
    <option vakue='1981'>1981</option>
    <option value='1982'>1982</option>
    <option value='1983'>1983</option>
    <option value='1984'>1984</option>
    <option value='1985'>1985</option>
    <option value='1986'>1986</option>
    <option value='1987'>1987</option>
    <option value='1988'>1988</option>
   <option value='1989'>1989</option>
    <option value='1990'>1990</option>

    </select></p>
    <p><textarea name='description' value='{$description}' placeholder='Description' rows='4' cols='40'></textarea></p>
    
    
    <input type='submit' value='Upload'/>
    </form></p>";

    include 'common/footer.php';