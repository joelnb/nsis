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
  $instance = new NsisWebInstance($instanceid);
  foreach($_POST['picked'] as $pageid) {
    if(strcmp($_POST['action'],'insert') == 0) {
      if($page = find_pageid($pageid)) {        
        $page->add_instance($instance->get_pageid());
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

$nsisweb->start_page('Your Pick List',FALSE);

?>
<span class="atitle">Your Pick List</span>
<p>Below you will see the pages in your pick list, a kind of clipboard for removed and newly created pages. Pages <a href="<?= $nsisweb->get_page_url('contribute') ?>">created by you</a> will appear in your pick list so
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
    <table width="100%">
      <tr>
        <td width="50" >Select</td>
        <td>&nbsp;Title</td>
        <td width="70">Preview</td>
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
            <td><input type="checkbox" name="picked[]" value="<?= $pageid ?>"></td>
            <td>&nbsp;<?= $page->get_title() ?></td>
            <td><a href="viewpage.php?pageid=<?= $pageid ?>" target="_blank">view</a></td>
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
    <p class="asubtitle">
      <?
      if(isset($instanceid)) {
        $session = $nsisweb->get_session();
        if($instanceid > 0 || $session->looks_like_admin()) {
        ?>
          <a href="<?= $nsisweb->get_page_url($instanceid); ?>">< Cancel</a> |
          <a href="Delete" onclick="pickform.action.value='delete';document.pickform.submit();return false;">Delete</a> |
          <a href="Insert" onclick="pickform.action.value='insert';document.pickform.submit();return false;">Insert ></a>
        <?
        }
      } else {
        ?>
          <a href="<?= $nsisweb->get_home_url() ?>">< Home</a> |
          <a href="Delete" onclick="pickform.action.value='delete';document.pickform.submit();return false;">Delete</a> |
          <span class="atcolord">Insert ></span>
        <?
      }
      ?>
    </p>
  </form>
<?
} else {
?>
<ul><li>There are no pages in your pick list at this time.</ul>
  <p class="asubtitle">
    <? if(isset($instanceid)) { ?>
      <a href="<?= $nsisweb->get_page_url($instanceid); ?>">< Cancel</a>
    <? } else { ?>
      <a href="<?= $nsisweb->get_home_url() ?>">< Home</a>
    <? } ?>
  </p>
<?
}
$nsisweb->end_page();
?>