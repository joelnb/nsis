<?
header("Location: /site/Changelog.24.0.html"); 
exit();
?>

<? include("include/global.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/nsis/NSIS/" />
<? IncludeHTMLHeader("Changelog"); ?>
<style type="text/css">
<!--
span, li {
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