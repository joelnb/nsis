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
	<li class="text"><b><a href="http://www.nullsoft.com/free/nsis/">Official Home Page</a></b>
		<ul>
		<span class="smalltext">General information about NSIS</span>
		</ul>
	</li>
	<li class="text"><b><a href="http://sourceforge.net/projects/nsis/">Project page</a></b>
		<ul>
		<span class="smalltext">Latest development info and downloads</span>
		</ul>
	</li>
	<li class="text"><b><a href="http://sourceforge.net/tracker/?group_id=22049&atid=373085">Submit Bug</a></b>
		<ul>
		<span class="smalltext">Found a bug?</span>
		</ul>
	</li>
	<li class="text"><b><a href="http://forums.winamp.com/forumdisplay.php?s=&forumid=65">Forum</a></b>
		<ul>
		<span class="smalltext">Talk to other NSIS users</span>
		</ul>
	</li>
	<li class="text"><b><a href="http://forums.winamp.com/showthread.php?s=&threadid=102650">FAQ</a></b>
		<ul>
		<span class="smalltext">Some frequently asked questions</span>
		</ul>
	</li>
	<li class="text"><b><a href="http://nsis.sourceforge.net/Docs/">Documentation</a></b>
		<ul>
		<span class="smalltext">Browse the latest NSIS documentation</span>
		</ul>
	</li>
	<li class="text"><b><a href="http://nsis.sourceforge.net/changelog.php">Change Log</a></b> 
		<ul>
		<span class="smalltext">See what's cooking<br>Updated: <?=LocalFileDate("nightly/changelog.htm")?></span> 
		</ul>
	</li>
	<li class="text"><b><a href="http://nsis.sourceforge.net/nightly/nsis.zip" title="NSIS CVS directory zipped up">Development Snapshot</a></b> 
		<ul>
		<span class="smalltext">Updated: <?=LocalFileDate("nightly/nsis.zip")?></span> 
		</ul>
	</li>
	<li class="text"><b><a href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/nsis/NSIS/">Browse CVS</a></b>
		<ul>
		<span class="smalltext">Browse the files of the latest version</span>
		</ul>
	</li>
</ul> 
<? IncludePageFooter(); ?>
</body> 
</html> 