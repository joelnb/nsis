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
	<li class="text"><b><a href="http://sourceforge.net/projects/nsis/" title="Latest development info and downloads">Project page</a></b></li>
	<li class="text"><b><a href="http://sourceforge.net/tracker/?group_id=22049&atid=373085" title="Found a bug?">Submit Bug</a></b></li>
	<li class="text"><b><a href="http://forums.winamp.com/forumdisplay.php?s=&forumid=65" title="Talk to other NSIS users">Forum</a></b>  
	<li class="text"><b><a href="http://forums.winamp.com/showthread.php?s=&threadid=102650" title="Some frequently asked questions">FAQ</a></b></li>
	<li class="text"><b><a href="http://nsis.sourceforge.net/Docs/" title="Browse the latest NSIS documentation">Documentation</a></b></li>
	<li class="text"><b><a href="http://nsis.sourceforge.net/changelog.php" title="See what's cooking">Change Log</a></b> 
		<ul>
			<span class="smalltext">Updated: <?=LocalFileDate("nightly/changelog.htm")?> </span> 
		</ul>
	</li>
	<li class="text"><b><a href="http://nsis.sourceforge.net/nightly/nsis.zip" title="NSIS CVS directory zipped up">Development Snapshot</a></b> 
		<ul>
			<span class="smalltext">Updated: <?=LocalFileDate("nightly/nsis.zip")?> </span> 
		</ul>
	</li>
	<li class="text"><b><a href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/nsis/NSIS/" title="Browse the files of the latest version">Browse CVS</a></b></li>
</ul> 
<? IncludePageFooter(); ?>
</body> 
</html> 