<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

if(isset($_GET['pageid']) && isset($_GET['script'])) {
  $page = find_pageid($_GET['pageid']);
  if($page) {
    $script = (int)$_GET['script'];
    $array_contenido = explode("[source]",$page->get_content());
    $count = count($array_contenido);
    for($i = 1;$i < $count;$i++){
      $array_contents = explode("[/source]",$array_contenido[$i]);
      if($i == $script) {
        header("Content-type: text/plain");
        header('Content-Disposition: attachment; filename="'.preg_replace("/[\?\"]+/","",$page->get_title()).' part '.$script.'.nsi"');
        print $array_contents[0];
        exit;
      }
    }
  }
}
?>