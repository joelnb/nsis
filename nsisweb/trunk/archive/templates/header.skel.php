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

$home_url            = $nsisweb->get_home_url();
$picklist_url        = 'picklist.php';
$logged_in_text      = '<i>not logged in</i> ( <a href="login.php'.$login_url_ext.'">login</a> )';

$session = $nsisweb->get_session();

if(!$session->is_anonymous()) {
  $logged_in_text = $session->get_username().' ( <a href="logout.php'.$login_url_ext.'">logout</a> )';
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- header.skel.php: begin -->
<html>

<head>

<script language="javascript" src="../site/media/template/nsis.js"></script>
<title>NSIS Archive</title>

    <? if(!$robots_allowed) { ?>
    <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
    <? } ?>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../site/media/template/nsis.css" type="text/css">

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="init()">

<!-- ###DOCUMENT_BODY### start-->

<table width="778" height="100%" class="maintable" cellspacing="0" cellpadding="0" align="center">

<div class="abar">
  <div class="auser">
  <strong>Logged in as:</strong> <?= $logged_in_text ?>
  </div>
  <div class="alinks">
 <?
          if(!$session->is_anonymous()) {
            if($session->looks_like_admin()) {
              echo '[ <a href="admin.php">Admin</a> ] ';
            }
            echo '[ <a href="prefs.php">Preferences</a> ] ';
          }
          ?>
          [ <a href="<?= $picklist_url ?>">Pick List</a> ] [ <a href="search.php">Search</a> ] [ <a href="../index.php">NSIS Site</a> ] [ <a href="<?= $home_url ?>">Home</a> ]
  </div>
</div>

  <tr>
    <td width="150" height="100"><img src="../site/media/template/left.jpg" width="150" height="100"></td>
    <td width="628" height="100" class="top"><div class="header">NSIS Archive</div></td>
  </tr>

  <tr>
    <td class="content" id="content" colspan="2">
    <div id="panelmenu">

<!-- header.skel.php: end -->