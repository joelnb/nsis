<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebuser.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpicks.pkg.php");

$session  = $nsisweb->get_session();
$user_id  = $session->user_id;
$username = $session->get_username();

$result = $nsisweb->query("select count(*) from nsisweb_pages where author=$user_id");
$array  = $nsisweb->get_result_array($result);
$pages_created = $array['count(*)'];

$result = $nsisweb->query("select count(*) from nsisweb_pages where author<>$user_id and last_author=$user_id");
$array  = $nsisweb->get_result_array($result);
$pages_modified = $array['count(*)'];

$result = $nsisweb->query("select count(*) from nsisweb_files where userid=$user_id");
$array  = $nsisweb->get_result_array($result);
$files_uploaded = $array['count(*)'];

$nsisweb->start_page('Your Preferences');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Your Preferences</font>
<p>Here you can see information about your user account and your contributions to the archive and you can modify some settings that affect the way your account behaves.</p>
<p style="margin-top:20px;">
  <table width="50%" style="border-style:solid;border-color:black;border-width:1px;" cellpadding="2" cellspacing="1">
    <tr style="background-color:#eeeeee"><td width="50%" align="left" valign="middle">Username</td><td align="left"><?= $username ?></td></tr>
    <tr><td align="left" valign="middle">Account Created</td><td align="left"><?= $session->created ?></td></tr>
    <tr style="background-color:#eeeeee"><td align="left" valign="middle">Pages Created</td><td align="left"><?= $pages_created ?></td></tr>
    <tr><td align="left" valign="middle">Pages Modified</td><td align="left"><?= $pages_modified ?></td></tr>
    <tr style="background-color:#eeeeee"><td align="left" valign="middle">Files Uploaded</td><td align="left"><?= $files_uploaded ?></td></tr>
  </table>
</p>
<?
$nsisweb->end_page();
?>