<?
include_once("$DOCUMENT_ROOT/engine/nsisweb.pkg.php");
include_once("$DOCUMENT_ROOT/engine/nsiswebsession.pkg.php");
end_session();
$nsisweb->redirect('nsisweb');
exit;
?>