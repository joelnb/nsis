<?

function get_param($param_name)
{
  global $HTTP_POST_VARS;
  global $HTTP_GET_VARS;
  $param_value = "";
  if(isset($HTTP_POST_VARS[$param_name]))
    $param_value = $HTTP_POST_VARS[$param_name];
  else if(isset($HTTP_GET_VARS[$param_name]))
    $param_value = $HTTP_GET_VARS[$param_name];
  return $param_value;
}

$latest = "1.98";
$modernseries = "2.0";
$modernversion = "rc1";
$output = "";
$version = get_param("version");
$cvs = get_param("cvs");

if ($version) {
  $update = false;
  $version = str_replace("v", "", $version);
  $pos = strpos($version, "b");
  $prerelease = "b";
  if (!$pos)
  {
    $pos = strpos($version, "a");
    $prerelease = "a";
  }
  if (!$pos) 
  {
    $pos = strpos($version, "rc");
    $prerelease = "rc";
  }
  if ($pos) 
  {
    $series = substr($version, 0, $pos);
    $revision = substr($version, $pos);
    if ($modernseries > $series) 
    {
      $output = "2|" . $modernseries . $modernversion;
    } else if ($modernseries < $series) {
      $output = "0";
    } else {
      if($prerelease == "a")
      {
        if(strpos($modernversion, "b") !== FALSE || strpos($modernversion, "rc") !== FALSE)
        {
          $output = "2|" . $modernseries . $modernversion;
        }else{
          if(substr($revision, 1) < substr($modernversion, 1))
          {
            $output = "2|" . $modernseries . $modernversion;
          }
        }
      } else if($prerelease == "b") {
        if(strpos($modernversion, "rc") !== FALSE)
        {
          $output = "2|" . $modernseries . $modernversion;
        }else{
          if(strpos($modernversion, $prerelease) !== FALSE)
          {
            if(substr($revision, 1) < substr($modernversion, 1))
            {
              $output = "2|" . $modernseries . $modernversion;
            } else {
              $output = "0";
            }
          }else{
            $output = "0";
          }
        }
      } else if($prerelease == "rc") {
        if(strpos($modernversion, $prerelease) !== FALSE)
        {
          if(substr($revision, 2) < substr($modernversion, 2))
          {
            $output = "2|" . $modernseries . $modernversion;
          } else {
            $output = "0";
          }
        }else{
          $output = "0";
        }
      }
    }
  } else {
    if($version == $modernseries)
    {
      if($modernrevision != "")
      {
        $output = "2|" . $modernseries . $modernversion;
      }else{
        $output = "0";
      }
    }else if ($latest >= $series)
    {
      $output = "1|".$latest;
    }
  }
}

header("Content-Length: " . strlen($output));
header("Content-Type: " . "text/plain");

print $output;
?>