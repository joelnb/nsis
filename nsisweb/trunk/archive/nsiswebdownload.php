<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
if(strlen($_GET['file']) > 0) {
  include_once("engine/nsiswebstorage.pkg.php");

  $storage = new NsisWebStorage;
  $result = $storage->exists_file($_GET['file']);
  if($result) {
    $array = $nsisweb->get_result_array($result);
    $path  = $storage->get_file_path($array['filename']);
    if(@file_exists($path)) {
      header("Content-type: ".$array['type']);
      header("Content-Disposition: attachment; filename=".$array['filename']);
      if(@readfile($path)) {
exit;
      }
    }
    $storage->remove_file($_GET['file']);
  }
}
$nsisweb->start_page('Download');
?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Download: <span color="#ff0000">Error</span></span>
<p>The file you attempted to download (<?= $_GET['file'] ?>) does not exist on this server.</p>
<?
$nsisweb->end_page();
?>