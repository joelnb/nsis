<?
/* This is a template file, it is invoked prior to dumping out page content.
   It should be used to create title banners and to position/surround/etc the
   page content to come.
   
   Defined already are:
     + $nsisweb
     + $page_info
     + $title
*/
$login_url_ext = '';
if((isset($page_info) || isset($_GET['page']) || isset($_GET['pageid'])) && isset($_GET['parentid'])) {
  unset($our_pageid);
  unset($our_parentid);
  if(isset($page_info)) {
    $our_pageid   = (int)$page_info['pageid'];
    $our_parentid = (int)$page_info['parentid'];
  } else {
    $our_parentid = (int)$_GET['parentid'];
    if(isset($_GET['pageid'])) {
      $our_pageid = (int)$_GET['pageid'];
    } else {
      $page = find_pageid($_GET['page']);
      if(isset($page['pageid'])) {
        $our_pageid = $page['pageid'];
      }
    }
  }
  if(isset($our_pageid) && isset($our_parentid)) {
    $login_url_ext = '&pageid='.$our_pageid.'&parentid='.$our_parentid;
  }
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
		<title>Nullsoft (SuperPiMP|Scriptable) Install System // NSIS Archive Site</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="Stylesheet" type="text/css" href="/include/style.css">
		<link rel="SHORTCUT ICON" href="/favicon.ico">
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
            [ <a href="<?= $picklist_url ?>">Pick List</a> ] [ <a href="<?= $home_url ?>">Home</a> ]
          </td>
				</tr>
			</table>
			<table width="750" cellpadding="0" cellspacing="0" class="maintable"> 
				<tr>
					<td> 
						<table width="720" border="0" cellpadding="0" cellspacing="0" class="innertable" style="background-image:none;"> 
							<tr class="header"> 
								<td width="70"><a href="/index.php"><div class="center"><img  border="0" src="/images/logo.gif" width="48" height="48"></div></a></td> 
								<td width="650"><div class="header">Nullsoft (SuperPiMP|Scriptable) Install System<br><font style="font-size:8pt;"><?= $page_browsing_depth ?></font></div></td> 
							</tr> 
							<tr> 
								<td colspan="2">
									<div class="margin"> 
<!-- header.skel.php: end -->
