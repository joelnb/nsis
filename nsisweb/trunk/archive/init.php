<html>
<body style="font-family:courier new;font-size:10pt;">
<?
  echo '<b>PHP Version: '.phpversion().'</b><br>';
  echo '<b>Installing NSISWeb:</b><br>';
  echo '<li>Loading nsisweb.pkg.php .. ';
  include_once('engine/nsisweb.pkg.php');
  if(!$nsisweb->version_check('4.0.3')) {
	  echo '<b><font color="red">Error!</font></b> PHP Version 4.0.3 or higher required<br>';
  } else {
	  $constants = get_defined_constants();
	  foreach($constants as $constant => $value) {
		  if(strncmp($constant,'NSISWEB_',8) == 0) {
				echo '<li>Configuration Option: '.$constant.' => '.$value."\n";
		  }
	  }
	  echo '<li>Path Check .. ';
	  if(file_exists($nsisweb->fileroot.'/contribute.php')) {
	    echo 'Done<br>';
	  } else {
	    echo 'Failed<br>';
	    $nsisweb->record_error('Problem with fileroot [ '.$nsisweb->fileroot.' ]');
	  }
	  echo '<li>Calling $nsisweb->initialise .. ';
	  $nsisweb->initialise();
	  echo 'Done<br>';

	  if(count($nsisweb->errors) > 0) {
	    echo '<b>Errors Occured:</b><br>';
	    foreach($nsisweb->errors as $error) {
	      echo "<li>$error\n";
	    }
	  } else {
	    echo '<b>Success!</b><br>';
	    echo '<b>Self Test:</b> <a href="'.$nsisweb->wwwroot.'/nsisweb.php">this link</a> should take you to the NSISWeb home page.<br>';
	    echo '<b>Diagnostics:</b><br>';
	    echo '&nbsp;&nbsp;fileroot => '.$nsisweb->fileroot."<br>\n";
	    echo '&nbsp;&nbsp;wwwroot => '.$nsisweb->wwwroot."<br>\n";
	  }
  }
?>
</body>
</html>