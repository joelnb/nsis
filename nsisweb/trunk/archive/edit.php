<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");

$revert = false;
if(strlen($_POST['action']) > 0) {
	if(strcmp($_POST['action'],'cancel') == 0) {
		$nsisweb->redirect($_POST['pageid']);
	} else if(strcmp($_POST['action'],'revert') == 0) {
		$revert = true;
	} else if(strcmp($_POST['action'],'save') == 0) {
		update_templated_page($_POST['pageid'],htmlentities($_POST['title']),$_POST['content']);
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
	$page    = find_pageid($pageid);
	$title   = $page['title'];
	$content = $page['source'];
} else if($_POST['pageid'] > 0) {
	$pageid  = $_POST['pageid'];
	if (get_magic_quotes_gpc()) {
		$title   = stripslashes($_POST['title']);
		$content = stripslashes($_POST['content']);
	}
}
$title = htmlentities($title);

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
	Edit the content of the page. You can use HTML although some tags that could be
	used to attack this site will be removed from your content. Additionally you can
	enclose text inside a [source] ... [/source] token pair which will cause that
	text to be syntax highlighted as if the text is PHP code:<br>
	<textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="25"><?=htmlentities($content)?></textarea>
	</p>
	<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
	  <input type="hidden" name="pageid" value="<?=$pageid?>">
	  <input type="hidden" name="action" value="preview">
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
		render_templated_page($title,$session->get_username(),$now,$processed,0);
	}
}
$nsisweb->end_page();
?>
