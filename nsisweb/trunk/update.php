<?

$latest = "1.98";

?>
<? include("include/global.php"); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
<head> 
<base href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/nsis/NSIS/">
<? IncludeHTMLHeader("Update Check"); ?>
</head> 
<body> 
<? IncludePageHeader("NSIS Update",true); ?>
<?php 
if ($version) {
	$update = false;
	$version = str_replace("v","",$version);
	$pos = strpos($version,"b");
	if (!$pos) $pos = strpos($version,"a");
	if ($pos) {
        $version = substr($version,0,$pos);
        if ($latest>=$version) $update = true;
	}
	else {
        if ($latest>$version) $update = true;
	}
	if ($update) {
		print "There is a new version of NSIS avaialable.  You may download it <a href=\"http://sourceforge.net/project/showfiles.php?group_id=22049\">here</a>.";
	}
	else {
		print "You have the latest version of NSIS installed.";
	}
}
else {
	print "Version parameter not found.";
}

?>
<? IncludePageFooter(); ?>
</body> 
</html> 
