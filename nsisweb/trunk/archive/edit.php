<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");

unset($parentid);
if(isset($_GET['parentid'])) {
  $parentid = $_GET['parentid'];
} else if(isset($_POST['parentid'])) {
  $parentid = $_POST['parentid'];
}

$revert = false;
if(strlen($_POST['action']) > 0) {
	if(strcmp($_POST['action'],'cancel') == 0) {
    $_GET['parentid'] = $parentid;
		$nsisweb->redirect($_POST['pageid']);
	} else if(strcmp($_POST['action'],'revert') == 0) {
		$revert = true;
	} else if(strcmp($_POST['action'],'save') == 0) {
    $title   = htmlentities(stripslashes($_POST['title']));
    $content = stripslashes($_POST['content']);
		update_templated_page($_POST['pageid'],$title,$content);
		$nsisweb->redirect($_POST['pageid']);
	}
}

$pageid = 0;
if($revert || $_GET['pageid'] > 0) {
	if($revert) {
		$pageid = $_POST['pageid'];
	} else {
		$pageid  = $_GET['pageid'];
	}
	$page = find_pageid($pageid);
	if ($page == FALSE) {
		$nsisweb->start_page('Edit');
		echo "<b><font color=\"red\">Page $pageid not found!</font></b>";
		$nsisweb->end_page();
		exit;
	}
  if($page['type'] != PAGETYPE_TEMPLATED &&
     $page['type'] != PAGETYPE_DIRECTORY) {
		$nsisweb->start_page('Edit');
		echo "<b><font color=\"red\">Page $pageid cannot be edited!</font></b>";
		$nsisweb->end_page();
		exit;
  }
	$title   = $page['title'];
	$content = $page['source'];
} else if($_POST['pageid'] > 0) {
	$pageid  = $_POST['pageid'];
	if (get_magic_quotes_gpc()) {
		$title   = stripslashes(htmlentities($_POST['title']));
		$content = stripslashes($_POST['content']);
	}
}

// make sure that user can edit this post
$session = $nsisweb->get_session();
$author  = $page['last_author'];
if($author != ANONYMOUS_USER_ID && $author != $session->user_id) {
	$nsisweb->start_page('Edit');
	?>
	<font style="font-family: verdana; font-size: 20pt; color: #000000;">Edit Page: <font color="red">Access Denied</font></font>
	<p>You do not have the right to edit the page entitled '<?= $page['title'] ?>'. Click <b>Go Back</b>
	to return to the page you came from.</p>
	<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
  	<a href="Go Back" onclick="history.go(-1);return false;">Go Back >></a>
	</p>
	<?
	$nsisweb->end_page();
	exit;
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
  <input type="text" style="font-family:courier new;font-size:10pt;" name="title" size="79" maxlength="255" value="<?=$title?>"><br>
	<br>
  <? if($page['type'] == PAGETYPE_DIRECTORY) { ?>
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
	  <input type="hidden" name="pageid" value="<?=$pageid?>">
	  <input type="hidden" name="action" value="preview">
    <input type="hidden" name="parentid" value="<?= $parentid ?>">
  	<a href="Cancel" onclick="wizard.action.value='cancel';wizard.submit();return false;">Cancel</a> |
  	<a href="Revert" onclick="wizard.action.value='revert';wizard.submit();return false;">Revert</a> |
  	<a href="Preview" onclick="wizard.action.value='preview';wizard.submit();return false;">Preview</a> |
  	<a href="Save Changes" onclick="wizard.action.value='save';wizard.submit();return false;">Save Changes</a>
	</p>
	</form>
<?
if(strlen($title)>0 || strlen($content)>0) {
	$session = $nsisweb->get_session();
	$result  = $nsisweb->query("select NOW()");
	$now     = $array['NOW()'];
	if($result) {
		$array     = $nsisweb->get_result_array($result);
		$processed = process_templated_content($content);
    if($page['type'] == PAGETYPE_DIRECTORY) {
		  $items = array(
			  array('pageid' => 0,'title' => 'dummy item one'),
			  array('pageid' => 1,'title' => 'dummy item two'),
			  array('pageid' => 2,'title' => 'dummy item three'),
			  array('pageid' => 3,'title' => 'dummy item four'),
			  array('pageid' => 4,'title' => 'dummy item five')
		  );
		  render_directory_page($title,$session->get_username(),$now,$processed,0,$items);
    } else  {
		  render_templated_page($title,$session->get_username(),$now,$processed,0);
    }
	}
}
$nsisweb->end_page();
?>
