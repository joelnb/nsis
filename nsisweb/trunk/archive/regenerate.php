<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

$nsisweb->start_page('Regenerating Content');
echo '<font style="font-family:verdana;font-size:20pt;color:#000000;">Regenerate Content</font>';

$result = $nsisweb->query("select pageid from nsisweb_pages");
if($result && $nsisweb->how_many_results($result)>0) {
	while($record = $nsisweb->get_result_array($result)) {
		$pages[] = $record['pageid'];
	}
	print '<p>Found '.count($pages).' to regenerate.<br><br></p><ul>';
	foreach($pages as $pageid) {
		$page = find_pageid($pageid);
		if($page) {
		  print '<li>Regenerating '.$page->get_title();
			$page->save($page->get_title(),$page->get_content(),$page->get_flags());
			print "</li>\n";
		}
	}
	print '</ul><p>Done.</p>';
} else {
	print '<p>There are no pages in the archive to operate on.</p>';
}

$nsisweb->end_page();
?>