<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebuser.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");

$instanceid = 0;
if(isset($_GET['instanceid'])) {
  $instanceid = $_GET['instanceid'];
}

if($instanceid > 0) {
  $instance = new NsisWebInstance($instanceid);
  if(!$instance->is_okay()) show_delete_error('Page Not Found','You cannot remove a page that does not exist!');
}

/* Does the user have the right to delete this instance? To delete an instance
   the user must have the right to delete pages in the section the instance is
   contained in... the user has to be an administrator or the last person to
   edit the section (because they take over ownership). The root section, 0,
   is special in that only administrators can modify it's contents. */
$session = $nsisweb->get_session();
$user    = find_userid($session->user_id);

if($instance->get_parentid() == 0 && !$user->is_admin()) {
  show_delete_error('Access Denied','Only an administrator can modify the contents of the root section!');
} else if($instance->get_parentid() != 0) {
  $directory      = new NsisWebInstance($instance->get_parentid());
  $directory_page = $directory->get_page();
  $author         = $directory_page->get_editorid();

  if(!$directory_page->can_modify()) {
    show_delete_error('Access Denied','You must be an administrator or the owner of the section in order to remove a page within it!');
  }
}

$returnid = $instance->get_parentid();

if(!$instance->delete()) {
  show_delete_error('Delete Failed','The page you wanted to remove could not be removed from the section containing it!');
}

$page = $instance->get_page();
add_to_current_picks($page->get_pageid(),$page->get_type());
$nsisweb->start_page('Delete',FALSE);
?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Delete Page:</span>
<p>The instance of the page in that section has now been removed.<br><br>Click <b>Go To Section</b> to return to the section that contained the deleted page.</p>
<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
  <a href="picklist.php?instanceid=<?= $returnid ?>">View Your Pick List</a> |
  <a href="<?= $nsisweb->get_page_url($returnid) ?>">Go To Section >></a>
</p>
<?
$nsisweb->end_page();

function show_delete_error($summary,$message)
{
  global $nsisweb;
  $nsisweb->start_page('Delete',FALSE);
  ?>
  <span style="font-family: verdana; font-size: 20pt; color: #000000;">Delete Page: <span color="red"><?= $summary ?></span></span>
  <p><?= $message ?> Click <b>Go Back</b> to return to the page you came from.</p>
  <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
  <a href="Go Back" onclick="history.go(-1);return false;">Go Back >></a>
  </p>
  <?
  $nsisweb->end_page();
  exit;
}
?>