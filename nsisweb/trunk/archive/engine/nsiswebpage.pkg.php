<?
include_once(dirname(__FILE__)."/../engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/../engine/nsiswebuser.pkg.php");
define('ANONYMOUS_PAGE_ID',  0);
define('PAGETYPE_RAW',       1);
define('PAGETYPE_TEMPLATED', 2);
define('PAGETYPE_DIRECTORY', 3);
define('PAGETYPE_PARENTLINK',4);

if(isset($_GET['action']) && strlen($_GET['action']) > 0) {
	if(strcmp($_GET['action'],'delete') == 0) {
		delete_page($_GET['pageid']);
	}
}

function delete_page($pageid)
{
	global $nsisweb;
	$session = $nsisweb->get_session();
	$user    = find_userid($session->user_id);
	if($pageid > 0 && $user->usertype == USERTYPE_ADMIN) {
		/* also need to remove links to other pages in the hierarchy */
		$result = $nsisweb->query("delete from nsisweb_pages where pageid=$pageid");
		if($result) {
			return TRUE;
		}
	}
	return FALSE;
}

function initialise_page_table()
{
	global $nsisweb;
	$nsisweb->query("drop table if exists nsisweb_pages");
	$nsisweb->query("create table nsisweb_pages (pageid int auto_increment,parentid int zerofill,type int not null,flags int zerofill,source text not null,title varchar(255),author int zerofill,created datetime not null,last_author int zerofill,last_updated datetime not null,views int zerofill,rating float zerofill,votes int zerofill,primary key (pageid))");
}

/* Given a pageid this function shows a raw page, a templated page or a
   directory page, or whatever other page types are implemented in future. */
function show_page($pageid,$make_whole_page)
{
	global $nsisweb;
	global $page_info;

	$success   = FALSE;
	$page_info = array();
	$result    = $nsisweb->query("select * from nsisweb_pages where pageid=$pageid");

	if($result && $nsisweb->how_many_results($result) == 1) {
		$page_info = $nsisweb->get_result_array($result);

		if($make_whole_page) {
			$nsisweb->start_page($page_info['title']);
		}
		
		switch($page_info['type']) {
			case PAGETYPE_RAW:
				/* ------------------------
				        PAGETYPE: RAW
				   ------------------------ */
				$filename = $nsisweb->fileroot.'/'.$page_info['source'];
				if(file_exists($filename)) {
					$page_info['views']++;
					$result = $nsisweb->query("update nsisweb_pages set views=".$page_info['views']);
					@include($filename);
					$success = TRUE;
				}
				break;
			case PAGETYPE_TEMPLATED:
				/* ------------------------ 
		         PAGETYPE: TEMPLATED
				   ------------------------ */
				$page_info['views']++;
				$result = $nsisweb->query("update nsisweb_pages set views=".$page_info['views']);
				$title  = &$page_info['title'];
				$source = &$page_info['source'];
				$user   = find_userid($page_info['author']);
				$author = $user->username;
				$date   = $page_info['created'];
				render_templated_page($title,$author,$date,$source,$pageid);
				$success = TRUE;
				break;
			case PAGETYPE_DIRECTORY:
				/* ------------------------ 
		         PAGETYPE: DIRECTORY
				   ------------------------ */
				$result = $nsisweb->query("select * from nsisweb_pages where pageid=$pageid");
				if($result && $nsisweb->how_many_results($result) == 1) {
					$directory_page = $nsisweb->get_result_array($result);
					$items = array();

					$result = $nsisweb->query("select * from nsisweb_pages where parentid=$pageid");
					if($result && $nsisweb->how_many_results($result) > 0) {
						while($mapping = $nsisweb->get_result_array($result)) {
							$result2 = $nsisweb->query("select * from nsisweb_pages where pageid=".$mapping['pageid']);
							if($result2 && $nsisweb->how_many_results($result2) == 1 && $child_page = $nsisweb->get_result_array($result2)) {
								$items[] = array(
									'pageid' => $child_page['pageid'],
									'title' => $child_page['title']
								);
							}
						}
					}
					render_directory_page(
						$directory_page['title'],
						$directory_page['author'],
						$directory_page['date'],
						$directory_page['source'],
						$pageid,$items);
				}
				$success = TRUE;
				break;
		}

		if($make_whole_page) {
			$nsisweb->end_page();
		}
	} else {
	  $url = $nsisweb->wwwroot.'/templates/404.php?page='.urlencode($pageid);
	  header("Location: $url");
	  exit;
	}

	return $success;
}

