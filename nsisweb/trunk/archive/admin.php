<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

function how_long($seconds)
{
  if($seconds == 0) return "now";
  $days  = (int)($seconds/86400); $seconds %= 86400; if($days>0)    $str .= "$days days ";
  $hours = (int)($seconds/3600);  $seconds %= 3600;  if($hours>0)   $str .= "$hours hours ";
  $mins  = (int)($seconds/60);    $seconds %= 60;    if($mins>0)    $str .= "$mins mins ";
  return "$str ago";
}

$nsisweb->start_page('Admin',FALSE);
$session = $nsisweb->get_session();
$user    = find_userid($session->user_id);

if(!$user->is_admin()) {
  echo '<p>This page is for users with admin rights only.</p>';
} else {
  $time_web = date('Y-m-d H:i:s',time());
  $time_db  = 'unknown';
  $record   = $nsisweb->query_one_only("select NOW()",__FILE__,__LINE__);
  if($record) $time_db = $record['NOW()'];

  switch($_GET['action']) {
    // ----------------------
    // PHP ENGINE INFORMATION
    // ----------------------
    case 'phpinfo':
      print <<<ENDOFHTML
        <span style="font-family:verdana;font-size:20pt;color:#000000;">Web Server Info</span><br>
        <span style="font-family:verdana;font-size:10pt;"><a href="admin.php">Return To Main Admin Options</a></span>
        <p>The PHP engine reports the following about it's configuration:<br><br></p>
ENDOFHTML;

      ob_start();
      phpinfo();
      $captured_phpinfo = ob_get_contents();
      ob_end_clean();

      $pos = strpos($captured_phpinfo,"<body");
      $pos = strpos($captured_phpinfo,">",$pos);
      $end = strpos($captured_phpinfo,"</body>");
      $pos++;
      $end--;
      print substr($captured_phpinfo,$pos,$end-$pos);
      break;

    // ---------------------------
    // DATABASE SERVER INFORMATION
    // ---------------------------
    case 'dbinfo':
      $filename = NSISWEB_LOGSDIR.'/errors.log';
      if(strcmp($_GET['subaction'],'clearlog') == 0) {
        $file = fopen($filename,'w');
        if($file) {
          fwrite($file,"Log emptied on ".date('Y-m-s H:i:s')."\n");
          fclose($filename);
        }
      }
      
      print <<<ENDOFHTML
        <span style="font-family:verdana;font-size:20pt;color:#000000;">Database Server Info</span><br>
        <span style="font-family:verdana;font-size:10pt;"><a href="admin.php">Return To Main Admin Options</a></span>
ENDOFHTML;

      if(@filesize($filename) <= 0) {
        print '<p>There are no errors in the database logs at this time.</p>';
      } else {
        print <<<ENDOFHTML
          <script>
            function checkclearlog()
            {
              return confirm("Are you sure you want to clear the log?");
            }
          </script>
          <p>Each row of this table is an error log entry logged by the NSIS
            Archive Engine when a database SQL query failed to execute
            correctly. Push the big red button to clear the log.<br>
            <br>
            <div style="text-align:center;"><a href="admin.php?action=dbinfo&subaction=clearlog" onclick="return checkclearlog();"><img style="border:none;" src="images/bigred.jpg"></a><div>
            <br>
            <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
              <tr style="background-color:#eeeeff">
                <td style="text-align:center;">&nbsp;<b>#</b>&nbsp;</td>
                <td colspan="4" style="text-align:center;">&nbsp;<b>Log Message</b>&nbsp;</td>
              </tr>
ENDOFHTML;

        ob_start();
        readfile($filename);
        $log = ob_get_contents();
        ob_end_clean();

        $i     = 0;
        $index = 1;
        $len   = strlen($log);
        $pos   = strpos($log,'#error#');

        do {
          $end  = strpos($log,'#error#',$pos+1);
          $pos += strlen('#error#');

          if(!$end) $end = $len;
          
          if($end-$pos > 0) {
            $markerpos = strpos($log,'#',$pos);
            $file      = substr($log,$pos,$markerpos-$pos);
            $pos       = $markerpos+1;
            $markerpos = strpos($log,'#',$pos);
            $line      = substr($log,$pos,$markerpos-$pos);
            $pos       = $markerpos+1;
            $markerpos = strpos($log,'#',$pos);
            $datetime  = substr($log,$pos,$markerpos-$pos);
            $pos       = $markerpos+1;
            $markerpos = strpos($log,'#',$pos);
            $request   = substr($log,$pos,$markerpos-$pos);
            $pos       = $markerpos+1;
            $msg       = substr($log,$pos,$end-$pos);

            if($i == 0) {
              $i = 1;
              $bgcolour = '#eeffee';
            } else {
              $i = 0;
              $bgcolour = '#eeeeee';
            }

            print '<tr style="background-color:'.$bgcolour.';font-size:8pt;">';
            print '<td rowspan="2" style="text-align:center;">'.$index++.'</td>';
            print '<td style="text-align:center">'.$datetime.'</td><td style="text-align:center">'.$file.'</td>';
            print '<td style="text-align:center">Line '.$line.'</td><td style="text-align:center">'.$request.'</td>';
            print '</tr><tr style="background-color:#ffffff;font-size:8pt;">';
            print '<td colspan="4" style="padding:3px;font-family:courier new;">'.wordwrap(htmlentities($msg),60,"\n",1).'</td>';
            print "</tr>\n";
          }

          $pos = $end;
        } while($pos > 0 && $end < $len);

        print <<<ENDOFHTML
            </table>
          </p>
ENDOFHTML;
      }
      break;

    // -------------------------------
    // CURRENTLY ACTIVE LOGIN SESSIONS
    // -------------------------------
    case 'sessions':
      /* Make sure the session data we print is the most upto date */
      timeout_sessions();

      $users = $nsisweb->query("select sessionid,a.userid,a.created,last_access,username,ip,a.flags,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(a.created)) as uptime,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(last_access)) as accessed from nsisweb_sessions as a,nsisweb_users as b where a.userid=b.userid order by ip",__FILE__,__LINE__);
      $anons = $nsisweb->query("select sessionid,userid,created,last_access,ip,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(created)) as uptime,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(last_access)) as accessed from nsisweb_sessions where userid=0 order by ip",__FILE__,__LINE__);
      $usercount = $users ? $nsisweb->how_many_results($users) : 0;
      $anoncount = $anons ? $nsisweb->how_many_results($anons) : 0;

      print <<<ENDOFHTML
        <span style="font-family:verdana;font-size:20pt;color:#000000;">Connected Sessions</span><br>
        <span style="font-family:verdana;font-size:10pt;"><a href="admin.php">Return To Main Admin Options</a></span>
        <p>The following sessions are currently established: ($usercount registered users and
        $anoncount guests)<br>
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
      if($usercount > 0) {
        while($record = $nsisweb->get_result_array($users)) {
          if($i == 0) {
            $i = 1;
            $bgcolour = '#eeffee';
          } else {
            $i = 0;
            $bgcolour = '#eeeeee';
          }

          $uptime   = how_long($record['uptime']);
          $accessed = how_long($record['accessed']);

          print "<tr style=\"background-color:$bgcolour;font-size:8pt;\" title=\"Session ID: ".$record['sessionid'].", session created $uptime, last accessed $accessed\">";
          print '<td>&nbsp;'.$record['userid'].'&nbsp;</td>';
          print '<td>&nbsp;'.$record['username'].'&nbsp;</td>';
          print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
          print '<td>&nbsp;'.$record['last_access'].'&nbsp;</td>';
          print '<td>&nbsp;'.$record['ip'].'&nbsp;</td>';
          print '<td>&nbsp;'.($record['flags'] & SESSIONFLAG_PERSIST ? 'Yes' : 'No').'&nbsp;</td>';
          print "</tr>\n";
        }
      }

      if($anoncount > 0) {
        while($record = $nsisweb->get_result_array($anons)) {
          if($i == 0) {
            $i = 1;
            $bgcolour = '#eeffee';
          } else {
            $i = 0;
            $bgcolour = '#eeeeee';
          }
          
          $uptime   = how_long($record['uptime']);
          $accessed = how_long($record['accessed']);

          print "<tr style=\"background-color:$bgcolour;font-size:8pt;\" title=\"Session ID: ".$record['sessionid'].", session created $uptime, last accessed $accessed\">";
          print '<td>&nbsp;0&nbsp;</td>';
          print '<td>&nbsp;Anonymous&nbsp;</td>';
          print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
          print '<td>&nbsp;'.$record['last_access'].'&nbsp;</td>';
          print '<td>&nbsp;'.$record['ip'].'&nbsp;</td>';
          print '<td>&nbsp;N/A&nbsp;</td>';
          print "</tr>\n";
        }
      }

      print <<<ENDOFHTML
          </table>
        </p>
ENDOFHTML;
      break;

    // -------------------------------------------
    // VIEW USER DETAILS & PROMOTE USERS TO ADMINS
    // -------------------------------------------
    case 'users':
      if(strcmp($_GET['subaction'],'grant') == 0 && $_GET['userid'] > 0) {
        $nsisweb->query('update nsisweb_users set usertype='.USERTYPE_ADMIN.' where userid='.$_GET['userid'],__FILE__,__LINE__);
      }

      $users     = $nsisweb->query("select userid,username,created,usertype,flags from nsisweb_users",__FILE__,__LINE__);
      $usercount = $users ? $nsisweb->how_many_results($users) : 0;

      print <<<ENDOFHTML
        <span style="font-family:verdana;font-size:20pt;color:#000000;">Registered Users</span><br>
        <span style="font-family:verdana;font-size:10pt;"><a href="admin.php">Return To Main Admin Options</a></span>
        <p>The following $usercount users are registered on this site:<br>
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

      if($usercount > 0) {
        $i = 0;
        while($record = $nsisweb->get_result_array($users)) {
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
            print '<td>&nbsp;No [ <a href="admin.php?action=users&subaction=grant&userid='.$record['userid'].'">grant</a> ]&nbsp;</td>';
          }
          print "</tr>\n";
        }
      }

      print <<<ENDOFHTML
          </table>
        </p>
ENDOFHTML;
      break;

    // -----------------------------
    // BROWSER USER AGENT STATISTICS
    // -----------------------------
    case 'browsers':
      print <<<ENDOFHTML
        <span style="font-family:verdana;font-size:20pt;color:#000000;">Browsers By IP</span><br>
        <span style="font-family:verdana;font-size:10pt;"><a href="admin.php">Return To Main Admin Options</a></span>
        <p>This table shows the number of distinct ip addresses associated with each browser type:<br>
          <br>
          <table border="1" bordercolor="#aaaaaa" cellpadding="2" cellspacing="0">
            <tr style="background-color:#eeeeff">
              <td>&nbsp;<b>#</b>&nbsp;</td>
              <td>&nbsp;<b>User Agent</b>&nbsp;</td>
              <td>&nbsp;<b>IP Addresses</b>&nbsp;</td>
            </tr>
ENDOFHTML;

      $result = $nsisweb->query("select count(ip) as cc,user_agent from nsisweb_info group by user_agent order by cc desc,user_agent asc",__FILE__,__LINE__);
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
        }
      }

      print <<<ENDOFHTML
          </table>
        </p>
