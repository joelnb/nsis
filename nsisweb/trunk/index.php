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
	<li class="text"><b><a href="http://www.nullsoft.com/free/nsis/" title="General information about NSIS">Official Home Page</a></b></li>
	<li class="text"><b><a href="http://sourceforge.net/projects/nsis/">Project page</a></b> 
		<ul>
			Latest development info and downloads
		</ul> 
	<li class="text"><b><a href="http://forums.winamp.com/forumdisplay.php?s=&forumid=65">Forum</a></b>  
		<ul>
			Talk to other NSIS users
		</ul> 
	<li class="text"><b><a href="http://forums.winamp.com/showthread.php?s=&threadid=102650">FAQ</a></b> 
		<ul>
			Some frequently asked questions
		</ul> 
	<li class="text"><b><a href="http://nsis.sourceforge.net/Docs/">Documentation</a></b> 
		<ul>
			Browse the latest NSIS documentation
		</ul> 
	<li class="text"><b><a href="http://nsis.sourceforge.net/changelog.php">Change Log</a></b> 
		<ul>
			See what's cooking<br> 
			<span class="smalltext">Updated: <?=LocalFileDate("nightly/changelog.htm")?> </span> 
		</ul> 
	<li class="text"><b><a href="http://nsis.sourceforge.net/nightly/nsis.zip">Development Snapshot</a></b> 
		<ul> 
			NSIS CVS directory zipped up<br> 
			<span class="smalltext">Updated: <?=LocalFileDate("nightly/nsis.zip")?> </span> 
		</ul>
	<li class="text"><b><a href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/nsis/NSIS/">Browse CVS</a></b> 
		<ul>
			Browse the files of the latest version
		</ul> 
</ul> 
<? IncludePageFooter(); ?>
</body> 
</html> 