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
		$nsisweb->start_page('Login');
		print '<font style="font-family: verdana; font-size: 20pt; color: #000000;">Login</font>';
		print '<p><b>Congratulations!</b> You have been successfully logged in.</p>';
		print '<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">';
    if(isset($_POST['pageid'])) {
		  print '<a href="'.$nsisweb->get_page_url($_POST['pageid']).'&pageid='.$_POST['pageid'].'&parentid='.$_POST['parentid'].'">Continue >></a>';
    } else {
		  print '<a href="'.$nsisweb->get_home_url().'">Go To Archive Home >></a>';
    }
		print '</p>';
		$nsisweb->end_page();
		unset($username);
		unset($password);
		exit;
	}
}
unset($username);
unset($password);

$create_url = $nsisweb->get_page_url('createaccount');
$nsisweb->start_page('Login');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Login</font>
<p>This page allows you to login to the <b>Archive</b> using your user account. If you do not have a user account you can
<a href="$create_url">create a a free account</a> now.</p>
<?
if($login_failed) {
	print '<p><b><font color="red">You could not be logged in, please try again.</font></b></p>';
}
?>
<form name="wizard" method="post" enctype="multipart/form-data" action="login.php">
  <? if(isset($_GET['pageid'])) { ?>
    <input type="hidden" name="pageid" value="<?= $_GET['pageid'] ?>">
  <? } ?>
  <input type="hidden" name="parentid" value="<?= $_GET['parentid'] ?>">
  <p align="center">
  Username: <input type="text" style="font-family:courier new;font-size:10pt;" name="username" size="25" maxlength="255"><br>
  <br>
  Password: <input type="password" style="font-family:courier new;font-size:10pt;" name="password" size="25" maxlength="255"><br>
  </p>
  <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
    <input type="submit" style="color:white;background-color:white;border-style:none">
    <a href="javascript:document.wizard.submit();">Login >></a>
  </p>
</form>
<?
$nsisweb->end_page();
?>