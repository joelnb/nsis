<?
function get_rollover($img)
{
  return 'onMouseOver="'.$img.'.src=\'images/'.$img.'2.png\'" onMouseOut="'.$img.'.src=\'images/'.$img.'.png\'"';
}
function get_image($img,$tooltip)
{
  return '<img src="images/'.$img.'.png" name="'.$img.'" width="20" height="20" border="0" alt="'.$tooltip.'">';
}

$session = $nsisweb->get_session();

if($view_only) {
  $edit_link   = get_image('edit','This page is in view only mode and cannot be edited');
  $pick_link   = get_image('copy','This page is in view only mode and cannot be copied to your pick list');
  $delete_link = get_image('cut','This page is in view only mode and cannot be removed from the Archive');
  $up_link     = get_image('up','This page is in view only mode and has no parent page to browse to');
  $insert_link = get_image('paste','This page is in view only mode and therefore pages cannot be pasted into it');
} else {
  if($this->get_parentid() == 0 && !$session->looks_like_admin()) {
    $delete_link = get_image('cut','This page instance cannot be removed from the Archive');
  } else {
    $delete_link = '<a href="delete.php?instanceid='.$this->get_instanceid().'">'.get_image('cut2','Remove this page instance from the Archive').'</a>';
  }

  if($this->get_instanceid() == 0) {
    $up_link     = '<a href="'.$nsisweb->get_home_url().'">'.get_image('up2','Return to the Archive home page').'</a>';
    $pick_link   = get_image('copy','This page cannot be added to your pick list');
    $edit_link   = get_image('edit','This page cannot be edited');
  } else {
    $up_link     = '<a href="'.$nsisweb->get_up_url().'">'.get_image('up2','View the parent of this page').'</a>';
    $pick_link   = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'">'.get_image('copy2','Add this page to your pick list').'</a>';
    $edit_link   = '<a href="edit.php?instanceid='.$this->get_instanceid().'">'.get_image('edit2','Edit this page').'</a>';
  }

  if($this->get_instanceid() == 0 && $session->looks_like_admin()) {
    $insert_link = '<a href="picklist.php?instanceid='.$this->get_instanceid().'">'.get_image('paste2','Insert a page from your pick list into this section').'</a>';
  } else {
    $insert_link = get_image('paste','You need admin rights to insert pages into this section');
  }
}

unset($history);
$instances = $nsisweb->get_instance_history(-1);
if(strlen($instances)>0) {
  $history = '<a href="'.$nsisweb->get_page_url(0).'">Browse</a>';
  $result  = $nsisweb->query("select a.instanceid,b.title from nsisweb_hierarchy as a,nsisweb_pages as b where a.instanceid in ($instances) and a.pageid=b.pageid");
  if($result && $nsisweb->how_many_results($result)>0) {
    $i = 0;
    while($record = $nsisweb->get_result_array($result)) {
      $history .= ' &gt; <a href="'.$nsisweb->get_page_url($record['instanceid']).'&instances='.$nsisweb->get_instance_history($i-2).'">'.$record['title'].'</a>';
    }
  }
} else {
  $history = '<span style="color:#888888">None</span>';
}

if($page = $this->get_page()) {
?>
<span style="font-size:8pt;">Parent Pages: <?= $history ?></span>
<hr style="color:#eeeeee">
<!-- dir_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td align="left" valign="middle"><span style="font-size:20pt;"><?= $page->get_title() ?></span></td>
<td align="right" valign="middle"><?= $edit_link ?> | <?= $delete_link ?> | <?= $pick_link ?> | <?= $insert_link ?> | <?= $up_link ?></td>
</tr></table>
<hr style="color:#eeeeee">
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
      print '<a href="'.$nsisweb->get_page_url($child['instanceid']).'&instances='.$nsisweb->get_instance_history(0).'">'.$child['title']."</a>";
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