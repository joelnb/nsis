<?
function get_rollover($img)
{
	return 'onMouseOver="'.$img.'.src=\'images/'.$img.'2.png\'" onMouseOut="'.$img.'.src=\'images/'.$img.'.png\'"';
}
function get_image($img)
{
	return '<img src="images/'.$img.'.png" name="'.$img.'" width="20" height="20" border="0" alt="'.$img.'">';
}

if($this->get_instanceid() == 0) {
	$edit_link   = get_image('edit');
	$pick_link   = get_image('copy');
	$delete_link = get_image('cut');
	$up_link     = get_image('up');
} else {
	$edit_link   = '<a href="'.$nsisweb->get_page_url('edit').'&instanceid='.$this->get_instanceid().'" '.get_rollover('edit').'>'.get_image('edit').'</a>';
	$pick_link   = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'" '.get_rollover('copy').'>'.get_image('copy').'</a>';
	$delete_link = '<a href="'.$nsisweb->get_page_url('delete').'&instanceid='.$this->get_instanceid().'" '.get_rollover('cut').'>'.get_image('cut').'</a>';
	$up_link     = '<a href="'.$nsisweb->get_page_url($this->get_parentid()).'" '.get_rollover('up').'>'.get_image('up').'</a>';
}

$page = $this->get_page();
if($page) {
	if($page->get_authorid() == 0) {
		$author = "anonymous";
	} else {
		$user = find_userid($page->get_authorid());
		$author = $user->username;
	}
?>
<!-- user_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
			<font style="font-size: 20pt;"><?= $page->get_title() ?></font><br>
			<font style="font-size: 8pt;">Written by <?= $author ?> <?= $page->get_author_date() ?>
			<?
				if($page->get_author_date() != $page->get_editor_date()) {
					if($page->get_authorid() != $page->get_editorid()) {
						$user        = find_userid($page->get_editorid());
						$last_author = $user->username;
					} else {
						$last_author = $author;
					}
					print '<br>Last updated by '.$last_author.' '.$page->get_editor_date();
				}
			?>
			</font><br>
		</td>
		<td align="right" valign="top">
		  <?= $edit_link ?> | <?= $delete_link ?> | <?= $pick_link ?> | <?= $up_link ?><br>
		</td>
	</tr>
</table>
<!-- user_page.skel.php: source -->
<?= $page->get_pp_content() ?>
<!-- user_page.skel.php: end -->
<? } ?>