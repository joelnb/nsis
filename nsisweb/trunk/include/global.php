<?

function LocalFileDate($file) {
	if (!file_exists($file)) return "Unknown";
	return gmdate("D, d M Y, H:i:s",filemtime($file))." GMT";
}

function IncludeHTMLHeader($title) {
	echo "<title>".$title." // NSIS Developer Site</title>\n".
		"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n".
		"<link rel=\"Stylesheet\" type=\"text/css\" href=\"http://nsis.sourceforge.net/include/style.css\" />\n".
		"<link rel=\"SHORTCUT ICON\" href=\"/favicon.ico\" />\n";
}
function IncludePageHeader($title,$showback=false) {
?>
<div class="center"> 
<table width="750" cellpadding="0" cellspacing="0" class="maintable"> 
<tr>
	<td> 
	<table width="720" border="0" cellpadding="0" cellspacing="0" class="innertable"> 
	<tr class="header"> 
		<td><a href="http://nsis.sourceforge.net/index.php"><img class="centerimage" src="http://nsis.sourceforge.net/images/logo.gif" width="48" height="48" alt="" /></a></td> 
		<td><div class="header"><? echo $title; if ($showback) _BackButton(); ?></div></td> 
	</tr> 
	<tr> 
		<td colspan="2">
		<div class="margin"> 
<?
	
}

function IncludePageFooter() {
?>
	<p class="center"><a href="http://sourceforge.net"><img class="centerimage" src="http://sourceforge.net/sflogo.php?group_id=22049&amp;type=1" alt="SourceForge Logo" /></a></p>
	</div>
  </td></tr> 
</table>
</td></tr>
</table>
</div> 
<?
}

function _BackButton() {
	echo "<p class=\"text\" align=\"center\"><a href=\"http://nsis.sourceforge.net/index.php\">Back to Main Page</a></p>";
}
?>