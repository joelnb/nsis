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

if(count($_POST)>0 && count($_POST['picked'])>0) {
	foreach($_POST['picked'] as $pickpageid) {
		set_page_parent($pickpageid,$parentid);
		remove_from_current_picks($pickpageid);
		$nsisweb->redirect($parentid);
	}
}

$nsisweb->start_page('Insert Pages');

?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Insert Pages</font>
<p>You have chosen to insert one or more pages from your currently picked pages into
the section you were browsing. Pages <a style="text-decoration:underline;color:#0000ff;" href="<?= $nsisweb->get_page_url('contribute') ?>">created by you</a> will appear in your pick list so
that you can insert them into the archive where you feel they belong.<br>
<br>
Select the pages you wish to insert from the pages in your pick list:<br>
<?
$picks = get_current_picks();
if(count($picks)>0) {
  ?>
  <form name="insertform" method="post" enctype="multipart/form-data" action="insert_pick_page.php">
	  <input type="hidden" name="parentid" value="<?=$parentid?>">
	  <table width="100%" border="1" bordercolor="#dddddd" cellpadding="2" cellspacing="0" style="margin-bottom:20px;">
	    <tr style="background-color:#d9d9d9;font-weight:bold;">
	      <td width="50" align="center">Insert</td>
	      <td>&nbsp;Title</td>
	      <td width="70" align="center">Preview</td>
	    </tr>
  <?
  foreach($picks as $pick) {
	  if($pick['pickedtype'] == 0) {
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
		  <a href="<?= $nsisweb->get_page_url($parentid); ?>"><< Cancel</a> |
		  <a href="Submit" onclick="insertform.submit();return false;">Insert >></a>
		</p>
	</form>
	<?
} else {
	?>
  <ul><li>There are no pages in your pick list at this time.</ul>
	<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
	  <a href="<?= $nsisweb->get_page_url($parentid); ?>"><< Cancel</a>
	</p>
	<?
}
echo '</p>';
$nsisweb->end_page();
?>