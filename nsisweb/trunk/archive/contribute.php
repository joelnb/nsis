<?
$upload_error = $php_errormsg;
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");

unset($action);
if(strlen($_GET['action'])>0) {
  $action = $_GET['action'];
} else if(strlen($_POST['action'])>0) {
  $action = $_POST['action'];
}

switch($action) {
  case 'createpage':
  case 'previewpage':
    ContributeNewPage();
    break;
  case 'savepage':
    SavePage();
    break;
  case 'createsection':
  case 'previewsection':
    ContributeNewSection();
    break;
  case 'savesection':
    SaveSection();
    break;
  case 'specifyupload':
    ContributeNewFile();
    break;
  case 'uploadfile':
    UploadFile();
    break;
  default:
    ChooseContributionType();
    break;
}

function ChooseContributionType()
{
  /* Present visitors with a selection of ways that they can contribute to the
     Archive. */
  global $nsisweb;
  $nsisweb->start_page('Contribute To The Archive');
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute To The Archive</span>
    <p>I want to contribute:</p>
    <form name="choiceform" method="post" enctype="multipart/form-data" action="contribute.php">
      <p style="margin-left:20px;">
        <input type="radio" name="action" value="createpage" checked>a page of content of my design.<br>
        <input type="radio" name="action" value="createsection">a new section that can contain other pages.<br>
ENDOFHTML;

  /* Only present the option to upload files to users that have admin
     rights. */
  $session = $nsisweb->get_session();
  $user    = find_userid($session->user_id);
  if($user->is_admin()) {
    echo '<input type="radio" name="action" value="specifyupload" DISABLED>one or more files that others can download.';
  }

  print <<<ENDOFHTML
      </p>
      <p>
        When you have made your choice press continue to move on to the next stage:
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <input type="hidden" name="stage" value="2">
        <a href="javascript:document.choiceform.submit();">Continue >></a>
      </p>
    </form>
    </p>
ENDOFHTML;

  /* Warn anonymous users that they will not receive credit for their
     contributions. */
  if($user->is_anonymous()) {
    print <<<ENDOFHTML
      <p style="border:solid 2px red;padding:5px;margin-top:20px;margin-bottom:20px;">
        You are <b>not</b> logged in which means that any contribution you make
        to the archive will be credited to the anonymous user. If you wish to
        gain the credit for this contribution you should
        <a style="text-decoration:underline;" href="login.php">login now</a>.
        If you do not already have an account here you can
        <a style="text-decoration:underline;" href="createaccount.php">create
        one for free</a>.<br>
        <br>
        Pages created by the anonymous user can be edited by anyone. Pages
        created when you are logged in however can only be edited by you or an
        administrator.
      </p>
ENDOFHTML;
  }
  $nsisweb->end_page();
}

function ContributeNewPage()
{
  global $nsisweb;
  $nsisweb->start_page('Contribute New Page');
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Page</span>
    <p>A new page requires three things, a title, some content and a place to
    exist in the page hierarchy. At this stage you must choose the title and
    the content. You can edit the title and content and preview the results
    as many times as you like before continuing onto the next stage.</p>
ENDOFHTML;

  if(isset($_POST['title'])) {
    $title = htmlentities(stripslashes($_POST['title']));
  } else {
    $title = "Pick a title for your page.";
  }
      
  if(isset($_POST['content'])) {
    $content = htmlentities(stripslashes($_POST['content']));
  } else {
    $content = "<p>Enter your page content here. You can remove the outer paragraph if you wish, it depends on the appearance you want for your page.\n\nYou can put NSIS source code in like this:\n\n[source]; Turn off old selected section\nSectionGetFlags $1 $0\nIntOp $0 $0 & ${SECTION_OFF}\nSectionSetFlags $1 $0\n[/source]\nAnd then carry on again...</p>";
  }

  unset($_POST);

  print <<<ENDOFHTML
    <form name="editform" method="post" enctype="multipart/form-data" action="contribute.php">
      <p>
        Choose a title for your new page: (255 characters max)<br>
        <input type="text" style="font-family:courier new;font-size:10pt;" name="title" size="79" maxlength="255" value="$title"><br>
        <br>
        You must now enter the content of your new page. You are allowed to use HTML although some
        tags that could be used to attack this site will be removed from your content. Additionally you
        can enclose text inside a [source] ... [/source] token pair which will cause that text to be
        syntax highlighted as if the text is NSIS script code:<br>
        <textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="25">$content</textarea>
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <input type="hidden" name="action" value="savepage">
        <a href="contribute.php"><< Back</a> |
        <a href="contribute.php?action=previewpage#preview">Preview</a> |
        <a href="javascript:document.editform.submit();">Continue >></a>
      </p>
    </form>
    <a name="preview">
ENDOFHTML;

  /* Construct a preview of the content supplied */
  if(strlen($title)>0 || strlen($content)>0) {
    $session = $nsisweb->get_session();
    $created = date('Y-m-d H:i:s',time());
    $preview_detail = array(
      'title'        => $title,
      'source'       => $content,
      'author'       => $session->user_id,
      'created'      => $created,
      'last_updated' => $created,
      'type'         => PAGETYPE_TEMPLATED);
    $preview  = new NsisWebPage($preview_detail);
    $instance = new NsisWebInstance($preview);
    $instance->show_inline(TRUE);
  }
  $nsisweb->end_page();
}

