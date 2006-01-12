<?php
# GeSHiHighlight.php
#
# By: E. Rogan Creswick (aka: Largos)
# largos@ciscavate.org
# ciscavate.org/wiki/
#
# License: GeSHi Highlight is released under the Gnu Public License (GPL), and comes with no warranties.
# The text of the GPL can be found here: http://www.gnu.org/licenses/gpl.html
# Loosely based on SyntaxHighlight.php by Coffman, (www.wickle.com)

include_once('geshi/geshi.php');

$geshiPath = "extensions/geshi/geshi";

class SyntaxSettings {};

$wgSyntaxSettings = new SyntaxSettings;
$wgExtensionFunctions[] = "wfSyntaxExtension";

function wfSyntaxExtension() {
	global $wgParser;

	$langArray = array("actionscript","ada","apache","asm","asp","bash",
	                   "caddcl","cadlisp","c","cpp","css","delphi",
	                   "html4strict","java","javascript","lisp", "lua",
	                   "nsis","oobas","pascal","perl","php-brief","php",
 	                   "python","qbasic","sql","vb","visualfoxpro","xml",
	                   "ini");

	foreach ( $langArray as $lang ){
		$wgParser->setHook( 'highlight-' . $lang,
		create_function( '$text', '$geshi = new GeSHi(rtrim(ltrim($text,"\n\r")), ' . $lang . ', "' . $geshiPath . '");
		                 #$geshi->enable_line_numbers(GESHI_FANCY_LINE_NUMBERS);
		                 return $geshi->parse_code();'));
	}
}

?>
