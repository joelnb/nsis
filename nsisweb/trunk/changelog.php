<? include("include/global.php"); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
<head> 
<? IncludeHTMLHeader("Changelog"); ?>
</head> 
<body> 
<? IncludePageHeader("NSIS Changelog",true); ?>
<pre class="changelog"><?php @readfile('/home/groups/n/ns/nsis/htdocs/nightly/changelog.txt') ?></pre> 
<? IncludePageFooter(); ?>
</body> 
</html> 