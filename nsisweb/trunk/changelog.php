<? include("include/global.php"); ?>
<?
	$_AUTHORS = array(
		array("rainwater","Robert Rainwater"),
		array("justin1014","Justin Frankel"),
		array("kichik","Amir Szekely"),
		array("joostverburg","Joost Verburg")
	);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
<head> 
<? IncludeHTMLHeader("Changelog"); ?>
</head> 
<body> 
<? IncludePageHeader("NSIS Changelog",true); ?>
<pre class="changelog">
<?php 
$contenta = @file('/home/groups/n/ns/nsis/htdocs/nightly/changelog.txt');
if ($contenta) {
	$content = implode ('',$contenta);
	for ($i = 0; $i < count($_AUTHORS); $i++) {
		$content = str_replace($_AUTHORS[$i][0],$_AUTHORS[$i][1],$content);
	}
	echo $content;
}
?>
</pre> 
<? IncludePageFooter(); ?>
</body> 
</html> 