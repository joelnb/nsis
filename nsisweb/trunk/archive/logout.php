<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");
end_session();
if(isset($_GET['page'])) {
  $nsisweb->redirect($_GET['page']);
} else {
  $nsisweb->redirect($nsisweb->get_home_url());
}
exit;
?>