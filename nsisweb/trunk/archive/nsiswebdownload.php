<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
if(strlen($_GET['file']) > 0) {
	include_once("engine/nsiswebstorage.pkg.php");

	$storage = new NsisWebStorage;
	$result = $storage->exists_file($_GET['file']);
	if($result) {
		$array = $nsisweb->get_result_array($result);
		header("Content-type: ".$array['type']);
		header("Content-Disposition: attachment; filename=".$array['filename']);
		readfile($storage->get_file_path($array['filename']));
		exit;
	}
}

$nsisweb->start_page('Download Error');
print 'The file you attempted to download ('.$_GET['file'].') does not exist on this server.';
?>