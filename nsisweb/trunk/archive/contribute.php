<?
$upload_error = $php_errormsg;

include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpage.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebpicks.pkg.php");

function get_max_upload() {
	if(!ini_get("file_uploads")) {
		return FALSE;
	}
	$upload_max_filesize = get_real_size(ini_get("upload_max_filesize"));
	$post_max_size = get_real_size(ini_get("post_max_size"));
	$memory_limit = round(get_real_size(ini_get("memory_limit")) / 2);
	if($upload_max_filesize>$post_max_size) {
		$max = $post_max_size;
	} else {
		$max = $upload_max_filesize;
	}
	if(($memory_limit!="")&&($memory_limit<$max)) {
		$max = $memory_limit;
	}
	if(NSISWEB_MAXSINGLEUPLOAD < $max) {
		$max = NSISWEB_MAXSINGLEUPLOAD;
	}
	return $max;
}
function get_real_size($size) {
	if ($size=="") { return 0; }
	$scan['MB'] = 1048576;
	$scan['M'] = 1048576;
	$scan['KB'] = 1024;
	$scan['K'] = 1024;
	while (list($key) = each($scan)) {
		if ((strlen($size)>strlen($key))&&(substr($size, strlen($size) - strlen($key))==$key)) {
			$size = substr($size, 0, strlen($size) - strlen($key)) * $scan[$key];
			break;
		}
	}
	return $size;
}
 
$stage = 1;
if(strlen($_POST['stage'])>0) {
	$stage = $_POST['stage'];
}

if($stage == 2 && strcmp($_POST['pagetype'],'newpage') != 0 &&
 strcmp($_POST['pagetype'],'newsection') != 0 &&
 strcmp($_POST['pagetype'],'newfile') != 0) {
	/* Bad input, go back a stage */
	$stage = 1;
}

