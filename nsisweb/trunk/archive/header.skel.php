<?
/* This is a template file, it is invoked prior to dumping out page content.
   It should be used to create title banners and to position/surround/etc the
   page content to come.
   
   Defined already are:
     + $nsisweb
     + $page_info (array)
     + $title
*/
$page_browsing_depth = "You are viewing archive page <b>$title</b>";
$home_url            = $nsisweb->get_home_url();
$logged_in_text      = '<i>not logged in</i> ( <a style="color:#0000ff;text-decoration:underline;" href="'.$nsisweb->get_page_url('login').'">login</a> )';

$session = $nsisweb->get_session();

if(!$session->is_anonymous()) {
	$logged_in_text = $session->get_username().' ( <a style="color:#0000ff;text-decoration:underline;" href="'.$nsisweb->get_page_url('logout').'">logout</a> )';
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
	<head>
		<title>Nullsoft (SuperPiMP|Scriptable) Install System // NSIS Archive Site</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="Stylesheet" type="text/css" href="http://nsis.sourceforge.net/include/style.css">
		<link rel="SHORTCUT ICON" href="/favicon.ico">
	</head> 
	<body> 
		<div class="center">
			<table width="750" cellpadding="0" cellspacing="0" border="0" style="background-color:#F0F0F0">
				<tr>
				  <td align="left" style="font-size:8pt;padding-bottom:2px;"><b>Logged in as:</b> <?= $logged_in_text ?></td>
				  <td align="right" style="font-size:8pt;padding-bottom:2px;">[ <a href="<?= $home_url ?>">Home</a> ]</td>
				</tr>
			</table>
			<table width="750" cellpadding="0" cellspacing="0" class="maintable"> 
				<tr>
					<td> 
						<table width="720" border="0" cellpadding="0" cellspacing="0" class="innertable" style="background-image:none;"> 
							<tr class="header"> 
								<td width="70"><a href="http://nsis.sourceforge.net/index.php"><div class="center"><img  border="0" src="http://nsis.sourceforge.net/images/logo.gif" width="48" height="48"></div></a></td> 
								<td width="650"><div class="header">Nullsoft (SuperPiMP|Scriptable) Install System<br><font style="font-size:8pt;"><?= $page_browsing_depth ?></font></div></td> 
							</tr> 
							<tr> 
								<td colspan="2">
									<div class="margin"> 