/* Returns the pageid of the newly created page (should be a positive non-zero integer). */
function create_raw_page($title,$filename)
{
	global $nsisweb;
	if(strlen($filename)>0 && strlen($title)>0 && file_exists($nsisweb->fileroot.'/'.$filename)) {
		$session = $nsisweb->get_session();
		$author  = $session->user_id;
		$nsisweb->query("insert into nsisweb_pages set type=".PAGETYPE_RAW.",flags=0,parentid=0,source='$filename',title='$title',author=$author,created=NOW(),last_author=$author,last_updated=NOW(),views=0,rating=0");
		return $nsisweb->get_created_id();
	}
	return FALSE;
}

/* Returns the pageid of the newly created page (should be a positive non-zero integer). */
function create_templated_page($title,$body)
{
	global $nsisweb;
	$source  = process_templated_content($body);
	$source  = mysql_escape_string($source);
	$session = $nsisweb->get_session();
	$author  = $session->user_id;
	$nsisweb->query("insert into nsisweb_pages set type=".PAGETYPE_TEMPLATED.",flags=0,parentid=0,source='$source',title='$title',author=$author,created=NOW(),last_author=$author,last_updated=NOW(),views=0,rating=0");
	return $nsisweb->get_created_id();
}

function process_templated_content($content)
{
	/* TODO: HTML Filter is taken from Squirrel Mail -- check the license before
	   using this in the final site implementation. This was mentioned in a user
	   comment by 'icon[at]linux.duke.edu' (01-May-2002 08:31) in the PHP Manual
	   from php.net. The comment linked to:
	     http://www.mricon.com/html/phpfilter.html
  */
	require('htmlfilter.inc');
	/* The tag_list controls (a) whether we disallow every tag bar some, or
	   disallow only certain tags, and (b) what that list of tags is. The
	   rm_tags_with_content array specifies which tags should additionally have
	   their content removed. Tags listed in the self_closing_tags array defines
	   which tags should *not* be forcibly closed (if that option is enabled).
	   rm_attnames is an array of arrays that defines for certain tags which
	   attributes should be forcibly removed. bad_attvals replaces parts of
	   attributes on certain tags with replacement text of our choosing.
	   add_attr_to_tag adds attributes of our choosing to certain tags. */
 	$tag_list             = array(true,	"font", "div", "span", "h1", "h2", "h3", "table", "tr", "td", "th", "br", "hr", "b", "a", "i", "img", "strong", "em", "p", "li", "ul", "ol", "pre");
	$rm_tags_with_content = array('script', 'style', 'applet', 'embed', 'head', 'frameset');
	$self_closing_tags    = array('img', 'br', 'hr', 'input');
	$force_tag_closing    = false;
	$rm_attnames          = array('/.*/' => array('/target/i', '/^on.*/i', '/^dynsrc/i', '/^datasrc/i', '/^data.*/i'));
	$add_attr_to_tag      = array('/^a$/i' => array('target' => '"_new"'));
	$bad_attvals          = array(
    '/.*/' => array( /* for any tag */
      '/.*/' => array( /* for any attribute */
				array( /* replace occurences of these in the attribute with ... */
          '/script:/i'
        ),
				array( /* these replacement texts */
          '\\1denied:\\2\\3'
				)
			)
		)
	);
	$trusted = sanitize(
		$content, 
		$tag_list, 
		$rm_tags_with_content,
		$self_closing_tags,
		$force_tag_closing,
		$rm_attnames,
		$bad_attvals,
		$add_attr_to_tag
	);
	return colour_source($trusted);
}

