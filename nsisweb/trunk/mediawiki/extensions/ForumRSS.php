<?php
$wgExtensionFunctions[] = "wfForumRSS";

function wfForumRSS() {
	global $wgParser;
	$wgParser->setHook('forumrss', 'ForumRSS');
	return true;
}

function ForumRSS() {
	global $wgParser;
	$wgParser->disableCache();
	return file_get_contents('/home/project-web/nsis/forum.rss.html');
}

?>
