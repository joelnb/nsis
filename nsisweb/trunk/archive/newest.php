<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebstorage.pkg.php");
$nsisweb->start_page('Latest Additions/Changes');
?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Latest Additions/Changes</span>
<p>The 25 most recently added/updated pages (excluding directory pages) are:</p>
<br>
<center>
  <table width="90%" cellpadding="2" cellspacing="0" border="0">
    <tr style="background-color:#ddffdd;color:black;font-family:verdana;font-size:10pt;">
      <th align="left"><b>&nbsp;Page Title&nbsp;</b></th>
      <th align="center"><b>&nbsp;Added / Changed&nbsp;</b></th>
    </tr>
<?
$result = $nsisweb->query('select type,title,pageid,UNIX_TIMESTAMP(created) as created,UNIX_TIMESTAMP(last_updated) as last_updated,last_author from nsisweb_pages as p where type<>'.PAGETYPE_DIRECTORY.' order by greatest(created,last_updated) desc limit 25');
echo mysql_error();
if($result) {
  $i = 0;

  while($record = $nsisweb->get_result_array($result)) {
    $rows[] = $record;
  }
	
  $user_map = array(0=>'Anonymous');
  foreach($rows as $record) {
    $userid = $record['last_author'];
    if($userid > 0) {
      if(!is_object($user_map[$userid])) {
	$user = find_userid($userid);
	$user_map[$userid] = $user->username;
      }
    }
    $username = $user_map[$userid];
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
    
    $action = ($new ? 'added' : 'changed')." $diff $units ago by ".$username;

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