<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page("Who's Who");

$users = $nsisweb->query("select * from nsisweb_users order by username asc",__FILE__,__LINE__);

print <<<ENDOFHTML
  <span style="font-family:verdana;font-size:20pt;color:#000000;">Who's Who?</span><br>
  <p>Archive users ordered alphabetically. Click a username to view their profile. Administrators are highlighted in yellow. High contributors are highlighted in blue, a deeper blue indicates more contributions.<br>
  <br>
  <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
ENDOFHTML;

$cols = 5;
$i    = 0;
while($record = $nsisweb->get_result_array($users)) {
	if($i == 0) {
  	print '<tr style="background-color:#eeffee;font-size:8pt;">';
 	}

	$pages_result = $nsisweb->query_one_only("select count(*) from nsisweb_pages where author=".$record['userid'].". order by created desc",__FILE__,__LINE__);
	if($pages_result) $pages_created = $pages_result['count(*)'];

 	print '<td';
 	if($record['usertype'] == USERTYPE_ADMIN) {
	 	print ' style="background-color:#ffffdd;"';
  } else if($pages_created>=20) {
	 	print ' style="background-color:#6666ff;"';
  } else if($pages_created>=15) {
	 	print ' style="background-color:#8888ff;"';
  } else if($pages_created>=10) {
	 	print ' style="background-color:#aaaaff;"';
  } else if($pages_created>=5) {
	 	print ' style="background-color:#ccccff;"';
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
		print '<td style="background-color:white;">&nbsp;</td>';
	}
	print "</tr>\n";
}

print <<<ENDOFHTML
    </table>
  </p>
ENDOFHTML;

$nsisweb->end_page();
?>