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
  var $start_time;
  var $executed_queries;
  var $db_selected;

  function NsisWebSite()
  {
    $this->wwwroot          = NSISWEB_WWWROOT.NSISWEB_WWWSUBDIR;
    $this->fileroot         = NSISWEB_FILEROOT.NSISWEB_FILESUBDIR;
    $this->session          = 0;
    $this->errors           = array();
    $this->start_time       = 0;
    $this->executed_queries = array();
    $this->db_selected      = FALSE;
  }
  function initialise()
  {
	  if(defined('NSISWEB_ALLOW_INIT') && NSISWEB_ALLOW_INIT == TRUE) {
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
  }
  function record_error($error)
  {
    if(strlen($error)>0) {
      $this->errors[] = $error;
      if ($fp = fopen(NSISWEB_LOGSDIR.'/errors.log', 'a')) {
        fwrite($fp, date('d-M-Y G:i:s T:').$error.'\n');
        fclose($fp);
      }
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
	  $this->start_time = $this->get_micro_time();
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
  function get_gen_time()
  {
	  return $this->get_micro_time()-$this->start_time;
  }
  function redirect($pagename)
  {
    if(strcmp($pagename,'0') == 0) {
      $pagename = 'browse';
    }

    if(file_exists($this->fileroot.'/'.$pagename.'.php')) {
      $url = $this->wwwroot.'/'.$pagename.'.php';
      // encode get args into $url
      $first = TRUE;
      foreach($_GET as $key => $value) {
        if($first) {
          $url .= '?';
          $first = FALSE;
        } else {
          $url .= '&';
        }
        $url .= urlencode($key).'='.urlencode($value);
      }
      header("Location: $url");
      exit;
    } else {
	    $instance = new NsisWebInstance((int)$pagename,FETCH_CONTENT_PP);
      $instance->show();
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
    if($link = mysql_pconnect(NSISWEB_MYSQL_HOST,NSISWEB_MYSQL_USER,NSISWEB_MYSQL_PASSWORD)) {
      /* only select the db if the query does not mention the db name and we have not already selected the database */
      $result = TRUE;
      if(!$this->db_selected) {
	      if(!stristr($query,'database '.NSISWEB_DB)) {
	        $result = mysql_select_db(NSISWEB_DB);
	        if($result) $this->db_selected = TRUE;
	      }
      }
      if($result && connection_status() == 0) {
        $this->last_query = $query;
        $this->executed_queries[] = $query;
        $result = mysql_query($query);
        if($result != FALSE) {
          return $result;
      }
    }
    $this->record_error(mysql_error());
    return FALSE;
  }
  function query_one($query)
  {
	  /* If you know that you are only interested in a single row of result data
	     (which is a very common case) this function performs the steps necessary
	     in one neat call. */
     $result = $this->query($query);
     if($result && $this->how_many_results($result) > 0) {
	     return $this->get_result_array($result);
     }
     return FALSE;
  }
  function query_one_only($query)
  {
	  /* If you know that you are only interested in a single row of result data
	     (which is a very common case) this function performs the steps necessary
	     in one neat call. This variant will barf if more than a single row of
	     data is returned to us by the database engine. */
     $result = $this->query($query);
     if($result && $this->how_many_results($result) == 1) {
	     return $this->get_result_array($result);
     }
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
    return $this->wwwroot.'/nsisweb.php';
  }
  function get_page_url($page)
  {
    return $this->get_base_url().'/nsisweb.php?page='.urlencode($page);
  }
  function get_base_url()
  {
    return NSISWEB_WWWSUBDIR;
  }
  /* Expects strings like '4.0.6' */
  function version_check($vercheck)
  {
    $minver = str_replace(".","", $vercheck);
    $curver = str_replace(".","", phpversion());
    return ($curver >= $minver) ? TRUE : FALSE;
  }
  function get_micro_time()
  {
   list($usec, $sec) = explode(" ",microtime()); 
   return ((float)$usec + (float)$sec); 
  }
};

if(!isset($nsisweb)) {
  $nsisweb = new NsisWebSite;
}
$page_info = array();
?>