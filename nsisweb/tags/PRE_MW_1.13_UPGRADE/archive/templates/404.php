<?
include_once(dirname(__FILE__)."/../engine/nsisweb.pkg.php");
$nsisweb->start_page('Page Not Found');
?>
  <table width="75%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td>
        <img border="0" align="top" src="<?= $nsisweb->get_base_url().'/images/exclamation.bmp' ?>">
      </td>
      <td>
        The page you were looking for, is not currently available, or you may have
        mis-typed the address. Please check and try again.<br>
        <br>
        Requested Page: <?= $_GET['page'] ?><br>
      </td>
    </tr>
  </table>
<? $nsisweb->end_page(); ?>