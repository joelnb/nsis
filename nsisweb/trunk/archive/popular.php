<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page('Most Popular');
?>
<span class="atitle">Most Popular</span>
<p>The top 25 most popular pages (excluding directory pages) by page views are:</p>
<br>
<center>
  <table width="90%" cellpadding="2" cellspacing="0" border="0">
    <tr class="aboxheader">
      <td><strong>&nbsp;Rank&nbsp;</strong></td>
      <td><strong>&nbsp;Page Title&nbsp;</strong></td>
      <td><strong>&nbsp;Views&nbsp;</strong></td>
    </tr>
<?
$result = $nsisweb->query('select title,views,pageid from nsisweb_pages where views>0 and type<>'.PAGETYPE_DIRECTORY.' order by views desc',__FILE__,__LINE__);
if($result) {
  $count = $nsisweb->how_many_results($result);
  $rank  = 1;
  if($count > 0) {
    $i = 0;
    while($rank <= 25 && is_array($record = $nsisweb->get_result_array($result))) {
      $title = '<a href="viewpage.php?pageid='.$record['pageid'].'" target="_blank">'.$record['title']."</a>\n";
      $views = (int)$record['views'];
      
      if($i == 0) {
        $i = 1;
        $bgcolour = 'acolor1';
      } else {
        $i = 0;
        $bgcolour = 'acolor2';
      }

      print <<<ENDOFHTML
      <tr class="$bgcolour">
        <td>
          &nbsp;$rank&nbsp;
        </td>
        <td>
          &nbsp;$title&nbsp;
        </td>
        <td>
          &nbsp;$views&nbsp;
        </td>
      </tr>
ENDOFHTML;
      $rank++;
    }
  }
}
?>
  </table>
</center>
<?
$nsisweb->end_page();
?>