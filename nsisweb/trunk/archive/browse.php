<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebuser.pkg.php");

$nsisweb->start_page('Browse Archive');
$items = find_children(0);
$description =<<<ENDOFHTML
Archive pages can be children of one or more other archive pages thereby forming a hierarchy. The list
of pages you see below are those pages that are at the top of the hierarchy.
ENDOFHTML;

render_directory_page('Browse',SYSTEM_USER_ID,0,$description,0,$items);
$nsisweb->end_page();
?>