<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

$keywords       = ""; if(strlen($_POST['keywords'])>0)       { $keywords       = $_POST['keywords'];      }
$author         = ""; if(strlen($_POST['author'])>0)         { $author         = $_POST['author'];        }
$anon_author    = ""; if(strlen($_POST['anon_author'])>0)    { $anon_author    = $_POST['anon_author'];   }
$anon_editor    = ""; if(strlen($_POST['anon_editor'])>0)    { $anon_editor    = $_POST['anon_editor'];   }
$has_source     = ""; if(strlen($_POST['has_source'])>0)     { $has_source     = $_POST['has_source'];    }
$exclude_dirs   = ""; if(strlen($_POST['exclude_dirs'])>0)   { $exclude_dirs   = $_POST['exclude_dirs'];  }
$created_since  = ""; if(strlen($_POST['created_since'])>0)  { $date = strtotime($_POST['created_since']);  if($date != -1) { $created_since  = date('Y-m-d H:i:s',$date); } }
$created_until  = ""; if(strlen($_POST['created_until'])>0)  { $date = strtotime($_POST['created_until']);  if($date != -1) { $created_until  = date('Y-m-d H:i:s',$date); } }
$modified_since = ""; if(strlen($_POST['modified_since'])>0) { $date = strtotime($_POST['modified_since']); if($date != -1) { $modified_since = date('Y-m-d H:i:s',$date); } }
$modified_until = ""; if(strlen($_POST['modified_until'])>0) { $date = strtotime($_POST['modified_until']); if($date != -1) { $modified_until = date('Y-m-d H:i:s',$date); } }

if(strcmp($_POST['action'],'search') == 0) {
  $do_search = TRUE;
} else {
  $do_search = FALSE;
  //$anon_author = 'CHECKED';
  //$anon_editor = 'CHECKED';
}

if(strcmp($anon_author,'CHECKED') != 0)  $anon_author  = '';
if(strcmp($anon_editor,'CHECKED') != 0)  $anon_editor  = '';
if(strcmp($has_source,'CHECKED') != 0)   $has_source   = '';
if(strcmp($exclude_dirs,'CHECKED') != 0) $exclude_dirs = '';

$nsisweb->start_page('Search',FALSE);

?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Search</span>
<p>You can use this page to search through the content of those archive pages
whose content is stored in the database. This should mean that almost all of
the content of this site can be searched from this page. The search engine will
try to match your keywords against page titles and page content.<br>
<br>
Separate multiple authors/editors with commas, and separate multiple keywords
with spaces. The date fields understand many types of date string, if it doesn't
do what you expected try writing the date another way (e.g. 25th December 2002
doesn't work but 25 December 2002 does). The native date format used is yyyy-mm-dd hh:mm:ss.<br>
<br>
</p>
<br>
<p>
  <form name="searchform" method="post" enctype="multipart/form-data" action="search.php" onkeydown="if (event.keyCode == 13) {document.searchform.submit()}">
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
          <input type="checkbox" name="anon_editor" value="CHECKED" <?= $anon_editor ?>>&nbsp;Anonymous Editor&nbsp;<br>
          <input type="checkbox" name="has_source" value="CHECKED" <?= $has_source ?>>&nbsp;Contains Source Code&nbsp;
          <input type="checkbox" name="exclude_dirs" value="CHECKED" <?= $exclude_dirs ?>>&nbsp;Exclude Directory Pages&nbsp;
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

/* Append to the query the specific part for matching pages containing source
   code */
if(strcmp($has_source,'CHECKED') == 0) {
  if(isset($query)) $query .= " and ";
  $query .= "source like '%[source]%'";
}

/* Append to the query the specific part for excluding directory pages */
if(strcmp($exclude_dirs,'CHECKED') == 0) {
  if(isset($query)) $query .= " and ";
  $query .= 'type<>'.PAGETYPE_DIRECTORY;
}

/* Append to the query the specific part for keyword matching */
if(strlen($keywords)>0) {
  $keywords = explode(' ',$keywords);
  if(count($keywords) > 0) {
    if(isset($query)) $query .= " and ";
    $query   .= "(title like '%".$keywords[0]."%' or source like '%".$keywords[0]."%'";
    for($i=1; $i<count($keywords); $i++) {
      $query .= " or title like '%".$keywords[$i]."%' or source like '%".$keywords[$i]."%'";
    }
    $query .= ")";
  }
}

/* Append to the query the specific part for author matching, get matching
author user ids first... */
$author_count = -1;
if(strlen($author)>0) {
  $author_count = 0;
  $authors      = explode(',',$author);
  if(count($authors) > 0) {
    $temp_query = "select userid from nsisweb_users where username like '%".$authors[0]."%'";
    for($i=1; $i<count($authors); $i++) {
      $temp_query .= " or username like '%".$authors[$i]."%'";
    }

    $result = $nsisweb->query($temp_query,__FILE__,__LINE__);
    if($result) $author_count = $nsisweb->how_many_results($result);
    
    if($result && $author_count>0) {
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

    $result = $nsisweb->query($temp_query,__FILE__,__LINE__);
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
  print '<br><span style="font-family: verdana; font-size: 20pt; color: #000000;">Results</span><p>';

  /* Fire the search query */
  if(isset($query)) {
    $query = $query_base.' where '.$query;
  } else {
    $query = $query_base;
  }
  $result = $nsisweb->query($query,__FILE__,__LINE__);

  /* Process the results */
  $count = $nsisweb->how_many_results($result);
  if($result && $count > 0) {
    print "Your search returned $count result";
    if($count != 1) print 's';
    print ". ";
    if($author_count > 0) {
      print "Your entered username(s) matched $author_count users.";
    } else if($author_count == 0) {
      print "Your entered username(s) did not match any known users, no filtering by user was done.";
    }
    print "<br><br>";
    print <<<END_OF_HTML
      <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
        <tr style="background-color:#eeeeff">
          <td align="center"><b>#</b></td>
          <td align="center"><b>Author</b></td>
          <td align="center"><b>Title</b></td>
        </tr>
END_OF_HTML;
    $i        = 0;
    $index    = 1;
    $user_map = array();
    while($record = $nsisweb->get_result_array($result)) {
      if($i == 0) {
        print '<tr style="background-color:#eeffee;">';
      } else {
        print '<tr style="background-color:#eeeeee;">';
      }
      $userid = $record['author'];
      print '<td align="center">&nbsp;'.$index++.'&nbsp;</td>';
      if($userid > 0) {
        if(!is_object($user_map[$userid])) {
          $user_map[$userid] = find_userid($userid);
        }
        $user = $user_map[$userid];
        print '<td align="center">&nbsp;'.$user->username.'&nbsp;</td>';
      } else {
        print '<td align="center">&nbsp;Anonymous&nbsp;</td>';
      }
      print '<td align="left">&nbsp;<a href="viewpage.php?pageid='.$record['pageid'].'" target="_blank">'.$record['title'].'</a>&nbsp;</td>';
      print '</tr>';
      $i = 1-$i;
    }
    print "</table>";
  } else {
    if($author_count == 0) {
      print "No user names matched the name or names that you entered.";
    } else {
      print "Your search returned no results.";
    }
  }

  print "</p>";
}
$nsisweb->end_page();
?>