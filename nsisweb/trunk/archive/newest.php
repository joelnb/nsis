<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebstorage.pkg.php");
$nsisweb->start_page('Latest Additions/Changes');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Latest Additions/Changes</font>
<p>The 25 most recently added/updated pages (excluding directory pages) are:</p>
<br>
<center>
  <table width="90%" cellpadding="2" cellspacing="0" border="0">
    <tr style="background-color:#ddffdd;color:black;font-family:verdana;font-size:10pt;">
      <th align="left"><b>&nbsp;Page Title&nbsp;</b></th>
	  <th align="center"><b>&nbsp;Added / Changed&nbsp;</b></th>
    </tr>
<?
$result = $nsisweb->query('select p.type,p.title,p.pageid,UNIX_TIMESTAMP(p.created) as created,UNIX_TIMESTAMP(p.last_updated) as last_updated,p.last_author,u.userid,u.username from nsisweb_pages as p,nsisweb_users as u where p.type<>'.PAGETYPE_DIRECTORY.' and u.userid=p.last_author order by greatest(p.created,p.last_updated) desc limit 25');
echo mysql_error();
if($result) {
	$i = 0;

	while($record = $nsisweb->get_result_array($result)) {
		$title = '<a href="viewpage.php?pageid='.$record['pageid'].'" target="_blank">'.$record['title']."</a>\n";
		$new = $record['last_updated'] == $record['created'];
		$diff = time() - ($new ? $record['created'] : $record['last_updated']);

		$units = 'seconds';
		if ($diff > 60) {
			$diff = (int)($diff / 60);
			$units = 'minutes';
			if ($diff > 60) {
				$diff = (int)($diff / 60);
				$units = 'hours';
				if ($diff > 24) {
					$diff = (int)($diff / 24);
					$units = 'days';
					if ($diff > 365) {
						$diff = (int)($diff / 365);
						$units = 'years';
					}
					else if ($diff > 30) {
						$diff = (int)($diff / 30);
						$units = 'months';
					}
				}
			}
		}
		
		$action = ($new ? 'created' : 'changed')." $diff $units ago by ".$record['username'];

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
			&nbsp;$title&nbsp;
		  </td>
		  <td align="right" valign="middle" style="font-family:verdana;font-size:10pt;">
			&nbsp;$action&nbsp;
		  </td>
		</tr>
ENDOFHTML;
	}
}
?>
  </table>
</center>
<?
$nsisweb->end_page();
?>