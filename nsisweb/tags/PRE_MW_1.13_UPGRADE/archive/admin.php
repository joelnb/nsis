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
        <span class="atitle">Web Server Info</span><br>
        <a href="admin.php">Return To Main Admin Options</a>
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
          fclose($file);
        }
      }
      
      print <<<ENDOFHTML
        <span class="atitle">Database Server Info</span><br>
        <a href="admin.php">Return To Main Admin Options</a>
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
            <a href="admin.php?action=dbinfo&subaction=clearlog" onclick="return checkclearlog();"><img border="0" src="images/bigred.jpg"></a>
            <br>
            <table>
              <tr class="aboxheader">
                <td>&nbsp;<strong>#</strong>&nbsp;</td>
                <td colspan="4">&nbsp;<b>Log Message</b>&nbsp;</td>
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
              $bgcolour = 'acolor1';
            } else {
              $i = 0;
              $bgcolour = 'acolor2';
            }

            print '<tr class="'.$bgcolour.'">';
            print '<td rowspan="2">'.$index++.'</td>';
            print '<td>'.$datetime.'</td><td>'.$file.'</td>';
            print '<td>Line '.$line.'</td><td>'.$request.'</td>';
            print '</tr><tr>';
            print '<td colspan="4">'.wordwrap(htmlentities($msg),60,"\n",1).'</td>';
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

      $unique_u  = $nsisweb->query("select distinct userid from nsisweb_sessions",__FILE__,__LINE__);
      $unique_a  = $nsisweb->query("select distinct ip from nsisweb_sessions where userid=0",__FILE__,__LINE__);
      $users     = $nsisweb->query("select sessionid,a.userid,a.created,last_access,username,ip,a.flags,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(a.created)) as uptime,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(last_access)) as accessed from nsisweb_sessions as a,nsisweb_users as b where a.userid=b.userid order by ip",__FILE__,__LINE__);
      $anons     = $nsisweb->query("select sessionid,userid,created,last_access,ip,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(created)) as uptime,(UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(last_access)) as accessed from nsisweb_sessions where userid=0 order by ip",__FILE__,__LINE__);
      $usercount = $users ? $nsisweb->how_many_results($unique_u) : 0;
      $anoncount = $anons ? $nsisweb->how_many_results($unique_a) : 0;

      print <<<ENDOFHTML
        <span class="atitle">Connected Sessions</span><br>
        <a href="admin.php">Return To Main Admin Options</a>
        <p>The following sessions are currently established: ($usercount registered users and
        $anoncount guests)<br>
          <br>
          <table>
            <tr class="aboxheader">
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
            $bgcolour = 'acolor1';
          } else {
            $i = 0;
            $bgcolour = 'acolor2';
          }

          $uptime   = how_long($record['uptime']);
          $accessed = how_long($record['accessed']);

          print "<tr class=\"$bgcolour\" title=\"Session ID: ".$record['sessionid'].", session created $uptime, last accessed $accessed\">";
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
            $bgcolour = 'acolor1';
          } else {
            $i = 0;
            $bgcolour = 'acolor2';
          }
          
          $uptime   = how_long($record['uptime']);
          $accessed = how_long($record['accessed']);

          print "<tr class=\"$bgcolour\" title=\"Session ID: ".$record['sessionid'].", session created $uptime, last accessed $accessed\">";
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

      $users     = $nsisweb->query("select userid,username,created,usertype,flags,email,forumid from nsisweb_users",__FILE__,__LINE__);
      $usercount = $users ? $nsisweb->how_many_results($users) : 0;

      print <<<ENDOFHTML
        <span class="atitle">Registered Users</span><br>
        <a href="admin.php">Return To Main Admin Options</a>
        <p>The following $usercount users are registered on this site (click the username to view the profile of the user) :-<br>
          <br>
          <table>
            <tr class="aboxheader">
              <td>&nbsp;<b>ID</b>&nbsp;</td>
              <td>&nbsp;<b>User</b>&nbsp;</td>
              <td>&nbsp;<b>Created</b>&nbsp;</td>
              <td>&nbsp;<b>Persistent Login</b>&nbsp;</td>
              <td>&nbsp;<b>Is Admin</b>&nbsp;</td>
							<td>&nbsp;<b>Email</b>&nbsp;</td>
							<td>&nbsp;<b>Profile</b>&nbsp;</td>
							<td>&nbsp;<b>PM</b>&nbsp;</td>
            </tr>
ENDOFHTML;

      if($usercount > 0) {
        $i = 0;
        while($record = $nsisweb->get_result_array($users)) {
          if($i == 0) {
            $i = 1;
            $bgcolour = 'acolor1';
          } else {
            $i = 0;
            $bgcolour = 'acolor2';
          }

          print '<tr class="'.$bgcolour.'">';
          print '<td>&nbsp;'.$record['userid'].'&nbsp;</td>';
          print '<td>&nbsp;<a href="profile.php?userid='.$record['userid'].'">'.$record['username'].'</a>&nbsp;</td>';
          print '<td>&nbsp;'.$record['created'].'&nbsp;</td>';
          print '<td>&nbsp;'.($record['flags'] & USERFLAG_PERSIST ? 'Yes' : 'No').'&nbsp;</td>';

          if($record['usertype'] == USERTYPE_ADMIN) {
            print '<td>&nbsp;Yes&nbsp;</td>';
          } else {
            print '<td>&nbsp;No [ <a href="admin.php?action=users&subaction=grant&userid='.$record['userid'].'">grant</a> ]&nbsp;</td>';
          }
					
					print '<td>&nbsp;';
					if(strlen($record['email']) > 0) {
						print '<a href="mailto:'.$record['email'].'">email</a>';
					} else {
						print '-';
					}
					print '&nbsp;</td>';
					if($record['forumid'] > 0) {
						print '<td>&nbsp;<a href="http://forums.winamp.com/member.php?action=getinfo&userid='.$record['forumid'].'">profile</a>&nbsp;</td>';
						print '<td>&nbsp;<a href="http://forums.winamp.com/private.php?action=newmessage&userid='.$record['forumid'].'">PM</a>&nbsp;</td>';
					} else {
						print '<td>&nbsp;-&nbsp</td>';
						print '<td>&nbsp;-&nbsp</td>';
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
        <span class="atitle">Browsers By IP</span><br>
        <a href="admin.php">Return To Main Admin Options</a>
        <p>This table shows the number of distinct ip addresses associated with each browser type:<br>
          <br>
          <table>
            <tr class="aboxheader">
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
            $bgcolour = 'acolor1';
          } else {
            $i = 0;
            $bgcolour = 'acolor2';
          }

          print '<tr class="'.$bgcolour.'">';
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
        <span class="atitle">NSIS Archive Admin Options</span>
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