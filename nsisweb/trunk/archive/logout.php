<?
include_once('engine/nsisweb.pkg.php');
include_once('engine/nsiswebsession.pkg.php');
end_session();
$nsisweb->redirect('nsisweb');
exit;
?>