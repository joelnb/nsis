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
  global $nsisweb;
  $nsisweb->start_page('Contribute To The Archive',FALSE);
  $session = $nsisweb->get_session();
  $user    = find_userid($session->user_id);

  /* Anonymous users can't contribute thanks to a jerk that likes to spam. */
  if($user->is_anonymous()) {
    print <<<ENDOFHTML
      <p style="border:solid 2px red;padding:5px;margin-top:20px;margin-bottom:20px;">
        Anonymous contribution is currently disabled. Please
        <a style="text-decoration:underline;" href="login.php">login now</a>.
        If you do not already have an account here you can
        <a style="text-decoration:underline;" href="createaccount.php">create
        one for free</a>.
      </p>
ENDOFHTML;
  }
  else {
    /* Present visitors with a selection of ways that they can contribute to the
       Archive. */
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
    if($user->is_admin()) {
      echo '<input type="radio" name="action" value="specifyupload">one or more files that others can download.';
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

    print <<<ENDOFHTML
      <p style="border:solid 2px red;padding:5px;margin-top:20px;margin-bottom:20px;">
        Please do <b>not </b> post bug reports and patches here. Post both at the
        <a style="text-decoration:underline;" href="http://sourceforge.net/projects/nsis">
        SourceForge project page</a>.
      </p>
ENDOFHTML;
  }

  $nsisweb->end_page();
}

function ContributeNewPage()
{
  global $nsisweb;
  $nsisweb->start_page('Contribute New Page',FALSE);
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Page</span>
    <p>A new page requires three things, a title, some content and a place to
    exist in the page hierarchy. At this stage you must choose the title and
    the content. You can edit the title and content and preview the results
    as many times as you like before continuing onto the next stage.</p>
ENDOFHTML;

  $title   = htmlentities(stripslashes($_POST['title']));
  $content = stripslashes($_POST['content']);

  if(strlen($title)<=0) {
    $title = "Pick a title for your page";
  }
  if(strlen($content)<=0) {
    $content = "Enter your page content here. You can remove the outer paragraph if you wish, it depends on the appearance you want for your page.\n\nYou can put NSIS source code in like this:\n\n[source]; Turn off old selected section\nSectionGetFlags $1 $0\nIntOp $0 $0 & \${SECTION_OFF}\nSectionSetFlags $1 $0\n[/source]\nAnd then carry on again...";
  }

  $safe_content = htmlentities($content);
  
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
        <textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="25">$safe_content</textarea>
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <input type="hidden" name="action" value="savepage">
        <a href="contribute.php"><< Back</a> |
        <a href="javascript:document.editform.action.value='previewpage';document.editform.submit();">Preview</a> |
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
    $instance->show_inline(VIEWMODE_NOBUTTONS);
  }
  $nsisweb->end_page();
}

function SavePage()
{
  if(!strcmp(stripslashes(str_replace("\r\n", "\n", $_POST['content'])), "Enter your page content here. You can remove the outer paragraph if you wish, it depends on the appearance you want for your page.\n\nYou can put NSIS source code in like this:\n\n[source]; Turn off old selected section\nSectionGetFlags $1 $0\nIntOp $0 $0 & \${SECTION_OFF}\nSectionSetFlags $1 $0\n[/source]\nAnd then carry on again...")) {
    ContributeNewPage();
    return;
  }
  /* When saving the page show the user every section that exists and ask them
     to choose one to insert their page in. */
  global $nsisweb;

  if(isset($_POST['title']) && isset($_POST['content'])) {
    $savetitle   = htmlentities(stripslashes($_POST['title']));
    $savecontent = htmlentities(stripslashes($_POST['content']));
  } else {
    $savetitle   = htmlentities($_POST['savetitle']);
    $savecontent = htmlentities($_POST['savecontent']);
  }

  if(isset($_POST['parentid']) && strlen($_POST['parentid']) >= 0) {
    $page    = new NsisWebPage();
    $result  = $page->insert(
      PAGETYPE_TEMPLATED,0,
      stripslashes(htmlentities($_POST['savetitle'])),
      stripslashes($_POST['savecontent'])
    );
    $page->add_instance($_POST['parentid']);
    header('Location: '.$nsisweb->wwwroot.'/viewpage.php?pageid='.$_POST['parentid']);
    exit;
  }

  $nsisweb->start_page('Contribute New Page',FALSE);
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Page</span>
    <p>From the list below please choose a section in which to insert your new page:</p>
    <form name="insertform" method="post" enctype="multipart/form-data" action="contribute.php">
      <input type="hidden" name="action" value="savepage">
      <input type="hidden" name="savetitle" value="$savetitle">
      <input type="hidden" name="savecontent" value="$savecontent">
      <p>
ENDOFHTML;

  $session = $nsisweb->get_session();
  if($session->looks_like_admin) {
    echo '<input type="radio" name="parentid" value="0"> The Archive Root (only admins can insert pages here)<br><br>';
  }

  $result = $nsisweb->query('select pageid,title from nsisweb_pages where type='.PAGETYPE_DIRECTORY,__FILE__,__LINE__);
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
  $nsisweb->end_page();
}

