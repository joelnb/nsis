<?php
if (!defined('MEDIAWIKI')) die();

$wgExtensionFunctions[] = 'wfExtendedProtection';

function wfExtendedProtection() {
	global $wgHooks;

  $wgHooks['userCan'][] = 'wfExtendedProtectionUserCan';
}

function wfExtendedProtectionUserCan(&$title, &$user, $action, &$result) {
	if ($title->getText() == 'EclipseNSIS - NSIS plugin for Eclipse') {
		if ($user->isSysop() || $user->getName() == 'Iceman K')
			return;
		if ($action != 'read')
      $result = false;
	}
}

?>
