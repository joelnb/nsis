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
    $nsisweb->query('update nsisweb_users set flags=flags & '.~USERFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
    $nsisweb->query('update nsisweb_sessions set flags=flags & '.~SESSIONFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
  } else if(strcmp($_GET['action'],'persist') == 0) {
    $nsisweb->query('update nsisweb_users set flags=flags | '.USERFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
    $nsisweb->query('update nsisweb_sessions set flags=flags | '.SESSIONFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
  } else if(strcmp($_GET['action'],'showqueries') == 0) {
    $nsisweb->query('update nsisweb_users set flags=flags | '.USERFLAG_SHOWQUERIES." where userid=$user_id",__FILE__,__LINE__);
  } else if(strcmp($_GET['action'],'dontshowqueries') == 0) {
    $nsisweb->query('update nsisweb_users set flags=flags & '.~USERFLAG_SHOWQUERIES." where userid=$user_id",__FILE__,__LINE__);
  }
  $user     = find_userid($user_id);
  $username = $user->username;

	if(strcmp($_POST['action'],'email') == 0) {
		$user->update($_POST['email'],$user->get_forumid());
		$user = find_userid($user_id);
	} else if(strcmp($_POST['action'],'forumid') == 0) {
		$user->update($user->get_email(),(int)($_POST['forumid']));
		$user = find_userid($user_id);
	}
  
  $user_created     = 'Unknown';
  $pages_created    = 'Unknown';
  $pages_modified   = 'Unknown';
  $files_uploaded   = 'Unknown';
  $current_picks    = 'Unknown';
  $current_sessions = 'Unknown';

  $record = $nsisweb->query_one_only("select created from nsisweb_users where userid=$user_id",__FILE__,__LINE__);
  if($record) $user_created = $record['created'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_pages where author=$user_id",__FILE__,__LINE__);
  if($record) $pages_created = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_pages where author<>$user_id and last_author=$user_id",__FILE__,__LINE__);
  if($record) $pages_modified = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_files where userid=$user_id",__FILE__,__LINE__);
  if($record) $files_uploaded = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_picks where sessionid='$session_id'",__FILE__,__LINE__);
  if($record) $current_picks = $record['count(*)'];

  $record = $nsisweb->query_one_only("select count(*) from nsisweb_sessions where userid=$user_id",__FILE__,__LINE__);
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
      <tr><td align="left" valign="middle">Your email address</td><td align="left"><?= strlen($user->get_email())>0 ? $user->get_email() : 'Not specified' ?></td></tr>
      <tr style="background-color:#eeeeee"><td align="left" valign="middle">Your Winamp forum userid</td><td align="left"><?= $user->get_forumid()>0 ? $user->get_forumid() : 'Not specified' ?></td></tr>
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
    ?><span style="font-family:verdana;font-size:15pt;color:#000000;">Show Queries</span><?
    $record = $nsisweb->query_one_only('select flags from nsisweb_users where userid='.$user_id,__FILE__,__LINE__);
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
	
	?><span style="font-family:verdana;font-size:15pt;color:#000000;">Your Email Address</span>
	<p>Use this form to update the email address we have for you in our records. This email address is visible only to administrators and allows them to contact you if necessary.<br>
	<br>
	<form name="email" method="post" enctype="multipart/form-data" action="prefs.php" onkeydown="if (event.keyCode == 13) {document.email.submit()}">
    <input type="hidden" name="action" value="email">
    <span style="align:middle;">Enter your email address:</span> 
		<input type="text" style="font-family:courier new;font-size:10pt;" name="email" size="25" maxlength="255" value="<?= $user->get_email() ?>">
    <input type="submit" value="Update Profile">
	</form>
  </p>
	
	<span style="font-family:verdana;font-size:15pt;color:#000000;">Your Winamp Forum User ID</span>
	<p>Use this form to update the Winamp forum user id we have for you in our records. This id allows both users and administrators to contact you via the forum.<br>
	<br>
	<form name="forumid" method="post" enctype="multipart/form-data" action="prefs.php" onkeydown="if (event.keyCode == 13) {document.forumid.submit()}">
    <input type="hidden" name="action" value="forumid">
    <span style="align:middle;">Enter your forum id:</span> 
		<input type="integer" style="font-family:courier new;font-size:10pt;" name="forumid" size="25" maxlength="255" value="<?= $user->get_forumid() ?>">
    <input type="submit" value="Update Profile">
	</form>
  </p>
	<?
}
$nsisweb->end_page();
?>