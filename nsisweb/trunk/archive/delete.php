<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");

$nsisweb->start_page('Delete');
if(strlen($_GET['pageid']) <= 0 || FALSE == ($page = find_pageid($_GET['pageid']))) {
	?>
	<font style="font-family: verdana; font-size: 20pt; color: #000000;">Delete Page: <font color="red">Invalid Page ID</font></font>
	<p>You cannot delete a page that does not exist! Click <b>Go Back</b>
	to return to the page you came from.</p>
	<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
  	<a href="Go Back" onclick="history.go(-1);return false;">Go Back >></a>
	</p>
	<?
} else {
	// make sure that user can delete this post
	$session = $nsisweb->get_session();
	$author  = $page['last_author'];
	if($author != ANONYMOUS_USER_ID && $author != $session->user_id) {
		?>
		<font style="font-family: verdana; font-size: 20pt; color: #000000;">Delete Page: <font color="red">Access Denied</font></font>
		<p>You do not have the right to delete the page entitled '<?= $page['title'] ?>'. Click <b>Go Back</b>
		to return to the page you came from.</p>
		<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
	  	<a href="Go Back" onclick="history.go(-1);return false;">Go Back >></a>
		</p>
		<?
	} else if(!delete_page_from_section($_GET['pageid'],$_GET['parentid'])) {
		?>
		<font style="font-family: verdana; font-size: 20pt; color: #000000;">Delete Page: <font color="red">Delete Failed</font></font>
		<p>The page entitled '<?= $page['title'] ?>' could not be deleted. Click <b>Go Back</b>
		to return to the page you came from.</p>
		<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
	  	<a href="Go Back" onclick="history.go(-1);return false;">Go Back >></a>
		</p>
		<?
	} else {
    if($_GET['parentid'] == 0) {
      $section = array('title' => 'Browse');
    } else {
      $section = find_pageid($_GET['parentid']);
    }
		?>
		<font style="font-family: verdana; font-size: 20pt; color: #000000;">Delete Page:</font>
		<p>The page entitled '<b><?= $page['title'] ?></b>' has been removed from section '<b><?= $section['title'] ?></b>'. It now exists only in your <a href="<?= $nsisweb->get_page_url("picklist") ?>">pick list</a>.<br><br>You can forcibly erase the page completely from within your pick list, or you can just leave it there and when you logout it will be erased anyway. Finally, you can save the page by inserting it into a section within the archive.<br><br>Click <b>Go To Section</b> to return to the section that contained the deleted page.</p>
		<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
	  	<a href="<?= $nsisweb->get_page_url('picklist') ?>">View Your Pick List</a> |
	  	<a href="<?= $nsisweb->get_page_url((int)$page['parentid']) ?>">Go To Section >></a>
		</p>
		<?
	}
}
$nsisweb->end_page();
?>