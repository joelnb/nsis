<?
$latest = "1.98";
if ($version) {
	$update = false;
	$version = str_replace("v","",$version);
	$pos = strpos($version,"b");
	if (!$pos) $pos = strpos($version,"a");
	if ($pos) {
        $version = substr($version,0,$pos);
        if ($latest>=$version) $update = true;
		if ($update) {
			print "1";
		}
		else {
			print "0";
		}
	}
	else {
        if ($latest>$version) $update = true;
		if ($update) {
			print "1";
		}
		else {
			print "0";
		}
	}
}
else {
	print "0";
}
?>

