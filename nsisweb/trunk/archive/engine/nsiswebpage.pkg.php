<?
include_once(dirname(__FILE__)."/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/nsiswebuser.pkg.php");

function initialise_page_table()
{
  global $nsisweb;
  $nsisweb->query("drop table if exists nsisweb_pages",__FILE__,__LINE__);
  $nsisweb->query("create table nsisweb_pages (pageid int unsigned auto_increment,type int unsigned not null default 0,flags int unsigned not null default 0,source text not null,ppsource text not null,title varchar(255),author int unsigned not null default 0,created datetime not null,last_author int unsigned not null default 0,last_updated datetime not null,views int unsigned not null default 0,rating float unsigned default 0,votes int unsigned not null default 0,primary key (pageid))",__FILE__,__LINE__);
  $nsisweb->query("create table nsisweb_hierarchy (instanceid int unsigned auto_increment,pageid int unsigned not null default 0,parentid int unsigned not null default 0,sequence int unsigned not null default 0,primary key (instanceid))",__FILE__,__LINE__);
}

define('FETCH_CONTENT_NO',  1); // page details only
define('FETCH_CONTENT_YES', 2); // details plus content
define('FETCH_CONTENT_PP',  3); // details plus pre-processed content
define('FETCH_CONTENT_BOTH',4); // details plus content & pp content

define('PAGETYPE_TEMPLATED',1);
define('PAGETYPE_DIRECTORY',2);

define('VIEWMODE_NORMAL',   0);
define('VIEWMODE_NOBUTTONS',1);
define('VIEWMODE_DETACHED', 2);

class NsisWebPage
{
  var $private_info;

  function NsisWebPage($param = 0,$fetch_mode = FETCH_CONTENT_NO)
  {
    $this->private_info = array('pageid'=>0,'source'=>FALSE,'ppsource'=>FALSE);

    if(is_array($param)) {
      /* If an array is given it is assumed that it contains enough information
         to create a fake page, one that does not exist in the database. We
         supply some not null defaults and then let the caller override them if they so
         desire. */
      $this->private_info = array(
       'pageid'       => 0,
       'type'         => PAGETYPE_TEMPLATED,
       'flags'        => 0,
       'title'        => '',
       'source'       => FALSE,
       'ppsource'     => FALSE,
       'author'       => SYSTEM_USER_ID,
       'created'      => 0,
       'last_author'  => SYSTEM_USER_ID,
       'last_updated' => 0,
       'views'        => 0,
       'rating'       => 0,
       'votes'        => 0);

      foreach($param as $key => $value) {
        $this->private_info[$key] = $value;
      }
      
      if($this->private_info['source'] && !$this->private_info['ppsource']) {
        $this->private_info['ppsource'] = preprocess($this->private_info['source'],$this->private_info['pageid']);
      }
    } else if((int)$param > 0) {
      $pageid = (int)$param;
      $fields = 'pageid,author,last_author,created,last_updated,title,type,views,rating,votes';

      switch($fetch_mode) {
        case FETCH_CONTENT_YES:  $fields .= ',source';          break;
        case FETCH_CONTENT_PP:   $fields .= ',ppsource';        break;
        case FETCH_CONTENT_BOTH: $fields .= ',source,ppsource'; break;
      }

      global $nsisweb;
      $record = $nsisweb->query_one_only("select $fields from nsisweb_pages where pageid=$pageid",__FILE__,__LINE__);
      if($record) {
        foreach($record as $key => $value) {
          $this->private_info[$key] = $value;
        }
      }
    }
  }

  function is_okay()
  {
    return $this->private_info['pageid'] > 0;
  }

  function get_pageid()      { return (int)$this->private_info['pageid'];      }
  function get_authorid()    { return (int)$this->private_info['author'];      }
  function get_editorid()    { return (int)$this->private_info['last_author']; }
  function get_author_date() { return $this->private_info['created'];          }
  function get_editor_date() { return $this->private_info['last_updated'];     }
  function get_title()        { return $this->private_info['title'];            }
  function get_flags()       { return (int)$this->private_info['flags'];       }
  function get_type()        { return (int)$this->private_info['type'];        }
  function get_views()       { return (int)$this->private_info['views'];       }
  function get_rating()      { return (float)$this->private_info['rating'];    }
  function get_votes()       { return (int)$this->private_info['votes'];       }
  
