<?
$insert_link = '<a href="picklist.php?instanceid='.$this->get_instanceid().'">insert page</a>';
$delete_link = '<a href="delete.php?instanceid='.$this->get_instanceid.'">delete page</a>';
if($this->get_parentid() == 0) {
  $edit_link   = '<font color="#aaaaaa">edit</a>';
  $delete_link = '<font color="#aaaaaa">delete</font>';
} else {
  $edit_link   = '<a href="edit.php?instanceid='.$this->get_instanceid().'">edit</a>';
  $delete_link = '<a href="delete.php?instanceid='.$this->get_instanceid().'">delete</a>';
}
if($this->get_instanceid() == 0) {
	$up_link   = '<a href="'.$nsisweb->get_home_url().'">up</a>';
	$pick_link = '<font color="#aaaaaa">pick</a>';
} else {
	$up_link   = '<a href="'.$nsisweb->get_page_url($this->get_parentid()).'">up</a>';
	$pick_link = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'">pick</a>';
}

if($page = $this->get_page()) {
?>
<!-- dir_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td align="left"><font style="font-size:20pt;"><?= $page->get_title() ?></font></td>
<td align="right" valign="top"><?= $edit_link ?> | <?= $pick_link ?> | <?= $delete_link ?> | <?= $insert_link ?> | <?= $up_link ?></td>
</tr></table>
<p><i><?= $page->get_pp_content() ?></i></p>
<p>
	<ul>
    <?
    $children = $this->get_children();
		if(count($children) > 0) {
			foreach($children as $child) {
				print '<li><a href="'.$nsisweb->get_page_url($child['instanceid']).'">'.$child['title']."</a>\n";
				if($child['type'] == PAGETYPE_DIRECTORY) {
					$count = get_instance_children_count($child['instanceid']);
					print " ($count)";
				}
			}
		} else {
			print 'There are no pages in this section.<br>';
		}
		?>
	</ul>
</p>
<!-- dir_page.skel.php: end -->
<? } ?>