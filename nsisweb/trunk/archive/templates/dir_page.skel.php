<?
	/* This file is a template. It is included by the NSISWeb core when it needs
	   to display a page that is a container for other pages. The properties of
	   the so called "directory page" and the actual content are
	   variables available to us. We are expected to use these in this file
	   thereby "filling" the template.
	   
	   We receive:-
			 + $title   : directory/container/section title
			 + $desc    : description of the section
			 + $author  : original author of the section
			 + $date    : original creation date of the section
			 + $pageid  : the NSISWeb internal id of the section
			 + $nsisweb : the NSISWeb core object instance
			 + $items   : an array of contained pages
			   -> $pageid
			   -> $title
			   
		The $author might be SYSTEM_USER_ID in which case it isn't a user at
		all but instead this template has been invoked by the engine for some
		other nefarious use ;-)
*/
unset($parentid);
if(isset($_GET['parentid'])) {
  $parentid = $_GET['parentid'];
}

$insert_link = '<a href="'.$nsisweb->get_page_url('picklist').'&parentid='.$pageid.'">insert page</a>';
$delete_link = '<a href="'.$nsisweb->get_page_url('delete').'&parentid='.$parentid.'&pageid='.$pageid.'">delete page</a>';
if(isset($parentid)) {
  $edit_link   = '<a href="'.$nsisweb->get_page_url('edit').'&pageid='.$pageid.'&parentid='.$parentid.'">edit</a>';
  $delete_link = '<a href="'.$nsisweb->get_page_url('delete').'&pageid='.$pageid.'&parentid='.$parentid.'">delete</a>';
  $up_link     = '<a href="'.$nsisweb->get_page_url($_GET['parentid']).'">up</a>';
} else {
  $edit_link   = '<font color="#aaaaaa">edit</a>';
  $delete_link = '<font color="#aaaaaa">delete</font>';
  $up_link = '<a href="'.$nsisweb->get_home_url().'">up</a>';
}
?>
<!-- dir_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td align="left"><font style="font-size:20pt;"><?= $title ?></font></td>
<td align="right" valign="top"><?= $edit_link ?> | <?= $delete_link ?> | <?= $insert_link ?> | <?= $up_link ?></td>
</tr></table>
<p><i><?= $desc ?></i></p>
<p>
	<ul>
    <?
		if(count($items) > 0) {
			$query = 'select pageid,title,type from nsisweb_pages where type<>'.PAGETYPE_PARENTLINK.' and pageid in (';
			$first = TRUE;
			foreach($items as $child) {
				if(!$first) $query .= ',';
				$query .= $child['pageid'];
				$first = FALSE;
			}
			$query .= ')';
			$result = $nsisweb->query($query);
			if($result && $nsisweb->how_many_results($result) > 0) {
				while($record = $nsisweb->get_result_array($result)) {
					print '<li><a href="'.$nsisweb->get_page_url($record['pageid']).'&parentid='.$pageid.'">'.$record['title']."</a>\n";
					if($record['type'] == PAGETYPE_DIRECTORY) {
						$children = find_children($record['pageid']);
						print ' ('.count($children).')';
					}
				}
			}
		} else {
			print 'There are no pages in this section.<br>';
		}
		?>
	</ul>
</p>
<!-- dir_page.skel.php: end -->
