<?
$latest = "1.98";
$betaseries = "2.0";
$betaversion = "b1";

if ($version) {
	$update = false;
	$version = str_replace("v","",$version);
	$pos = strpos($version,"b");
	if (!$pos) $pos = strpos($version,"a");
	if ($pos) {
        $series = substr($version,0,$pos);
		$revision = substr($version,$pos);
        if ($latest>=$series) print "1|".$latest;
		else if (!strcmp($betaseries,$series)) {
			if (!strncmp($betaversion,$revision,1)) {
				if (substr($betaversion,1)>substr($revision,1)||(substr($betaversion,1)==substr($revision,1)&&$cvs==1)) print "2|".$betaseries.$betaversion;
				else print "0";
			}
			else if (!strncmp($betaversion,"b",1)&&!strncmp($revision,"a",1)) {
				print "2|".$betaseries.$betaversion;
			}
			else print "0";
		}
		else print "0";
	}
	else {
        if ($latest>$version) $update = true;
		if ($update) {
			print "1|".$latest;
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

