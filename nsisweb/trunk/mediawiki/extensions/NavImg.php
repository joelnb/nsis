<?php

$wgExtensionFunctions[] = "wfNavImg";

function wfNavImg() {
	global $wgParser;

	$wgParser->setHook('navimg', 'wfNavImgHook');
}

function wfNavImgHook($input) {
	list($type, $imgname, $page) = explode('|', $input);

	if (!isset($type) || !isset($imgname) || !isset($page))
		return $input;

	$img = Image::newFromName($imgname);
	if (!$img->exists()) {
		global $wgOut;
		return $wgOut->parse('[['. $page . ']]');
	}

	if ($type == 'local') {
		$title = Title::newFromText($page);
		$url = $title->getLocalURL();
	} else {
		global $wgParser, $wgMsgParserOptions;
		$url = $wgParser->transformMsg($page, $wgMsgParserOptions);
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
