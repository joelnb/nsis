<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebsession.pkg.php");
end_session();
if(isset($_GET['page'])) {
  header("Location: ".$nsisweb->get_page_url($_GET['page']));
} else {
  header("Location: ".$nsisweb->get_home_url());
}
exit;
?>