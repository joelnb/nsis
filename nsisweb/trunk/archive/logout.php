<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");
end_session();
$nsisweb->redirect('nsisweb');
exit;
?>