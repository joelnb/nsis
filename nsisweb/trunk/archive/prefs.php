<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

$nsisweb->start_page('Your Preferences',FALSE);
echo '<span style="font-family:verdana;font-size:20pt;color:#000000;">Your Preferences</span>';

$session = $nsisweb->get_session();

if($session->is_anonymous()) {
  echo '<p>Only logged in users can view this page.</p>';
} else {
  $session_id = $session->session_id;
  $user_id    = $session->user_id;

  if(strcmp($_GET['action'],'stoppersist') == 0) {
    $nsisweb->query('update nsisweb_users set flags=flags & '.~USERFLAG_PERSIST." where userid=$user_id");
    $nsisweb->query('update nsisweb_sessions set flags=flags & '.~SESSIONFLAG_PERSIST." where userid=$user_id");
  } else if(strcmp($_GET['action'],'persist') == 0) {
    $nsisweb->query('update nsisweb_users set flags=flags | '.USERFLAG_PERSIST." where userid=$user_id");
    $nsisweb->query('update nsisweb_sessions set flags=flags | '.SESSIONFLAG_PERSIST." where userid=$user_id");
  } else if(strcmp($_GET['action'],'showqueries') == 0) {
    $nsisweb->query('update nsisweb_users set flags=flags | '.USERFLAG_SHOWQUERIES." where userid=$user_id");
  } else if(strcmp($_GET['action'],'dontshowqueries') == 0) {
    $nsisweb->query('update nsisweb_users set flags=flags & '.~USERFLAG_SHOWQUERIES." where userid=$user_id");
  }
  
  $user     = find_userid($user_id);
  $username = $user->username;

  $user_created     = 'Unknown';
  $pages_created    = 'Unknown';
  $pages_modified   = 'Unknown';
  $files_uploaded   = 'Unknown';
  $current_picks    = 'Unknown';
  $current_sessions = 'Unknown';

  $record = $nsisweb->query_one_only("select created from nsisweb_users where userid=$user_id");
  if($record) $user_created = $record['created'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_pages where author=$user_id");
  if($record) $pages_created = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_pages where author<>$user_id and last_author=$user_id");
  if($record) $pages_modified = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_files where userid=$user_id");
  if($record) $files_uploaded = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_picks where sessionid='$session_id'");
  if($record) $current_picks = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_sessions where userid=$user_id");
  if($record) $current_sessions = $record['count(*)'];

  ?>
  <p>Here you can see information about your user account and your contributions to the archive and you can modify some settings that affect the way your account behaves.</p>
  <p style="margin-top:20px;">
    <table width="80%" style="border-style:solid;border-color:black;border-width:1px;" cellpadding="2" cellspacing="1">
      <tr style="background-color:#eeeeee"><td align="left" valign="middle">Your user name</td><td align="left"><?= $username ?></td></tr>
      <tr><td align="left" valign="middle">You created your account on</td><td align="left"><?= $user_created ?></td></tr>
      <tr style="background-color:#eeeeee"><td align="left" valign="middle">Pages created by you</td><td align="left"><?= $pages_created ?></td></tr>
      <tr><td align="left" valign="middle">Other pages last modified by you</td><td align="left"><?= $pages_modified ?></td></tr>
      <tr style="background-color:#eeeeee"><td align="left" valign="middle">Downloadable files supplied by you</td><td align="left"><?= $files_uploaded ?></td></tr>
      <tr><td align="left" valign="middle">Number of items in your pick list</td><td align="left"><?= $current_picks ?></td></tr>
      <tr style="background-color:#eeeeee"><td align="left" valign="middle">Number of current sessions</td><td align="left"><?= $current_sessions ?></td></tr>
      <tr><td align="left" valign="middle">Do you have admin rights?</td><td align="left"><?= $user->is_admin() ? 'Yes' : 'No' ?></td></tr>
      <tr style="background-color:#eeeeee"><td align="left" valign="middle">Persistent Login</td><td align="left"><?= $user->persists() ? 'Yes' : 'No' ?></td></tr>
    </table>
  </p>
  
  <span style="font-family:verdana;font-size:15pt;color:#000000;">Persistent Login</span>
  <?
  if($user->persists()) {
    print <<<ENDOFHTML
    <p>Your preferences currently indicate that you are using the persistent
       login feature. You can stop using this feature at any time by
       <a href="prefs.php?action=stoppersist">clicking here</a>. Your login
       sessions will then timeout after 30 minutes of inactivity.</p>
ENDOFHTML;
  } else {
    print <<<ENDOFHTML
    <p>You are not using the persistent login feature which means that your
       login sessions will timeout after 30 minutes of inactivity. To stay
       permanently logged in <a href="prefs.php?action=persist">click here</a>
       to activate the persistent login feature.</p>
ENDOFHTML;
  }
  
  if($user->is_admin()) {
    ?><span style="font-family:verdana;font-size:15pt;color:#000000;">Show queries</span><?
    $record = $nsisweb->query_one_only('select flags from nsisweb_users where userid='.$user_id);
    if($record) {
      if ($record['flags'] & USERFLAG_SHOWQUERIES) {
        //? 'dontshowqueries' : 'showqueries';
        print <<<ENDOFHTML
        <p>Your preferences indicate that you have chosen to show every query that is executed to create pages. <a href="prefs.php?action=dontshowqueries">Click here</a> to disable this option.</p>
ENDOFHTML;
      } else {
        print <<<ENDOFHTML
        <p>As an admin you have the option to show below each page the sql queries used to generate it to assist you when investigating bugs in the archive. <a href="prefs.php?action=showqueries">Click here</a> to enable this option.</p>
ENDOFHTML;
      }
    }
  }
}
$nsisweb->end_page();
?>