function SavePage()
{
  /* When saving the page show the user every section that exists and ask them
     to choose one to insert their page in. */
  global $nsisweb;
  $title   = htmlentities(stripslashes($_POST['title']));
  $content = stripslashes($_POST['content']);

  if(isset($_POST['parentid']) && strlen($_POST['parentid']) >= 0) {
    $page    = new NsisWebPage();
    $result  = $page->insert(PAGETYPE_TEMPLATED,0,$title,$content);
    $page->add_instance($_POST['parentid']);
    header('Location: '.$nsisweb->wwwroot.'/viewpage.php?pageid='.$_POST['parentid']);
    exit;
  }

  $nsisweb->start_page('Contribute New Page');
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Page</span>
    <p>From the list below please choose a section in which to insert your new page:</p>
    <form name="insertform" method="post" enctype="multipart/form-data" action="contribute.php">
      <input type="hidden" name="action" value="savepage">
      <input type="hidden" name="title" value="$title">
      <input type="hidden" name="content" value="$content">
      <p>
ENDOFHTML;

  $session = $nsisweb->get_session();
  if($session->looks_like_admin) {
    echo '<input type="radio" name="parentid" value="0"> The Archive Root (only admins can insert pages here)<br><br>';
  }

  $result = $nsisweb->query('select pageid,title from nsisweb_pages where type='.PAGETYPE_DIRECTORY);
  if($result && $nsisweb->how_many_results($result)>0) {
    while($record = $nsisweb->get_result_array($result)) {
      echo '<input type="radio" name="parentid" value="'.$record['pageid'].'"> '.$record['title']."<br>\n";
    }
  } else if(!$session->looks_like_admin) {
    echo 'There are no sections for you to insert your page into!';
  }

  print <<<ENDOFHTML
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <input type="hidden" name="action" value="savepage">
        <a href="javascript:document.insertform.submit();">Insert Your Page >></a>
      </p>
    </form>
ENDOFHTML;
}

function ContributeNewSection()
{
  global $nsisweb;
  $nsisweb->start_page('Contribute New Section');
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Section</span>
    <p>A new section requires three things, a title, a description of what kind of pages should be contained
    within the section, and a place for the section to exist in the page hierarchy. At this stage you must
    choose the title and the description. You can edit the title and description and preview
    the results as many times as you like before continuing onto the next stage.</p>
ENDOFHTML;

  if(isset($_POST['title'])) {
    $title = htmlentities(stripslashes($_POST['title']));
  } else {
    $title = "Pick a title for your section.";
  }

  if(isset($_POST['content'])) {
    $content = htmlentities(stripslashes($_POST['content']));
  } else {
    $content = "<p>Enter your section description here.</p>";
  }

  unset($_POST);
        
  print <<<ENDOFHTML
    <form name="editform" method="post" enctype="multipart/form-data" action="contribute.php">
      <p>
        Choose a title for your new page: (255 characters max)<br>
        <input type="text" style="font-family:courier new;font-size:10pt;" name="title" size="79" maxlength="255" value="$title"><br>
        <br>
        Enter a description for your new section:<br>
        <textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="3">$content</textarea>
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <input type="hidden" name="action" value="savesection">
        <a href="contribute.php"><< Back</a> |
        <a href="contribute.php?action=previewsection#preview">Preview</a> |
        <a href="javascript:document.editform.submit();">Continue >></a>
      </p>
    </form>
    <a name="preview">
ENDOFHTML;

  /* Construct a preview of the content supplied */
  if(strlen($title)>0 || strlen($content)>0) {
    $session = $nsisweb->get_session();
    $created = date('Y-m-d H:i:s',time());
    $preview_detail = array(
      'title'        => $title,
      'source'       => $content,
      'author'       => $session->user_id,
      'created'      => $created,
      'last_updated' => $created,
      'type'         => PAGETYPE_DIRECTORY);
    $preview  = new NsisWebPage($preview_detail);
    $instance = new NsisWebInstance($preview);
    $instance->show_inline(TRUE);
  }
  $nsisweb->end_page();
}

