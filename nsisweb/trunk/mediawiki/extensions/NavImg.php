<?php

$wgExtensionFunctions[] = "wfNavImg";

function wfNavImg() {
	global $wgParser;
	$wgParser->setHook('navimg', 'wfNavImgHook');
	return true;
}

function wfNavImgHook($input, $args, $parser) {
	list($type, $imgname, $page) = explode('|', $input);

	if (!isset($type) || !isset($imgname) || !isset($page))
		return $input;

	$img = wfLocalFile($imgname);
	if (!$img) {
		return $parser->recursiveTagParse('[['. $page . ']]');
	}

	if ($type == 'local') {
		$title = Title::newFromText($page);
		$url = $title->getLocalURL();
	} else {
		global $wgTitle;
		$url = $parser->preprocess($page, $wgTitle, new ParserOptions());
	}

	return '<span class="plainlinks"><a href="' . $url . '">' . navImgToHtml($img) . '</a></span>';
}

function navImgToHtml($image) {
	$src = $image->getURL();
	$width = $image->getWidth();
	$height = $image->getHeight();
	return "<img src=\"$src\" width=\"$width\" height=\"$height\" border=\"0\" alt=\"\"/>";
}

?>
