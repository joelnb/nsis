<?
$latest = "1.98";
$betaseries = "2.0";
$betaversion = "b0";

if ($version) {
	$update = false;
	$version = str_replace("v","",$version);
	$pos = strpos($version,"b");
	if (!$pos) $pos = strpos($version,"a");
	if ($pos) {
        $series = substr($version,0,$pos);
		$revision = substr($version,$pos+1);
        if ($version>=$series) print "1|".$latest;
		else if (!strcmp($betaseries,$series)&&$betaversion>$revision) print "1|".$betaseries.$betaversion;
		else print "0";
	}
	else {
        if ($latest>$version) $update = true;
		if ($update) {
			print "1".$latest;
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

