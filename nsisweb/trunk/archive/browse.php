<?
include_once('engine/nsisweb.pkg.php');
include_once('engine/nsiswebpage.pkg.php');
$nsisweb->start_page('Browse Archive');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Browse</font>
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
?>
<?
$nsisweb->end_page();
?>