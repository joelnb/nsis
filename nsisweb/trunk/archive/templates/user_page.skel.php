<?
function get_rollover($img)
{
  return 'onMouseOver="'.$img.'.src=\'images/'.$img.'2.png\'" onMouseOut="'.$img.'.src=\'images/'.$img.'.png\'"';
}
function get_image($img,$tooltip)
{
  return '<img src="images/'.$img.'.png" name="'.$img.'" width="20" height="20" border="0" alt="'.$tooltip.'">';
}

switch($view_mode) {
  case VIEWMODE_NOBUTTONS:
    $edit_link   = get_image('edit','This page is in view only mode and cannot be edited');
    $pick_link   = get_image('copy','This page is in view only mode and cannot be copied to your pick list');
    $delete_link = get_image('cut','This page is in view only mode and cannot be removed from the Archive');
    $up_link     = get_image('up','This page is in view only mode and has no parent page to browse to');
    break;
  case VIEWMODE_DETACHED:
    $edit_link   = '<a href="edit.php?pageid='.$this->get_pageid().'&instances='.$nsisweb->get_instance_history(0).'">'.get_image('edit2','Edit this page').'</a>';
    $pick_link   = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'">'.get_image('copy2','Add this page to your pick list').'</a>';
    $delete_link = get_image('cut','You are viewing this page without reference to a parent page and so it cannot be removed as a child of that parent');
    $up_link     = get_image('up','You are viewing this page without reference to a parent page and so you cannot move up to the parent');
    break;
  case VIEWMODE_NORMAL:
  default:
    $edit_link = '<a href="edit.php?pageid='.$this->get_pageid().'&instances='.$nsisweb->get_instance_history(0).'">'.get_image('edit2','Edit this page').'</a>';
    if($this->get_instanceid() == 0) {
      $pick_link   = get_image('copy','This page cannot be added to your pick list');
      $delete_link = get_image('cut','This page instance cannot be removed from the Archive');
      $up_link     = '<a href="'.$nsisweb->get_home_url($this->get_parentid()).'">'.get_image('up2','Return to the Archive home page').'</a>';
    } else {
      $pick_link   = '<a href="picklist.php?action=pick&instanceid='.$this->get_instanceid().'">'.get_image('copy2','Add this page to your pick list').'</a>';
      $delete_link = '<a href="delete.php?instanceid='.$this->get_instanceid().'">'.get_image('cut2','Remove this page instance from the Archive').'</a>';
      $up_link     = '<a href="'.$nsisweb->get_up_url().'">'.get_image('up2','View the parent of this page').'</a>';
    }
    break;
}

$page = $this->get_page();
if($page) {
  if($page->get_authorid() == 0) {
    $author = "anonymous";
  } else {
    $user = find_userid($page->get_authorid());
    $author = $user->username;
  }

  $history = '<span style="color:#888888">None</span>';
  $instances = $nsisweb->get_instance_history(-1);
  if(strlen($instances)>0) {
    $history = '<a href="browse.php">Browse</a>';
    $result  = $nsisweb->query("select a.instanceid,b.title from nsisweb_hierarchy as a,nsisweb_pages as b where a.instanceid in ($instances) and a.pageid=b.pageid",__FILE__,__LINE__);
    if($result && $nsisweb->how_many_results($result)>0) {
      $i = 0;
      while($record = $nsisweb->get_result_array($result)) {
        $history .= ' &gt; <a href="'.$nsisweb->get_page_url($record['instanceid']).'&instances='.$nsisweb->get_instance_history($i-2).'">'.$record['title'].'</a>';
      }
    }
  }
?>
<!-- user_page.skel.php: begin -->
<span style="font-size:8pt">Parent Pages: <?= $history ?></a>
<hr style="color:#eeeeee">
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td align="left" valign="middle" style="font-size: 20pt;">
      <?= $page->get_title() ?>
    </td>
    <td align="right" valign="middle">
      <?= $edit_link ?> | <?= $delete_link ?> | <?= $pick_link ?> | <?= $up_link ?>
    </td>
  </tr>
</table>
<hr style="color:#eeeeee">
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td align="left" valign="top">
      Written by <a href="profile.php?userid=<?= $page->get_authorid() ?>"><?= $author ?></a> <?= $page->get_author_date() ?>
    </td>
    <td align="right" valign="top">
      <?
      if($page->get_author_date() != $page->get_editor_date()) {
        if($page->get_authorid() != $page->get_editorid()) {
          $user        = find_userid($page->get_editorid());
          $last_author = $user->username;
        } else {
          $last_author = $author;
        }
        print 'Last updated by <a href="profile.php?userid='.$page->get_editorid().'">'.$last_author.'</a> '.$page->get_editor_date();
      }
      ?>
    </td>
  </tr>
  <tr><td><br><br></td></tr>
  <tr><td colspan="2" align="left" valign="top" style="background-color:#eeeeff;border-width:1px;border-style:solid;padding:10px;font-size:10pt;">
<!-- user_page.skel.php: source -->
<?= $page->get_pp_content() ?>
<!-- user_page.skel.php: end -->
  </td></tr>
</table>
<? } ?>