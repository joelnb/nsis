<?
include_once(dirname(__FILE__)."/nsisweb.pkg.php");

class NsisWebStorage
{
	function initialise()
	{
	  global $nsisweb;
		$nsisweb->query("drop table if exists nsisweb_files");
		$nsisweb->query("create table nsisweb_files (filename varchar(255) not null,type varchar(255) not null,size int unsigned not null default 0,userid int unsigned not null default 0)");
	}
  function get_files()
  {
	  global $nsisweb;
	  return $nsisweb->query('select * from nsisweb_files order by filename');
  }
  function exists_file($filename)
  {
	  global $nsisweb;
	  $filename = mysql_escape_string($filename);
	  $result = $nsisweb->query("select * from nsisweb_files where filename='$filename'");
	  if($result != FALSE) {
		  if($nsisweb->how_many_results($result) > 0) {
			  return $result;
		  }
	  }
	  return FALSE;
  }
  function add_file($filename,$mime_type)
  {
	  global $nsisweb;
	  $filename = mysql_escape_string($filename);
	  $size     = filesize($nsisweb->fileroot.'/uploads/'.$filename);
	  if(!$this->exists_file($filename)) {
		  $session = $nsisweb->get_session();
		  $user_id = $session->user_id;
		  $result  = $nsisweb->query("insert into nsisweb_files set filename='$filename', type='$mime_type', size='$size', userid='$user_id';");
		  return ($result != FALSE);
	  } else {
		  $nsisweb->record_error("File '$filename' already exists");
	  }
	  return FALSE;
  }
  function remove_file($filename)
  {
	  global $nsisweb;
	  $store_folder = $nsisweb->fileroot.'/uploads';
	  $sqlfilename  = mysql_escape_string($filename);
	  
	  $result = $nsisweb->query("delete from nsisweb_files where filename='$sqlfilename'");
	  if($result == TRUE) {
		  $result = $nsisweb->query("select * from nsisweb_files where filename='$sqlfilename'");
		  if($result == TRUE && $nsisweb->how_many_results($result) > 0) {
			  $nsisweb->record_error( "File '$sqlfilename' could not be removed from the database");
		  } else {
			  @unlink($store_folder.'/'.$filename);
			  return TRUE;
		  }
	  }
	  return FALSE;
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
						$nsisweb->record_error("upload failure: file is not an uploaded file");
						$_FILES[$form_field_name]['error'] = 4;
					}
				} else {
					$nsisweb->record_error("upload failure: file has error code [ $error ]");
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
						$nsisweb->record_error("upload failure: file is not an uploaded file");
						$_FILES[$form_field_name]['error'][$i] = 4;
					}
				} else {
					$nsisweb->record_error("upload failure: file has error code [ $error ]");
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
							$nsisweb->record_error('upload failure: add_file() failed');
							unlink($uploaded_name);
						}
					} else {
						$nsisweb->record_error("upload failure: file could not be moved to $uploaded_name");
					}
				}
			} else {
				$uploaded_name = $store_folder.'/'.$_FILES[$form_field_name]['name'];
				if(@move_uploaded_file($_FILES[$form_field_name]['tmp_name'],$uploaded_name)) {
					if($this->add_file($_FILES[$form_field_name]['name'],
						$_FILES[$form_field_name]['type'])) {
						$stored_files++;
					} else {
						$nsisweb->record_error('upload failure: add_file() failed');
						unlink($uploaded_name);
					}
				} else {
					$nsisweb->record_error("upload failure: file could not be moved to $uploaded_name");
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
     entries in the database that correspond to missing files. */
  function sync()
  {
	  global $nsisweb;
	  $store_folder = $nsisweb->fileroot.'/uploads';
	  if($dir = @opendir($store_folder)) {
		  while($file = readdir($dir)) {
			  if($file == "." or $file == "..") continue;
			  if(!$this->exists_file($file)) {
				  $this->add_file($file,'application/octet-stream');
			  }
		  }
	  }
  }
  function get_file_url($filename)
  {
	  global $nsisweb;
	  if($this->exists_file($filename)) {
	  	return $nsisweb->get_base_url().'/uploads/'.$filename;
  	}
  	return FALSE;
  }
  function get_file_path($filename)
  {
	  global $nsisweb;
	  if($this->exists_file($filename)) {
	  	return $nsisweb->fileroot.'/uploads/'.$filename;
  	}
  	return FALSE;
  }
};
?>