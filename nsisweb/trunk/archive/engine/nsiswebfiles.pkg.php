<?
include_once(dirname(__FILE__)."/nsisweb.pkg.php");

define('USE_UNIX_FILE_COMMAND',TRUE);

function initialise_files_table()
{
  global $nsisweb;
  $nsisweb->query("drop table if exists nsisweb_files",__FILE__,__LINE__);
  $nsisweb->query("create table nsisweb_files (filename varchar(255) not null,type varchar(255) not null,size int unsigned not null default 0,userid int unsigned not null default 0,downloads int unsigned not null default 0,about text not null)",__FILE__,__LINE__);
}

class NsisWebFile
{
  var $private_info;
  
  function NsisWebFile($param)
  {
    if(is_array($param)) {
      $this->private_info = $param;
    }
  }

  function is_okay()         { return ((int)$this->private_info['size'])>0; }
  function get_filename()    { return $this->private_info['filename'];      }
  function get_mime_type()   { return $this->private_info['type'];          }
  function get_size()        { return $this->private_info['size'];          }
  function get_description() { return $this->private_info['about'];         }
  function get_downloads()   { return $this->private_info['downloads'];     }
  function get_contributor() { return $this->private_info['userid'];        }

  function get_url()
  {
    global $nsisweb;
    return $nsisweb->get_base_url().'/uploads/'.$this->get_filename();
  }
  function get_path()
  {
    global $nsisweb;
    return $nsisweb->fileroot.'/uploads/'.$this->get_filename();
  }
  function get_image_url()
  {
    global $nsisweb;
    switch($this->get_mime_type()) {
      case 'application/x-zip-compressed':
      case 'application/zip':
        return $nsisweb->get_base_url().'/images/zip.gif'; break;
    }
    return '';
  }

  function delete()
  {
    global $nsisweb;
    $sqlfilename  = mysql_escape_string($this->get_path());
    $nsisweb->query("delete from nsisweb_files where filename='$sqlfilename'",__FILE__,__LINE__);
  }
  function download()
  {
    if(@file_exists($this->get_path())) {
      if(@filesize($this->get_path()) == $this->get_size()) {
        header("Content-type: ".$this->get_mime_type());
        header("Content-Disposition: attachment; filename=".$this->get_filename());
        header("Content-length: ".$this->get_size());
        if(@readfile($this->get_path())) {
          global $nsisweb;
          $this->private_info['downloads']++;
          $nsisweb->query("update nsisweb_files set downloads=downloads+1 where filename='".mysql_escape_string($this->get_filename())."'",__FILE__,__LINE__);
          exit;
        }
      }
    }
  }
  function save($description,$mime_type)
  {
    global $nsisweb;
    $size = @filesize($this->get_path());
    if($size > 0) {
      $type        = mysql_escape_string(determine_file_type($this->get_filename(),$mime_type));
      $description = mysql_escape_string($description);
      $nsisweb->query("update nsisweb_files set about='$description',size=$size,type='$type' where filename='".$this->get_filename(),__FILE__,__LINE__);
    }
  }
};

function find_file($filename)
{
  global $nsisweb;
  $filename = mysql_escape_string($filename);
  $record   = $nsisweb->query_one_only("select * from nsisweb_files where filename='$filename'",__FILE__,__LINE__);
  return new NsisWebFile($record);
}

function add_file($filename,$mime_type,$description)
{
  $file = find_file($filename);
  if(!$file) {
    global $nsisweb;
    $size        = @filesize($nsisweb->fileroot.'/uploads/'.$filename);
    $filename    = mysql_escape_string($filename);
    $description = mysql_escape_string($description);
    $type        = mysql_escape_string(determine_file_type($filename,$mime_type));
    $session     = $nsisweb->get_session();
    $user_id     = $session->user_id;
    $result      = $nsisweb->query("insert into nsisweb_files set filename='$filename',type='$type',size='$size',userid='$user_id',downloads=0,about='$description'",__FILE__,__LINE__);
    return ($result != FALSE);
  }
  return FALSE;
}

function determine_file_type($filename,$proposed_type)
{
  if(USE_UNIX_FILE_COMMAND) {
    global $nsisweb;
    $path   = $nsisweb->fileroot.'/uploads/'.$filename;
    $output = `file -i $path`;  // -i means return a mime type
    return $output;
  } else {
    return $proposed_type;
  }
}

/* Returns 0 if no files were uploaded, 1 if some were uploaded, and 2 if all were
   uploaded. */