function ContributeNewSection()
{
  global $nsisweb;
  $nsisweb->start_page('Contribute New Section',FALSE);
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Section</span>
    <p>A new section requires three things, a title, a description of what kind of pages should be contained
    within the section, and a place for the section to exist in the page hierarchy. At this stage you must
    choose the title and the description. You can edit the title and description and preview
    the results as many times as you like before continuing onto the next stage.</p>
ENDOFHTML;

  $title   = htmlentities(stripslashes($_POST['title']));
  $content = stripslashes($_POST['content']);

  if(strlen($title)<=0) {
    $title = "Pick a title for your page";
  }
  if(strlen($content)<=0) {
    $content = "Pick a title for your section";
  }

  $safe_content = htmlentities($content);

  print <<<ENDOFHTML
    <form name="editform" method="post" enctype="multipart/form-data" action="contribute.php">
      <p>
        Choose a title for your new page: (255 characters max)<br>
        <input type="text" style="font-family:courier new;font-size:10pt;" name="title" size="79" maxlength="255" value="$title"><br>
        <br>
        Enter a description for your new section:<br>
        <textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="3">$safe_content</textarea>
      </p>
      <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
        <input type="hidden" name="action" value="savesection">
        <a href="contribute.php"><< Back</a> |
        <a href="javascript:document.editform.action.value='previewsection';document.editform.submit();">Preview</a> |
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
    $instance->show_inline(VIEWMODE_NOBUTTONS);
  }
  $nsisweb->end_page();
}

function SaveSection()
{
  /* When saving the page show the user every section that exists and ask them
     to choose one to insert their page in. */
  global $nsisweb;
  if(isset($_POST['title']) && isset($_POST['content'])) {
    $savetitle   = htmlentities(stripslashes($_POST['title']));
    $savecontent = htmlentities(stripslashes($_POST['content']));
  } else {
    $savetitle   = htmlentities($_POST['savetitle']);
    $savecontent = htmlentities($_POST['savecontent']);
  }

  if(isset($_POST['parentid']) && strlen($_POST['parentid']) >= 0) {
    $page    = new NsisWebPage();
    $result  = $page->insert(
      PAGETYPE_DIRECTORY,0,
      stripslashes(htmlentities($_POST['savetitle'])),
      stripslashes($_POST['savecontent'])
    );
    $page->add_instance($_POST['parentid']);
    header('Location: '.$nsisweb->wwwroot.'/viewpage.php?pageid='.$_POST['parentid']);
    exit;
  }

  $nsisweb->start_page('Contribute New Section',FALSE);
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New Section</span>
    <p>From the list below please choose a section in which to insert your new section:</p>
    <form name="insertform" method="post" enctype="multipart/form-data" action="contribute.php">
      <input type="hidden" name="action" value="savesection">
      <input type="hidden" name="savetitle" value="$savetitle">
      <input type="hidden" name="savecontent" value="$savecontent">
      <p>
ENDOFHTML;

  $session = $nsisweb->get_session();
  if($session->looks_like_admin) {
    echo '<input type="radio" name="parentid" value="0"> The Archive Root (only admins can insert pages here)<br><br>';
  }

  $result = $nsisweb->query('select pageid,title from nsisweb_pages where type='.PAGETYPE_DIRECTORY,__FILE__,__LINE__);
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
  
  list($total_space,$space_used) = get_storage_space();
  $space_left = $total_space-$space_used;
  $alloc_meg  = ($total_space/1024/1024).' Mb';
  $left_meg   = ($space_left/1024/1024).' Mb';
  
  $nsisweb->start_page('Contribute New File',FALSE);
  print <<<ENDOFHTML
    <span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New File</span>
    <p>Your admin status gives you the right to upload files to the Archive.
    Please do not abuse this facility, and please remember that these files
    will be stored in the SourceForge webspace where we have a 100 Mb
    limit.<br>
    <br>
    For NSIS installers and example scripts you should create pages in the
    Archive rather than provide them as downloads. Suitable downloads are
    things like NSIS plugins and if the author approves in some cases it might
    make sense to host certain tools related to NSIS, for example if the
    normal host is unreliable or slow.<br>
    <br>
    When you press upload there will be a delay whilst the file is transmitted
    to this server. Of the $alloc_meg of available storage space $left_meg
    remains.</p>
ENDOFHTML;

  $max_upload_bytes = get_single_upload_limit();
  $max_upload_bytes = ($max_upload_bytes > $space_left) ? $space_left : $max_upload_bytes;
  $max_upload_mb    = $max_upload_bytes/1024.0/1024.0;

  if(isset($_POST['content'])) {
    $content = htmlentities(stripslashes($_POST['content']));
  } else {
    $content = "Describe the file you are uploading here.";
  }

  print <<<ENDOFHTML
    <form name="uploadform" method="post" enctype="multipart/form-data" action="contribute.php">
      <p>
        Enter a description for your new file:<br>
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
  global $nsisweb;
  
  $nsisweb->start_page('Contribute New File',FALSE);
  print '<span style="font-family:verdana;font-size:20pt;color:#000000;">Contribute New File</span>';
  
  if(count($_FILES) > 0) {
    $result = process_uploaded_files('nsiswebfile','content');

    print "<p>";
    if(strlen($upload_error)>0 || $result == 0) {
      print 'Your file could not be uploaded. The problem seems to be: ';
      if(strlen($upload_error)>0) {
        print $upload_error;
      } else if(strlen($nsisweb->errors)>0) {
        print $nsisweb->errors[0];
      }
    } else {
      print <<<ENDOFHTML
      Your file was succesfully uploaded to the Archive.<br>
      <br>
      <span style="color:red">Warning:</span> If you think that the icon for
      your file on the download page is incorrect, or it is a question, you
      will need to contact a developer and get them to upload a new image
      for the mime type of your file, and to associate the type with your
      chosen image.
ENDOFHTML;
    }
    print "</p>";
  }

  print <<<ENDOFHTML
    <p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
      <a href="download.php">Open Downloads Page</a> | <a href="nsisweb.php">Return To Home >></a>
    </p>
ENDOFHTML;
  $nsisweb->end_page();
}

function unhtmlentities($string)
{
  $trans_tbl = get_html_translation_table(HTML_ENTITIES);
  $trans_tbl = array_flip($trans_tbl);
  return strtr($string, $trans_tbl);
}
?>
