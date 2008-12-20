<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
header('Content-type: application/rss+xml');
print "<?xml version=\"1.0\"?>\n";
?>
<rss version="2.0">
  <channel>
    <title>NSIS Archive</title>
    <link>http://nsis.sourceforge.net/archive/</link>
    <description>Latest changes in the NSIS Archive</description>
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
    $title = $record['title'];
    $link = NSISWEB_WWWROOT.NSISWEB_WWWSUBDIR.'/viewpage.php?pageid='.$record['pageid'];
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
    
    $action = ($new ? 'added' : 'changed')." $diff $units".($diff > 1 ? "s" : "")." ago by ".$username;

    if($i == 0) {
      $i = 1;
      $bgcolour = '#eeeeee';
    } else {
      $i = 0;
      $bgcolour = '#ddddff';
    }

    print <<<ENDOFHTML
    <item>
      <title>$title</title>
      <description>$action</description>
      <link>$link</link>
    </item>

ENDOFHTML;
  }
}
?>
  </channel>
</rss>
