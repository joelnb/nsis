<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page('Latest Additions/Changes');
?>
<span class="atitle">Latest Additions/Changes</span>
<p>The 25 most recently added/updated pages (excluding directory pages) are:</p>
<br>
<center>
  <table width="90%" cellpadding="2" cellspacing="0" border="0">
    <tr class="aboxheader">
      <td width="450"><b>&nbsp;Page Title&nbsp;</b></td>
      <td><b>&nbsp;Added / Changed&nbsp;</b></td>
    </tr>
<?
$result = $nsisweb->query('select type,title,pageid,UNIX_TIMESTAMP(created) as created,UNIX_TIMESTAMP(last_updated) as last_updated,last_author from nsisweb_pages as p where type<>'.PAGETYPE_DIRECTORY.' order by greatest(created,last_updated) desc limit 25',__FILE__,__LINE__);
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

    $units = 'second';
    if ($diff >= 60) {
      $diff = (int)($diff / 60);
      $units = 'minute';
      if ($diff >= 60) {
        $diff = (int)($diff / 60);
        $units = 'hour';
        if ($diff >= 24) {
          $diff = (int)($diff / 24);
          $units = 'day';
          if ($diff >= 365) {
            $diff = (int)($diff / 365);
            $units = 'year';
          }
          else if ($diff >= 30) {
            $diff = (int)($diff / 30);
            $units = 'month';
          }
        }
      }
    }
    
    $action = ($new ? 'added' : 'changed')." $diff $units".($diff > 1 ? "s" : "")." ago by <a href='profile.php?userid=".$userid."'>".$username."</a>";

      if($i == 0) {
        $i = 1;
        $bgcolour = 'acolor1';
      } else {
        $i = 0;
        $bgcolour = 'acolor2';
      }

    print <<<ENDOFHTML
    <tr class="$bgcolour">
      <td width="450">
        &nbsp;$title&nbsp;
      </td>
      <td>
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