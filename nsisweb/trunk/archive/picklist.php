<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpicks.pkg.php");

if(strlen($_POST['instanceid'])>0) {
  $instanceid = $_POST['instanceid'];
} else if(strlen($_GET['instanceid'])>0) {
  $instanceid = $_GET['instanceid'];
}

if(strcmp($_GET['action'],'pick') == 0) {
  $instance = new NsisWebInstance($instanceid);
  $page = new NsisWebPage($instance->get_pageid());
  if($instance->is_okay() && $page->is_okay()) {
    add_to_current_picks($page->get_pageid(),$page->get_type());
  }
} else if(strlen($_POST['action'])>0 && count($_POST['picked'])>0) {
  foreach($_POST['picked'] as $pageid) {
    if(strcmp($_POST['action'],'insert') == 0) {
      if($page = find_pageid($pageid)) {
        $instance = new NsisWebInstance($instanceid);
        $parentid = new NsisWebPage($instance->get_pageid());
        $page->add_instance($parentid);
        remove_from_current_picks($pageid);
      }
    } else if(strcmp($_POST['action'],'delete') == 0) {
      remove_from_current_picks($pageid);
    }
  }

  unset($_POST['picked']);
  unset($_POST['instanceid']);
  unset($_GET['instanceid']);

  if(strcmp($_POST['action'],'insert') == 0) {
    $nsisweb->redirect($instanceid);
  } else if(Strcmp($_POST['action'],'delete') == 0) {
    unset($instanceid);
  }
}

$nsisweb->start_page('Your Pick List');

?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Your Pick List</span>
<p>Below you will see the pages in your pick list, a kind of clipboard for removed and newly created pages. Pages <a style="text-decoration:underline;color:#0000ff;" href="<?= $nsisweb->get_page_url('contribute') ?>">created by you</a> will appear in your pick list so
that you can insert them into the archive where you feel they belong. You will only be able to insert a page if you came to your pick list by clicking on an Insert link in the archive, otherwise the action will be greyed out and unavailable.<br>
<br>
Select one or more pages from the pick list and then click an action link at the bottom:<br>
<?
$picks = get_current_picks();
if(count($picks)>0) {
  ?>
  <form name="pickform" method="post" enctype="multipart/form-data" action="picklist.php">
    <input type="hidden" name="instanceid" value="<?= $instanceid ?>">
    <input type="hidden" name="action" value="insert">
    <table width="100%" border="1" bordercolor="#dddddd" cellpadding="2" cellspacing="0" style="margin-bottom:20px;">
      <tr style="background-color:#d9d9d9;font-weight:bold;">
  <td width="50" align="center">Select</td>
  <td>&nbsp;Title</td>
  <td width="70" align="center">Preview</td>
      </tr>
  <?
  foreach($picks as $pick) {
    /* Add support for other page types as needed */
    if($pick['pickedtype'] == PAGETYPE_TEMPLATED || 
      $pick['pickedtype'] == PAGETYPE_DIRECTORY) {
      $pageid = $pick['pickedid'];
      if($page = find_pageid($pageid)) {
  if(strlen($page->get_title())>0) {
    ?>
    <tr>
      <td align="center" valign="middle"><input style="margin-left:10px;" type="checkbox" name="picked[]" value="<?= $pageid ?>"></td>
      <td align="left" valign="middle">&nbsp;<?= $page->get_title() ?></td>
      <td align="center" valign="middle"><a style="text-decoration:underline;color:#0000ff;" href="viewpage.php?pageid=<?= $pageid ?>" target="_blank">view</a></td>
    </tr>
    <?
  }
      }
    }
  }
  ?>
    </table>
    <p>Press Cancel to return to the page you were viewing before, or Insert to add
    the ticked pages as children of the page you were viewing.</p>
    <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
      <?
      if(isset($instanceid)) {
  $session = $nsisweb->get_session();
  if($instanceid > 0 || $session->looks_like_admin()) {
  ?>
    <a href="<?= $nsisweb->get_page_url($instanceid); ?>"><< Cancel</a> |
          <a href="Delete" onclick="pickform.action.value='delete';document.pickform.submit();return false;">Delete</a> |
    <a href="Insert" onclick="pickform.action.value='insert';document.pickform.submit();return false;">Insert >></a>
  <?
  }
      } else {
        ?>
    <a href="<?= $nsisweb->get_home_url() ?>"><< Home</a> |
    <a href="Delete" onclick="pickform.action.value='delete';document.pickform.submit();return false;">Delete</a> |
    <span style="color:#aaaaaa">Insert >></span></a>
  <?
      }
      ?>
    </p>
</form>
<?
} else {
?>
<ul><li>There are no pages in your pick list at this time.</ul>
  <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
    <? if(isset($instanceid)) { ?>
      <a href="<?= $nsisweb->get_page_url($instanceid); ?>"><< Cancel</a>
    <? } else { ?>
      <a href="<?= $nsisweb->get_home_url() ?>"><< Home</a>
    <? } ?>
  </p>
<?
}
echo '</p>';
$nsisweb->end_page();
?>