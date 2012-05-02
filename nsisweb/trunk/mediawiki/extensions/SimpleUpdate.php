<?php

require_once( "SpecialPage.php" );

$wgExtensionFunctions[] = "wfSimpleUpdateSetup";
$wgExtensionCredits['other'][] = array(
  'name' => 'Simple Update',
  'description' => 'allows simple page updates using one URL',
  'author' => 'Amir Szekely'
);

function wfSimpleUpdateSetup() {
  SpecialPage::addPage(new SpecialPage("Simpleupdate", '', false, 'wfSpecialSimpleUpdate', __FILE__));
}

function wfSpecialSimpleUpdate() {
  global $wgOut, $wgRequest;

  $action   = $wgRequest->getText('action');
  $user     = $wgRequest->getText('su_user');
  $password = $wgRequest->getText('su_password');
  $title    = $wgRequest->getText('su_title');
  $data     = $wgRequest->getText('su_data');
  $summary  = $wgRequest->getText('su_summary');

  if (wfSimpleUpdateLogin($user, $password)) {
    global $wgArticle;
    $title = Title::newFromText($title);
    $wgArticle = $article = new Article($title);
    $article->updateArticle($data, $summary, false, $title->userIsWatching());
    $result = 'success';
  } else {
    $result = 'bad login';
  }

  if ($action == 'raw') {
    $wgOut->disable();
    header('Pragma: nocache');
    echo $result;
    return;
  }

  $wgOut->addWikiText($result);
}

function wfSimpleUpdateLogin($user, $password) {
  // ripped from SpecialUserlogin.php

  $u = User::newFromName( $user );
  if( is_null( $u ) ) {
    return false;
  }

  if (!$u->checkPassword( $password )) {
    return false;
  }

  if (!in_array('sysop', $u->getEffectiveGroups())) {
    return false;
  }

  // update logged on user
  global $wgUser;
  $wgUser = $u;

  return true;
}

?>