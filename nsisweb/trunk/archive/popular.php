<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebstorage.pkg.php");
$nsisweb->start_page('Most Popular');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Most Popular</font>
<p>The most viewed pages are:</p>
<br>
<center>
  <table width="90%" cellpadding="2" cellspacing="0" border="0">
    <tr style="background-color:#ddffdd;color:black;font-family:verdana;font-size:10pt;">
      <th align="left"><b>&nbsp;Rank&nbsp;</b></th>
      <th align="left"><b>&nbsp;Page Title&nbsp;</b></th>
      <th align="center"><b>&nbsp;Views&nbsp;</b></th>
    </tr>
<?
$result = $nsisweb->query("select title,views from nsisweb_pages where views>0 order by views desc");
if($result) {
  $rank = $nsisweb->how_many_results($result);
	if($rank > 0) {
		$i = 0;
		while(is_array($record = $nsisweb->get_result_array($result))) {
			$title = $record['title'];
      $views = (int)$record['views'];
			
			if($i == 0) {
				$i = 1;
				$bgcolour = '#eeeeee';
			} else {
				$i = 0;
				$bgcolour = '#ddddff';
			}
			
			print <<<ENDOFHTML
			<tr style="background-color:$bgcolour;">
			  <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
			    &nbsp;$rank&nbsp;
			  </td>
			  <td align="left" valign="middle" style="font-family:verdana;font-size:10pt;">
			    &nbsp;$title&nbsp;
			  </td>
			  <td align="center" valign="middle" style="font-family:verdana;font-size:10pt;">
			    &nbsp;$views&nbsp;
			  </td>
			</tr>
ENDOFHTML;
    $rank--;
		}
	}
}
?>
  </table>
</center>
<?
$nsisweb->end_page();
?>