<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");

/* Handle GET and POST arguments */
unset($instanceid);
if(isset($_GET['instanceid'])) {
  $instanceid = $_GET['instanceid'];
} else if(isset($_POST['instanceid'])) {
  $instanceid = $_POST['instanceid'];
}

unset($action);
if(isset($_POST['action'])) {
  $action = $_POST['action'];
}

define('ACTION_REVERT', 0);
define('ACTION_PREVIEW',1);
define('ACTION_CANCEL', 2);
define('ACTION_SAVE',   3);

/* Obey form actions */
if($action == ACTION_CANCEL) {
  $nsisweb->redirect($instanceid);
}

/* All other actions require edit rights, and for that we need to lookup the
   page and see who created it. We are given an instanceid which tells us
   which part of the page hierarchy the user is trying to edit. From the
   instanceid we can determine which page it is an instance of and then work
   with that actual page. */
$instance = new NsisWebInstance($instanceid,FETCH_CONTENT_YES);
$page     = $instance->get_page();
$pageid   = $page->get_pageid();
$session  = $nsisweb->get_session();

/* Handle error conditions */
if(!$instance || !$page) {
  $nsisweb->start_page('Edit',FALSE);
  echo '<span style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page: <span color="red">Access Denied</span></span>';
  echo '<p>Page '.$instanceid.' not found!<br><br></p>';
  $nsisweb->end_page();
  exit;
} else if($page->get_type() != PAGETYPE_TEMPLATED && $page->get_type() != PAGETYPE_DIRECTORY) {
  $nsisweb->start_page('Edit',FALSE);
  echo '<span style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page: <span color="red">Access Denied</span></span>';
  if($pageid == 0) {
  	echo '<p>You need admin rights in order to edit the root directory page of the Archive.<br><br></p>';
	} else {
	  echo '<p>Page '.$pageid.' cannot be edited!<br><br></p>';
  }
  $nsisweb->end_page();
  exit;
} else {
  $session = $nsisweb->get_session();
  $author  = $page->get_authorid();
  if(!$page->can_modify()) {
    $nsisweb->start_page('Edit',FALSE);
    ?>
    <span style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page: <span color="red">Access Denied</span></span>
    <p>You do not have the right to edit the page entitled '<?= $page->get_title() ?>'. Click <b>Go Back</b>
    to return to the page you came from.</p>
    <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
    <a href="Go Back" onclick="history.go(-1);return false;">Go Back >></a>
    </p>
    <?
    $nsisweb->end_page();
    exit;
  }
}

/* Do action specific stuff */
switch($action) {
  case ACTION_SAVE:
    $page->save(stripslashes($_POST['title']),stripslashes($_POST['content']),$page->get_flags());
    $nsisweb->redirect($instanceid);
    break;
  case ACTION_PREVIEW:
    $title   = htmlentities(stripslashes($_POST['title']));
    $content = htmlentities(stripslashes($_POST['content']));
    break;
  case ACTION_REVERT:
  default:
    $title   = $page->get_title();
    $content = $page->get_content();
    break;
}

$nsisweb->start_page('Edit',FALSE);
?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page</span>
<p>Use the edit controls on this page to edit the page you selected. Click preview
at any time to see how your edits are affecting the appearance of the page.
Clicking revert will throw away your edits and you will begin the editing process
from scratch again. When you are finished editing press Save Changes to keep the
edits, or Cancel to discard them and return to the page you were viewing.</p>
<form name="editform" method="post" enctype="multipart/form-data" action="edit.php">
  <p>Edit the title of the page: (255 characters max)<br>
    <input type="text" style="font-family:courier new;font-size:10pt;" name="title" size="79" maxlength="255" value="<?= htmlentities($title) ?>"><br>
    <br>
    <? if($page->get_type() == PAGETYPE_DIRECTORY) { ?>
    Edit the description of this directory page.
    <? } else { ?>
    Edit the content of the page.
    <? } ?>
    You can use HTML although some tags that could be
    used to attack this site will be removed from your content. Additionally you can
    enclose text inside a [source] ... [/source] token pair which will cause that
    text to be syntax highlighted as if the text is NSIS script code:<br>
    <textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="25"><?= htmlentities($content) ?></textarea>
  </p>
  <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
    <input type="hidden" name="instanceid" value="<?= $instanceid ?>">
    <input type="hidden" name="instances" value="<?= $nsisweb->get_instance_history(0) ?>">
    <input type="hidden" name="action" value="<?= ACTION_PREVIEW ?>">
    <a href="Cancel" onclick="document.editform.action.value=<?= ACTION_CANCEL ?>;document.editform.submit();return false;">Cancel</a> |
    <a href="Revert" onclick="document.editform.action.value=<?= ACTION_REVERT ?>;document.editform.submit();return false;">Revert</a> |
    <a href="Preview" onclick="document.editform.action.value=<?= ACTION_PREVIEW ?>;document.editform.submit();return false;">Preview</a> |
    <a href="Save Changes" onclick="document.editform.action.value=<?= ACTION_SAVE ?>;document.editform.submit();return false;">Save Changes</a>
  </p>
  </form>
<?
/* Show a preview of the appearance of the page */
if(strlen($title)>0 || strlen($content)>0) {
  $session = $nsisweb->get_session();
  $fake_page_details = array('title'=>$title,'source'=>$content,'author'=>$session->user_id);
  if($page->get_type() == PAGETYPE_TEMPLATED) {
    $fake_page_details['type'] = PAGETYPE_TEMPLATED;
  } else {
    $fake_page_details['type'] = PAGETYPE_DIRECTORY;
  }
  $page = new NsisWebPage($fake_page_details);
  $instance = new NsisWebInstance($page);
  $instance->show_inline(VIEWMODE_NOBUTTONS);
}
$nsisweb->end_page();
?>