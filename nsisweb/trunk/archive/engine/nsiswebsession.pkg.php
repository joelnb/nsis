<?
/* Anything and everything to do with sessions is in here.

   What is a session? A session is the state remembered for a visitor to the website.
   To identify this session we give it a session_id. A registered user of the website
   can have more than one active session if they have logged in from more than one
   web browser (e.g. Internet Explorer and Netscape Navigator), or if they have logged
   in from more than one IP address. An anonymous user also has a session but this is
   only used to hold page state rather than persistent user settings.
   
   A session identifier needs to be associated with things that we can use to prove
   the identity of the person giving us the session_id. Once a user is logged in the
   session_id is all that is needed to act as that user. Protecting this is not easy.
   
   We can remember the IP address that the originator of the session used but 
   accurately determining this is hard. We can give the session a timeout period. We
   can force the user to re-enter their password for particularly dangerous operations.
   And then anything else I can think of later.
   
   For now security is *not* implemented, so that the implementation is simple.
   
   A session_id is the result of an MD5 operation, a 32 character hex string. This
   session_id is stored in a cookie on the client computer, or if they have turned off
   cookies then we have to use GET arguments to pass the session_id between pages.
   
   The userid zero identifies an anonymous session (since valid userid values are all
   one and higher).
*/

include_once(dirname(__FILE__)."/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/nsiswebpicks.pkg.php");
define('COOKIE_NAME','nsiswebid');
define('ANONYMOUS_USER_ID',0);
define('SESSION_TIMEOUT',60*30); /* seconds */

function initialise_session_table()
{
	global $nsisweb;
	$nsisweb->query("drop table if exists nsisweb_sessions");
	$nsisweb->query('create table nsisweb_sessions (sessionid varchar(255) not null,userid int unsigned not null default 0,created datetime not null,last_access datetime not null)');
}

class NsisWebSession
{
	var $session_id;
	var $user_id;
	var $created;
	var $last_access;
	var $last_checked;
	var $cached_username; /* do not use this directly, call get_username() instead! */

	function NsisWebSession($array)
	{
		$this->session_id   = $array['sessionid'];
		$this->user_id      = $array['userid'];
		$this->created      = $array['created'];
		$this->last_access  = $array['last_access'];
		$this->last_checked = time();
		unset($this->cached_username);
	}
	function is_legal()
	{
		return TRUE;
	}
	function is_anonymous()
	{
		return ($this->user_id == ANONYMOUS_USER_ID) ? TRUE : FALSE;
	}
	function get_username()
	{
		if(!isset($this->cached_username)) {
			global $nsisweb;
			$result = $nsisweb->query("select username from nsisweb_users where userid=$this->user_id");
			if($result && $nsisweb->how_many_results($result) == 1) {
				$array = $nsisweb->get_result_array($result);
				$this->cached_username = $array['username'];
			} else {
				$this->cached_username = "anonymous";
			}
		}
		return $this->cached_username;
	}
};

/* This function examines your cookie and GET data and decides if you have a session
   already or not. If not, or your session has timed out, a new anonymous session is
   returned. */
