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
define('COOKIE_NAME','nsiswebid');
define('ANONYMOUS_USER_ID',0);
define('SESSION_TIMEOUT',60*30); /* seconds */

function initialise_session_table()
{
	global $nsisweb;
	$nsisweb->query("drop table if exists nsisweb_sessions");
	$nsisweb->query('create table nsisweb_sessions (sessionid varchar(255) not null,userid int not null,created datetime not null,last_access datetime not null)');
}

class NsisWebSession
{
	var $session_id;
	var $user_id;
	var $created;
	var $last_access;

	function NsisWebSession($array)
	{
		$this->session_id  = $array['sessionid'];
		$this->user_id     = $array['userid'];
		$this->created     = $array['created'];
		$this->last_access = $array['last_access'];
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
		global $nsisweb;
		$result = $nsisweb->query("select username from nsisweb_users where userid='$this->user_id'");
		if($result && $nsisweb->how_many_results($result) == 1) {
			$array = $nsisweb->get_result_array($result);
			return $array['username'];
		}
		return "anonymous";
	}
};

/* This function examines your cookie and GET data and decides if you have a session
   already or not. If not, or your session has timed out, a new anonymous session is
   returned. */
function find_my_session()
{
	global $nsisweb;

	$session_id = ANONYMOUS_SESSION_ID;
	$session    = FALSE;

	if(isset($_COOKIE[COOKIE_NAME])) {
		$session_id = $_COOKIE[COOKIE_NAME];
	} else if(isset($_GET[COOKIE_NAME])) {
		$session_id = $_GET[COOKIE_NAME];
	}

	/* timeout old sessions */
	$nsisweb->query("delete from nsisweb_sessions where (UNIX_TIMESTAMP()-UNIX_TIMESTAMP(last_access))>".SESSION_TIMEOUT);

	if($session_id != ANONYMOUS_SESSION_ID) {
		$result = $nsisweb->query("select * from nsisweb_sessions where sessionid='$session_id'");
		if($result && $nsisweb->how_many_results($result) == 1) {
			$session = new NsisWebSession($nsisweb->get_result_array($result));
			if($session->is_legal()) {
				$nsisweb->query("update nsisweb_sessions set last_access=NOW() where sessionid='$session_id'");
				return $nsisweb->session = $session;
			} else {
				end_session();
			}
		}
	}

	/* Create a new anonymous session */
	$session_id = construct_session_id();
	$result = $nsisweb->query("insert into nsisweb_sessions set sessionid='$session_id',userid=0,created=NOW(),last_access=NOW()");
	if(!$result) {
		$nsisweb->record_error(mysql_error());
	}

	setcookie(COOKIE_NAME,$session_id,time()+86400,"/","",0);
	$array = array('sessionid'=>$session_id,'userid'=>0);
	return $nsisweb->session = new NsisWebSession($array);
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
				$array = array('sessionid'=>$session_id,'userid'=>$user_id);
				return $nsisweb->session = new NsisWebSession($array);
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