  /* The content might have to be loaded on demand, it depends on the
     fetch_mode used to create this object. */
  function get_content()
  {
    if(!$this->private_info['source']) {
      global $nsisweb;
      $record = $nsisweb->query_one_only('select source from nsisweb_pages where pageid = '.$this->get_pageid(),__FILE__,__LINE__);
      if($record) $this->private_info['source'] = $record['source'];
    }
    return $this->private_info['source'];
  }
  function get_pp_content()
  {
    if(!$this->private_info['ppsource']) {
      global $nsisweb;
      $record = $nsisweb->query_one_only('select ppsource from nsisweb_pages where pageid = '.$this->get_pageid(),__FILE__,__LINE__);
      if($record) $this->private_info['ppsource'] = $record['ppsource'];
    }
    return $this->private_info['ppsource'];
  }
  
  function get_instances()
  {
    global $nsisweb;
    $instances = array();
    $result    = $nsisweb->query('select * from nsisweb_hierarchy where pageid='.$this->get_pageid().' order by sequence asc',__FILE__,__LINE__);
    if($result && $nsisweb->how_many_results($result) > 0) {
      while($record = $nsisweb->get_result_array($result)) {
        $instances[] = new NsisWebInstance($record);
      }
    }
    return $instances;
  }
  /* sequence is optional, if non zero it will specify the position under the
     parent of the instance and other instances under the same parent will
     be renumbered to fit this instance in, otherwise it will be appeneded be
     the end of the instances under the parent. It is illegal for a page to be
     a child of a parent more than once, or for two or more children to share
     the same sequence number. */
  function add_instance($parentid,$sequence = 0) /* parentid should be an pageid */
  {
    if($sequence < 0) return FALSE;
    
    global $nsisweb;
    $session = $nsisweb->get_session();
    
    if($parentid == 0) {
      if(!$session->looks_like_admin()) return FALSE;
      $user = find_userid($session->user_id);
      if(!$user->is_admin()) return FALSE;
    }
    
    /* Build a list of pages in the section we are adding to. Don't allow the
       same page in a section twice. */
    $instances = array();
    $result    = $nsisweb->query("select * from nsisweb_hierarchy where parentid=$parentid order by sequence asc",__FILE__,__LINE__);
    if($result && $nsisweb->how_many_results($result) > 0) {
      while($record = $nsisweb->get_result_array($result)) {
        $instance = new NsisWebInstance($record);
        if($instance->get_pageid() == $this->get_pageid()) {
          return FALSE;
        }
        $instances[] = $instance;
      }
    }
    
    /* Insert our new instance and reorganise sequence numbers as required. */
    $num_instances = count($instances);
    if($sequence > $num_instances) {
      $sequence = 0;
    }
    if(!$sequence) {
      if(!$nsisweb->query("insert into nsisweb_hierarchy set parentid=$parentid,pageid=".$this->get_pageid().',sequence='.($num_instances+1),__FILE__,__LINE__)) {
        return FALSE;
      }
    } else {
      /* We need to renumber the other instances so that this instance can have
         the sequence that the user requested. */
      $nsisweb->query("insert into nsisweb_hierarchy set parentid=$parentid,pageid=".$this->get_pageid().",sequence=$sequence",__FILE__,__LINE__);
      $nsisweb->query("update nsisweb_hierarchy set sequence=sequence+1 where parentid=$parentid and sequence > $sequence",__FILE__,__LINE__);
    }
    return TRUE;
  }

  function regenerate()
  {
    global $nsisweb;
    $ppsource = mysql_escape_string(preprocess($this->get_content(),$this->get_pageid()));
    $result = $nsisweb->query("update nsisweb_pages set ppsource='$ppsource' where pageid=".$this->get_pageid(),__FILE__,__LINE__);
  }

