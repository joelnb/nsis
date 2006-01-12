<?php
$wgExtensionFunctions[] = "wfNSISDev";

function wfNSISDev() {
	global $wgParser;
	$wgParser->setHook('changelogtimestamp', 'tsChangeLog');
	$wgParser->setHook('nightlybuildtimestamp', 'tsNightlyBuild');
	$wgParser->setHook('changelog', 'showChangeLog');
}

function getTimeStamp($file) {
	global $wgParser;
	$wgParser->disableCache();
	return gmdate('D, d M Y, H:i', filemtime($file)) . ' GMT';
}

function tsChangeLog() {
	return getTimeStamp('/home/groups/n/ns/nsis/htdocs/nightly/changelog.htm');
}

function tsNightlyBuild() {
	return GetTimeStamp('/home/groups/n/ns/nsis/htdocs/nightly/nsis.zip');
}

function showChangeLog($linesPerPage) {
	$LINESPERPAGE = (int) $linesPerPage;
	if ($LINESPERPAGE <= 0) $LINESPERPAGE = 30;

	global $wgRequest, $wgUser, $wgLang, $wgArticle, $wgParser;
	$wgSkin = $wgUser->getSkin();
	$wgTitle = $wgArticle->getTitle();
	$wgThisLink = $wgTitle->getText();

	// Disable cache
	$wgParser->disableCache();

	// Initialize output
	$output = '';

	// Get page number
	$curpage = $wgRequest->getInt('clpage', 1);

	// Get lines
	$lines = file('/home/groups/n/ns/nsis/htdocs/nightly/changelog.htm');
	$lines = array_filter($lines);
	$linescount = count($lines);

	// Get number of pages
	$pages = ceil($linescount / $LINESPERPAGE);

	// Page navigation
	if ($pages > 1) {
		$output .= '<p>';
		for ($i = 1; $i <= $pages; $i++) {
			if ($i == $curpage) {
				$output .= '<strong>[ '.$i.' ]</strong> ';
			} else {
				$link = $wgSkin->makeKnownLink($wgThisLink, $wgLang->formatNum("{$i}"), "clpage={$i}");
				$output .= '[ '.$link.' ] ';
			}
		}
		$output .= '</p>';
	}

	// Verify page number
	if ($curpage > $pages)
		$curpage = $pages;

	// Log
	$output .= '<ul>';
	foreach (array_slice($lines, ($curpage - 1) * $LINESPERPAGE, $LINESPERPAGE) as $line) {
		$output .= $line;
	}
	$output .= '</ul>';

	// Back/next
	if ($pages > 1) {
		$output .= "<p><strong>";

		$backpage = $curpage - 1;
		$nextpage = $curpage + 1;

		if ($backpage > 0) {
			$output .= $wgSkin->makeKnownLink($wgThisLink, '&lt; Back', "clpage={$backpage}");
		}

		$output .= ' ';

		if ($nextpage <= $pages) {
			$output .= $wgSkin->makeKnownLink($wgThisLink, 'Next &gt;', "clpage={$nextpage}");
		}

		$output .= "</strong></p>";
	}

	return $output;
}

?>
