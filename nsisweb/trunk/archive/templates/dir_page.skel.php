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
?>
<table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td align="left"><font style="font-family: verdana; font-size: 20pt; color: #000000;"><?= $title ?></font></td>
<td align="right"><a href="<?= $nsisweb->get_page_url('insert_pick_page') ?>&parentid=<?= $pageid ?>">insert page</a></td>
</tr></table>
<p><i><?= $desc ?></i></p>
<p>
	<ul>
    <?
		if(count($items) > 0) {
			foreach($items as $item) {
				print '<li><a href="'.$nsisweb->get_base_url().'/nsisweb.php?page='.$item['pageid'].'">'.$item['title']."</a>\n";
				if($item['type'] == PAGETYPE_DIRECTORY) {
					$children = find_children($item['pageid']);
					print ' ('.count($children).')';
				}
			}
		} else {
			print 'There are no pages in this section.<br>';
		}
		?>
	</ul>
</p>
