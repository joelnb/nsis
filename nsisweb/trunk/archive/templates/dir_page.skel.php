<?
function get_rollover($img)
{
  return 'onMouseOver="'.$img.'.src=\'images/'.$img.'2.png\'" onMouseOut="'.$img.'.src=\'images/'.$img.'.png\'"';
}
function get_image($img,$tooltip)
{
  return '<img src="images/'.$img.'.png" name="'.$img.'" width="20" height="20" border="0" alt="'.$tooltip.'">';
}

$insert_link = '<a href="picklist.php?instanceid='.$this->get_instanceid().'">'.get_image('paste2','Insert a page from your pick list into this section').'</a>';
$edit_link   = '<a href="edit.php?instanceid='.$this->get_instanceid().'&pageid='.$this->get_pageid().'">'.get_image('edit2','Edit this page').'</a>';
if($this->get_parentid() == 0) {
  $delete_link = get_image('cut','This page instance cannot be removed from the Archive');
} else {
  $delete_link = '<a href="delete.php?instanceid='.$this->get_instanceid().'">'.get_image('cut2','Remove this page instance from the Archive').'</a>';
}
if($this->get_instanceid() == 0) {
  $up_link   = '<a href="'.$nsisweb->get_home_url().'">'.get_image('up2','Return to the Archive home page').'</a>';
  $pick_link = get_image('copy','This page cannot be added to your pick list');
} else {
  $up_link   = '<a href="'.$nsisweb->get_page_url($this->get_parentid()).'">'.get_image('up2','View the parent of this page').'</a>';
  $pick_link = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'">'.get_image('copy2','Add this page to your pick list').'</a>';
}

if($page = $this->get_page()) {
?>
<!-- dir_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td align="left"><span style="font-size:20pt;"><?= $page->get_title() ?></span></td>
<td align="right" valign="top"><?= $edit_link ?> | <?= $delete_link ?> | <?= $pick_link ?> | <?= $insert_link ?> | <?= $up_link ?></td>
</tr></table>
<p><i><?= $page->get_pp_content() ?></i></p>
<p>
  <?
  $children = $this->get_children();
  if(count($children) > 0) {
    foreach($children as $child) {
      if($child['type'] == PAGETYPE_DIRECTORY) {
        print '<img src="images/folder.gif" width="16" height="16" vspace="5" hspace="5" style="vertical-align:middle;">';
      } else {
        print '<img src="images/file.gif" width="16" height="16" vspace="5" hspace="5" style="vertical-align:middle;">';
      }
      print '<a href="'.$nsisweb->get_page_url($child['instanceid']).'">'.$child['title']."</a>";
      if($child['type'] == PAGETYPE_DIRECTORY) {
        $count = NsisWebPage::get_children_count($child['pageid']);
        print " ($count)";
      }
      print "<br>\n";
    }
  } else {
    print 'There are no pages in this section.<br>';
  }
  ?>
</p>
<!-- dir_page.skel.php: end -->
<? } ?>