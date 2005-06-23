<?
if(!isset($_GET['userid'])) {
  header('Location: /wiki');
  exit;
}

include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

$nsisweb->start_page('User Profile',FALSE);
echo '<span class="atitle">User Profile</span>';

if(!isset($_GET['userid'])) {
	?><p>Internal Error: No userid specified.</p><?
} else if((int)($_GET['userid']) == 0) {
	?><p>Profile information for that user cannot be shown because the user is an anonymous user and so has no profile.</p><?
} else {
	$user_id = (int)$_GET['userid'];
	$user    = find_userid($user_id);
	if($user->is_anonymous()) {
		?><p>The given userid is not valid.</p><?
	} else {
		$username         = $user->username; 
		$user_created     = 'Unknown';
		$pages_created    = 'Unknown';
		$pages_modified   = 'Unknown';
		$files_uploaded   = 'Unknown';
	
		$record = $nsisweb->query_one_only("select created from nsisweb_users where userid=$user_id",__FILE__,__LINE__);
		if($record) $user_created = $record['created'];
	
		$pages_result = $nsisweb->query("select title,created,pageid from nsisweb_pages where author=$user_id order by created desc",__FILE__,__LINE__);
		if($pages_result) $pages_created = $nsisweb->how_many_results($pages_result);
	
		$record = $nsisweb->query_one_only("select count(*) from nsisweb_pages where author<>$user_id and last_author=$user_id",__FILE__,__LINE__);
		if($record) $pages_modified = $record['count(*)'];
	
		$record = $nsisweb->query_one_only("select count(*) from nsisweb_files where userid=$user_id",__FILE__,__LINE__);
		if($record) $files_uploaded = $record['count(*)'];
		?>
    <h1><a href="/wiki/User:<?= $username ?>">Wiki profile</a></h1>
		<p>Here you can see information about the username you clicked on:</p>
		<p>
			<table width="80%">
				<tr><t>User name</td><td><?= $username ?></td></tr>
				<tr><td>Account created on</td><td><?= $user_created ?></td></tr>
				<tr><td>Pages created by user</td><td><?= $pages_created ?></td></tr>
				<tr><td>Other pages last modified by user</td><td><?= $pages_modified ?></td></tr>
				<tr><td>Downloadable files supplied by user</td><td><?= $files_uploaded ?></td></tr>
				<tr><td>Is user an administrator?</td><td><?= $user->is_admin() ? 'Yes' : 'No' ?></td></tr>
				<tr><td>Winamp forum userid</td><td><?= $user->get_forumid()>0 ? $user->get_forumid() : 'Not specified' ?></td></tr>
			</table>
		</p>
		<br>
		<p>
		<?
		$session = $nsisweb->get_session();
		if($session->looks_like_admin()) {
			$admin = $session->get_user();
			if($admin->is_admin()) {
				if(strlen($user->get_email()) > 0) {
					?>You can contact this user by email at <a href="mailto:<?= $user->get_email() ?>"><?= $user->get_email() ?></a>. [ <b><i>Only administrators can see this email address</i></b> ]<br><br><?
				} else {
					?>This user has not given their email address so you cannot email them.<br><br><?
				}
			}
	  }
		if($user->get_forumid() > 0) {
			?>You can view this user's Winamp forum profile by clicking <a href="http://forums.winamp.com/member.php?action=getinfo&userid=<?= $user->get_forumid() ?>">here</a>.
			You can send this user a Private Message by clicking <a href="http://forums.winamp.com/private.php?action=newmessage&userid=<?= $user->get_forumid() ?>">here</a>.<?
		} else {
			?>This user has not given their Winamp forum userid so you cannot view their profile or send them a private message.<?
		}
		?>
		</p>
		<?
		if($pages_created > 0) {
		?>
		<p>
		  Pages created by this user (most recent first):-<br>
		  <br>
			<table width="80%">
				<?
				  $toggle = 0;
				  while($record = $nsisweb->get_result_array($pages_result)) {
					  if($toggle) $bgcolour = 'acolor1'; else $bgcolour = 'acolor2';
						print '<tr class="'.$bgcolour.'">';
						print '<td align="left" valign="middle"><a href="viewpage.php?pageid='.$record['pageid'].'" target="_blank">'.$record['title'].'</a></td>';
						print '<td align="left" valign="middle" width="150">'.$record['created'].'</td>';
						print '</tr>';
					  $toggle = 1-$toggle;
				  }
				?>
			</table>
		</p>
		<?
		}
	}
}
$nsisweb->end_page();
?>