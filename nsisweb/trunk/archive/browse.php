<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebuser.pkg.php");

$nsisweb->start_page('Browse Archive');
$description = 'Archive pages can be children of one or more other archive pages thereby forming a hierarchy. The list of pages you see below are those pages that are at the top of the hierarchy.';
$page = new NsisWebPage(array('type'=>PAGETYPE_DIRECTORY,'flags'=>0,'title'=>'Browse','source'=>$description));
$instance = new NsisWebInstance($page);
$instance->show_inline();
$nsisweb->end_page();
?>