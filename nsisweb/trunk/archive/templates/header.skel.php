<?
/* This is a template file, it is invoked prior to dumping out page content.
   It should be used to create title banners and to position/surround/etc the
   page content to come.
   
   Defined already are:
     + $nsisweb
     + $page_info
     + $title
*/
global $instance;
$login_url_ext = '';
if(isset($instance) && strcmp(get_class($instance),'nsiswebinstance') == 0) {
  $login_url_ext = '?page='.$instance->get_instanceid();
}

$page_browsing_depth = "You are viewing archive page <b>$title</b>";
$home_url            = $nsisweb->get_home_url();
$picklist_url        = 'picklist.php';
$logged_in_text      = '<i>not logged in</i> ( <a style="color:#0000ff;text-decoration:underline;" href="login.php'.$login_url_ext.'">login</a> )';

$session = $nsisweb->get_session();

if(!$session->is_anonymous()) {
  $logged_in_text = $session->get_username().' ( <a style="color:#0000ff;text-decoration:underline;" href="logout.php'.$login_url_ext.'">logout</a> )';
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- header.skel.php: begin -->
<html>
  <head>
    <title>NSIS Archive</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="Stylesheet" type="text/css" href="/include/style.css">
    <link rel="SHORTCUT ICON" href="/favicon.ico">
    <? if(!$robots_allowed) { ?>
    <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
    <? } ?>
  </head>
<body>
  <div class="center">
    <table width="750" cellpadding="0" cellspacing="0" border="0" style="background-color:#F0F0F0">
      <tr>
        <td align="left" style="font-size:8pt;padding-bottom:2px;"><b>Logged in as:</b> <?= $logged_in_text ?></td>
        <td align="right" style="font-size:8pt;padding-bottom:2px;">
          <?
          if(!$session->is_anonymous()) {
            if($session->looks_like_admin()) {
              echo '[ <a href="admin.php">Admin</a> ] ';
            }
            echo '[ <a href="prefs.php">Preferences</a> ] ';
          }
          ?>
          [ <a href="<?= $picklist_url ?>">Pick List</a> ] [ <a href="search.php">Search</a> ] [ <a href="<?= $home_url ?>">Home</a> ]
        </td>
      </tr>
    </table>
    <table width="750" cellpadding="0" cellspacing="0" class="maintable"> 
      <tr>
        <td>
          <table width="720" border="0" cellpadding="0" cellspacing="0" class="innertable" style="background-image:none;">
            <tr class="header"> 
              <td><a href="http://nsis.sourceforge.net/index.php"><img class="centerimage" src="http://nsis.sourceforge.net/images/logo.gif" width="48" height="48" alt="" /></a></td> 
              <td><div class="header">NSIS Archive<br><span style="font-size:8pt;"><?= $page_browsing_depth ?></span></div></td>
            </tr>
            <tr>
              <td colspan="2">
                <p style="font-size:8pt;color:#FF0000;text-align:center;">Please note that the archive is still under development. If you have any suggestions, find any bugs,
                or have problems working with the archive come chat with us at <a href="irc://irc.landoleet.org/nsis">#nsis @ irc.landoleet.org</a> or send
                a PM to <a href="http://forums.winamp.com/private.php?s=&action=newmessage&userid=19620">KiCHiK</a> or
                <a href="http://forums.winamp.com/private.php?s=&action=newmessage&userid=70214">Sunjammer</a></p>
              </td>
            </tr> 
            <tr>
              <td colspan="2">
                <div class="margin"> 
<!-- header.skel.php: end -->