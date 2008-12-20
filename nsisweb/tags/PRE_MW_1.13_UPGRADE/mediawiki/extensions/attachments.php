<?php

$wgExtensionFunctions[] = "wfAttachmentsExtension";

function wfAttachmentsExtension() {
	global $wgParser;

	$wgParser->setHook('attach', 'attach_func');
}

function attach_func($input) {
	$zip = Image::newFromName('Zip.gif');
	$attachment = Image::newFromName($input);
	if (!$attachment->exists())
		return $input . ' not found';

	$output = '<a href="' . $attachment->getURL() . '" style="text-decoration: none">';
	$output .= toHtml($zip) . ' ' . $input . '</a> (';
	$output .= get_human_readable_size($attachment->getSize()) . ')';

	return $output;
}

function toHtml($image) {
	$src = $image->getURL();
	$width = $image->getWidth();
	$height = $image->getHeight();
	return "<img src=\"$src\" width=\"$width\" height=\"$height\" border=\"0\" alt=\"\"/>";
}

function get_human_readable_size($size) {
	$suffix = 'bytes';

	if ($size >= 1024) {
		$size /= 1024;
		$size = (int) $size;
		$suffix = 'KB';
	}

	return $size . ' ' . $suffix;
}

?>
