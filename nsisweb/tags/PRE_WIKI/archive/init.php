<html>
<body style="font-family:courier new;">
<?
  echo '<b>PHP Version: '.phpversion().'</b><br>';
  echo '<b>Installing NSISWeb:</b><br>';
  echo '<li>Loading nsisweb.pkg.php .. ';
  include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
  if(!$nsisweb->version_check('4.0.3')) {
    echo '<b><span style="color:red">Error!</span></b> PHP Version 4.0.3 or higher required<br>';
  } else {
    $constants = get_defined_constants();
    foreach($constants as $constant => $value) {
      if(strncmp($constant,'NSISWEB_',8) == 0) {
        if(strcmp($constant,'NSISWEB_MYSQL_USER') == 0 ||
          strcmp($constant,'NSISWEB_MYSQL_PASSWORD') == 0 ||
          strcmp($constant,'NSISWEB_MAGIC_NUMBER') == 0) {
            echo '<li>Configuration Option: '.$constant." => hidden\n";
          } else {
            echo '<li>Configuration Option: '.$constant.' => '.$value."\n";
         }
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
  print "<hr>\n";
  phpinfo();
?>
</body>
</html>