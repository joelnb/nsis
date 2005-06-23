<?
if(isset($_GET['file'])) {
  header('Location: /wiki/File:'.$_GET['file']);
} else {
  header('Location: /wiki/Special:Imagelist');
}
?>