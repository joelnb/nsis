<?
if($this->get_instanceid() == 0) {
	$edit_link   = '<font color="#aaaaaa">edit</a>';
	$pick_link   = '<font color="#aaaaaa">pick</a>';
	$delete_link = '<font color="#aaaaaa">delete</a>';
	$up_link     = '<font color="#aaaaaa">up</a>';
} else {
	$edit_link   = '<a href="'.$nsisweb->get_page_url('edit').'&instanceid='.$this->get_instanceid().'">edit</a>';
	$pick_link   = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'">pick</a>';
	$delete_link = '<a href="'.$nsisweb->get_page_url('delete').'&instanceid='.$this->get_instanceid().'">delete</a>';
	$up_link     = '<a href="'.$nsisweb->get_page_url($this->get_parentid()).'">up</a>';
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
		  <?= $edit_link ?> | <?= $pick_link ?> | <?= $delete_link ?> | <?= $up_link ?><br>
		</td>
	</tr>
</table>
<!-- user_page.skel.php: source -->
<?= $page->get_pp_content() ?>
<!-- user_page.skel.php: end -->
<? } ?>