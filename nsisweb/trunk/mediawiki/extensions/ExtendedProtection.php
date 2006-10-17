<?php
if (!defined('MEDIAWIKI')) die();

$wgExtensionFunctions[] = 'wfExtendedProtection';

function wfExtendedProtection() {
  global $wgHooks;

  $wgHooks['userCan'][] = 'wfExtendedProtectionUserCan';
}

function wfExtendedProtectionUserCan(&$title, &$user, $action, &$result) {
  $extendedProtectionList = array(
    'EclipseNSIS - NSIS plugin for Eclipse' => 'Iceman K',
    'File Association' => 'Vytautas'
  );

  if (in_array($title->getText(), array_keys($extendedProtectionList))) {
    if ($user->isSysop() || $user->getName() == $extendedProtectionList[$title->getText()])
      return;
    if ($action != 'read')
      $result = false;
  }
}

?>