function process_uploaded_files($form_field_name)
{
  global $nsisweb;
  $store_folder = $nsisweb->fileroot.'/uploads';
  $count        = 0;
  $total_files  = 0;
  $okay_files   = 0;
  $stored_files = 0;
  $multi_mode   = 0;

  /* There are two possible ways the form field has been populated, either it's
     name was given with a trailing [] pair everytime it was used as the name of
     a file input field, or else the [] were not given. In the latter case only
     a single file input field can exist by that name. Here we detect which case
     we are in: */
  if(strlen($_FILES[$form_field_name]['name']) > 0) {
    /* Single Mode */
    $count = 1;
    if($_FILES[$form_field_name]['error'] != 4) { /* 4 means 'no file uploaded' */
      $total_files = 1;
      $error = $_FILES[$form_field_name]['error'];
      if(!$nsisweb->version_check('4.2.0') || $error == 0) { /* 0 means 'okay' */
        if(is_uploaded_file($_FILES[$form_field_name]['tmp_name'])) {
          $okay_files = 1;
        } else {
          $nsisweb->record_error("upload failure: file is not an uploaded file (file=".$_FILES[$form_field_name].')',__FILE__,__LINE__);
          $_FILES[$form_field_name]['error'] = 4;
        }
      } else if($error) {
        $nsisweb->record_error("upload failure: file has error code (error=$error)",__FILE__,__LINE__);
      } else {
        $nsisweb->record_error("upload failure: PHP version 4.2.0 required for is_uploaded_file()",__FILE__,__LINE__);
      }
    }
  } else if(is_array($_FILES[$form_field_name]['name'])) {
    /* Multi Mode */
    $multi_mode = 1;
    $count      = count($_FILES[$form_field_name]['name']);
    
    for($i=0; $i<$count; $i++) {
      $error = $_FILES[$form_field_name]['error'][$i];
      $tmp   = $_FILES[$form_field_name]['tmp_name'][$i];
      if(!$nsisweb->version_check('4.2.0') || $error != 4) {
        $total_files++;
        if($error == 0 && is_uploaded_file($tmp)) {
          $okay_files++;
        } else {
          $nsisweb->record_error("upload failure: file is not an uploaded file (file=$tmp)",__FILE__,__LINE__);
          $_FILES[$form_field_name]['error'][$i] = 4;
        }
      } else if($error) {
        $nsisweb->record_error("upload failure: file has error code (error=$error)",__FILE__,__LINE__);
      } else {
        $nsisweb->record_error("upload failure: PHP version 4.2.0 required for is_uploaded_file()",__FILE__,__LINE__);
      }
    }
  }

  /* If some files are ready for processing, move and record them */
  if($okay_files > 0) {
    if($multi_mode) {
      for($i=0; $i<$count; $i++) {
        $uploaded_name = $store_folder.'/'.$_FILES[$form_field_name]['name'][$i];
        if(@move_uploaded_file($_FILES[$form_field_name]['tmp_name'],$uploaded_name)) {
          if($this->add_file($_FILES[$form_field_name]['name'][$i],
            $_FILES[$form_field_name]['type'][$i])) {
            $stored_files++;
          } else {
            $nsisweb->record_error('upload failure: add_file() failed (file='.$_FILES[$form_field_name]['name'][$i].')',__FILE__,__LINE__);
            unlink($uploaded_name);
          }
        } else {
          $nsisweb->record_error("upload failure: file could not be moved (oldname=".$_FILES[$form_field_name]['tmp_name'].',newname='.$uploaded_name.')',__FILE__,__LINE__);
        }
      }
    } else {
      $uploaded_name = $store_folder.'/'.$_FILES[$form_field_name]['name'];
      if(@move_uploaded_file($_FILES[$form_field_name]['tmp_name'],$uploaded_name)) {
        if($this->add_file($_FILES[$form_field_name]['name'],
          $_FILES[$form_field_name]['type'])) {
          $stored_files++;
        } else {
          $nsisweb->record_error('upload failure: add_file() failed (file='.$_FILES[$form_field_name]['name'].')',__FILE__,__LINE__);
          unlink($uploaded_name);
        }
      } else {
        $nsisweb->record_error("upload failure: file could not be moved (oldname=".$_FILES[$form_field_name]['tmp_name'].',newname='.$uploaded_name.')',__FILE__,__LINE__);
      }
    }
  }

  if($total_files > 0 && $stored_files > 0) {
    if($stored_files < $total_files) {
      return 1;
    } else {
      return 2;
    }
  }

  return FALSE;
}

/* This will add entries to the storage database for any file that exists in the
   upload directory that does not exist in the database. It will *not* remove
   entries in the database that correspond to missing files. It can't know the*/
function sync()
{
  global $nsisweb;
  $store_folder = $nsisweb->fileroot.'/uploads';
  if($dir = @opendir($store_folder)) {
    while($filename = readdir($dir)) {
      if($filename == "." or $filename == "..") continue;
      if($file = ($filename)) {
        add_file($filename,'application/octet-stream','No description');
      }
    }
  }
}

function get_single_upload_limit() {
  if(!ini_get("file_uploads")) {
    return FALSE;
  }
  $upload_max_filesize = get_real_size(ini_get("upload_max_filesize"));
  $post_max_size = get_real_size(ini_get("post_max_size"));
  $memory_limit = round(get_real_size(ini_get("memory_limit")) / 2);
  if($upload_max_filesize>$post_max_size) {
    $max = $post_max_size;
  } else {
    $max = $upload_max_filesize;
  }
  if(($memory_limit!="")&&($memory_limit<$max)) {
    $max = $memory_limit;
  }
  if(NSISWEB_MAXSINGLEUPLOAD < $max) {
    $max = NSISWEB_MAXSINGLEUPLOAD;
  }
  return $max;
}

function get_human_readable_size($size)
{
  if ($size != "") { 
    return 0;
  }
  $scan['MB'] = 1048576;
  $scan['M'] = 1048576;
  $scan['KB'] = 1024;
  $scan['K'] = 1024;
  while (list($key) = each($scan)) {
    if ((strlen($size)>strlen($key))&&(substr($size, strlen($size) - strlen($key))==$key)) {
      $size = substr($size, 0, strlen($size) - strlen($key)) * $scan[$key];
      break;
    }
  }
  return $size;
}
?>