<? include("include/global.php"); ?>
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
	echo $content;
}
?>
</pre> 
<? IncludePageFooter(); ?>
</body> 
</html> 