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
$edit_link = '<a href="'.$nsisweb->get_page_url('edit').'&pageid='.$pageid.'">edit</a>';
if(isset($_GET['parentid'])) {
  $delete_link = '<a href="'.$nsisweb->get_page_url('delete').'&pageid='.$pageid.'&parentid='.$_GET['parentid'].'">delete</a>';
  $up_link     = '<a href="'.$nsisweb->get_page_url($_GET['parentid']).'">up</a>';
} else {
  $delete_link = '<font color="#aaaaaa">delete</font>';
  $up_link = '<a href="'.$nsisweb->get_home_url().'">up</a>';
}
?>
<!-- user_page.skel.php: begin -->
<table style="font-family:verdana;font-size:8pt;color:#000000;" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
			<font style="font-size: 20pt;"><?= $title ?></font><br>
			<font style="font-size: 8pt;">Written by <?= $author ?>, <?= $date ?>
			<?
				$page = find_pageid($pageid);
				if($page['created'] != $page['last_updated']) {
					$user   = find_userid($page['last_author']);
					$author = $user->username;
					print ' [ Last updated by '.$author.', '.$page['last_updated'].' ]';
				}
			?>
			</font><br>
		</td>
		<td align="right" valign="top">
		  <?= $edit_link ?> | <?= $delete_link ?> | <?= $up_link ?><br>
		</td>
	</tr>
</table>
<!-- user_page.skel.php: source -->
<?= $source ?>
<!-- user_page.skel.php: end -->
