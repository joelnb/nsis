<?php
$wgExtensionFunctions[] = "wfForumRSS";

function wfForumRSS() {
	global $wgParser;
	$wgParser->setHook('forumrss', 'ForumRSS');
}

function ForumRSS() {
	global $wgParser;
	$wgParser->disableCache();
	return file_get_contents('/home/groups/n/ns/nsis/forum.rss.html');
}

?>