function find_my_session()
{
	global $nsisweb;

	$session_id   = ANONYMOUS_SESSION_ID;
	$session      = FALSE;
	$session_okay = FALSE;

	if(isset($_COOKIE[COOKIE_NAME])) {
		$session_id = $_COOKIE[COOKIE_NAME];
	} else if(isset($_GET[COOKIE_NAME])) {
		$session_id = $_GET[COOKIE_NAME];
	}

	/* Import saved php data (if any exists) -- this could come from a publicly
	   accessible file depending on how php is configured, e.g. /tmp is the
	   default location for session files to be stored. */
	session_save_path(NSISWEB_SESSION_DIR);
  session_start();

  /* Can we trust this imported data? The saved session data includes an md5'd
	   version of the session_id plus a magic number known only to us... if we
	   add this magic number to our session_id then md5 it and compare it to
	   the one from the imported data we can kinda tell whether or not that data
	   should be usable by the current user (based on their cookie data). This
	   works on the premise that an attacker doesn't know our magic number. */
  if(isset($_SESSION['session']) && isset($_SESSION['id'])) {
		$check_against = md5($session_id+NSISWEB_MAGIC_NUMBER);
		if(strcmp($check_against,$_SESSION['id']) == 0) {
			if($session = unserialize(base64_decode($_SESSION['session']))) {
				/* Does the session need timing out? Try not to do these checks too often
				   so that we hit the database less frequently. */
				if(time()-$session->last_checked > 300) {
					$nsisweb->query("delete from nsisweb_sessions where (UNIX_TIMESTAMP()-UNIX_TIMESTAMP(last_access))>".SESSION_TIMEOUT);
					if($session_id != ANONYMOUS_SESSION_ID) {
						$result = $nsisweb->query("select * from nsisweb_sessions where sessionid='$session_id'");
						if($result && $nsisweb->how_many_results($result) == 1) {
							$session = new NsisWebSession($nsisweb->get_result_array($result));
							if($session->is_legal()) {
								$session->last_checked = time();
								$session_okay = TRUE;
							}
						}
					}
				} else {
					$session_okay = TRUE;
				}
			}
		}
	}

	if($session && $session->okay) {
		$result = $nsisweb->query("update nsisweb_sessions set last_access=NOW() where sessionid='$session_id'");
		if(!$result || mysql_affected_rows($result) != 1) {
			$session = FALSE;
		}
	}

	if(!$session || !$session_okay) {
		/* Create a new anonymous session */
		$session_id = construct_session_id();
		$session    = new NsisWebSession(array('sessionid'=>$session_id,'userid'=>0));
		$nsisweb->query("insert into nsisweb_sessions set sessionid='$session_id',userid=0,created=NOW(),last_access=NOW()");
		setcookie(COOKIE_NAME,$session_id,time()+86400,"/","",0);
  }

  /* Update the cached username in the session object */
  $session->get_username();

  /* Store the session data in the php session file, for some reason on the
     SourceForge php installation I have to unset here first, otherwise
     instead of a base64 encoded stream I end up with a pure object!! */
  unset($_SESSION['session']);
  unset($_SESSION['id']);
	$_SESSION['session'] = base64_encode(serialize($session));
	$_SESSION['id']      = md5($session_id+NSISWEB_MAGIC_NUMBER);
	return $nsisweb->session = $session;
}

function construct_session_id()
{
	return uniqid(rand(),1);
}

function end_session()
{
	global $nsisweb;
	
	$session_id = 0;
	if(isset($_COOKIE[COOKIE_NAME])) {
		$session_id = $_COOKIE[COOKIE_NAME];
	} else if(isset($_GET[COOKIE_NAME])) {
		$session_id = $_GET[COOKIE_NAME];
	}

	if($session_id != 0) {
		$nsisweb->query("delete from nsisweb_sessions where sessionid='$session_id'");
		$nsisweb->query("delete from nsisweb_picks where sessionid='$session_id'");
	}

	setcookie(COOKIE_NAME,"",time()-86400,"/","",0);
	unset($_GET[COOKIE_NAME]);

	@session_start();
	$_SESSION = array();
	@session_unset();
	@session_destroy();
}

function login($username,$password)
{
	global $nsisweb;
	$result = $nsisweb->query("select * from nsisweb_users where username='$username'");
	if($result != FALSE && $nsisweb->how_many_results($result) == 1) {
		$array = $nsisweb->get_result_array($result);
		if($array != FALSE && md5($password) == $array['password']) {
			end_session();
			$user_id    = $array['userid'];
			$session_id = construct_session_id();
			$result     = $nsisweb->query("insert into nsisweb_sessions set sessionid='$session_id',userid='$user_id',created=NOW(),last_access=NOW()");
			if($result) {
				setcookie(COOKIE_NAME,$session_id,time()+86400,"/","",0);
				$session = new NsisWebSession(array('sessionid'=>$session_id,'userid'=>$user_id));

				/* Update the cached username in the session object */
  			$session->get_username();

				session_save_path(NSISWEB_SESSION_DIR);
  			session_start();
				$_SESSION['session'] = base64_encode(serialize($session));
				$_SESSION['id']      = md5($session_id+NSISWEB_MAGIC_NUMBER);

				return $nsisweb->session = $session;
			} else {
				$nsisweb->record_error(mysql_error());
			}
		} else {
			$nsisweb->record_error('Bad credentials');
		}
	} else {
		$nsisweb->record_error('Unknown username');
	}
	return find_my_session();
}
?>