<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page('Admin');

echo '<font style="font-family:verdana;font-size:20pt;color:#000000;">NSIS Archive Admin Options</font>';

$session = $nsisweb->get_session();
$user    = find_userid($session->user_id);

if(!$user->is_admin()) {
	echo '<p>This page is for users with admin rights only.</p>';
} else {
	/* Make sure the session data we print is the most upto date */
	timeout_sessions();
	
	print <<<ENDOFHTML
	<p>Administrator status gives you the right to modify any page stored in the
	database no	matter who created it. There are no other options available to an
	administrator at this time.</p>
	
	<font style="font-family:verdana;font-size:15pt;color:#000000;">Connected Sessions</font>
	<p>The following sessions are currently established:<br>
	  <br>
	  <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
	    <tr style="background-color:#eeeeff">
	    	<td>&nbsp;<b>Session ID</b>&nbsp;</td>
	    	<td>&nbsp;<b>#</b>&nbsp;</td>
	    	<td>&nbsp;<b>User</b>&nbsp;</td>
	    	<td>&nbsp;<b>Start Time</b>&nbsp;</td>
	    	<td>&nbsp;<b>Last Access</b>&nbsp;</td>
	    </tr>
ENDOFHTML;

	$i = 0;
	$result = $nsisweb->query("select sessionid,a.userid,a.created,last_access,username from nsisweb_sessions as a,nsisweb_users as b where a.userid=b.userid");
	if($result && $nsisweb->how_many_results($result) > 0) {
		while($record = $nsisweb->get_result_array($result)) {
			if($i == 0) {
				$i = 1;
				$bgcolour = '#eeffee';
			} else {
				$i = 0;
				$bgcolour = '#eeeeee';
			}

			print '<tr style="background-color:'.$bgcolour.';font-size:8pt;">';
			print '<td>&nbsp;'.$record['sessionid'].'&nbsp;</td>';
			print '<td>&nbsp;'.$record['userid'].'&nbsp;</td>';
			print '<td>&nbsp;'.$record['username'].'&nbsp;</td>';
			print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
			print '<td>&nbsp;'.$record['last_access'].'&nbsp;</td>';
			print "</tr>\n";
ENDOFHTML;
		}
	}

	$result = $nsisweb->query("select sessionid,userid,created,last_access from nsisweb_sessions where userid=0");
	if($result && $nsisweb->how_many_results($result) > 0) {
		while($record = $nsisweb->get_result_array($result)) {
			if($i == 0) {
				$i = 1;
				$bgcolour = '#eeeeee';
			} else {
				$i = 0;
				$bgcolour = '#ddddff';
			}

			print '<tr style="background-color:'.$bgcolour.';font-size:8pt;">';
			print '<td>&nbsp;'.$record['sessionid'].'&nbsp;</td>';
			print '<td>&nbsp;0&nbsp;</td>';
			print '<td>&nbsp;Anonymous&nbsp;</td>';
			print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
			print '<td>&nbsp;'.$record['last_access'].'&nbsp;</td>';
			print "</tr>\n";
ENDOFHTML;
		}
	}
	print <<<ENDOFHTML
	  </table>
	</p>
	<font style="font-family:verdana;font-size:15pt;color:#000000;">Registered Users</font>
	<p>The following users are registered on this site:<br>
	  <br>
	  <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
	    <tr style="background-color:#eeeeff">
	    	<td>&nbsp;<b>#</b>&nbsp;</td>
	    	<td>&nbsp;<b>User</b>&nbsp;</td>
	    	<td>&nbsp;<b>Created</b>&nbsp;</td>
	    	<td>&nbsp;<b>Admin</b>&nbsp;</td>
	    </tr>
ENDOFHTML;

	$result = $nsisweb->query("select userid,username,created,usertype from nsisweb_users");
	if($result && $nsisweb->how_many_results($result) > 0) {
		$i = 0;
		while($record = $nsisweb->get_result_array($result)) {
			if($i == 0) {
				$i = 1;
				$bgcolour = '#eeffee';
			} else {
				$i = 0;
				$bgcolour = '#eeeeee';
			}

			print '<tr style="background-color:'.$bgcolour.';font-size:8pt;">';
			print '<td>&nbsp;'.$record['userid'].'&nbsp;</td>';
			print '<td>&nbsp;'.$record['username'].'&nbsp;</td>';
			print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
			print '<td>&nbsp;'.($record['usertype'] == USERTYPE_ADMIN ? 'Yes' : 'No').'&nbsp;</td>';
			print "</tr>\n";
ENDOFHTML;
		}
	}
	
	print <<<ENDOFHTML
	  </table>
	</p>
ENDOFHTML;
}

$nsisweb->end_page();
?>