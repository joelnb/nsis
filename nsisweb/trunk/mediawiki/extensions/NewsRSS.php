<?php
$wgExtensionFunctions[] = "wfNewsRSS";

function wfNewsRSS() {
	global $wgParser;
	$wgParser->setHook('newsrss', 'NewsRSS');
	return true;
}

function NewsRSS() {
	global $wgParser;
	$wgParser->disableCache();
	return file_get_contents('/home/project-web/nsis/news.rss.html');
}

?>
