<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
$nsisweb->start_page('Browse Archive');
?>
<table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td align="left"><font style="font-family: verdana; font-size: 20pt; color: #000000;">Browse</font></td>
<td align="right"><a href="<?= $nsisweb->get_page_url('insert_pick_page') ?>&pageid=0">insert page</a></td>
</tr></table>
<p>Archive pages can be children of one or more other archive pages thereby forming a hierarchy. The list
of pages you see below are those pages that are at the top of the hierarchy.</p>
<?
$page_array = get_top_level_pages();
if(count($page_array)>0) {
  echo "<ul>\n";
  foreach($page_array as $page_record) {
	  echo '<li><b><a href="'.$nsisweb->get_page_url($page_record['pageid']).'">'.$page_record['title']."</a></b>\n";
	  if(strlen($page_record['description'])>0) {
	  	echo '<ul>'.$page_record['description']."</ul>\n";
  	}
  	echo "</li>\n";
  }
  echo "</ul>\n";
} else {
  echo "<ul><li>There are no pages in the archive at this time.</li></ul>\n";
}

$nsisweb->end_page();
?>