ENDOFHTML;
      break;

    // -------------------
    // ADMINS OPTIONS PAGE
    // -------------------
    default:
      print <<<ENDOFHTML
        <span style="font-family:verdana;font-size:20pt;color:#000000;">NSIS Archive Admin Options</span>
        <p>Administrator status gives you the right to modify any page stored in the
        database no matter who created it, the right to grant admin rights to other
        users, the right to upload files to the archive and the ability to see
        detailed Archive status information.</p>

        <p>
          <br>
          <ul>
            <li><b><a href="admin.php?action=sessions">Current Sessions</a></b>
              <p>View the currently logged in user sessions</p>
            </li>
            <li><b><a href="admin.php?action=users">Registered Users</a></b>
              <p>View user information and promote users to administrators</p>
            </li>
            <li><b><a href="admin.php?action=browsers">Browser Info</a></b>
              <p>Statistics about the browsers used by our visitors</p>
            </li>
            <li><b><a href="admin.php?action=dbinfo">Database Server Info</a></b>
              <p>View the NSIS Archive Engine SQL error log<br>
              <span class="smalltext">Database Server Time: $time_db</span></p>
            </li>
            <li><b><a href="admin.php?action=phpinfo">Web Server Info</a></b>
              <p>Configuration information about the PHP engine<br>
              <span class="smalltext">Web Server Time: $time_web</span></p>
            </li>
          </ul>
        </p>
ENDOFHTML;
    break;
  }
}

print "<br><br>";
$nsisweb->end_page();
?>