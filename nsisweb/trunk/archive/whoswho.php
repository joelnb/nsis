<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page("Who's Who");

$users = $nsisweb->query("select * from nsisweb_users order by username asc",__FILE__,__LINE__);

print <<<ENDOFHTML
  <span class="atitle">Who's Who?</span><br>
  <p>Archive users ordered alphabetically. Click a username to view their profile. Administrators are highlighted in yellow. High contributors are highlighted in blue, a deeper blue indicates more contributions.<br>
  <br>
  <table>
ENDOFHTML;

$cols = 5;
$i    = 0;
while($record = $nsisweb->get_result_array($users)) {
	if($i == 0) {
  	print '<tr>';
 	}

	$pages_result = $nsisweb->query_one_only("select count(*) from nsisweb_pages where author=".$record['userid'].". order by created desc",__FILE__,__LINE__);
	if($pages_result) $pages_created = $pages_result['count(*)'];

 	print '<td';
 	if($record['usertype'] == USERTYPE_ADMIN) {
	 	print ' class="aucolora"';
  } else if($pages_created>=20) {
	 	print ' class="aucolor20"';
  } else if($pages_created>=15) {
	 	print ' class="aucolor15"';
  } else if($pages_created>=10) {
	 	print ' class="aucolor10"';
  } else if($pages_created>=5) {
	 	print ' class="aucolor5"';
  }

	print '>&nbsp;<a href="profile.php?userid='.$record['userid'].'">'.$record['username'].'</a>&nbsp;</td>';

  $i++;
  if($i == $cols) {
  	print "</tr>\n";
  	$i = 0;
 	}
}

if($i > 0) {
	while($i++ != $cols) {
		print '<td>&nbsp;</td>';
	}
	print "</tr>\n";
}

print <<<ENDOFHTML
    </table>
  </p>
ENDOFHTML;

$nsisweb->end_page();
?>