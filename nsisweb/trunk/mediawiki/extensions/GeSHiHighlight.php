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

	$langArray = array("actionscript","ada","apache","applescript","asm",
	                   "asp","autoit","bash","blitzbasic","bnf","c","caddcl",
	                   "cadlisp","cfdg","cfm","cpp-qt","cpp","csharp","css",
	                   "c_mac","d","delphi","diff","div","dos","eiffel",
	                   "fortran","freebasic","gml","groovy","html4strict",
	                   "idl","ini","inno","io","ioex","java","java5",
	                   "javascript","latex","lisp","lua","matlab","mirc",
	                   "mpasm","mysql","nsis","objc","ocaml-brief","ocaml",
	                   "oobas","oracle8","pascal","perl","php-brief","php",
	                   "plsql","python","qbasic","reg","robots","ruby","sas",
	                   "scheme","sdlbasic","smalltalk","smarty","sql","tcl",
	                   "thinbasic","tsql","vb","vbnet","vhdl","visualfoxpro",
                     "winbatch","xml");

	foreach ( $langArray as $lang ){
		$wgParser->setHook( 'highlight-' . $lang,
		create_function( '$text', '$geshi = new GeSHi(rtrim(ltrim($text,"\n\r")), ' . $lang . ', "' . $geshiPath . '");
		                 #$geshi->enable_line_numbers(GESHI_FANCY_LINE_NUMBERS);
		                 return $geshi->parse_code();'));
	}
}

?>
