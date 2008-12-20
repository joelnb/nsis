<?php

require_once( "SpecialPage.php" );

$wgExtensionFunctions[] = "wfSimpleUpdateSetup";
$wgExtensionCredits['other'][] = array(
  'name' => 'Simple Update',
  'description' => 'allows simple page updates using one URL',
  'author' => 'Amir Szekely'
);

function wfSimpleUpdateSetup() {
  global $wgMessageCache;
  $wgMessageCache->addMessages(array('simpleupdate' => 'Simple Update'));
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
    $title = Title::newFromText($title);
    $article = new Article($title);
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
  if ( 0 == $u->getID() ) {
    global $wgAuth;
    /**
     * If the external authentication plugin allows it,
     * automatically create a new account for users that
     * are externally defined but have not yet logged in.
     */
    if ( $wgAuth->autoCreate() && $wgAuth->userExists( $u->getName() ) ) {
      if ( $wgAuth->authenticate( $u->getName(), $this->mPassword ) ) {
        $u =& $this->initUser( $u );
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    $u->loadFromDatabase();
  }

  if (!$u->checkPassword( $password )) {
    return false;
  }

  if (!$u->isSysop()) {
    return false;
  }

  // update logged on user
  global $wgUser;
  $wgUser = $u;

  return true;
}

?>