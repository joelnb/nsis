<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpicks.pkg.php");

if(count($_POST)>0 && count($_POST['picked'])>0 && strlen($_GET['parentid'])>0) {
	foreach($_POST['picked'] as $pickpageid) {
		set_page_parent($pickpageid,$_GET['parentid']);
	}
}

$nsisweb->start_page('Insert Pages');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Insert Pages</font>
<p>You have chosen to insert one or more pages from your currently picked pages into
the section you were browsing.<br>
<br>
Select the pages you wish to insert from those shown from your pick list below:</p>
<?
$picks = get_current_picks();
if(count($picks)>0) {
  echo '<form method="post" enctype="multipart/form-data" action="insert_pick_page.php">'."\n";
  echo '  <input type="hidden" name="parentid" value="'.$_GET['pageid'].'">'."\n";
  foreach($picks as $pick) {
	  if($pick['pickedtype'] == PICKTYPE_PAGE) {
	  	$pageid = $pick['pickedid'];
	  	$page   = find_pageid($pageid);
	  	if($page && strlen($page['title'])>0) {
	  		echo '<input type="checkbox" name="picked[]" value="'.$pageid.'">&nbsp;'.$page['title']."\n";
  		}
  	}
  }
  echo "</form>\n";
} else {
  echo "<ul><li>There are no pages in your pick list at this time.</ul>\n";
}

$nsisweb->end_page();
?>