<?
/* This file contains core stuff used throughout the site code, there is a global
   instance of the NsisWebSite class named nsisweb. */
include_once('nsisweb.cfg.php');
include_once('nsiswebsession.pkg.php');
include_once('nsiswebpage.pkg.php');
include_once('nsiswebstorage.pkg.php');
include_once('nsiswebuser.pkg.php');
define('ANONYMOUS_USER_ID',0);

class NsisWebSite
{
	var $wwwroot;
	var $fileroot;
	var $last_query;
	var $errors;
	var $session;
	
	function NsisWebSite()
	{
		$this->wwwroot  = NSISWEB_WWWROOT.NSISWEB_WWWSUBDIR;
		$this->fileroot = NSISWEB_FILEROOT.NSISWEB_FILESUBDIR;
		$this->session  = 0;
		$this->errors   = array();
	}
	function initialise()
	{
		if(NSISWEB_OWNDB) {
			$this->query('drop database if exists '.NSISWEB_DB);
			$this->query('create database '.NSISWEB_DB);
		}
		initialise_user_table();
		initialise_session_table();
		initialise_page_table();
		$storage = new NsisWebStorage;
		$storage->initialise();
	}
	function record_error($error)
	{
		if(strlen($error)>0) {
			$this->errors[] = $error;
		}
	}
	function get_session()
	{
		if($this->session == 0) {
			$this->session = find_my_session();
		}
		return $this->session;
	}
	function logged_in()
	{
		$session = $this->get_session();
		return $session->user_id != ANONYMOUS_USER_ID;
	}
	function start_page($title)
	{
		global $page_info;
		
		$this->get_session();
		
		$page_browsing_depth = "You are viewing archive page <b>$title</b>";
		$home_url            = $this->get_home_url();
		$logged_in_text      = '<i>not logged in</i> ( <a style="color:#0000ff;text-decoration:underline;" href="'.$this->get_page_url('login').'">login</a> )';
		
		$this->get_session();
		if(!$this->session->is_anonymous()) {
			$logged_in_text = $this->session->get_username().' ( <a style="color:#0000ff;text-decoration:underline;" href="'.$this->get_page_url('logout').'">logout</a> )';
		}
		
		print <<<ENDPAGEHEADER
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
	<head>
		<title>Nullsoft (SuperPiMP|Scriptable) Install System // NSIS Archive Site</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="Stylesheet" type="text/css" href="http://nsis.sourceforge.net/include/style.css">
		<link rel="SHORTCUT ICON" href="/favicon.ico">
	</head> 
	<body> 
		<div class="center">
			<table width="750" cellpadding="0" cellspacing="0" border="0" style="background-color:#F0F0F0">
				<tr>
				  <td align="left" style="font-size:8pt;padding-bottom:2px;"><b>Logged in as:</b> $logged_in_text</td>
				  <td align="right" style="font-size:8pt;padding-bottom:2px;">[ <a href="$home_url">Home</a> ]</td>
				</tr>
			</table>
			<table width="750" cellpadding="0" cellspacing="0" class="maintable"> 
				<tr>
					<td> 
						<table width="720" border="0" cellpadding="0" cellspacing="0" class="innertable" style="background-image:none;"> 
							<tr class="header"> 
								<td width="70"><a href="http://nsis.sourceforge.net/index.php"><div class="center"><img  border="0" src="http://nsis.sourceforge.net/images/logo.gif" width="48" height="48"></div></a></td> 
								<td width="650"><div class="header">Nullsoft (SuperPiMP|Scriptable) Install System<br><font style="font-size:8pt;">$page_browsing_depth</font></div></td> 
							</tr> 
							<tr> 
								<td colspan="2">
									<div class="margin"> 
ENDPAGEHEADER;
	}
	function end_page()
	{
		global $page_info;
		
		echo <<<ENDPAGEFOOTER
        						<p>&nbsp;<br>&nbsp;<br><a href="http://sourceforge.net"><img class="image" src="http://sourceforge.net/sflogo.php?group_id=22049&amp;type=1" alt="SourceForge Logo"></a> 
									</div>
								</td> 
							</tr> 
						</table> 
					</td>
				</tr> 
			</table> 
		</div> 
	</body> 
</html>
ENDPAGEFOOTER;
	}
	function redirect($pagename)
	{
		if(file_exists($this->fileroot.'/'.$pagename.'.php')) {
		  $url = $this->wwwroot.'/'.$pagename.'.php';
	  	header("Location: $url");
	  	exit;
  	} else {
			show_page($pagename,TRUE);
		  exit;
  	}
	}
	function query($query)
	{
		/* own database permission check */
		if(!NSISWEB_OWNDB && strstr($query,'database ')) {
			return FALSE;
		}

		/* admin rights check */
		if(stristr($query,'create table') || stristr($query,'drop ')) {
			/* not implemented yet, force manual manipulation for now */
			/*$this->record_error('insufficient privileges');
			return FALSE;*/
  	}

	  unset($this->$last_query);
	  if($link = mysql_connect(NSISWEB_MYSQL_HOST,NSISWEB_MYSQL_USER,NSISWEB_MYSQL_PASSWORD)) {
		  /* only select the db if the query does not mention the db name */
		  $result = TRUE;
		  if(!stristr($query,'database '.NSISWEB_DB)) {
			  $result = mysql_select_db(NSISWEB_DB);
		  }
		  if($result && connection_status() == 0) {
			  $this->last_query = $query;
			  $result = mysql_query($query);
			  if($result != FALSE) {
				  return $result;
			  }
		  }
		}
	  $this->record_error(mysql_error());
	  return FALSE;
	}
  function how_many_results($result)
  {
	  return mysql_num_rows($result);
  }
  function get_result_array($result)
  {
		return mysql_fetch_array($result,MYSQL_ASSOC);
  }
  function get_created_id()
  {
	  /* Warning: Will not work if the AUTO_INCREMENT column type is BIGINT,
	     instead use 'SELECT LAST_INSERT_ID()'. Doesn't work for INSERT_DELAYED
	     either, and you should check the mysql docs for INSERT IGNORE queries,
	     it might not work properly for them either. */
	  return mysql_insert_id();
  }
  function get_home_url()
  {
	  return $this->wwwroot;
  }
  function get_page_url($page)
  {
	  return $this->wwwroot.'/nsisweb.php?page='.urlencode($page);
  }
  /* Expects strings like '4.0.6' */
	function version_check($vercheck)
	{
		$minver = str_replace(".","", $vercheck);
		$curver = str_replace(".","", phpversion());
		return ($curver >= $minver) ? TRUE : FALSE;
	}
};

if(!isset($nsisweb)) {
	$nsisweb = new NsisWebSite;
}
$page_info = array();
?>