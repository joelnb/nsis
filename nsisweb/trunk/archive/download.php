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
	    print "<p>Admin, FYI here's the details of the download that could not be found:-<pre>";
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
<span class="atitle">Download</span>
<p>The following table lists files that are available for download from this website, and the name of the
user that contributed the file to the archive.</p>
<br>
<center>
  <table cellpadding="2" cellspacing="0">
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
        $bgcolour = 'acolor1';
      } else {
        $i = 0;
        $bgcolour = 'acolor2';
      }

      ?>
        <tr class="<?= $bgcolour ?>">
          <td><a href="<?= $grab_link ?>"><img src="<?= $file->get_image_url() ?>" border="0"> <?= $file->get_filename() ?></a> (<?= $size ?>)</td>
          <td><?= $downloads ?></td>
          <td>Uploaded by <a href="profile.php?userid=<?= $user->user_id ?>"><?= $username ?></a></td>
        </tr>
        <tr>
          <td colspan="3"><?= $about ?></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
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