switch($stage) {
	case 1:
		/* --------------------
		      WIZARD PAGE 1
		   -------------------- */
		$nsisweb->start_page('Contribute');
		print <<<ENDOFHTML
		<font style="font-family: verdana; font-size: 20pt; color: #000000;">Contribute: Stage One</font>
		<p>Firstly you need to decide what type of content you are contributing to the site. Currently you have
		two choices: (1) you can create a page of content, containing content or containing other pages, or (2) you can
		con upload files to the archive.<br>
		<br>
		I want to contribute:
		</p>
		<form name="wizard" method="post" enctype="multipart/form-data" action="contribute.php">
		  <p style="margin-left:20px;">
				<input type="radio" name="pagetype" value="newpage" checked>a page of content of my design.<br>
				<input type="radio" name="pagetype" value="newsection">a new section that can contain other pages.<br>
				<input type="radio" name="pagetype" value="newfile">one or more files that others can download.<br>
			</p>
			<p>
			When you have made your choice press continue to move on to the next stage:
			</p>
			<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
			  <input type="hidden" name="stage" value="2">
			  <a href="javascript:wizard.submit();">Continue >></a>
			</p>
		</form>
		</p>
ENDOFHTML;
		$session = $nsisweb->get_session();	
		if($session->user_id == ANONYMOUS_USER_ID) {
			$login_url  = $nsisweb->get_page_url('login');
			$create_url = $nsisweb->get_page_url('createaccount');
			
			print <<<ENDOFHTML
			<p style="border:solid 2px red;padding:5px;margin-top:20px;margin-bottom:20px;">You are <b>not</b> logged in which means that any contribution you make
			to the archive will be credited to the anonymous user. If you wish to gain the credit for
			this contribution you should <a style="text-decoration:underline;" href="$login_url">login now</a>. If you do not
			already have an account here you can <a style="text-decoration:underline;" href="$create_url">create one for free</a>.<br>
			<br>
			Pages created by the anonymous user can be edited by anyone. Pages created when you are logged in however
			can only be edited by you or an administrator.</p>
ENDOFHTML;
		}
	  break;
	case 2:
		/* --------------------
		      WIZARD PAGE 2
		   -------------------- */
		$pagetype = $_POST['pagetype'];

		if(strcmp($pagetype,'newpage') == 0) {
			$nsisweb->start_page('Contribute');
			print <<<ENDOFHTML
			<font style="font-family: verdana; font-size: 20pt; color: #000000;">Contribute: Stage Two</font>
			<p>A new page requires three things, a title, some content and a place to exist in the page hierarchy.
			At this stage you must choose the title and the content. You can edit the title and content and preview
			the results as many times as you like before continuing onto the next stage.</p>
ENDOFHTML;
		} else if(strcmp($pagetype,'newsection') == 0) {
			$nsisweb->start_page('Contribute');
			print <<<ENDOFHTML
			<font style="font-family: verdana; font-size: 20pt; color: #000000;">Contribute: Stage Two</font>
			<p>A new section requires three things, a title, a description of what kind of pages should be contained
			within the section, and a place for the section to exist in the page hierarchy. At this stage you must
			choose the title and the description. You can edit the title and description and preview
			the results as many times as you like before continuing onto the next stage.</p>
ENDOFHTML;
		} else if(strcmp($pagetype,'newfile') == 0) {
			$nsisweb->start_page('Contribute');
			print <<<ENDOFHTML
			<font style="font-family: verdana; font-size: 20pt; color: #000000;">Contribute: Stage Two</font>
			<p>We encourage upload of files to this archive and try to make this as easy as possible. However, the
			automatic scripts that power this site cannot determine whether or not uploaded files are safe for others
			to download and as such uploaded files must be approved before they appear as downloadable files on this
			site. This approval process requires a real person and will be done as quickly as possible.<br>
			<br>
			The site also enforces a limit on the amount of disk space that can be used by uploads. At this time
			the scripts that power the site are not capable of using more than one server as a file repository and
			so automatic uploads are limited to the space available to us on this server.<br>
			<br>
			Each time you press <b>upload</b> there will be a delay whilst the file is transmitted to this server,
			and then you will be returned to this screen so that you may upload another file. If there were any
			problems with the last file you uploaded these will be shown to you on this page after your upload
			finishes.</p>
ENDOFHTML;
		} else {
			/* Error, go back a step */
			$_POST['stage'] = 1;
			header("Location: contribute.php");
			exit;
		}

		if(strcmp($pagetype,'newpage') == 0 || strcmp($pagetype,'newsection') == 0) {
			$title = htmlentities(stripslashes($_POST['title']));
			$content = stripslashes($_POST['content']);
			// We don't want any </textarea>'s in there...
			$content_entities = htmlentities($content);

			print <<<ENDOFHTML
			<form name="wizard" method="post" enctype="multipart/form-data" action="contribute.php">
			<p>
			Choose a title for your new page: (255 characters max)<br>
			<input type="text" style="font-family:courier new;font-size:10pt;" name="title" size="79" maxlength="255" value="$title"><br>
			<br>
ENDOFHTML;

			if(strcmp($pagetype,'newpage') == 0) {
				print <<<ENDOFHTML
				You must now enter the content of your new page. You are allowed to use HTML although some
				tags that could be used to attack this site will be removed from your content. Additionally you
				can enclose text inside a [source] ... [/source] token pair which will cause that text to be
				syntax highlighted as if the text is NSIS script code:<br>
				<textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="25">$content_entities</textarea>
ENDOFHTML;
			} else if(strcmp($pagetype,'newfile') == 0) {
				print <<<ENDOFHTML
				You must now enter the description of your new section: (255 characters max)<br>
				<input type="text" style="font-family:courier new;font-size:10pt;" name="content" size="79" maxlength="255" value="$title"><br>
ENDOFHTML;
			} else if(strcmp($pagetype,'newsection') == 0) {
				print <<<ENDOFHTML
				Enter a description for your new section:<br>
				<textarea name="content" style="font-family:courier new;font-size:10pt;" cols="79" rows="3">$content_entities</textarea>
ENDOFHTML;
			}
			
			print <<<ENDOFHTML
			</p>
			<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
			  <input type="hidden" name="stage" value="3">
			  <input type="hidden" name="pagetype" value="$pagetype">
		  	<a href="javascript:wizard.stage.value=1;wizard.submit();"><< Back</a> |
		  	<a href="javascript:wizard.stage.value=2;wizard.submit();">Preview</a> |
			  <a href="javascript:wizard.submit();">Continue >></a>
			</p>
			</form>
ENDOFHTML;

			if(strlen($title)>0 || strlen($content)>0) {
				$session = $nsisweb->get_session();
				if(strcmp($pagetype,'newpage') == 0) {
					$result = $nsisweb->query("select NOW()");
					$now = $array['NOW()'];
					if($result) {
						$array = $nsisweb->get_result_array($result);
						$processed = process_templated_content($content,TRUE);
						render_templated_page($title,$session->get_username(),$now,$processed,0);
					}
				} else {
					$items = array(
						array('pageid' => 0,'title' => 'dummy item one'),
						array('pageid' => 1,'title' => 'dummy item two'),
						array('pageid' => 2,'title' => 'dummy item three'),
						array('pageid' => 3,'title' => 'dummy item four'),
						array('pageid' => 4,'title' => 'dummy item five')
					);
					render_directory_page($title,$session->get_username(),$now,$content,0,$items);
				}
			}
		} else if(strcmp($pagetype,'newfile') == 0) {
			$max_upload_bytes = get_max_upload();
			$max_upload_mb    = $max_upload_bytes/1024.0/1024.0;
			
			if(count($_FILES) > 0) {
				$storage = new NsisWebStorage;
				$result = $storage->process_uploaded_files('nsiswebfile');

				print "<p>";
				if(strlen($upload_error)>0 || $result == 0) {
					print '<b><font color="red">Last upload failed</font></b>';
					if(strlen($upload_error)>0) {
						print " [$upload_error]";
					} else if(strlen($nsisweb->errors)>0) {
						print " [".$nsisweb->errors[0]."]";
					}
				} else {
					print "<b>Upload succeeded</b>";
				}
				print "</p>";
			}

			$home_link = $nsisweb->get_home_url();
			
			print <<<ENDOFHTML
			<form name="wizard" method="post" enctype="multipart/form-data" action="contribute.php">
			<p>
			Choose the file that you wish to upload: (max single upload: $max_upload_mb Mb)<br>
			<input name="MAX_FILE_SIZE" type="hidden" value="$max_upload_bytes">
			<input name="nsiswebfile" type="file" size="72"><br>
			</p>
			<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
			  <input type="hidden" name="stage" value="2">
			  <input type="hidden" name="pagetype" value="$pagetype">
		  	<a href="javascript:wizard.stage.value=1;wizard.submit();"><< Back</a> |
		  	<a href="javascript:wizard.stage.value=2;wizard.submit();">Upload</a> |
			  <a href="$home_link">Finished >></a>
			</p>
			</form>
ENDOFHTML;
		}
	  break;
	case 3:
		/* --------------------
		      WIZARD PAGE 4
		   -------------------- */
		$pagetype = $_POST['pagetype'];
		$title    = htmlentities(stripslashes($_POST['title']));
		$content  = stripslashes($_POST['content']);

		if(strcmp($pagetype,'newpage') == 0) {
			$result = create_templated_page($title,$content);
		} else if(strcmp($pagetype,'newsection') == 0) {
			$result = create_directory_page($title,$content);
		} else {
			/* Error, go back a step */
			$_POST['stage'] = 2;
			header("Location: contribute.php");
			exit;
		}

		$nsisweb->start_page('Contribute');
		print <<<ENDOFHTML
		<font style="font-family: verdana; font-size: 20pt; color: #000000;">Contribute: Complete</font>
ENDOFHTML;

		if($result > 0) {
		  if(strcmp($pagetype,'newpage') == 0) {
			  add_to_current_picks($result,PAGETYPE_TEMPLATED);
		  } else if(strcmp($pagetype,'newsection') == 0) {
			  add_to_current_picks($result,PAGETYPE_DIRECTORY);
      }
			print <<<ENDOFHTML
			<p>The new page that you have created has been added to your pick list.
			You should now browse through the archive until you find somewhere that
			you want to insert your new page. You may find that you do not have
			permission to insert the page at some locations.<br>
			<br>
			Once you have found a section to insert the page in click the insert pages
			link on the browse page and you will be able to select which pages you wish
			to insert from your pick list.<br>
			<br>
			If you do not insert the page in your current session the new page will be
			deleted.</p>
ENDOFHTML;
		} else {
			$query = $nsisweb->last_query;
			print <<<ENDOFHTML
			<p>An error has occured, your page could not be created.<br>
			<br>
			The last query executed was:<br>
			<font style="font-family:courier new;">$query</font><br>
			<br>
			Errors that we know of are:<br>
ENDOFHTML;
			print_r($nsisweb->errors);
			print "</p>";
		}

		$home_link   = $nsisweb->get_home_url();
		$browse_link = $nsisweb->get_page_url('browse');

		print <<<ENDOFHTML
		<p align="right" style="margin-top:30px;border-top:solid 1px #000000;">
		  <A href="$browse_link">Browse Pages</a> | 
		  <a href="$home_link">Return To Home</a>
		</p>
ENDOFHTML;
		break;
}
$nsisweb->end_page();
?>