function SaveSection()
{
  /* When saving the page show the user every section that exists and ask them
     to choose one to insert their page in. */
  global $nsisweb;
  $title   = htmlentities(stripslashes($_POST['title']));
  $content = stripslashes($_POST['content']);

  if(isset($_POST['parentid']) && strlen($_POST['parentid']) >= 0) {
    $page    = new NsisWebPage();
    $result  = $page->insert(PAGETYPE_DIRECTORY,0,$title,$content);
    $page->add_instance($_POST['parentid']);
    header('Location: '.$nsisweb->wwwroot.'/viewpage.php?pageid='.$_POST['parentid']);
    exit;
  }

  $nsisweb->start_page('Contribute New Section');
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Section</span>
    <p>From the list below please choose a section in which to insert your new section:</p>
    <form name="insertform" method="post" enctype="multipart/form-data" action="contribute.php">
      <input type="hidden" name="action" value="savesection">
      <input type="hidden" name="title" value="$title">
      <input type="hidden" name="content" value="$content">
      <p>
ENDOFHTML;

  $session = $nsisweb->get_session();
  if($session->looks_like_admin) {
    echo '<input type="radio" name="parentid" value="0"> The Archive Root (only admins can insert pages here)<br><br>';
  }

  $result = $nsisweb->query('select pageid,title from nsisweb_pages where type='.PAGETYPE_DIRECTORY);
  if($result && $nsisweb->how_many_results($result)>0) {
    while($record = $nsisweb->get_result_array($result)) {
      echo '<input type="radio" name="parentid" value="'.$record['pageid'].'"> '.$record['title']."<br>\n";
    }
  } else if(!$session->looks_like_admin) {
    echo 'There are no sections for you to insert your page into!';
  }

  print <<<ENDOFHTML
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <a href="javascript:document.insertform.submit();">Insert Your Section >></a>
      </p>
    </form>
ENDOFHTML;
}

function ContributeNewFile()
{
  global $nsisweb;
  $nsisweb->start_page('Contribute New File');
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New File</span>
    <p>We encourage upload of files to this archive and try to make this as
    easy as possible. However, the automatic scripts that power this site
    cannot determine whether or not uploaded files are safe for others to
    download and as such uploaded files must be approved before they appear as
    downloadable files on this site. This approval process requires a real
    person and will be done as quickly as possible.<br>
    <br>
    The site also enforces a limit on the amount of disk space that can be
    used by uploads. At this time the scripts that power the site are not
    capable of using more than one server as a file repository and so
    automatic uploads are limited to the space available to us on this
    server.<br>
    <br>
    Each time you press <b>upload</b> there will be a delay whilst the file is
    transmitted to this server, and then you will be returned to this screen
    so that you may upload another file. If there were any problems with the
    last file you uploaded these will be shown to you on this page after your
    upload finishes.</p>
ENDOFHTML;

  $max_upload_bytes = get_single_upload_limit();
  $max_upload_mb    = $max_upload_bytes/1024.0/1024.0;

  if(isset($_POST['content'])) {
    $content = htmlentities(stripslashes($_POST['content']));
  } else {
    $content = "Describe the file you are uploading here.";
  }

  print <<<ENDOFHTML
    <form name="uploadform" method="post" enctype="multipart/form-data" action="contribute.php">
      <p>
        Enter a description for your new section:<br>
        <textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="3">$content</textarea>
        <br>
        Choose the file that you wish to upload: (max single upload: $max_upload_mb Mb)<br>
        <input name="MAX_FILE_SIZE" type="hidden" value="$max_upload_bytes">
        <input name="nsiswebfile" type="file" size="72"><br>
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <input type="hidden" name="action" value="uploadfile">
        <a href="contribute.php"><< Back</a> |
        <a href="javascript:document.uploadform.submit();">Continue >></a>
      </p>
    </form>
ENDOFHTML;
  $nsisweb->end_page();
}

function UploadFile()
{
/*  if(count($_FILES) > 0) {
    //$storage = new NsisWebStorage;
    //$result = $storage->process_uploaded_files('nsiswebfile');

    print "<p>";
    if(strlen($upload_error)>0 || $result == 0) {
      print '<b><span style="color:red">Last upload failed</span></b>';
      if(strlen($upload_error)>0) {
        print " [$upload_error]";
      } else if(strlen($nsisweb->errors)>0) {
        print " [".$nsisweb->errors[0]."]";
      }
    } else {
      print "<b>Upload succeeded</b>";
    }
    print "</p>";
  }*/
}
?>