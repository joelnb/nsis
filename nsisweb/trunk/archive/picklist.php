<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpicks.pkg.php");

unset($parentid);
if(strlen($_POST['parentid'])>0) {
	$parentid = $_POST['parentid'];
} else if(strlen($_GET['parentid'])>0) {
	$parentid = $_GET['parentid'];
}

if(count($_POST)>0 && count($_POST['picked'])>0 && strlen($_POST['action'])>0) {
	foreach($_POST['picked'] as $pickpageid) {
    if(strcmp($_POST['action'],'insert') == 0) {
		  set_page_parent($pickpageid,$parentid);
		  remove_from_current_picks($pickpageid);
    } else if(strcmp($_POST['action'],'delete') == 0) {
		  remove_from_current_picks($pickpageid);
    }
	}
  unset($_POST['picked']);
  unset($_POST['parentid']);
  unset($_GET['parentid']);

  if(strcmp($_POST['action'],'insert') == 0 ||
     strcmp($_POST['action'],'delete') == 0) {
	  $nsisweb->redirect($parentid);
  }
}

$nsisweb->start_page('Your Pick List');

?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Your Pick List</font>
<p>Below you will see the pages in your pick list, a kind of clipboard for removed and newly created pages. Pages <a style="text-decoration:underline;color:#0000ff;" href="<?= $nsisweb->get_page_url('contribute') ?>">created by you</a> will appear in your pick list so
that you can insert them into the archive where you feel they belong. You will only be able to insert a page if you came to your pick list by clicking on an Insert link in the archive, otherwise the action will be greyed out and unavailable.<br>
<br>
Select one or more pages from the pick list and then click an action link at the bottom:<br>
<?
$picks = get_current_picks();
if(count($picks)>0) {
  ?>
  <form name="pickform" method="post" enctype="multipart/form-data" action="picklist.php">
	  <input type="hidden" name="parentid" value="<?=$parentid?>">
    <input type="hidden" name="action" value="insert">
	  <table width="100%" border="1" bordercolor="#dddddd" cellpadding="2" cellspacing="0" style="margin-bottom:20px;">
	    <tr style="background-color:#d9d9d9;font-weight:bold;">
	      <td width="50" align="center">Insert</td>
	      <td>&nbsp;Title</td>
	      <td width="70" align="center">Preview</td>
	    </tr>
  <?
  foreach($picks as $pick) {
    /* Add support for other page types as needed */
	  if($pick['pickedtype'] == PAGETYPE_TEMPLATED || 
       $pick['pickedtype'] == PAGETYPE_DIRECTORY) {
	  	$pageid = $pick['pickedid'];
	  	$page   = find_pageid($pageid);
	  	if($page && strlen($page['title'])>0) {
	  		?>
	  		<tr>
	  		  <td align="center" valign="middle"><input style="margin-left:10px;" type="checkbox" name="picked[]" value="<?=$pageid?>"></td>
	  		  <td align="left" valign="middle">&nbsp;<?=$page['title']?></td>
	  		  <td align="center" valign="middle"><a style="text-decoration:underline;color:#0000ff;" href="<?= $nsisweb->get_page_url($pageid) ?>" target="preview">view</a></td>
	  		</tr>
	  		<?
  		}
  	}
  }
  ?>
    </table>
    <p>Press Cancel to return to the page you were viewing before, or Insert to add
    the ticked pages as children of the page you were viewing.</p>
		<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
      <? if(isset($parentid)) { ?>
		  <a href="<?= $nsisweb->get_page_url($parentid); ?>"><< Cancel</a> |
      <a href="Delete" onclick="pickform.action.value='delete';pickform.submit();return false;">Delete</a> |
		  <a href="Insert" onclick="pickform.action.value='insert';pickform.submit();return false;">Insert >></a>
      <? } else { ?>
		  <a href="Cancel" onclick="history.go(-1);return false;"><< Cancel</a> |
      <a href="Delete" onclick="pickform.action.value='delete';pickform.submit();return false;">Delete</a> |
      <font color="#aaaaaa">Insert >></a>
      <? } ?>
		</p>
	</form>
	<?
} else {
	?>
  <ul><li>There are no pages in your pick list at this time.</ul>
	<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
    <? if(isset($parentid)) { ?>
	  <a href="<?= $nsisweb->get_page_url($parentid); ?>"><< Cancel</a>
    <? } else { ?>
		<a href="Cancel" onclick="history.go(-1);return false;"><< Cancel</a>
    <? } ?>
	</p>
	<?
}
echo '</p>';
$nsisweb->end_page();
?>