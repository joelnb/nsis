<?php
if (!defined('MEDIAWIKI')) die();

$wgExtensionFunctions[] = 'wfExtendedProtection';

function wfExtendedProtection() {
	global $wgHooks;
	
	$wgHooks['ArticleSave'][] = 'wfExtendedProtectionArticleSave';
}

function wfExtendedProtectionArticleSave(&$article, &$user, &$text, &$summary, &$minoredit, &$watchthis, &$sectionanchor) {
	$title = $article->getTitle();
	if ($title->getText() == 'EclipseNSIS - NSIS plugin for Eclipse') {
		if ($user->isSysop() || $user->getName() == 'Iceman K') {
			return true;
		}
		global $wgOut;
		$wgOut->addWikiText( "<span style=\"color: red; font-size: 140%\">This page is protected and can only be edited by sysops and Iceman K.</span>" );
		return false;
	}
	return true;
}

?>
