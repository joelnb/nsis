<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebstorage.pkg.php");

$keywords       = $_POST['keywords'];
$author         = $_POST['author'];
$anon_author    = $_POST['anon_author'];
$anon_editor    = $_POST['anon_editor'];
$created_since   = $_POST['created_since'];
$created_until     = $_POST['created_until'];
$modified_since  = $_POST['modified_since'];
$modified_until    = $_POST['modified_until'];
$allow_orphans  = $_POST['allow_orphans'];

if(strcmp($_POST['action'],'search') == 0) {
	$do_search = TRUE;
} else {
	$do_search = FALSE;
}

if(strcmp($anon_author,'CHECKED') != 0) $anon_author = '';
if(strcmp($anon_editor,'CHECKED') != 0) $anon_editor = '';
if(strcmp($allow_orphans,'CHECKED') != 0) $allow_orphans = '';

$nsisweb->start_page('Search');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Search</font>
<p>You can use this page to search through the content of those archive pages
whose content is stored in the database. This should mean that almost all of
the content of this site can be searched from this page.<br></p>
<br>
<p>
	<form name="search" method="post" enctype="multipart/form-data" action="search.php">	
	  <input type="hidden" name="action" value="search">
	  <table border="1" bordercolor="#aaaaaa" cellpadding="3" cellspacing="0">
	    <tr style="background-color:#eeeeee">
	    	<td>&nbsp;Keywords:&nbsp;</td>
	    	<td colspan="3"><input type="text" name="keywords" size="56" value="<?= $keywords ?>"></td>
	    </tr>
		  <tr style="background-color:#ffffff">
	    	<td>&nbsp;Author:&nbsp;</td>
	    	<td><input type="text" name="author" value="<?= $author ?>"></td>
	    	<td>&nbsp;Editor:&nbsp;</td>
	    	<td><input type="text" name="editor" value="<?= $editor ?>"></td>
	    </tr>
		  <tr style="background-color:#eeeeee">
		  	<td>&nbsp;Created: From&nbsp;</td>
		  	<td><input type="text" name="created_since" value="<?= $created_since ?>">
		  	<td>&nbsp;To&nbsp;</td>
		  	<td><input type="text" name="created_until" value="<?= $created_until ?>"></td>
		  </tr>
		  <tr style="background-color:#ffffff">
		  	<td>&nbsp;Modified: From&nbsp;</td>
		  	<td><input type="text" name="modified_since" value="<?= $modified_since ?>"></td>
		  	<td>&nbsp;To&nbsp;</td>
		  	<td><input type="text" name="modified_until" value="<?= $modified_until ?>"></td>
		  </tr>
		  <tr style="background-color:#eeeeee">
		  	<td colspan="4" align="center">
			  	<input type="checkbox" name="anon_author" value="CHECKED" <?= $anon_author ?>>&nbsp;Anonymous Author&nbsp;
			  	<input type="checkbox" name="anon_editor" value="CHECKED" <?= $anon_editor ?>>&nbsp;Anonymous Editor&nbsp;
			  	<input type="checkbox" name="allow_orphans" value="CHECKED" <?= $allow_orphans ?>>&nbsp;Include Orphans&nbsp;
		  	</td>
		  </tr>
	  </table>
	  <br>
	  <center><input type="submit" value="Search"></center>
	</form>
</p>
<?
$query_base = "select pageid,author,title from nsisweb_pages";
unset($query);

/* Append to the query the specific part for including orphaned pages */
if(strcmp($allow_orphans,'CHECKED') != 0) {
	if(isset($query)) $query .= " and ";
	$query .= "flags & ".PAGEFLAG_ORPHANED." = 0";
}

/* Append to the query the specific part for keyword matching */
if(strlen($keywords)>0) {
	$keywords = explode(' ',$keywords);
	if(count($keywords) > 0) {
		if(isset($query)) $query .= " and ";
		$query   .= "(instr(title,'".$keywords[0]."') or instr(source,'".$keywords[0]."')";
		for($i=1; $i<count($keywords); $i++) {
			$query .= " or instr(title,'".$keywords[$i]."') or instr(source,'".$keywords[$i]."')";
		}
		$query .= ")";
	}
}

/* Append to the query the specific part for author matching, get matching
   author user ids first... */
