<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");

//print "<pre>"; print_r($_POST); print "</pre>";

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
if($instanceid != 0) {
	$instance = new NsisWebInstance($instanceid,FETCH_CONTENT_YES);
	$page = $instance->get_page();
} else {
	$page = new NsisWebPage($pageid,FETCH_CONTENT_YES);
	$instance = new NsisWebInstance($page);
}
$pageid = $page->get_pageid();

/* Handle error conditions */
if(!$instance || !$page->is_okay()) {
	$nsisweb->start_page('Edit');
	$pageid = $instance ? $instance->get_pageid() : $page->get_pageid();
	echo '<b><font color="red">Page '.$pageid.' not found!</font></b>';
	$nsisweb->end_page();
	exit;
} else if($page->get_type() != PAGETYPE_TEMPLATED && $page->get_type() != PAGETYPE_DIRECTORY) {
	$nsisweb->start_page('Edit');
	echo '<b><font color="red">Page '.$instance->get_pageid().' cannot be edited!</font></b>';
	$nsisweb->end_page();
	exit;
} else {
	$session = $nsisweb->get_session();
	$author  = $page->get_authorid();
	if(!$page->can_modify()) {
		$nsisweb->start_page('Edit');
		?>
		<font style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page: <font color="red">Access Denied</font></font>
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
		$page->save(htmlentities(stripslashes($_POST['title'])),stripslashes($_POST['content']),$page->get_flags());
		$nsisweb->redirect($instanceid);
		break;
	case ACTION_PREVIEW:
		$title   = htmlentities(stripslashes($_POST['title']));
		$content = stripslashes($_POST['content']);
		break;
	case ACTION_REVERT:
	default:
		$title   = $page->get_title();
		$content = $page->get_content();
		break;
}

$nsisweb->start_page('Edit');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page</font>
<p>Use the edit controls on this page to edit the page you selected. Click preview
at any time to see how your edits are affecting the appearance of the page.
Clicking revert will throw away your edits and you will begin the editing process
from scratch again. When you are finished editing press Save Changes to keep the
edits, or Cancel to discard them and return to the page you were viewing.</p>
<form name="wizard" method="post" enctype="multipart/form-data" action="edit.php">
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
	  <input type="hidden" name="pageid" value="<?= $pageid ?>">
	  <input type="hidden" name="action" value="<?= ACTION_PREVIEW ?>">
  	<a href="Cancel" onclick="document.wizard.action.value=<?= ACTION_CANCEL ?>;document.wizard.submit();return false;">Cancel</a> |
  	<a href="Revert" onclick="document.wizard.action.value=<?= ACTION_REVERT ?>;document.wizard.submit();return false;">Revert</a> |
  	<a href="Preview" onclick="document.wizard.action.value=<?= ACTION_PREVIEW ?>;document.wizard.submit();return false;">Preview</a> |
  	<a href="Save Changes" onclick="document.wizard.action.value=<?= ACTION_SAVE ?>;document.wizard.submit();return false;">Save Changes</a>
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
	$instance->show_inline();
}
$nsisweb->end_page();
?>