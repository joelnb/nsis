<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

if(strlen($_POST['method']) > 0) {
  if(strcmp($_POST['method'],'thiscomp') == 0) {
    end_session();
  } else if(strcmp($_POST['method'],'all') == 0) {
    end_sessions();
  }
  if(isset($_POST['page'])) {
    header("Location: ".$nsisweb->get_page_url($_POST['page']));
  } else {
    header("Location: ".$nsisweb->get_home_url());
  }
  exit;
} else {
  $session = $nsisweb->get_session();
  $record = $nsisweb->query_one("select count(*) from nsisweb_sessions where userid=".$session->user_id,__FILE__,__LINE__);

  if($record) {
    if($record['count(*)'] == 1) {
      end_session();
      if(isset($_GET['page'])) {
        header("Location: ".$nsisweb->get_page_url($_GET['page']));
      } else {
        header("Location: ".$nsisweb->get_home_url());
      }
      exit;
    } else {
      $nsisweb->start_page('Logout',FALSE);
      $page = $_GET['page'];

      print <<<ENDOFHTML
        <span class="atitle">Logout</span>
        <p>Which sessions would you like to logout?<br>
        <br>
        <form name="logoutform" method="post" enctype="multipart/form-data" action="logout.php">
ENDOFHTML;

      if(isset($_GET['page'])) {
        print '<input type="hidden" name="page" value="'.$page.'">';
      }

      print <<<ENDOFHTML
          <input type="radio" name="method" value="thiscomp" CHECKED>Logout on the this computer<br>
          <input type="radio" name="method" value="all">Logout all sessions<br>
          <p class="asubtitle"><a href="javascript:document.logoutform.submit();">Logout ></a></p>
        </form>
      </p>
ENDOFHTML;
      $nsisweb->end_page();
    }
  }
}
?>