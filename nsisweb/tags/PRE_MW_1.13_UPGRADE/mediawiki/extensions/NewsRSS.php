<?php
$wgExtensionFunctions[] = "wfNewsRSS";

function wfNewsRSS() {
	global $wgParser;
	$wgParser->setHook('newsrss', 'NewsRSS');
}

function NewsRSS() {
	global $wgParser;
	$wgParser->disableCache();
	return file_get_contents('/home/groups/n/ns/nsis/news.rss.html');
}

?>
