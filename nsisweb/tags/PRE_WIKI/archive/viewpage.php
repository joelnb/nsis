<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

if($_GET['pageid'] == 0) {
  $nsisweb->redirect(0);
} else if($page = new NsisWebPage($_GET['pageid'],FETCH_CONTENT_PP)) {
  if($page->is_okay()) {
    $instance = new NsisWebInstance($page);
    $instance->show(VIEWMODE_DETACHED);
    exit;
  }
}

$url = $nsisweb->get_base_url().'/templates/404.php?page='.urlencode($_GET['pageid']);
header("Location: $url");
?>