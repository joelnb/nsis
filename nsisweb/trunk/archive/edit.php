<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

function return_to_caller($instances,$pageid)
{
  global $nsisweb;
  $instanceid = 0;

  /* Ultra cautious */
  if(strlen($instances)>0) {
    $array = explode(',',$instances);
    if(is_array($array) && count($array)>0) {
      $int = array_pop($array);
      if(is_integer($int)) {
        $instanceid = (int)$int;
      }
    }
  }

  if($instanceid > 0) {
    $nsisweb->redirect($instanceid);
  } else {
    header("Location: ".$nsisweb->get_base_url()."/viewpage.php?pageid=$pageid");
    exit;
  }
}

/* Handle GET and POST arguments */
unset($pageid);
if(isset($_GET['pageid'])) {
  $pageid = $_GET['pageid'];
} else if(isset($_POST['pageid'])) {
  $pageid = $_POST['pageid'];
}

unset($instances);
if(isset($_GET['instances'])) {
  $instances = $_GET['instances'];
} else if(isset($_POST['instances'])) {
  $instances = $_POST['instances'];
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
  return_to_caller($instances,$pageid);
}

/* All other actions require edit rights, and for that we need to lookup the
   page and see who created it. We are given an instanceid which tells us
   which part of the page hierarchy the user is trying to edit. From the
   instanceid we can determine which page it is an instance of and then work
   with that actual page. */
$page    = new NsisWebPage($pageid);
$session = $nsisweb->get_session();

/* Handle error conditions */
if(!$page || $pageid == 0) {
  $nsisweb->start_page('Edit',FALSE);
  echo '<span style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page: <span color="red">Access Denied</span></span>';
  echo '<p>Page '.$pageid.' not found!<br><br></p>';
  $nsisweb->end_page();
  exit;
} else if($page->get_type() != PAGETYPE_TEMPLATED && $page->get_type() != PAGETYPE_DIRECTORY) {
  $nsisweb->start_page('Edit',FALSE);
  echo '<span style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page: <span color="red">Access Denied</span></span>';
  echo '<p>Internal Error: The type of page is not recognised (type='.$page->get_type().'<br><br></p>';
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
    $page->save(htmlentities(stripslashes($_POST['title'])),stripslashes($_POST['content']),$page->get_flags());
    return_to_caller($instances,$pageid);
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
    <input type="text" style="font-family:courier new;font-size:10pt;" name="title" size="79" maxlength="255" value="<?=$title?>"><br>
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
    <textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="25"><?=htmlentities($content)?></textarea>
  </p>
  <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
    <input type="hidden" name="pageid" value="<?= $pageid ?>">
    <input type="hidden" name="instances" value="<?= $instances ?>">
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
  $page     = new NsisWebPage($fake_page_details);
  $instance = new NsisWebInstance($page);
  $instance->show_inline(VIEWMODE_NOBUTTONS);
}
$nsisweb->end_page();
?>