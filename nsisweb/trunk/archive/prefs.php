<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

$nsisweb->start_page('Your Preferences',FALSE);
echo '<span style="font-family:verdana;font-size:20pt;color:#000000;">Your Preferences</span>';

$session = $nsisweb->get_session();

if($session->is_anonymous()) {
  echo '<p>Only logged in users can view this page.</p>';
} else {
  $session_id     = $session->session_id;
  $user_id        = $session->user_id;
  $user           = find_userid($user_id);
  $username       = $user->username;
  $passwordcolour = '';

  if(strcmp($_GET['action'],'loggedin') == 0) {
	  echo '<br><br><center style="border:1px solid black;padding:2px;"><b style="color:#000000;">Thankyou for logging in '.$username.'</b></center>';
  } else if(strcmp($_POST['action'],'applychanges') == 0) {
		$changes  = 0;
		$errorstr = "";
		
		if(strcasecmp($user->get_email(),$_POST['email']) != 0) {
			$user->update($_POST['email'],$user->get_forumid());
			$changes++;
		}
		if(strcasecmp($user->get_forumid(),$_POST['forumid']) != 0) {
			$user->update($user->get_email(),(int)($_POST['forumid']));
			$changes++;
		}
		if(strlen($_POST['password1'])>0 || strlen($_POST['password2'])>0) {
			if(strcasecmp($_POST['password1'],$_POST['password2']) == 0) {
				$md5result = md5(stripslashes($_POST['password1']));
				$nsisweb->query("update nsisweb_users set password='".$md5result."' where userid=$user_id");
				$resultarray = $nsisweb->query_one_only("select password from nsisweb_users where userid=$user_id");
				if(strcasecmp($md5result,$resultarray['password']) == 0) {
					$errorstr = '<br><br><center style="border:1px solid black;padding:2px;"><b style="color:#55ff55;">Your password has been changed successfully.</b></center>';
					$changes++;
				} else {
					$errorstr = '<br><br><center style="border:1px solid black;"><b style="color:#ff0000;">Your password could not be changed!</b></center>';
				}
			} else {
				$passwordcolour = 'background-color:#ffaaaa';
				$errorstr       = '<br><br><center style="border:1px solid black;"><b style="color:#ff0000;">The passwords you enter must match exactly!</b></center>';
			}
		}

		$persist = (strcasecmp($_POST['persist'],'on') == 0) ? true : false;
		if($persist != $user->persists()) {
			if($persist) {
		    $nsisweb->query('update nsisweb_users set flags=flags | '.USERFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
		    $nsisweb->query('update nsisweb_sessions set flags=flags | '.SESSIONFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
				$changes++;
			} else {
		    $nsisweb->query('update nsisweb_users set flags=flags & '.~USERFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
		    $nsisweb->query('update nsisweb_sessions set flags=flags & '.~SESSIONFLAG_PERSIST." where userid=$user_id",__FILE__,__LINE__);
				$changes++;
	    }
		}
		
		$showqueries = (strcasecmp($_POST['sqlqueries'],'on') == 0) ? true : false;
		if(($user->get_flags() & USERFLAG_SHOWQUERIES) != $showqueries) {
			if($showqueries) {
    		$nsisweb->query('update nsisweb_users set flags=flags | '.USERFLAG_SHOWQUERIES." where userid=$user_id",__FILE__,__LINE__);
				$changes++;
      } else {
		    $nsisweb->query('update nsisweb_users set flags=flags & '.~USERFLAG_SHOWQUERIES." where userid=$user_id",__FILE__,__LINE__);
				$changes++;
      }
    }

		// pick up changes
		$user = find_userid($user_id);

		if(strlen($errorstr)>0) {
			echo $errorstr;
		} else if($changes > 0) {
			echo '<br><br><center style="border:1px solid black;padding:2px;"><b style="color:#55ff55;">Your changes have been applied successfully.</b></center>';
		} else {
			echo '<br><br><center style="border:1px solid black;padding:2px;"><b style="color:#000000;">None of your settings needed to be updated.</b></center>';
		}
	}
	
	$_POST = array();
  
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
  <p>Here you can see information about your user account and your
     contributions to the archive and you can modify some settings that
     affect the way your account behaves.</p>
  <p style="margin-top:20px;">
  	<form name="settings" method="post" enctype="multipart/form-data" action="prefs.php" onkeydown="if (event.keyCode == 13) { document.settings.submit(); }">
  	  <input type="hidden" name="action" value="applychanges">
	    <table width="80%" style="border-style:solid;border-color:black;border-width:1px;" cellpadding="2" cellspacing="1">
	      <tr style="background-color:#ffffee"><td align="center" valign="middle" colspan="2" height="20">Account Information</td></tr>
	      <tr style="background-color:#eeeeee"><td align="left" valign="middle" height="20">Your user name</td><td align="left"><b><?= $username ?></b></td></tr>
	      <tr><td align="left" valign="middle" height="20">You created your account on</td><td align="left"><?= $user_created ?></td></tr>
	      <tr style="background-color:#eeeeee"><td align="left" valign="middle" height="20">Pages created by you</td><td align="left"><?= $pages_created ?></td></tr>
	      <tr><td align="left" valign="middle" height="20">Other pages last modified by you</td><td align="left"><?= $pages_modified ?></td></tr>
	      <tr style="background-color:#eeeeee"><td align="left" valign="middle" height="20">Downloadable files supplied by you</td><td align="left"><?= $files_uploaded ?></td></tr>
	      <tr><td align="left" valign="middle" height="20">Number of items in your pick list</td><td align="left"><?= $current_picks ?></td></tr>
	      <tr style="background-color:#eeeeee"><td align="left" valign="middle" height="20">Number of current sessions</td><td align="left"><?= $current_sessions ?></td></tr>
	      <tr><td align="left" valign="middle" height="20">Do you have admin rights?</td><td align="left"><input type="checkbox" DISABLED <?= $user->is_admin() ? 'CHECKED' : ''; ?>></td></tr>
	      <tr style="background-color:#ffffee"><td align="center" valign="middle" colspan="2" height="20">Configurable Settings</td></tr>
	      <tr style="background-color:#eeeeee"><td align="left" valign="middle" height="20">Enable persistent logins</td><td align="left"><input name="persist" type="checkbox" <?= $user->persists() ? 'CHECKED' : ''; ?>></td></tr>
	      <tr><td align="left" valign="middle" height="20">Your email address</td><td align="left"><input style="margin:0px;padding:1px;font-size:8pt;width:200px;" name="email" type="text" size="20" maxlength="255" value="<?= $user->get_email() ?>"></td></tr>
	      <tr style="background-color:#eeeeee"><td align="left" valign="middle" height="20">Your Winamp forum userid</td><td align="left"><input style="margin:0px;padding:1px;font-size:8pt;width:200px;" name="forumid" type="text" size="20" maxlength="255" value="<?= $user->get_forumid() ?>"></td></tr>
	      <?
				  if($user->is_admin()) {
				    $record = $nsisweb->query_one_only('select flags from nsisweb_users where userid='.$user_id,__FILE__,__LINE__);
				    if($record) {
					    print '<tr><td align="left" valign="middle" height="20">Display SQL queries</td><td align="left">';
				      if ($record['flags'] & USERFLAG_SHOWQUERIES) {
					      print '<input name="sqlqueries" type="checkbox" CHECKED>';
				      } else {
					      print '<input name="sqlqueries" type="checkbox">';
				      }
				      print '</td></tr>';
			      }
		      }
				?>
	      <tr style="background-color:#ffffee"><td align="center" valign="middle" colspan="2" height="20">Change Your Password</td></tr>
	      <tr style="background-color:#eeeeee"><td align="left" valign="middle" height="20">Enter your new password</td><td align="left"><input style="margin:0px;padding:1px;font-size:8pt;width:200px;<?= $passwordcolour ?>" name="password1" type="password" size="20" maxlength="255" value=""></td></tr>
	      <tr><td align="left" valign="middle" height="20">Confirm your new password</td><td align="left"><input style="margin:0px;padding:1px;font-size:8pt;width:200px;<?= $passwordcolour ?>" name="password2" type="password" size="20" maxlength="255" value=""></td></tr>
	    </table>
	    <p align="center"><a href="javascript:document.settings.submit();">Click Here To Apply Changes To Your Settings</a></p>
    </form>
  </p>
  <span style="font-family:verdana;font-size:20pt;color:#000000;">Settings Explained</span>
  <p>
    <b>Q:</b> Can I change my username?<br>
    <b>A:</b> No, this name uniquely identifies you and cannot be changed.<br>
    <br>
    <b>Q:</b> How can I upload files for others to download and thereby change the value <i>'Downloadable files supplied by you'</i>?<br>
    <b>A:</b> Administrators can use the Contribute link on the Archive Home page. Normal users are not allowed to upload files to the Archive.<br>
    <br>
    <b>Q:</b> What is the pick list?</i>?<br>
    <b>A:</b> At the top of every Archive page is a [ Pick List ] link. This link takes you to your pick list. Your pick list holds pages that
              you have "cut" or "copied" from one place in the Archive so that you can insert them in another place or delete them.<br>
    <br>
    <b>Q:</b> How can 'Number of current sessions' ever be higher than one?</i>?<br>
    <b>A:</b> I can think of three reasons: (a) You are logged in using more than one type of Browser, e.g. IE and Netscape; (b) You are logged in from more than one computer; (c) The login code still contains some minor bugs :P<br>
    <br>
    <b>Q:</b> How can I get admin rights?<br>
    <b>A:</b> Convince an existing administrator that you should have them :P<br>
    <br>
    <b>Q:</b> What are persistent logins?<br>
    <b>A:</b> Persistent logins are not timed out, they stay logged in. At least that's the theory, this feature is not working perfectly yet.<br>
    <br>
    <b>Q:</b> Who can see my email address? Why should I give you it?<br>
    <b>A:</b> Only administrators can see your email address. If we don't have it and we find reason to edit or remove a page you have created you will not be consulted if we cannot contact you! Also, I quite like to say thank you to people who contribute content to the Archive and if you have not provided your forum userid this will be the only way I can say thankyou! In future you will be able to get your account password reset and the new password automatically emailed to you, but only if you provide your email address.<br>
    <br>
    <b>Q:</b> What is a Winamp forum userid? Where can I get one/find my user id?<br>
    <b>A:</b> The NSIS forums are hosted on forums.winamp.com <a href="http://forums.winamp.com/forumdisplay.php?forumid=65">here</a>. You can create an account there if you do not already have one. Your forum userid can be seen by hovering over your username where it appears on the Winamp forum and by looking at the URL you would be taken to by that link. The forum user id is at the end of that URL.<br>
    <br>
    <b>Q:</b> Who can see my Winamp forum userid? Why should I give you it?<br>
    <b>A:</b> Anyone who clicks on your username in the Archive can see your forum user id. This lets them contact you via forum PM (private message) or by the email address you have listed in your forum account. Why provide it? So people who like your contributions can say hi and thankyou, or to tell you if you made a mistake. Also, if you do not provide an email address this will be the only way an adminstrator can contact you if there is a problem.<br>
    <br>
    <b>Q:</b> Why would I want to see SQL queries? What does this mean?<br>
    <b>A:</b> This option is only available to administrators. It allows you to see on each page which queries the database that drives the site was asked to perform. This can be useful when investigating a bug in the Archive web site code.<br>
  </p>
  <?
}
$nsisweb->end_page();
?>