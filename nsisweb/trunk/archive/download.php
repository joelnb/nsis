<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

if(isset($_GET['file'])) {
  $file = find_file($_GET['file']);
  if($file) {
    $file->download();
		$nsisweb->start_page('Download',FALSE);
		$session = $nsisweb->get_session();
		$user    = find_userid($session->user_id);
    print "<p><b><font color=\"red\">Error</font></b>: The file you requested could not be found!</p>";
		if($user->is_admin()) {
	    print "<p><pre>";
	    print_r($file);
	    print "path: ".$file->get_path()."\n";
	    print "</pre></p>";
    }
		$nsisweb->end_page();
    exit;
  }
}

$nsisweb->start_page('Download Files');
?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Download</span>
<p>The following table lists files that are available for download from this website, and the name of the
user that contributed the file to the archive.</p>
<br>
<center>
  <table style="border-style:none;font-size:10pt;" cellpadding="2" cellspacing="0">
    <tr style="background-color:#ffaa00;font-size:12pt;"><td colspan="3"><b>Downloads are currently down. Normal service <i>should</i> be resumed by 18:00 GMT 07/05/2003.</b></td></tr>
<?
$result = $nsisweb->query("select * from nsisweb_files",__FILE__,__LINE__);
if($result) {
  if($nsisweb->how_many_results($result) > 0) {
    $i = 0;
    while(is_array($record = $nsisweb->get_result_array($result))) {
      $file      = new NsisWebFile($record);
      $user      = find_userid($file->get_contributor());
      $grab_link = 'download.php?file='.urlencode($file->get_filename());
      $size      = sprintf("%d Kb",$file->get_size()/1024.0);
      $username  = $user->username;
      $downloads = 'Download Count: '.$record['downloads'];
      $about     = $record['about'];
      if($about == '') $about = 'No description has been provided for this file.';
      
      if($user->is_anonymous()) $username = 'Anonymous';

      if($i == 0) {
        $i = 1;
        $bgcolour = '#eeffee';
      } else {
        $i = 0;
        $bgcolour = '#eeeeee';
      }

      ?>
        <tr style="background-color:<?= $bgcolour ?>;">
          <td style="text-align:center;border:solid 1px #aaaaaa;padding:4px;border-bottom:none;"><a href="<?= $grab_link ?>"><img style="vertical-align:middle;" src="<?= $file->get_image_url() ?>" border="0"> <?= $file->get_filename() ?></a> (<?= $size ?>)</td>
          <td style="text-align:center;border:solid 1px #aaaaaa;padding:4px;border-bottom:none;border-left:none;"><?= $downloads ?></td>
          <td style="text-align:center;border:solid 1px #aaaaaa;padding:4px;border-bottom:none;border-left:none;">Uploaded by <a href="profile.php?userid=<?= $user->user_id ?>"><?= $username ?></a></td>
        </tr>
        <tr style="text-align:justify;background-color:#ffffff;border-style:none;">
          <td colspan="3" style="border:solid 1px #aaaaaa;padding:10px;"><?= $about ?></td>
        </tr>
        <tr style="background-color:#ffffff;height:20pt;"><td></td></tr>
      <?
    }
  }
}
?>
  </table>
</center>
<?
$nsisweb->end_page();
?>