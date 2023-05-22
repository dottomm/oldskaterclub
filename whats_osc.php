<?php

include 'common/useful_stuff.php';
if (!db_connect())	die();

$thispage="What is Old Skaters Club?";

include 'common/header.php';

include 'common/user_query.php';    



echo"    
<div id='content'> 

<h1>$thispage</h1> 
<!--Latin Text Ahead-->

<p class='text'>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultricies ac lorem at fermentum. Curabitur vel enim vel mi scelerisque bibendum. Ut sagittis semper nisi non sagittis. Nullam vel nisi sit amet mauris sagittis dapibus. Aliquam fringilla viverra ligula, ut placerat dui tincidunt pharetra. Ut molestie vestibulum arcu, varius aliquet nulla pulvinar ornare. Donec facilisis arcu pharetra neque sagittis, nec ornare felis euismod. Mauris congue mollis volutpat.
</p>

<p class='text'>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultricies ac lorem at fermentum. Curabitur vel enim vel mi scelerisque bibendum. Ut sagittis semper nisi non sagittis. Nullam vel nisi sit amet mauris sagittis dapibus. Aliquam fringilla viverra ligula, ut placerat dui tincidunt pharetra. Ut molestie vestibulum arcu, varius aliquet nulla pulvinar ornare. Donec facilisis arcu pharetra neque sagittis, nec ornare felis euismod. Mauris congue mollis volutpat.
</p>

<p class='text'>Nam convallis bibendum nibh, eu hendrerit lorem lobortis sit amet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas id lacus at orci pretium euismod. Donec laoreet justo sed ligula consequat, ac tincidunt dolor varius. Suspendisse sollicitudin nulla at dui lacinia lobortis. Praesent et diam luctus, congue tortor in, ullamcorper nulla. Aenean vulputate tincidunt risus et lacinia. Praesent facilisis metus sem, at cursus nisi sodales id. Aliquam lobortis lorem lectus, non dignissim lacus laoreet et. Etiam justo sapien, gravida sed commodo sed, accumsan et orci. Suspendisse eget velit vehicula, adipiscing massa a, scelerisque lacus. Cras rutrum semper dui, ornare volutpat diam facilisis vitae. Aenean tempor ante ac dolor rhoncus placerat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam erat volutpat. Curabitur placerat nulla ac fringilla imperdiet.
</p>


</div>
";

 include 'common/footer.php';