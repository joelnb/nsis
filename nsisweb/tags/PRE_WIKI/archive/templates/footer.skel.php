<?
/* This is a template file, it is invoked prior to dumping out page content.
   It should be used to create title banners and to position/surround/etc the
   page content to come.
   
   Defined already are:
     + $nsisweb
     + $page_info (array)
     + $title
*/

/* Change this to TRUE to see the queries exected, never set it to true on the
   release site though because this sensitive data, debug purposes only! */
$query_count = count($nsisweb->executed_queries);
?>
<!-- footer.skel.php: begin -->
    </td>
  </tr>
  <tr>
    <td colspan="2" height="40" class="alogo">
      <a href="http://sourceforge.net"><img src="http://sourceforge.net/sflogo.php?group_id=22049&amp;type=1" alt="SourceForge Logo" border="0"></a>
    </td>
  </tr> 
</table>
<?
/*

  <p>Page generated in <?= number_format($nsisweb->get_gen_time(),3) ?> seconds (<?= $query_count.' '.($query_count == 1 ? "query" : "queries") ?>).</p>
  <?
  $session = $nsisweb->get_session();
  $user    = $session->get_user();
  if($user->get_flags() & USERFLAG_SHOWQUERIES) {
    print "<b>Executed Queries:</b><ol>\n";
    foreach($nsisweb->executed_queries as $query) {
      print "<li>".htmlentities($query)."</li>\n";
    }
    print "</ol>";
    if (count($nsisweb->errors)) {
      print "<b>Errors:</b><ol>\n";
      foreach($nsisweb->errors as $error) {
        print "<li>".htmlentities($error)."</li>\n";
      }
      print "</ol>";
    }
  }
?>

*/
?>
</body> 
</html>
<!-- footer.skel.php: end -->
