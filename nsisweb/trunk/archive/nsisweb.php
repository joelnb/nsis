<?
  include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
	include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
  
  if(isset($_GET['page']) && strlen($_GET['page']) > 0) {
	  $page = $_GET['page'];
	  unset($_GET['page']);
  	$nsisweb->redirect($page);
  } else if(isset($_GET['action'])) {
		if(strcmp($_GET['action'],'delete') == 0) {
			delete_page($_GET['pageid']);
		}
	}

  unset($_GET['page']);
  $nsisweb->start_page('Home');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Archive Home</font>
<p>Welcome to the NSIS Archives, a repository of NSIS related information and downloads maintained by
NSIS users for NSIS users.</p>
<ul>
  <li><b><a href="<?= $nsisweb->get_page_url('welcome') ?>">Welcome</a></b>
  	<ul>General information about the NSIS Archive</ul>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('contribute') ?>">Contribute</a></b>
  	<ul>Help the archive grow by uploading your stuff to the archive</ul>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('browse') ?>">Browse</a></b>
    <ul>Dive right in and start browsing the archive for goodies!</ul>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('download') ?>">Download</a></b>
    <ul>Skip the information and head straight for the downloads</ul>
  </li>
  <li><b><a href="<?= $nsisweb->get_page_url('popular') ?>">Most Popular</a></b>
    <ul>See which pages are visited most and which files are downloaded most frequently</ul>
  </li>
<?
if ($nsisweb->get_session()->is_anonymous()) {
  <li><b><a href="<?= $nsisweb->get_page_url('createaccount') ?>">Your Account</a></b>
    <ul>Get your free account with us and get the credit for your contributions</ul>
  </li>
<?
}
  
$nsisweb->end_page(); ?>