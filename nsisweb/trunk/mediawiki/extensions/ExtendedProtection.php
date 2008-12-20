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
    'Adding Language strings as resources' => 'CancerFace'
  );

  if (in_array($title->getText(), array_keys($extendedProtectionList))) {
    if (in_array('sysop', $user->getEffectiveGroups()) || $user->getName() == $extendedProtectionList[$title->getText()]) {
      return true;
    }
    if ($action != 'read') {
      $result = false;
      return false;
    }
  }

  return true;
}

?>
