<?
  include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
  include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
  
  if(isset($_GET['page']) && strlen($_GET['page']) >= 0) {
    $instanceid = $_GET['page'];
    unset($_GET['page']);
    $nsisweb->redirect($instanceid);
  }

  unset($_GET['page']);
  $nsisweb->start_page('Home');
  
  $okay_count = 0;
  
  $result = $nsisweb->query("select count(*) from nsisweb_users");
  if($result && $nsisweb->how_many_results($result) == 1) {
    $record = $nsisweb->get_result_array($result);
    $count  = $record['count(*)'];
    $users_text = $count.' registered '.($count == 1 ? "user" : "users");
    $okay_count++;
  }
  
  $result = $nsisweb->query("select count(*) from nsisweb_hierarchy as a,nsisweb_pages as b where a.pageid=b.pageid and b.type=".PAGETYPE_TEMPLATED);
  if($result && $nsisweb->how_many_results($result) == 1) {
    $record = $nsisweb->get_result_array($result);
    $count  = $record['count(*)'];
    $pages_text = $count.' '.($count == 1 ? "page" : "pages");
    $okay_count++;
  }
?>
<span style="font-family: verdana; font-size: 20pt; color: #000000;">Archive Home</span>
<p>Welcome to the NSIS Archives, a repository of NSIS related information and downloads maintained by
NSIS users for NSIS users.
<? if($okay_count == 2) { ?>
The Archive currently contains <?= $pages_text ?> and has <?= $users_text ?>.
<? } ?>
</p>
<ul>
  <li><b><a href="<?= $nsisweb->get_page_url('welcome') ?>">Welcome</a></b>
    <p>General information about the NSIS Archive</p>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('contribute') ?>">Contribute</a></b>
    <p>Help the archive grow by uploading your stuff to the archive</p>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('browse') ?>">Browse</a></b>
    <p>Dive right in and start browsing the archive for goodies!</p>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('download') ?>">Download</a></b>
    <p>Skip the information and head straight for the downloads</p>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('newest') ?>">Latest Additions/Changes</a></b>
    <p>See the latest additions and modifications</p>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('popular') ?>">Most Popular</a></b>
    <p>See which pages are visited most and which files are downloaded most frequently</p>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('search') ?>">Search</a></b>
    <p>Need to find something or can't remember where you saw something before? Try this...</p>
  </li>
<?
$session = $nsisweb->get_session();
if ($session->is_anonymous()) {
  $url = $nsisweb->get_page_url('createaccount');
  print <<<ENDOFHTML
    <li><b><a href="$url">Your Account</a></b>
      <p>Get your free account with us and get the credit for your contributions</p>
    </li>
ENDOFHTML;
}
?>
</ul>
<?
$nsisweb->end_page();
?>