  /* Only use this for existing pages */  
  function save($title,$content,$flags)
  {
    global $nsisweb;
    $title    = mysql_escape_string($title);
    $source   = mysql_escape_string($content);
    $ppsource = mysql_escape_string(preprocess($content,$this->get_pageid()));
    $session  = $nsisweb->get_session();
    $author   = $session->user_id;
    $result = $nsisweb->query("update nsisweb_pages set flags=$flags,title='$title',source='$source',ppsource='$ppsource',last_author=$author,last_updated=NOW() where pageid=".$this->get_pageid(),__FILE__,__LINE__);
    if(!$result) return FALSE;
    $record = $nsisweb->query_one_only("select NOW()",__FILE__,__LINE__);
    $this->private_info['flags']        = $flags;
    $this->private_info['title']        = $title;
    $this->private_info['source']       = $source;
    $this->private_info['ppsource']     = $ppsource;
    $this->private_info['last_author']  = $author;
    $this->private_info['last_updated'] = $record['NOW()'];
    return TRUE;
  }
  function insert($type,$flags,$title,$content)
  {    
    global $nsisweb;
    $title    = mysql_escape_string($title);
    $source   = mysql_escape_string($content);
    $ppsource = mysql_escape_string(preprocess($content,$this->get_pageid()));
    $session  = $nsisweb->get_session();
    $author   = $session->user_id;
    $result   = $nsisweb->query("insert into nsisweb_pages set type=$type,flags=$flags,title='$title',source='$source',ppsource='$ppsource',author=$author,created=NOW(),last_author=$author,last_updated=NOW(),views=0,rating=0,votes=0",__FILE__,__LINE__);
    if(!$result) return FALSE;
    $record = $nsisweb->query_one_only("select NOW()",__FILE__,__LINE__);
    $this->private_info = array(
      'pageid'       => $nsisweb->get_created_id(),
      'type'         => $type,
      'flags'        => $flags,
      'title'        => $title,
      'source'       => $source,
      'ppsource'     => $ppsource,
      'author'       => $author,
      'created'      => $record['NOW()'],
      'last_author'  => $author,
      'last_updated' => $record['NOW()'],
      'views'        => 0,
      'rating'       => 0,
      'votes'        => 0);
    return TRUE;
  }
  function increment_views()
  {
    global $nsisweb;
    if($this->get_pageid() > 0) {
      $nsisweb->query('update nsisweb_pages set views=views+1 where pageid='.$this->get_pageid(),__FILE__,__LINE__,0);
    }
  }
  function can_modify()
  {
    if($this->get_authorid() == ANONYMOUS_USER_ID) return TRUE;
    global $nsisweb;
    $session = $nsisweb->get_session();
    if($this->get_authorid() == $session->user_id) return TRUE;

    $user = find_userid($session->user_id);
    if($user->is_admin()) return TRUE;

    return FALSE;
  }
  /* can be called with or without a parentid parameter */
  function get_children($parentid = -1)
  {
    if($parentid == -1) {
      $parentid = $this->get_parentid();
    }
    
    /* Use a join to the nsisweb_pages table to return the page details. */ 
    global $nsisweb;
    $children = array();
    $result   = $nsisweb->query('select a.instanceid,a.pageid,b.type,b.title from nsisweb_hierarchy as a,nsisweb_pages as b where a.parentid='.$parentid.' and b.pageid=a.pageid order by a.sequence',__FILE__,__LINE__);
    if($result && $nsisweb->how_many_results($result) > 0) {
      while($record = $nsisweb->get_result_array($result)) {
        $children[] = $record;
      }
    }
    return $children;
  }
  /* can be called with or without a parentid parameter */
  function get_children_count($parentid = -1)
  {
    if($parentid == -1) {
      $parentid = $this->get_parentid();
    }
    
    /* Use a join to the nsisweb_pages table to return the full pages. */ 
    global $nsisweb;
    $child_pages    = 0;
    $child_sections = 0;

    $record = $nsisweb->query_one_only('select count(*) from nsisweb_hierarchy as a,nsisweb_pages as b where type='.PAGETYPE_TEMPLATED.' and a.parentid='.$parentid.' and b.pageid=a.pageid',__FILE__,__LINE__);
    if($record) $child_pages = $record['count(*)'];

    $record = $nsisweb->query_one_only('select count(*) from nsisweb_hierarchy as a,nsisweb_pages as b where type='.PAGETYPE_DIRECTORY.' and a.parentid='.$parentid.' and b.pageid=a.pageid',__FILE__,__LINE__);
    if($record) $child_sections = $record['count(*)'];

    return array($child_pages,$child_sections);
  }
};

/* Valid instance indices are 1 and above. */
class NsisWebInstance
{
  var $private_info;
  
