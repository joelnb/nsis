<?
/* post_max_size && upload_max_filesize control the total max upload size */
/* file_uploads determines whether or not file uploads are allowed at all */
/* upload_tmp_dir determines where uploaded files are stored */
/* <input type="hidden" name="MAX_FILE_SIZE" value="1000">.. MAX_FILE_SIZE
   is an advisory to the browser in this case but in can be circumvented. */
$upload_error = $php_errormsg;

include_once(dirname(__FILE__)."/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/nsiswebstorage.pkg.php");

$storage = new NsisWebStorage;
$result = $storage->process_uploaded_files('nsiswebfile');

if($result == 2) {
if(strlen($_POST['returnurl']) > 0) {
header("Location: ".$_POST['returnurl']);
exit;
} else {
$nsisweb->start_page('Upload');
print "Upload complete.<br>";
}
} else {
$nsisweb->start_page('Upload');
if($result == 1) {
print "Some files could not be uploaded.";
} else {
print "None of the files could be uploaded.";
}
if(strlen($upload_error) > 0) {
print " The webserver reported an error: $upload_error<br>";
}
}
?>
