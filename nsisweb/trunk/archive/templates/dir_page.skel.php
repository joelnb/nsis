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
*/
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;"><?= $title ?></font><br>
<p><i><?= $desc ?></i></p>
<p>
	<ul>
    <?
		if(count($items) > 0) {
			foreach($items as $item) {
				?>
				<li><a href="<?= $nsisweb->wwwroot.'/nsisweb.php?page='.$item['pageid'] ?>"><?= $item['title'] ?></a>
				<?
			}
		} else {
			<? There are no pages in this section.<br> ?>
		}
		?>
	</ul>
</p>