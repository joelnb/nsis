<? include("include/global.php"); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
<head> 
<base href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/nsis/NSIS/">
<? IncludeHTMLHeader("Changelog"); ?>
<style type="text/css">
<!--
p, li {
	font-size: 11px; 
    font-family: Verdana, Arial, Helvetica, sans-serif; 
}
-->
</style>
</head>
<body> 
<? IncludePageHeader("NSIS Changelog",true); ?>
<?php 
$contenta = @readfile('/home/groups/n/ns/nsis/htdocs/nightly/changelog.htm');
if ($contenta) {
	echo $content;
}
?>
<? IncludePageFooter(); ?>
</body> 
</html> 