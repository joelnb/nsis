<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebstorage.pkg.php");
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
      <th style="background-color:transparent;" align="left">&nbsp;</th>
    </tr>
<?
$storage = new NsisWebStorage;
$result  = $storage->get_files();

if($result) {
  if($nsisweb->how_many_results($result) > 0) {
    $i = 0;
    while(is_array($record = $nsisweb->get_result_array($result))) {
      $filename   = $record['filename'];
      $user       = find_userid($record['userid']);
      $username   = $user->username;
      $grab_link  = 'nsiswebdownload.php?file='.urlencode($filename);
      $size       = sprintf("%d Kb",$record['size']/1024.0);

      if($record['userid'] != ANONYMOUS_USER_ID) {
	$username = "<b>$username</b>";
      }

      if($i == 0) {
	$i = 1;
	$bgcolour = '#eeeeee';
      } else {
	$i = 0;
	$bgcolour = '#ddddff';
      }

      if(strstr($record['type'],'image/') || strstr($record['type'],'text/')) {
	$view_link = '<a style="color:black;text-decoration:underline;" href="'.$storage->get_file_url($filename).'">view</a>';
      } else {
	$view_link = '';
      }

      print <<<ENDOFHTML
	<tr style="background-color:$bgcolour;">
	  <td align="right" valign="middle" style="font-family:tahoma;font-size:8pt;background-color:transparent;">
	    <a style="color:black;text-decoration:underline;" href="$grab_link">grab</a> &nbsp;
	  </td>
	  <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
	    &nbsp;$filename&nbsp;
	  </td>
	  <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
	    &nbsp;$size&nbsp;
	  </td>
	  <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
	    &nbsp;$username&nbsp;
	  </td>
	  <td align="left" valign="middle" style="font-family:tahoma;font-size:8pt;background-color:transparent;">
	    &nbsp; $view_link 
	  </td>
	</tr>
ENDOFHTML;
    }
  }
}
?>
  </table>
</center>
<?
$nsisweb->end_page();
?>