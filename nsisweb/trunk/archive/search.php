<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebstorage.pkg.php");

$nsisweb->start_page('Search');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Search</font>
<p>You can use this page to search through the content of those archive pages
whose content is stored in the database. This should mean that almost all of
the content of this site can be searched from this page.<br></p>
<br>
<p>
	<form name="search" method="post" enctype="multipart/form-data" action="search.php">	
	  <table border="1" bordercolor="#aaaaaa" cellpadding="3" cellspacing="0">
	    <tr style="background-color:#eeffee">
	    	<td>&nbsp;Keywords:&nbsp;</td>
	    	<td><input type="text" name="keywords" value="<?= $keywords ?>"></td>
	    	<td>&nbsp;Author:&nbsp;</td>
	    	<td><input type="text" name="author" value="<?= $author ?>"></td>
	    </tr>
		  <tr style="background-color:#eeeeee">
		  	<td>&nbsp;Created From:&nbsp;</td>
		  	<td><input type="text" name="created_from" value="<?= $created_from ?>"></td>
		  	<td>&nbsp;To:&nbsp;</td>
		  	<td><input type="text" name="created_to" value="<?= $created_to ?>"></td>
		  </tr>
		  <tr style="background-color:#eeffee">
		  	<td>&nbsp;Modified From:&nbsp;</td>
		  	<td><input type="text" name="modified_from" value="<?= $modified_from ?>"></td>
		  	<td>&nbsp;To:&nbsp;</td>
		  	<td><input type="text" name="modified_to" value="<?= $modified_to ?>"></td>
		  </tr>
		  <tr style="background-color:#eeeeee">
		  	<td align="center" colspan="3"><input type="checkbox" name="include_orphaned" value="0">&nbsp;Include Orphaned Pages:&nbsp;</td>
		  	<td align="center">&nbsp;<input type="submit" value="Search">&nbsp;</td>
		  </tr>
	  </table>
	</form>
</p>
<?
if(isset($_POST['keywords']) && strlen($_POST['keywords']) > 0) {
	$keywords = explode(' ',$_POST['keywords']);
	$query    = "select pageid,author,title from nsisweb_pages where instr(title,'".$keywords[0]."') or instr(source,'".$keywords[0]."')";
	for($i=1; $i<count($keywords); $i++) {
		$query .= " or instr(title,'".$keywords[$i]."') or instr(source,'".$keywords[$i]."')";
	}
	$result = $nsisweb->query($query);
	if($result) {
		print <<<END_OF_HTML
<br>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Results</font>
<p>
	<table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
	  <tr style="background-color:#eeeeff">
	  	<td align="center"><b>Author</b></td>
	  	<td align="center"><b>Title</b></td>
	  </tr>
END_OF_HTML;
    $i = 0;
		while($record = $nsisweb->get_result_array($result)) {
			if($i % 0 == 0) {
				print '<tr style="background-color:#eeffee;">';
			} else {
				print '<tr style="background-color:#eeeeee;">';
			}
			$userid = $record['author'];
			if($userid > 0) {
				$user = find_userid($userid);
				print '<td align="center">&nbsp;'.$user->$username.'&nbsp;</td>';
		  } else {
			  print '<td align="center">&nbsp;Anonymous&nbsp;</td>';
		  }
			print '<td align="left">&nbsp;<a href="'.$nsisweb->get_page_url($record['pageid']).'">'.$record['title'].'</a>&nbsp;</td>';
			print '</tr>';
			$i = 1-$i;
		}
		print "</table></p>";
	}
}

$nsisweb->end_page();
?>