if(strlen($author)>0) {
	$authors = explode(',',$author);
	if(count($authors) > 0) {
		$temp_query = "select userid from nsisweb_users where username like '%".$authors[0]."%'";
		for($i=1; $i<count($authors); $i++) {
			$temp_query .= " or username like '%".$authors[$i]."%'";
		}

		$result = $nsisweb->query($temp_query);
		if($result && $nsisweb->how_many_results($result)>0) {
			if(isset($query)) $query .= " and ";
			$query .= "author in (";
			$first = TRUE;
			while($record = $nsisweb->get_result_array($result)) {
				if(!$first) $query .= ",";
				$query .= (int)$record['userid'];
				$first = FALSE;
			}
			if(strcmp($anon_author,'CHECKED') == 0) {
				$query .= ",0";
			}
			$query .= ")";
		}
	}
} else {
	/* Append to the query to match the anonymous author if required */
	if(strcmp($anon_author,'CHECKED') == 0) {
		if(isset($query)) $query .= " and ";
		$query .= "author=0";
	}
}

/* Append to the query the specific part for editor matching, get matching
   author user ids first... */
if(strlen($editor)>0) {
	$editors = explode(',',$editor);
	if(count($editors) > 0) {
		$temp_query = "select userid from nsisweb_users where username like '%".$editors[0]."%'";
		for($i=1; $i<count($editors); $i++) {
			$temp_query .= " or username like '%".$editors[$i]."%'";
		}

		$result = $nsisweb->query($temp_query);
		if($result && $nsisweb->how_many_results($result)>0) {
			if(isset($query)) $query .= " and ";
			$query .= "last_author in (";
			$first = TRUE;
			while($record = $nsisweb->get_result_array($result)) {
				if(!$first) $query .= ",";
				$query .= (int)$record['userid'];
				$first = FALSE;
			}
			if(strcmp($anon_editor,'CHECKED') == 0) {
				$query .= ",0";
			}
			$query .= ")";
		}
	}
} else {
	/* Append to the query to match the anonymous editor if required */
	if(strcmp($anon_editor,'CHECKED') == 0) {
		if(isset($query)) $query .= " and ";
		$query .= "last_author=0";
	}
}

/* Append to the query the specific part for date matching */
if(strlen($created_since)>0) {
	$date = strtotime($created_since);
	if($date != -1) {
		if(isset($query)) $query .= " and ";
    $query .= "created >= '".date('Y-m-d H:i:s',$date)."'";
  }
}
if(strlen($created_until)>0) {
	$date = strtotime($created_until);
	if($date != -1) {
		if(isset($query)) $query .= " and ";
		$query .= "created <= '".date('Y-m-d H:i:s',$date)."'";
  }
}
if(strlen($modified_since)>0) {
	$date = strtotime($modified_since);
	if($date != -1) {
		if(isset($query)) $query .= " and ";
		$query .= "last_updated >= '".date('Y-m-d H:i:s',$date)."'";
	}
}
if(strlen($modified_until)>0) {
	$date = strtotime($modified_until);
	if($date != -1) {
		if(isset($query)) $query .= " and ";
		$query .= "last_updated <= '".date('Y-m-d H:i:s',$date)."'";
	}
}

if($do_search) {
	/* Head up the search results area on the generated page */
	print '<br><font style="font-family: verdana; font-size: 20pt; color: #000000;">Results</font><p>';

	/* Fire the search query */
	if(isset($query)) {
		$query = $query_base.' where '.$query;
	} else {
		$query = $query_base;
	}
	$result = $nsisweb->query($query);

	/* Process the results */
	if($result && $nsisweb->how_many_results($result) > 0) {
		print <<<END_OF_HTML
	<table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
	  <tr style="background-color:#eeeeff">
	  	<td align="center"><b>Author</b></td>
	  	<td align="center"><b>Title</b></td>
	  </tr>
END_OF_HTML;
	  $i = 0;
		while($record = $nsisweb->get_result_array($result)) {
			if($i == 0) {
				print '<tr style="background-color:#eeffee;">';
			} else {
				print '<tr style="background-color:#eeeeee;">';
			}
			$userid = $record['author'];
			if($userid > 0) {
				$user = find_userid($userid);
				print '<td align="center">&nbsp;'.$user->username.'&nbsp;</td>';
		  } else {
			  print '<td align="center">&nbsp;Anonymous&nbsp;</td>';
		  }
			print '<td align="left">&nbsp;<a href="'.$nsisweb->get_page_url($record['pageid']).'">'.$record['title'].'</a>&nbsp;</td>';
			print '</tr>';
			$i = 1-$i;
		}
		print "</table>";
	} else {
		print "Your search returned no results.";
	}

	print "</p>";
}
$nsisweb->end_page();
?>