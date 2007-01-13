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

$TYPES = array(
  "a" => 0,
  "b" => 1,
  "rc" => 2,
  "" => 3
);

$RTYPES = array(
  "a",
  "b",
  "rc",
  ""
);

$output = "0";

$latest_stable_version = "2.23";
$latest_version = "2.23";
$latest_type = $TYPES[""];
$latest_build = "";

$version = get_param("version");
$cvs = get_param("cvs");

function splitVersion($version) {
  $t = "";

  $p = strpos($version, "a");
  if ($p != FALSE)
    $t = "a";

  $p = strpos($version, "b");
  if ($p != FALSE)
    $t = "b";

  $p = strpos($version, "rc");
  if ($p != FALSE)
    $t = "rc";

  if ($t == "") {
    return array(
      "version" => $version,
      "type" => "",
      "build" => ""
    );
  }

  return array(
    "version" => substr($version, 0, strpos($version, $t)),
    "type" => $t,
    "build" => substr($version, strpos($version, $t) + strlen($t))
  );
}

if ($version) {
  $version = str_replace("v", "", $version);
  $v = splitVersion($version);
  $version = $v["version"];
  $type = $TYPES[$v["type"]];
  $build =  $v["build"];

  if ($latest_stable_version > $version) {
    // our stable version is newer than the user's
    $output = "1|".$latest_stable_version;
  } elseif ($latest_stable_version == $version && $type != $TYPES[""]) {
    // the user is using a pre-release of the stable version
    $output = "1|".$latest_stable_version;
  } else {
    // the user is using a pre-release version
    $update = false;

    if ($latest_version > $version) {
      // a pre-release for a newer version is available
      $update = true;
    } elseif ($latest_version == $version) {
      // same pre-release major version
      if ($latest_type > $type) {
        // we have a newer type
        $update = true;
      } elseif ($latest_type == $type) {
        // same type
        if ($latest_build > $build) {
          // newer build
          $update = true;
        } elseif ($latest_build == $build && $cvs) {
          // user's build is from cvs
          $update = true;
        }
      }
    }

    if ($update) {
      $output = "2|".$latest_version.$RTYPES[$latest_type].$latest_build;
    }
  }
}

header("Content-Length: " . strlen($output));
header("Content-Type: " . "text/plain");

print $output;
?>