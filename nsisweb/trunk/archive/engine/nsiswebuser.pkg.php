<?
/* No security whatsoever *yet* */
/* User id zero is the anonymous user */

include_once(dirname(__FILE__)."/nsisweb.pkg.php");
define('ANONYMOUS_USER_ID',    0);
define('SYSTEM_USER_ID',      -1);
define('USERTYPE_NORMAL',      0);
define('USERTYPE_ADMIN',       1);
define('USERFLAG_PERSIST',     1);
define('USERFLAG_SHOWQUERIES', 2);

function initialise_user_table()
{
  global $nsisweb;
  $nsisweb->query("drop table if exists nsisweb_users",__FILE__,__LINE__);
  $nsisweb->query("create table nsisweb_users (username varchar(255) not null,password varchar(255) not null,userid int unsigned auto_increment,primary key(userid),created datetime not null,usertype int unsigned not null default 0,flags int unsigned default 0,email varchar(255),forumid int default 0)",__FILE__,__LINE__);
}

class NsisWebUser
{
  var $user_id;
  var $username;
  var $usertype;
  var $flags;
  var $email;
  var $forumid; /* as in userid in this link: http://forums.winamp.com/member.php?action=getinfo&userid=70214 */
  
  function NsisWebUser($array)
  {
    $this->user_id  = $array['userid'];
    $this->username = $array['username'];
    $this->usertype = $array['usertype'];
    $this->flags    = $array['flags'];
    $this->email    = $array['email'];
    $this->forumid  = $array['forumid'];
  }
  function is_admin()
  {
    return ($this->usertype == USERTYPE_ADMIN) ? TRUE : FALSE;
  }
  function persists()
  {
    return ($this->is_anonymous() || $this->flags & USERFLAG_PERSIST) ? TRUE : FALSE;
  }
  function is_anonymous()
  {
    return ($this->user_id == 0) ? TRUE : FALSE;
  }
  function get_flags()
  {
    return $this->flags;
  }
  function get_email()
  {
	  return $this->email;
  }
	function get_forumid()
	{
		return $this->forumid;
	}
	function update($email,$forumid)
	{
		if($this->user_id != ANONYMOUS_USER_ID && is_int($forumid)) {
			$email = mysql_escape_string($email);
			global $nsisweb;
			$nsisweb->query("update nsisweb_users set email='$email', forumid='$forumid' where userid=".$this->user_id);
		}
	}
};

function find_user($username)
{
  global $nsisweb;
  $username = mysql_escape_string($username);
  $result = $nsisweb->query("select * from nsisweb_users where username='$username'",__FILE__,__LINE__);
  if($result != FALSE && $nsisweb->how_many_results($result) == 1) {
    $array = $nsisweb->get_result_array($result);
  } else {
    $array = array('userid'=>0,'username'=>'anonymous');
  }
  return new NsisWebUser($array);
}

function find_userid($user_id)
{
  $user_id = (int)$user_id;
  if($user_id == 0) {
    return new NsisWebUser(array('userid'=>0,'username'=>'anonymous'));
  } else {
    global $nsisweb;
    $result = $nsisweb->query("select * from nsisweb_users where userid=$user_id",__FILE__,__LINE__);
    if($result != FALSE && $nsisweb->how_many_results($result) == 1) {
      $array = $nsisweb->get_result_array($result);
    } else {
      $array = array('userid'=>0,'username'=>'unknown');
    }
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
      $result = $nsisweb->query("insert into nsisweb_users set username='$username', password='$password', userid=NULL, created=NOW()",__FILE__,__LINE__);
      return $result != FALSE;
    }
  }
  return FALSE;
}

/* $user must be a NsisWebUser instance */
function change_user_type($user,$new_type)
{
  global $nsisweb;
  $session = $nsisweb->get_session();
  $this_user = find_userid($session->user_id);
  
  if($this_user->is_admin()) {
    $result = $nsisweb->query("update nsisweb_users set usertype=$new_type where userid=".$session->user_id,__FILE__,__LINE__);
    if($result) {
      $user->usertype = $new_type;
      return TRUE;
    }
  }
  
  return FALSE;
}
?>