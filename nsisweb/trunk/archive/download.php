<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

if(isset($_GET['file'])) {
  $file = find_file($_GET['file']);
  if($file) {
    $file->download();
    print "<pre>";
    print_r($file);
    print "path: ".$file->get_path()."\n";
    print "</pre>";
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
  <table width="90%" cellpadding="2" cellspacing="0" border="0">
    <tr style="background-color:#ddffdd;color:black;font-family:verdana;font-size:10pt;">
      <th style="background-color:transparent;" align="left">&nbsp;</th>
      <th align="left"><b>&nbsp;File&nbsp;</b></th>
      <th align="left"><b>&nbsp;Size&nbsp;</b></th>
      <th align="left"><b>&nbsp;Contributor&nbsp;</b></th>
    </tr>
<?
$result = $nsisweb->query("select * from nsisweb_files");
if($result) {
  if($nsisweb->how_many_results($result) > 0) {
    $i = 0;
    while(is_array($record = $nsisweb->get_result_array($result))) {
      $file      = new NsisWebFile($record);
      $user      = find_userid($file->get_contributor());
      $grab_link = 'download.php?file='.urlencode($file->get_filename());
      $size      = sprintf("%d Kb",$file->get_size()/1024.0);
      $username  = $user->username;
      
      if($user->is_anonymous()) $username = 'Anonymous';

      if($i == 0) {
        $i = 1;
        $bgcolour = '#eeeeee';
      } else {
        $i = 0;
        $bgcolour = '#ddddff';
      }

      ?>
        <tr style="background-color:$bgcolour;">
          <td align="right" valign="middle" style="font-family:tahoma;font-size:8pt;background-color:transparent;">
            <a style="color:black;text-decoration:underline;" href="<?= $grab_link ?>"><img src="<?= $file->get_image_url() ?>" border="0"></a> &nbsp;
          </td>
          <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
            &nbsp;<?= $file->get_filename() ?>&nbsp;
          </td>
          <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
            &nbsp;<?= $size ?>&nbsp;
          </td>
          <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
            &nbsp;<?= $username ?>&nbsp;
          </td>
        </tr>
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