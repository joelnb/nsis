<? include("include/global.php"); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
<head>
<? IncludeHTMLHeader("Nullsoft (SuperPiMP|Scriptable) Install System"); ?>
</head> 
<body> 
<? IncludePageHeader("Nullsoft (SuperPiMP|Scriptable) Install System"); ?>
<p class="text">NSIS tries to be a scriptable win32 installer/uninstaller system that doesn't suck and isn't huge.</p> 
<ul> 
	<li class="text"><b><a href="http://www.nullsoft.com/free/nsis/">Home page</a></b> 
		<ul>
			General information about NSIS
		</ul> 
	<li class="text"><b><a href="http://sourceforge.net/projects/nsis/">Project page</a></b> 
		<ul>
			Latest development version information<br>and downloads
		</ul> 
	<li class="text"><b><a href="http://forums.winamp.com/forumdisplay.php?s=&forumid=65">Forum</a></b>  
		<ul>
			Talk to other NSIS users
		</ul> 
	<li class="text"><b><a href="http://forums.winamp.com/showthread.php?s=&threadid=102650">FAQ</a></b> 
		<ul>
			Some frequently asked questions
		</ul> 
	<li class="text"><b><a href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/nsis/NSIS/">Browse CVS</a></b> 
		<ul>
			Browse the files of the latest version
		</ul> 
	<li class="text"><b><a href="changelog.php">Change log</a></b> 
		<ul>
			See what's cooking<br> 
			<span class="smalltext">Updated: <?=LocalFileDate("nightly/changelog.txt")?> </span> 
		</ul> 
	<li class="text"><b><a href="nightly/nsis.zip">Nightly CVS snapshot</a></b> 
		<ul> 
			NSIS CVS directory zipped up<br> 
			<span class="smalltext">Updated: <?=LocalFileDate("nightly/nsis.zip")?> </span> 
		</ul> 
	<li class="text"><b><a href="nsis-snapshot-sep22.exe">Snapshot with installer</a></b> 
		<ul> 
			NSIS CVS snapshot with installer<br> 
			<span class="smalltext">Updated: <?=LocalFileDate("nsis-snapshot-sep22.exe")?></span> 
		</ul> 
</ul> 
<? IncludePageFooter(); ?>
</body> 
</html> 