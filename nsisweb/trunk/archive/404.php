<?
include_once("nsisweb.pkg.php");
$nsisweb->start_page('Page Not Found');
?>
<center>
	<table width="75%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td align="left">
	      <img border="0" align="top" src="exclamation.bmp">
	    </td>
	    <td align="left" valign="middle" style="font-size:10pt;margin:12px;">
	      The page you were looking for, is not currently available, or you may have
	      mis-typed the address. Please check and try again.<br>
	      <br>
	      Requested Page: <?= $_GET['page'] ?><br>
	    </td>
	  </tr>
	</table>
</center>
<? $nsisweb->end_page(); ?>