<?
include_once('engine/nsisweb.pkg.php');
$nsisweb->start_page('Create Account');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Create Account</font>
<?
$username = $_POST['username'];
$password = $_POST['password'];
if(strlen($username)>0 && strlen($password)>0) {
	if(!add_user($username,$password)) {
		print '<p><b><font color="red">Error!</font></b> Your user account could not be created. Please try another username and/or password.</p>';
	} else {
		print '<p><b>Congratulations!</b> Your user account has been created, you can now login with your new account.</p>';
		print '<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">';
		print '<a href="'.$nsisweb->get_page_url('login').'">Continue >></a>';
		print '</p>';
	}
	exit;
}

?>
<p>This page allows you to create a user account on <b>NSISWeb</b> which can then be used to get credit for
your contributions to the site. You also need an account if you want to be an administrator or have any other
kind of special rights.</p>
<form name="wizard" method="post" enctype="multipart/form-data" action="createaccount.php">
<p>
Please choose a user name, this can be anything you like:<br>
<input type="text" style="font-family:courier new;font-size:10pt;" name="username" size="25" maxlength="255" value="<?= $username ?>"><br>
<br>
Please choose a password for your account:<br>
<input type="password" style="font-family:courier new;font-size:10pt;" name="password" size="25" maxlength="255"><br>
</p>
<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
  <a href="javascript:wizard.submit();">Continue >></a>
</p>
</form>
<?
$nsisweb->end_page();
?>