<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page("Who's Who");

$users = $nsisweb->query("select * from nsisweb_users order by username asc",__FILE__,__LINE__);

print <<<ENDOFHTML
  <span style="font-family:verdana;font-size:20pt;color:#000000;">Who's Who?</span><br>
  <p>Archive users ordered alphabetically. Click a username to view their profile. Administrators are highlighted.<br>
  <br>
  <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
ENDOFHTML;

$cols = 5;
$i    = 0;
while($record = $nsisweb->get_result_array($users)) {
	if($i == 0) {
  	print '<tr style="background-color:#eeffee;font-size:8pt;">';
 	}
 	
 	print '<td';
 	if($record['usertype'] == USERTYPE_ADMIN) {
	 	print ' style="background-color:#ffffdd;"';
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