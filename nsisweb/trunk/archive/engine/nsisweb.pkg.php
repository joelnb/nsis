<?
/* This file contains core stuff used throughout the site code, there is a global
   instance of the NsisWeb class named nsisweb. */
include_once(dirname(__FILE__)."/nsisweb.cfg.php");
include_once(dirname(__FILE__)."/nsiswebsession.pkg.php");
include_once(dirname(__FILE__)."/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/nsiswebfiles.pkg.php");
include_once(dirname(__FILE__)."/nsiswebuser.pkg.php");
define('ANONYMOUS_USER_ID',0);

class NsisWeb
{
  var $wwwroot;
  var $fileroot;
  var $last_query;
  var $errors;
  var $session;
  var $start_time;
  var $executed_queries;
  var $db_selected;
  var $instance_history;

  function NsisWeb()
  {
    $this->wwwroot          = NSISWEB_WWWROOT.NSISWEB_WWWSUBDIR;
    $this->fileroot         = NSISWEB_FILEROOT.NSISWEB_FILESUBDIR;
    $this->session          = 0;
    $this->errors           = array();
    $this->start_time       = 0;
    $this->executed_queries = array();
    $this->db_selected      = FALSE;
    if(strlen($_GET['instances'])>0) {
      $this->instance_history = explode(',',$_GET['instances']);
    } else {
      $this->instance_history = array(0);
    }
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
      initialise_files_table();
    }
  }
  function record_error($error,$file='Unknown',$line='Unknown')
  {
    if(strlen($error)>0) {
      $this->errors[] = $error;
      if ($fp = fopen(NSISWEB_LOGSDIR.'/errors.log', 'a')) {
        /* #error# acts as a dectectable start point of an error message and is
           not likely to turn up in the logs. */
        fwrite($fp,"#error#".basename($file)."#$line#".date('d-M-Y G:i:s T').'#'.$_SERVER['REQUEST_URI'].'#'.$error."\n");
        fclose($fp);
      }
    }
  }
  function reset_instance_history()
  {
    $this->instance_history = array();
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
  function start_page($title,$robots_allowed = TRUE)
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
      if(end($this->instance_history) != (int)$pagename) {
        $this->instance_history[] = (int)$pagename;
      }
      $instance = new NsisWebInstance((int)$pagename,FETCH_CONTENT_PP);
      $instance->show();
      exit;
    }
  }
  function get_instance_history($up_depth)
  {
    if($up_depth > 0) {
      return 0;
    } else if($up_depth == 0) {
      return implode(',',$this->instance_history);
    } else {
      return implode(',',array_slice($this->instance_history,0,$up_depth));
    }
  }
  function get_last_history_page()
  {
    return $this->instance_history[count($this->instance_history)-2];
  }
  function get_up_url()
  {
    return $this->get_page_url($this->get_last_history_page()).'&instances='.urlencode($this->get_instance_history(-2));
  }
  function query($query,$file='Unknown',$line='Unknown',$dolog=1)
  {
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
      /* 0 means NORMAL, 1 means ABORTED and 2 means TIMEOUT */
      if($result && connection_status() == 0) {
        $this->last_query = $query;
        $this->executed_queries[] = $query;
        $result = mysql_query($query);

        if(strstr($query,'update') || 
           strstr($query,'insert') ||
           strstr($query,'delete')) {
          global $nsisweb;
          if($nsisweb->session != 0) {
            $session = $nsisweb->session;
            $user    = $session->user_id;
            $ip      = $session->ip;
          } else {
            $user = $ip = 'unknown';
          }
          if ($dolog) {
            $logline = "modification detected: user=$user ip=$ip query=$query";
            if($fp = fopen(NSISWEB_LOGSDIR.'/dbmods.log', 'a')) {
              fwrite($fp,"#dbmod#".basename($file)."#$line#".date('d-M-Y G:i:s T').'#'.$_SERVER['REQUEST_URI'].'#'.$logline."\n");
              fclose($fp);
            }
          }
        }
          
        if($result != FALSE) {
          return $result;
        } else {
          $this->record_error('mysql_query() failed: '.mysql_error()." (query=$query)",$file,$line);
        }
      } else {
        $this->record_error('connection_status() is not NORMAL: '.mysql_error()." (query=$query)",$file,$line);
      }
    } else {
      $this->record_error('mysql_pconnect() failed: '.mysql_error()." (query=$query)",$file,$line);
    }
    return FALSE;
  }
  function query_one($query,$file='Unknown',$line='Unknown')
  {
    /* If you know that you are only interested in a single row of result data
       (which is a very common case) this function performs the steps necessary
       in one neat call. */
     $result = $this->query($query,$file,$line);
     if($result && $this->how_many_results($result) > 0) {
       return $this->get_result_array($result);
     }
     return FALSE;
  }
  function query_one_only($query,$file='Unknown',$line='Unknown')
  {
    /* If you know that you are only interested in a single row of result data
       (which is a very common case) this function performs the steps necessary
       in one neat call. This variant will barf if more than a single row of
       data is returned to us by the database engine. */
     $result = $this->query($query,$file,$line);
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
  $nsisweb = new NsisWeb;
}
$page_info = array();
?>