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
	$nsisweb->query('create table nsisweb_sessions (sessionid varchar(255) not null,userid int unsigned not null default 0,created datetime not null,last_access datetime not null,last_checked datetime not null)');
}

class NsisWebSession
{
	var $session_id;
	var $user_id;
	var $created;
	var $last_access;
	var $last_checked;
	var $cached_username; /* do not use this directly, call get_username() instead! */
	var $looks_like_admin;
	var $persist;

	function NsisWebSession($param)
	{
		$this->looks_like_admin = FALSE;
		$this->persist          = FALSE;
		
		if(is_array($param)) {
			$this->session_id       = $param['sessionid'];
			$this->user_id          = $param['userid'];
			$this->created          = $param['created'];
			$this->last_access      = $param['last_access'];
			$this->last_checked     = $param['last_checked'];
			unset($this->cached_username);
		} else if(is_string($param)) {
			$this->from_string($param);
		}
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
	function to_string()
	{
		/* No I don't trust serialize/unserialize!!! */
		$string = sprintf(
			"%3d%3d%3d%3d%3d%3d%3d%3d%s%s%s%s%s%s%s%s",
			strlen($this->session_id),
			strlen($this->user_id),
			strlen($this->created),
			strlen($this->last_access),
			strlen($this->last_checked),
			1,1,
			isset($this->cached_username) ? strlen($this->cached_username) : 0,
			"$this->session_id",
			"$this->user_id",
			"$this->created",
			"$this->last_access",
			"$this->last_checked",
			$this->looks_like_admin ? 1 : 0,
			$this->persist ? 1 : 0,
			isset($this->cached_username) ? "$this->cached_username" : "");
		return $string;
	}
	function from_string($string)
	{
		$format_string          = "%3d%3d%3d%3d%3d%3d%3d%3d";
		$skipcount              = strlen($format_string);
		$lengths                = sscanf($string,$format_string);
		$this->session_id       = substr($string,$skipcount,$lengths[0]); $skipcount += $lengths[0];
		$this->user_id          = substr($string,$skipcount,$lengths[1]); $skipcount += $lengths[1];
		$this->created          = substr($string,$skipcount,$lengths[2]); $skipcount += $lengths[2];
		$this->last_access      = substr($string,$skipcount,$lengths[3]); $skipcount += $lengths[3];
		$this->last_checked     = substr($string,$skipcount,$lengths[4]); $skipcount += $lengths[4];
		$this->looks_like_admin = substr($string,$skipcount,$lengths[5]); $skipcount += $lengths[5];
		$this->persist          = substr($string,$skipcount,$lengths[6]); $skipcount += $lengths[6];
		
		if($lengths[7] > 0) {
			$this->cached_username = substr($string,$skipcount,$lengths[7]);
		} else {
			unset($this->cached_username);
		}
	}
	function looks_like_admin()
	{
		return ($this->looks_like_admin ? TRUE : FALSE);
	}
	function persists()
	{
		return ($this->persist ? TRUE : FALSE);
	}
};

/* This function examines your cookie and GET data and decides if you have a session
   already or not. If not, or your session has timed out, a new anonymous session is
   returned. */
function find_my_session()
{
	global $nsisweb;
	define('NO_SESSION',0);

	$session_id   = NO_SESSION;
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
			$session = new NsisWebSession(base64_decode($_SESSION['session']));
			/* Does the session need timing out? Try not to do these checks too often
			   so that we hit the database less frequently. */
			if(!$session->persists() && (time()-$session->last_checked) > 300) {
				timeout_sessions();
				if($session_id != NO_SESSION) {
					$nsisweb->query("update nsisweb_sessions set last_checked=NOW() where sessionid='$session_id'");
					$record = $nsisweb->query_one_only("select * from nsisweb_sessions where sessionid='$session_id'");
					if($record) {
						$session = new NsisWebSession($record);
						if($session->is_legal()) {
							$session->last_checked = time();
							$session_okay = TRUE;
						}
					} else {
						end_session();
						session_save_path(NSISWEB_SESSION_DIR);
					  session_start();
					}
				}
			} else {
				$session_okay = TRUE;
			}
		}
	}

	if($session && $session_okay) {
		$result = $nsisweb->query("update nsisweb_sessions set last_access=NOW() where sessionid='$session_id'");
	}

	if(!$session || !$session_okay) {
		/* Create a new anonymous session */
		$session_id = construct_session_id();
		$record     = $nsisweb->query_one_only("select NOW()");
		$now        = $record['NOW()'];
		$session    = new NsisWebSession(array('sessionid'=>$session_id,'userid'=>0,'created'=>$now,'last_access'=>$now,'last_checked'=>time()));
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
	$_SESSION['session'] = base64_encode($session->to_string());
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
	setcookie(session_name(),"",time()-86400,"/","",0);
	unset($_GET[COOKIE_NAME]);

	@session_start();
	$_SESSION = array();
	@session_unset();
	@session_destroy();

	if($nsisweb->session != 0) {	
		$session = $nsisweb->session;
		$session->user_id = 0;
		$session->looks_like_admin = FALSE;
		$session->persist          = FALSE;
		unset($session->cached_username);
	}
	
	unset($_SESSION['session']);
}

function login($username,$password)
{
	global $nsisweb;
	$record = $nsisweb->query_one_only("select * from nsisweb_users where username='$username'");
	
	if($record && md5($password) == $record['password']) {
		$user_id    = $record['userid'];
		$session    = $nsisweb->get_session();
		$session_id = $session->session_id;
		
		setcookie(COOKIE_NAME,$session_id,time()+86400,"/","",0);
		$session->user_id          = $user_id;
		$session->last_checked     = time();
		$session->looks_like_admin = ($record['usertype'] == USERTYPE_ADMIN) ? TRUE : FALSE;
		$session->persist          = ($record['flags'] & USERFLAG_PERSIST) ? TRUE : FALSE;
		unset($session->cached_username);

		/* Update the cached username in the session object */
		$session->get_username();

		session_save_path(NSISWEB_SESSION_DIR);
		session_start();
		$_SESSION['session'] = base64_encode($session->to_string());
		$_SESSION['id']      = md5($session_id+NSISWEB_MAGIC_NUMBER);

		$nsisweb->query('update nsisweb_sessions set last_access=NOW(),last_checked=NOW(),userid='.$session->user_id." where sessionid='$session_id'");
		return $nsisweb->session = $session;
	} else {
		$nsisweb->record_error('Unknown username');
	}
	return find_my_session();
}

function timeout_sessions()
{
	global $nsisweb;
	$nsisweb->query("delete from nsisweb_sessions where (UNIX_TIMESTAMP()-UNIX_TIMESTAMP(last_access))>".SESSION_TIMEOUT);
}
?>