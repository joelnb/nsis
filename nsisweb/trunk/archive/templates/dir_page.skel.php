<?
function get_rollover($img)
{
	return 'onMouseOver="'.$img.'.src=\'images/'.$img.'2.png\'" onMouseOut="'.$img.'.src=\'images/'.$img.'.png\'"';
}
function get_image($img,$tooltip)
{
	return '<img src="images/'.$img.'.png" name="'.$img.'" width="20" height="20" border="0" alt="'.$tooltip.'">';
}

$insert_link = '<a href="picklist.php?instanceid='.$this->get_instanceid().'" '.get_rollover('paste').'>'.get_image('paste','Insert a page from your pick list into this section').'</a>';
$edit_link   = '<a href="edit.php?instanceid='.$this->get_instanceid().'&pageid='.$this->get_pageid().'" '.get_rollover('edit').'>'.get_image('edit','Edit this page').'</a>';
if($this->get_parentid() == 0) {
  $delete_link = get_image('cut','This page instance cannot be removed from the Archive');
} else {
  $delete_link = '<a href="delete.php?instanceid='.$this->get_instanceid().'" '.get_rollover('cut').'>'.get_image('cut','Remove this page instance from the Archive').'</a>';
}
if($this->get_instanceid() == 0) {
	$up_link   = '<a href="'.$nsisweb->get_home_url().'" '.get_rollover('up').'>'.get_image('up','Return to the Archive home page').'</a>';
	$pick_link = get_image('copy','This page cannot be added to your pick list');
} else {
	$up_link   = '<a href="'.$nsisweb->get_page_url($this->get_parentid()).'" '.get_rollover('up').'>'.get_image('up','View the parent of this page').'</a>';
	$pick_link = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'" '.get_rollover('copy').'>'.get_image('copy','Add this page to your pick list').'</a>';
}

if($page = $this->get_page()) {
?>
<!-- dir_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td align="left"><font style="font-size:20pt;"><?= $page->get_title() ?></font></td>
<td align="right" valign="top"><?= $edit_link ?> | <?= $delete_link ?> | <?= $pick_link ?> | <?= $insert_link ?> | <?= $up_link ?></td>
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