  /* If param is an integer it is assumed to be an instanceid and the object
     will be populated from the database. If the param is an array it is
     assumed to be the fields describing an instance (i.e. the database query
     has already taken place, or a new object is being constructed on the fly,
     and the given values should be used instead of performing another query).
     Finally if param is an object of type NsisWebPage it is assumed that the
     caller wants to create a fake page, i.e. a temporary one that has no
     database presence and has instanceid 0 and parentid 0. */
  function NsisWebInstance($param,$fetch_mode = 0)
  {
    $this->private_info['instanceid'] = 0;
    if(is_array($param)) {
      $this->private_info = $param;
    } else if(is_object($param) && strcasecmp(get_class($param),'NsisWebPage') == 0) {
      $this->private_info = array(
        'instanceid' => 0,
        'pageid'     => $param->get_pageid(),
        'sequence'   => 1,
        'parentid'   => 0,
        'page'       => $param);
    } else {
      global $nsisweb;
      if($fetch_mode == 0) {
        $record = $nsisweb->query_one_only('select instanceid,pageid,parentid,sequence from nsisweb_hierarchy where instanceid='.(int)$param,__FILE__,__LINE__);
        if($record) {
          $this->private_info = $record;
          $this->private_info['page'] = FALSE;
        }
      } else {
        $instance_fields = 'a.instanceid,a.pageid,a.parentid,a.sequence';
        $page_fields     = 'b.author,b.last_author,b.created,b.last_updated,b.title,b.type,b.views,b.rating,b.votes';

        switch($fetch_mode) {
          case FETCH_CONTENT_YES:  $page_fields .= ',b.source';          break;
          case FETCH_CONTENT_PP:   $page_fields .= ',b.ppsource';        break;
          case FETCH_CONTENT_BOTH: $page_fields .= ',b.source,b.ppsource'; break;
        }

        $record = $nsisweb->query_one_only("select $instance_fields,$page_fields from nsisweb_hierarchy as a,nsisweb_pages as b where a.instanceid=".(int)$param.' and b.pageid=a.pageid',__FILE__,__LINE__);
        $page_details = array(
          'pageid'       => $record['pageid'],
          'author'       => $record['author'],
          'last_author'  => $record['last_author'],
          'created'      => $record['created'],
          'last_updated' => $record['last_updated'],
          'title'        => $record['title'],
          'type'         => $record['type'],
          'views'        => $record['views'],
          'rating'       => $record['rating'],
          'votes'        => $record['votes']);
    
        switch($fetch_mode) {
          case FETCH_CONTENT_YES:  $page_details['source']   = $record['source'];   break;
          case FETCH_CONTENT_PP:   $page_details['ppsource'] = $record['ppsource']; break;
          case FETCH_CONTENT_BOTH: 
            $page_details['source']   = $record['source'];
            $page_details['ppsource'] = $record['ppsource'];
            break;
        }
        
        $this->private_info = array(
          'instanceid' => $record['instanceid'],
          'pageid'     => $record['pageid'],
          'parentid'   => $record['parentid'],
          'sequence'   => $record['sequence'],
          'page'       => new NsisWebPage($page_details));
      }
    }
  }
  
  function is_okay()
  {
    return $this->private_info['instanceid'] > 0;
  }
  
  function get_instanceid() { return (int)$this->private_info['instanceid']; }
  function get_pageid()     { return (int)$this->private_info['pageid'];     }
  function get_sequence()   { return (int)$this->private_info['sequence'];   }
  function get_parentid()   { return (int)$this->private_info['parentid'];   } /* this should be an instanceid */
  
  /* The page object is not created until it is needed. */
  function get_page()
  {
    if(!$this->private_info['page'] && $this->private_info['instanceid'] > 0) {
      $this->private_info['page'] = new NsisWebPage($this->get_pageid(),FETCH_CONTENT_BOTH);
    }
    return $this->private_info['page'];
  }
  function show($view_mode = VIEWMODE_NORMAL)
  {
    global $nsisweb;
    global $instance;
    $instance = $this;
    $page = $this->get_page();
    $nsisweb->start_page($page->get_title());
    $success = $this->show_inline($view_mode);
    $nsisweb->end_page();
    return $success;
  }
  function show_inline($view_mode = VIEWMODE_NORMAL)
  {
    if(strlen($_GET['instances']) > 0) {
      $instances = $_GET['instances'].','.$this->get_instanceid();
    } else {
      $instances = $this->get_instanceid();
    }

    global $nsisweb; /* Used by the template pages */
    $page = $this->get_page();
    switch($page->get_type()) {
      case PAGETYPE_TEMPLATED:
        $page->increment_views();
        include(NSISWEB_USERPAGE_SKELETON);
        break;
      case PAGETYPE_DIRECTORY:
        $page->increment_views();
        include(NSISWEB_DIRECTORY_SKELETON);
        break;
      default:
        return FALSE;
    }
    return TRUE;
  }
  function delete()
  {
    /* We have to renumber the indices of the remaining pages. */
    global $nsisweb;
    $parentid = $this->get_parentid();
    $sequence = $this->get_sequence();
    $record   = $nsisweb->query_one_only("select max(sequence) from nsisweb_hierarchy where parentid=$parentid",__FILE__,__LINE__);
    if(!$record) return FALSE;
    $count = $record['max(sequence'];
    $nsisweb->query("delete from nsisweb_hierarchy where parentid=$parentid and sequence=$sequence",__FILE__,__LINE__);
    $nsisweb->query("update nsisweb_hierarchy set sequence=sequence-1 where parentid=$parentid and sequence > $sequence",__FILE__,__LINE__);
    return TRUE;
  }
  function get_children()
  {
    return NsisWebPage::get_children($this->get_pageid());
  }
  function get_children_count()
  {
    return NsisWebPage::get_children_count($this->get_pageid());
  }
};

