<?
	/* This file is a template. It is included by the NSISWeb core when it needs
	   to display a page of user created content. The properties of the user page
	   (such as the author, creation date, etc) and the actual content are
	   variables available to us. We are expected to use these in this file
	   thereby "filling" the template.
	   
	   We receive:-
			 + $title   : user document title
			 + $author  : original author of the document
			 + $date    : original creation date of the document
			 + $source  : the document content
			 + $pageid  : the NSISWeb internal id of the user document
			 + $nsisweb : the NSISWeb core object instance
*/
	$edit_link = '<a href="'.$nsisweb->get_home_url().'/nsisweb.php?action=edit&pageid='.$pageid.'">edit</a>';
	$delete_link = '<a href="'.$nsisweb->get_home_url().'/nsisweb.php?action=delete&pageid='.$pageid.'">delete</a>';
?>
<!-- dir_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
			<font style="font-family: verdana; font-size: 20pt; color: #000000;"><?= $title ?></font><br>
			<font style="font-family: verdana; font-size: 8pt; color: #000000;">Written by <?= $author ?>, <?= $date ?></font><br>
		</td>
		<td align="right">
		  <?= $edit_link ?> | <?= $delete_link ?><br>
		</td>
	</tr>
</table>
<!-- dir_page.skel.php: source -->
<?= $source ?>
<!-- dir_page.skel.php: end -->
