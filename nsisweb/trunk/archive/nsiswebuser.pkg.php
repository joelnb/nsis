<?
/* No security whatsoever *yet* */
/* User id zero is the anonymous user */

include_once('nsisweb.pkg.php');
define('ANONYMOUS_USER_ID',0);

function initialise_user_table()
{
	global $nsisweb;
	$nsisweb->query("drop table if exists nsisweb_users");
	$nsisweb->query("create table nsisweb_users (username varchar(255) not null,password varchar(255) not null,userid int auto_increment, primary key(userid), created datetime)");
}

class NsisWebUser
{
	var $user_id;
	var $username;
	
	function NsisWebUser($array)
	{
		$this->user_id  = $array['userid'];
		$this->username = $array['username'];
	}
};

function find_user($username)
{
  global $nsisweb;
  $username = mysql_escape_string($username);
  $result = $nsisweb->query("select * from nsisweb_users where username='$username'");
  if($result != FALSE && $nsisweb->how_many_results($result) == 1) {
	  $array = $nsisweb->get_result_array($result);
  } else {
	  $array = array('userid'=>0,'username'=>'anonymous');
  }
  return new NsisWebUser($array);
}

function find_userid($user_id)
{
  global $nsisweb;
  $result = $nsisweb->query("select * from nsisweb_users where userid='$user_id'");
  if($result != FALSE && $nsisweb->how_many_results($result) == 1) {
	  $array = $nsisweb->get_result_array($result);
  } else {
	  $array = array('userid'=>0,'username'=>'anonymous');
  }
  return new NsisWebUser($array);
}

function add_user($username,$password)
{
	if(strcasecmp($username,'anonymous') && strlen($username) > 0 && strlen($password) > 0) {
	  $user = find_user($username);
	  if($user->user_id == ANONYMOUS_USER_ID) {
		  global $nsisweb;
		  $password = md5($password);
	  	$result = $nsisweb->query("insert into nsisweb_users set username='$username', password='$password', userid=NULL, created=NOW()");
	  	return $result != FALSE;
		}
	}
	return FALSE;
}
?>