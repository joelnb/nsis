<?
/* This file contains core stuff used throughout the site code, there is a global
   instance of the NsisWebSite class named nsisweb. */
include_once(dirname(__FILE__)."/nsisweb.cfg.php");
include_once(dirname(__FILE__)."/nsiswebsession.pkg.php");
include_once(dirname(__FILE__)."/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/nsiswebstorage.pkg.php");
include_once(dirname(__FILE__)."/nsiswebuser.pkg.php");
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
		initialise_picks_table();
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
		$nsisweb = $this;
		include(NSISWEB_HEADER_SKELETON);
	}
	function end_page()
	{
		global $page_info;
		$nsisweb = $this;
		include(NSISWEB_FOOTER_SKELETON);
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