<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");

$login_failed = FALSE;

$username = $_POST['username'];
$password = $_POST['password'];
unset($_POST['username']);
unset($_POST['password']);

if(strlen($username)>0 && strlen($password)>0) {
  $session = login($username,$password);
  if($session->is_anonymous()) {
    $login_failed = TRUE;
  } else {
    if(isset($_POST['page'])) {
      header("Location: ".$nsisweb->get_page_url($_POST['page']));
    } else {
      header("Location: ".$nsisweb->get_base_url().'/prefs.php?action=loggedin');
    }
  }
}
unset($username);
unset($password);

$create_url = $nsisweb->get_page_url('createaccount');
$nsisweb->start_page('Login',FALSE);
?>
<span class="atitle">Login</span>
<p>This page allows you to login to the <b>Archive</b> using your user account.
You only need an account if you want to make contributions.
If you do not have a user account you can <a href="<?= $create_url ?>">create a a free account</a> now.</p>
<?
if($login_failed) {
  print '<p><b><span color="red">You could not be logged in, please try again.</span></b></p>';
}
?>
<form name="loginform" method="post" enctype="multipart/form-data" action="login.php" onkeydown="if (event.keyCode == 13) {document.loginform.submit()}">
  <? if(isset($_GET['page'])) { ?>
    <input type="hidden" name="page" value="<?= $_GET['page'] ?>">
  <? } ?>
  <p align="center">
  Username: <input type="text" name="username" size="25" maxlength="255"><br>
  <br>
  Password: <input type="password" name="password" size="25" maxlength="255"><br>
  </p>
  <p class="asubtitle"><a href="javascript:document.loginform.submit();">Login ></a></p>
</form>
<?
$nsisweb->end_page();
?>