<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebuser.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpicks.pkg.php");

$session    = $nsisweb->get_session();
$session_id = $session->session_id;
$user_id    = $session->user_id;
$username   = $session->get_username();

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

$nsisweb->start_page('Your Preferences');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Your Preferences</font>
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
  </table>
</p>
<?
$nsisweb->end_page();
?>