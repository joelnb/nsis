<?
include_once('nsisweb.pkg.php');
include_once('nsiswebsession.pkg.php');
end_session();
$nsisweb->redirect('nsisweb');
exit;
?>