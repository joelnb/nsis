<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");

$username      = "";
$bgc_username  = "";
$bgc_password  = "";
$bgc_password2 = "";
unset($error_msg);

if(strcmp($_POST['action'],'createaccount') == 0) {
  $username = $_POST['username'];
  $password = $_POST['password'];
  $error_bg = "acolore";
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
        $nsisweb->start_page('Create Account',FALSE);
        print '<span class="atitle">Create Account</span>';
        print '<p><b>Congratulations!</b> Your user account has been created and you have been logged in!</p>';
        print '<p class="asubtitle">';
        print '<a href="'.$nsisweb->get_home_url().'">Continue ></a>';
        print '</p>';
        exit;
      }
    }
  }
}
$nsisweb->start_page('Create Account',FALSE);
?>
<span class="atitle">Create Account</span>
<p>This page allows you to create a NSIS Archive user account which can then be used to contribute pages.</p>
<form name="createaccountform" method="post" enctype="multipart/form-data" action="createaccount.php" onkeydown="if (event.keyCode == 13) {document.createaccountform.submit()}">
  <input type="hidden" name="action" value="createaccount">
  <p align=center>
    <? if(isset($error_msg)) { ?>
    <p class="aboxnote"><?= $error_msg ?></p>
    <? } ?>
    <table>
      <tr><td>Please choose a user name:</td></tr>
      <tr><td><input type="text" class="<?= $bgc_username ?>" name="username" size="25" maxlength="255" value="<?= $username ?>"></td></tr>
      <tr><td>Please choose a password:<br></td></tr>
      <tr><td><input type="password" class="<?= $bgc_password ?>" name="password" size="25" maxlength="255"></td></tr>
      <tr><td>Confirm your password:<br></td></tr>
      <tr><td><input type="password" class="<?= $bgc_password ?>" name="password2" size="25" maxlength="255"></td></tr>
    </table>
  </p>
  <p class="asubtitle"><a href="javascript:document.createaccountform.submit();">Continue ></a></p>
</form>
<?
$nsisweb->end_page();
?>