function preprocess($content,$pageid)
{
  /* TODO: HTML Filter is taken from Squirrel Mail -- check the license before
     using this in the final site implementation. This was mentioned in a user
     comment by 'icon[at]linux.duke.edu' (01-May-2002 08:31) in the PHP Manual
     from php.net. The comment linked to:
       http://www.mricon.com/html/phpfilter.html
  */
  require_once('htmlfilter.inc');
  /* The tag_list controls (a) whether we disallow every tag bar some, or
     disallow only certain tags, and (b) what that list of tags is. The
     rm_tags_with_content array specifies which tags should additionally have
     their content removed. Tags listed in the self_closing_tags array defines
     which tags should *not* be forcibly closed (if that option is enabled).
     rm_attnames is an array of arrays that defines for certain tags which
     attributes should be forcibly removed. bad_attvals replaces parts of
     attributes on certain tags with replacement text of our choosing.
     add_attr_to_tag adds attributes of our choosing to certain tags. */
  $tag_list             = array(true,  "font", "div", "span", "h1", "h2", "h3", "table", "tr", "td", "th", "br", "hr", "b", "a", "i", "u", "img", "strong", "em", "p", "li", "ul", "ol", "pre", "blockquote");
  $rm_tags_with_content = array('script', 'style', 'applet', 'embed', 'head', 'frameset');
  $self_closing_tags    = array(); //array('img', 'br', 'hr', 'input');
  $force_tag_closing    = false;
  $rm_attnames          = array('/.*/' => array('/target/i', '/^on.*/i', '/^dynsrc/i', '/^datasrc/i', '/^data.*/i'));
  $add_attr_to_tag      = array('/^a$/i' => array('target' => '"_blank"'));
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

  $content = colour_source($content,$pageid);
  
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

  return $trusted;
}

/* Based on a function provided in the PHP Manual from php.net, in a user
   comment by 'webmaster AT solophp.com' on the 30-Jul-2002 09:05.
   
   This is the only function throughout the code base that looks for and
   handles [source]..[/source] blocks inside content. When a user enters
   content we allow them to use linebreaks as a formatting aid that exists
   in the output too. However that output is interpreted as HTML and so
   linebreaks must be converted to <br> tags. The exception to this rule
   is inside [source]..[/source] blocks where linebreaks are retained as is
   all other formatting and the block is styled as preformatted text. */
function colour_source($string,$pageid){
  $array_contenido = explode("[source]",str_replace("\n",'<br>',$string));
  $final = $array_contenido[0];
  $count = count($array_contenido);

  if($count > 0) {  
    for($i = 1;$i < $count;$i++){
      $array_contents = explode("[/source]",$array_contenido[$i]);

      /* A word about wordwrap: i'm using cut mode 1 because I *never*
         want a page layout messed up by a long script line and it's
         conceivable that a long file path would exceed the 78 character
         limit, especially if chained together with anything else. Cut
         mode zero will allow the limit to be exceeded if it can't find
         a suitable break point so I can't use that. Cut mode 1 forcibly
         breaks at the limit. */
      $script = tempnam(NSISWEB_SESSION_DIR,"nsis_");
      @unlink($script);
      $temp = fopen($script,"w");
      fwrite($temp,wordwrap(str_replace("<br>","\n",$array_contents[0]),78,"\n",1));
      fclose($temp); 
      $cmd = NSISWEB_LEXER_PATH." < ".$script." 2>&1";
      $array_contents[0] = `$cmd`;
      unlink($script);

      /* At the moment the parser flextest encloses the output in <pre>
         </pre> which we don't want, so get rid of it. */
      // $array_contents[0] = substr($array_contents[0],5,-6);

      /* attach a disk icon to enable saving the source */
      if($pageid > 0) {
        $final .= '<a href="savescript.php?pageid='.$pageid.'&script='.$i.'">';
        $final .= '<img border="0" src="images/disk.gif" width="19" height="19" hspace="5" vspace="5" align="middle"></a>';
        $final .= '<span style="font-family:verdana;font-size:7pt;">Save this script</span><br>';
      }

      $final .= '<span style="font-family:courier new;font-size:10pt;">';
      $final .= $array_contents[0]."</span>".$array_contents[1];
    }

    return $final;
  }

  return $string;
}

function find_pageid($pageid)
{
  $page = new NsisWebPage($pageid);
  if($page->is_okay()) {
    return $page;
  }
  return FALSE;
}
?>