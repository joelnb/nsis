<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page('Admin',FALSE);

echo '<span style="font-family:verdana;font-size:20pt;color:#000000;">NSIS Archive Admin Options</span>';

$session = $nsisweb->get_session();
$user    = find_userid($session->user_id);

if(!$user->is_admin()) {
  echo '<p>This page is for users with admin rights only.</p>';
} else {
  if(strcmp($_GET['action'],'grant') == 0 && $_GET['userid'] > 0) {
    $nsisweb->query('update nsisweb_users set usertype='.USERTYPE_ADMIN.' where userid='.$_GET['userid']);
  } else if(strcmp($_GET['action'],'phpinfo') == 0) {
    echo '<p>The PHP engine reports:<br><br></p>';
    phpinfo();
    $nsisweb->end_page();
    die();
  }
  
  /* Make sure the session data we print is the most upto date */
  timeout_sessions();
  
  $time_web = date('Y-m-d H:i:s',time());
  
  $time_db  = 'unknown';
  $record   = $nsisweb->query_one_only("select NOW()");
  if($record)  $time_db = $record['NOW()'];

  print <<<ENDOFHTML
  <p>Administrator status gives you the right to modify any page stored in the
  database no  matter who created it, and the right to grant admin rights to
  other users.</p>
  
  <span style="font-family:verdana;font-size:15pt;color:#000000;">Web Server Info</span>
  <p>The time on the web server is $time_web. The time on the database server is
  $time_db. PHP diagnostics can be viewed  <a href="admin.php?action=phpinfo">here</a></p>
  
  <span style="font-family:verdana;font-size:15pt;color:#000000;">Connected Sessions</span>
  <p>The following sessions are currently established:<br>
    <br>
    <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
      <tr style="background-color:#eeeeff">
        <td>&nbsp;<b>ID</b>&nbsp;</td>
        <td>&nbsp;<b>User</b>&nbsp;</td>
        <td>&nbsp;<b>Start Time</b>&nbsp;</td>
        <td>&nbsp;<b>Last Access</b>&nbsp;</td>
        <td>&nbsp;<b>IP</b>&nbsp;</td>
        <td>&nbsp;<b>Persist</b>&nbsp;</td>
      </tr>
ENDOFHTML;

  $i = 0;
  $result = $nsisweb->query("select sessionid,a.userid,a.created,last_access,username,ip,a.flags from nsisweb_sessions as a,nsisweb_users as b where a.userid=b.userid order by ip");
  if($result && $nsisweb->how_many_results($result) > 0) {
    while($record = $nsisweb->get_result_array($result)) {
      if($i == 0) {
        $i = 1;
        $bgcolour = '#eeffee';
      } else {
        $i = 0;
        $bgcolour = '#eeeeee';
      }

      print '<tr style="background-color:'.$bgcolour.';font-size:8pt;" title="Session ID: '.$record['sessionid'].'">';
      print '<td>&nbsp;'.$record['userid'].'&nbsp;</td>';
      print '<td>&nbsp;'.$record['username'].'&nbsp;</td>';
      print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
      print '<td>&nbsp;'.$record['last_access'].'&nbsp;</td>';
      print '<td>&nbsp;'.$record['ip'].'&nbsp;</td>';
      print '<td>&nbsp;'.($record['flags'] & SESSIONFLAG_PERSIST ? 'Yes' : 'No').'&nbsp;</td>';
      print "</tr>\n";
ENDOFHTML;
    }
  }

  $result = $nsisweb->query("select sessionid,userid,created,last_access,ip from nsisweb_sessions where userid=0 order by ip");
  if($result && $nsisweb->how_many_results($result) > 0) {
    while($record = $nsisweb->get_result_array($result)) {
      if($i == 0) {
        $i = 1;
        $bgcolour = '#eeffee';
      } else {
        $i = 0;
        $bgcolour = '#eeeeee';
      }

      print '<tr style="background-color:'.$bgcolour.';font-size:8pt;" title="Session ID: '.$record['sessionid'].'">';
      print '<td>&nbsp;0&nbsp;</td>';
      print '<td>&nbsp;Anonymous&nbsp;</td>';
      print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
      print '<td>&nbsp;'.$record['last_access'].'&nbsp;</td>';
      print '<td>&nbsp;'.$record['ip'].'&nbsp;</td>';
      print '<td>&nbsp;No&nbsp;</td>';
      print "</tr>\n";
ENDOFHTML;
    }
  }
  print <<<ENDOFHTML
    </table>
  </p>
  <span style="font-family:verdana;font-size:15pt;color:#000000;">Registered Users</span>
  <p>The following users are registered on this site:<br>
    <br>
    <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
      <tr style="background-color:#eeeeff">
        <td>&nbsp;<b>ID</b>&nbsp;</td>
        <td>&nbsp;<b>User</b>&nbsp;</td>
        <td>&nbsp;<b>Created</b>&nbsp;</td>
        <td>&nbsp;<b>Persistent Login</b>&nbsp;</td>
        <td>&nbsp;<b>Is Admin</b>&nbsp;</td>
      </tr>
ENDOFHTML;

  $result = $nsisweb->query("select userid,username,created,usertype,flags from nsisweb_users");
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
      print '<td>&nbsp;'.($record['flags'] & USERFLAG_PERSIST ? 'Yes' : 'No').'&nbsp;</td>';

      if($record['usertype'] == USERTYPE_ADMIN) {
        print '<td>&nbsp;Yes&nbsp;</td>';
      } else {
        print '<td>&nbsp;No [ <a href="admin.php?action=grant&userid='.$record['userid'].'">grant</a> ]&nbsp;</td>';
      }
      print "</tr>\n";
ENDOFHTML;
    }
  }

  print <<<ENDOFHTML
    </table>
  </p>
ENDOFHTML;

  print <<<ENDOFHTML
  <span style="font-family:verdana;font-size:15pt;color:#000000;">Browsers By IP</span>
  <p>This table shows the number of distinct ip addresses associated with each browser type:<br>
    <br>
    <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
      <tr style="background-color:#eeeeff">
        <td>&nbsp;<b>#</b>&nbsp;</td>
        <td>&nbsp;<b>User Agent</b>&nbsp;</td>
        <td>&nbsp;<b>IP Addresses</b>&nbsp;</td>
      </tr>
ENDOFHTML;

  $result = $nsisweb->query("select count(ip) as cc,user_agent from nsisweb_info group by user_agent order by cc desc,user_agent asc");
  if($result && $nsisweb->how_many_results($result) > 0) {
    $i     = 0;
    $index = 1;
    while($record = $nsisweb->get_result_array($result)) {
      if($i == 0) {
        $i = 1;
        $bgcolour = '#eeffee';
      } else {
        $i = 0;
        $bgcolour = '#eeeeee';
      }

      print '<tr style="background-color:'.$bgcolour.';font-size:8pt;">';
      print '<td>&nbsp;'.$index++.'&nbsp;</td>';
      print '<td>&nbsp;'.$record['user_agent'].'&nbsp;</td>';
      print '<td>&nbsp;'.$record['cc'].'&nbsp;</td>';
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