/* Returns the pageid of the newly created page (should be a positive non-zero integer). */
function create_directory_page($title,$description)
{
	global $nsisweb;
	$session = $nsisweb->get_session();
	$author  = $session->user_id;
	$nsisweb->query("insert into nsisweb_pages set type=".PAGETYPE_DIRECTORY.",flags=0,parentid=0,source='$description',title='$title',author=$author,created=NOW(),last_author=$author,last_updated=NOW(),views=0,rating=0");
	return $nsisweb->get_created_id();
}

function clear_page_parents($pageid)
{
	global $nsisweb;
	$nsisweb->query("delete from nsisweb_pages where type=".PAGETYPE_PARENTLINK." and pageid=$pageid");
	$nsisweb->query("update nsisweb_pages set parentid=0 where pageid=$pageid");
}

function set_page_parent($pageid,$parentid)
{
	global $nsisweb;
	$result = $nsisweb->query("select * from nsisweb_pages where pageid=$pageid and type in (1,2,3)");
	$count  = $nsisweb->how_many_results($result);
	if($result && $count > 0) {
		if($count == 1) {
			$page = $nsisweb->get_result_array($result);
			if($page['parentid'] == ANONYMOUS_PAGE_ID) {
				$nsisweb->query("update nsisweb_pages set parentid=$parentid where pageid=$pageid and type in (1,2,3)");
				return TRUE;
			}
		}
		$nsisweb->query("insert into nsisweb_pages set type=".PAGETYPE_PARENTLINK.",pageid=$pageid,parentid=$parentid");
		return TRUE;
	}
	return FALSE;
}

function find_page($title)
{
	global $nsisweb;
	$result = $nsisweb->query("select * from nsisweb_pages where title='$title'");

	if($result && $nsisweb->how_many_results($result) == 1) {
		$page = $nsisweb->get_result_array($result);
		if(strcmp($page['title'],$title) == 0) {
			return make_safe_page($page);
		}
	}
	return FALSE;
}

function find_pageid($pageid)
{
	global $nsisweb;
	$result = $nsisweb->query("select * from nsisweb_pages where pageid=$pageid");

	if($result && $nsisweb->how_many_results($result) == 1) {
		$page = $nsisweb->get_result_array($result);
		if($page['pageid'] == $pageid) {
			return make_safe_page($page);
		}
	}
	return FALSE;
}

function get_top_level_pages()
{
	global $nsisweb;
	$result = $nsisweb->query("select * from nsisweb_pages where parentid=0");
	$pages  = array();
	if($result && $nsisweb->how_many_results($result) > 0) {
		while($page = $nsisweb->get_result_array($result)) {
			$pages[] = make_safe_page($page);
		}
	}
	return $pages;
}

function make_safe_page($page)
{
	$safe = array(
		'pageid' => $page['pageid'],
		'title'  => $page['title'],
		'type'   => $page['type'],
		'views'  => $page['views'],
		'rating' => $page['rating'],
		'votes'  => $page['votes']);
	if($page['type'] == PAGETYPE_DIRECTORY) {
		$safe['description'] = $page['source'];
	}
	return $safe;
}

/* Based on a function provided in the PHP Manual from php.net, in a user
   comment by 'webmaster AT solophp.com' on the 30-Jul-2002 09:05. */
function colour_source($string){
	$array_contenido = explode("[source]",$string);
	$final = $array_contenido[0];
	for($i = 1;$i <= count($array_contenido);$i++){
		$array_contents = explode("[/source]",$array_contenido[$i]);
		ob_start();
		highlight_string("<?".$array_contents[0]."?>");
		$array_contents[0] = ob_get_contents();
		ob_end_clean();
		$final .= $array_contents[0].$array_contents[1];
	}
	return str_replace(array("&lt;?","?&gt;"),"",$final);
}

function render_templated_page($title,$author,$date,$source,$pageid)
{
	global $nsisweb;
	include(NSISWEB_USERPAGE_SKELETON);
}

function render_directory_page($title,$author,$date,$desc,$pageid,$items)
{
	global $nsisweb;
	include(NSISWEB_DIRECTORY_SKELETON);
}
?>