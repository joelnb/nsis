<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");

$bgc_username  = "";
$bgc_password  = "";
$bgc_password2 = "";
unset($error_msg);

if(strcmp($_POST['action'],'createaccount') == 0) {
  $username = $_POST['username'];
  $password = $_POST['password'];
  $error_bg = "background-color:#ffaaaa;";
  $okay     = 0;

  if(strlen($username)<=0) {
    $bgc_username = $error_bg;
  } else {
    $okay++;
  }
  if(strlen($password)<=0 && strlen($password2)<=0) {
    $bgc_password = $error_bg;
  } else {
    $okay++;
  }
  
  if($okay != 2) {
    $error_msg = 'You must fill in all of the fields';
  } else if(strcmp($password,$_POST['password2']) != 0) {
    $error_msg = 'The passwords entered must match';
  } else {
	  if(!add_user($username,$password)) {
      $error_msg = 'Please try another username and/or password';
	  } else {
      $session = login($username,$password);
	
      if($session->is_anonymous()) {
		    $error_msg = 'Please try another username and/or password';
	    } else {
        $nsisweb->start_page('Create Account');
        print '<font style="font-family: verdana; font-size: 20pt; color: #000000;">Create Account</font>';
		    print '<p><b>Congratulations!</b> Your user account has been created and you have been logged in!</p>';
		    print '<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">';
		    print '<a href="'.$nsisweb->get_home_url().'">Continue >></a>';
		    print '</p>';
        exit;
      }
    }
  }
}
$nsisweb->start_page('Create Account');
?>
<font style="font-family: verdana; font-size: 20pt; color: #000000;">Create Account</font>
<p>This page allows you to create a user account on <b>NSISWeb</b> which can then be used to get credit for
your contributions to the site. You also need an account if you want to be an administrator or have any other
kind of special rights.</p>
<form name="wizard" method="post" enctype="multipart/form-data" action="createaccount.php">
  <input type="hidden" name="action" value="createaccount">
  <p align=center>
    <? if(isset($error_msg)) { ?>
    <font style="text-align:center;color:#ff0000;font-weight:bold;"><?= $error_msg ?></font><br><br>
    <? } ?>
    <table>
      <tr><td>Please choose a user name:</td></tr>
      <tr><td><input type="text" style="<?= $bgc_username ?>font-family:courier new;font-size:10pt;" name="username" size="25" maxlength="255" value="<?= $username ?>"></td></tr>
      <tr><td>Please choose a password:<br></td></tr>
      <tr><td><input type="password" style="<?= $bgc_password ?> font-family:courier new;font-size:10pt;" name="password" size="25" maxlength="255"></td></tr>
      <tr><td>Confirm your password:<br></td></tr>
      <tr><td><input type="password" style="<?= $bgc_password ?> font-family:courier new;font-size:10pt;" name="password2" size="25" maxlength="255"></td></tr>
    </table>
  </p>
  <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
    <input type="submit" style="color:white;background-color:white;border-style:none">
    <a href="javascript:wizard.submit();">Continue >></a>
  </p>
</form>
<?
$nsisweb->end_page();
?>