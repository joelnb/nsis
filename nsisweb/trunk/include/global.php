<?

function LocalFileDate($file) {
	if (!file_exists($file)) return "Unknown";
	return date("r",filemtime("nsis-snapshot-sep22.exe"));
}

function IncludeHTMLHeader($title) {
	echo "<title>".$title."</title>\n".
		"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\n".
		"<link rel=\"Stylesheet\" type=\"text/css\" href=\"include/style.css\">\n";
}
function IncludePageHeader($title,$showback=false) {
?>
<div class="center"> 
<table width="750" cellpadding="0" cellspacing="0" class="maintable"> 
<tr>
	<td> 
	<table width="720" border="0" cellpadding="0" cellspacing="0" class="innertable"> 
	<tr class="header"> 
		<td width="48"><img class="center" src="images/logo.gif" width="48" height="48"></td> 
		<td width="678"><div align="center" class="header"><? echo $title; ?></div></td> 
	</tr> 
	<tr> 
		<td colspan="2">
		<div class="margin"> 
<?
	if ($showback) _BackButton();
}

function IncludePageFooter() {
?>
        <a href="http://sourceforge.net"><img class="image" src="http://sourceforge.net/sflogo.php?group_id=22049&amp;type=1" alt="SourceForge Logo"></a> 
		</div>
		</td> 
	</tr> 
	</table> 
	</td>
</tr> 
</table> 
</div> 
<?
}

function _BackButton() {
?>
	<tr> 
		<td width="48"><img class="center" src="images/logo.gif" width="48" height="48"></td> 
		<td width="678"><div align="center" class="text"><a href="index.php">Back to Main Page</a></div></td> 
	</tr> 
<?
}

?>