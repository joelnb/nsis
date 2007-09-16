<?php
/**
 * MonoBook nouveau
 *
 * Translated from gwicke's previous TAL template version to remove
 * dependency on PHPTAL.
 *
 * @todo document
 * @package MediaWiki
 * @subpackage Skins
 */

if( !defined( 'MEDIAWIKI' ) )
        die( -1 );

/** */
require_once('includes/SkinTemplate.php');

/**
 * Inherit main code from SkinTemplate, set the CSS and template filter.
 * @todo document
 * @package MediaWiki
 * @subpackage Skins
 */
class SkinNSIS extends SkinTemplate {
  /** Using NSIS skin. */
  function initPage( &$out ) {
    SkinTemplate::initPage( $out );
    $this->skinname  = 'nsis';
    $this->stylename = 'nsis';
    $this->template  = 'NSISTemplate';
  }

  function getSidebarItemLevel($line) {
    $level = 0;
    $len = strlen($line);

    for ($i = 0; $i < $len; $i++) {
      if ($line{$i} == '*')
        $level++;
      else
        return $level;
    }
  }

  /**
   * Build an array that represents the sidebar(s), the navigation bar among them
   *
   * @return array
   * @access private
   */
  function buildSidebar() {
    $fname = 'SkinNSIS::buildSidebar';
    wfProfileIn( $fname );

    $bar = array();
    $lines = explode( "\n", wfMsgForContent( 'sidebar' ) );
    foreach ($lines as $line) {
      if (strpos($line, '*') !== 0)
        continue;
      if (strpos($line, '**') !== 0) {
        $line = trim($line, '* ');
        $heading = $line;
      } else {
        $level = $this->getSidebarItemLevel($line);
        $line = substr($line, $level);
        if (strpos($line, '|') !== false) { // sanity check
          $line = explode( '|' , trim($line, '* '), 2 );
          $link = wfMsgForContent( $line[0] );
          if ($link == '-')
            continue;
          if (wfEmptyMsg($line[1], $text = wfMsg($line[1])))
            $text = $line[1];
          if (wfEmptyMsg($line[0], $link))
            $link = $line[0];
          $bar[$heading][] = array(
            'text' => $text,
            'href' => $this->makeInternalOrExternalUrl( $link ),
            'id' => 'n-' . strtr($line[1], ' ', '-'),
            'level' => $level - 1,
          );
        } else { continue; }
      }
    }

    wfProfileOut( $fname );
    return $bar;
  }
}

class NSISTemplate extends QuickTemplate {

  /**
   * Prints one sidebar.
   *
   * @access private
   */
  function printSidebar($sidebar) {
    $lastlevel = 0;
    foreach($sidebar as $key => $val) {
      $level = $val['level'];
      $id = htmlspecialchars($val['id']);
      $href = htmlspecialchars($val['href']);
      $text = htmlspecialchars($val['text']);

      if ($level > $lastlevel) {
        echo '<ul>';
      } else if ($level == $lastlevel) {
        echo '</li>';
      } else {
        echo '</li></ul></li>';
      }

      echo '<li id="'.$id.'"><a href="'.$href.'">'.$text.'</a>';

      $lastlevel = $level;
    }

    for ($i = 0; $i < $lastlevel; $i++)
      echo '</li></ul>';

    echo "\n";
  }

  /**
   * Template filter callback for NSIS skin.
   * Takes an associative array of data set from a SkinTemplate-based
   * class, and a wrapper for MediaWiki's localization database, and
   * outputs a formatted page.
   *
   * @access private
   */
  function execute() {
		// Suppress warnings to prevent notices about missing indexes in $this->data
		wfSuppressWarnings();

?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php $this->text('lang') ?>" lang="<?php $this->text('lang') ?>" dir="<?php $this->text('dir') ?>">
  <head>
    <meta http-equiv="Content-Type" content="<?php $this->text('mimetype') ?>; charset=<?php $this->text('charset') ?>" />
    <meta name="verify-v1" content="WLF5Lq4UBvbQthz98kyOIQ+Vz9LDT92e8JyA6Iatsoc=" />
    <?php $this->html('headlinks') ?>
    <title><?php $this->text('pagetitle') ?></title>
    <link rel="alternate" type="application/rss+xml" title="NSIS Project News" href="http://sourceforge.net/export/rss2_projnews.php?group_id=22049&amp;rss_fulltext=1" />
    <style type="text/css" media="screen,projection">/*<![CDATA[*/ @import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/main.css?7"; /*]]>*/</style>
    <link rel="stylesheet" type="text/css" <?php if(empty($this->data['printable']) ) { ?>media="print"<?php } ?> href="<?php $this->text('stylepath') ?>/common/commonPrint.css" />
    <!--[if lt IE 5.5000]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE50Fixes.css";</style><![endif]-->
    <!--[if IE 5.5000]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE55Fixes.css";</style><![endif]-->
    <!--[if IE 6]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE60Fixes.css";</style><![endif]-->
    <!--[if IE 7]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE70Fixes.css?1";</style><![endif]-->
    <!--[if IE]><script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('stylepath') ?>/common/IEFixes.js"></script>
    <meta http-equiv="imagetoolbar" content="no" /><![endif]-->
    <script type="<?php $this->text('jsmimetype') ?>">var skin = '<?php $this->text('skinname')?>';var stylepath = '<?php $this->text('stylepath')?>';</script>
		<script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('stylepath' ) ?>/common/wikibits.js"><!-- wikibits js --></script>
<?php	if($this->data['jsvarurl'  ]) { ?>
		<script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('jsvarurl'  ) ?>"><!-- site js --></script>
<?php	} ?>
<?php	if($this->data['pagecss'   ]) { ?>
		<style type="text/css"><?php $this->html('pagecss'   ) ?></style>
<?php	}
		if($this->data['usercss'   ]) { ?>
		<style type="text/css"><?php $this->html('usercss'   ) ?></style>
<?php	}
		if($this->data['userjs'    ]) { ?>
		<script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('userjs' ) ?>"></script>
<?php	}
		if($this->data['userjsprev']) { ?>
		<script type="<?php $this->text('jsmimetype') ?>"><?php $this->html('userjsprev') ?></script>
<?php	}
		if($this->data['trackbackhtml']) print $this->data['trackbackhtml']; ?>
		<!-- Head Scripts -->
		<?php $this->html('headscripts') ?>
  </head>
  <body <?php if($this->data['body_ondblclick']) { ?>ondblclick="<?php $this->text('body_ondblclick') ?>"<?php } ?>
<?php if($this->data['body_onload'    ]) { ?>onload="<?php     $this->text('body_onload')     ?>"<?php } ?>
 class="<?php $this->text('nsclass') ?> <?php $this->text('dir') ?>">
  <div id="header">
    <div id="logo"><a href="/" title="Back to website"><img src="<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/logo.gif" alt="NSIS logo"/></a></div>
    <!-- <div id="logo-text">&nbsp;</div> -->
  </div>
<div id="mainWrapper">
      <div id="column-content">
	<div id="content">
	  <a name="top" id="top"></a>
	  <?php if($this->data['sitenotice']) { ?><div id="siteNotice"><?php $this->html('sitenotice') ?></div><?php } ?>
	  <h1 class="firstHeading"><?php $this->text('title') ?></h1>
	  <div id="bodyContent">
	    <h3 id="siteSub"><?php $this->msg('tagline') ?></h3>
	    <div id="contentSub"><?php $this->html('subtitle') ?></div>
	    <?php if($this->data['undelete']) { ?><div id="contentSub2"><?php     $this->html('undelete') ?></div><?php } ?>
	    <?php if($this->data['newtalk'] ) { ?><div class="usermessage"><?php $this->html('newtalk')  ?></div><?php } ?>
	    <!-- start content -->
	    <?php $this->html('bodytext') ?>
	    <?php if($this->data['catlinks']) { ?><div id="catlinks"><?php       $this->html('catlinks') ?></div><?php } ?>
	    <!-- end content -->
	    <div class="visualClear"></div>
	  </div>
	</div>
      </div>
      <div id="column-one">
	<div id="p-cactions" class="portlet">
	  <h5><?php $this->msg('views') ?></h5>
	  <ul>
	    <?php foreach($this->data['content_actions'] as $key => $action) {
	       ?><li id="ca-<?php echo htmlspecialchars($key) ?>"
	       <?php if($action['class']) { ?>class="<?php echo htmlspecialchars($action['class']) ?>"<?php } ?>
	       ><a href="<?php echo htmlspecialchars($action['href']) ?>"><?php
	       echo htmlspecialchars($action['text']) ?></a></li><?php
	     } ?>
	  </ul>
	</div>
	<div class="portlet" id="p-personal">
	  <h5><?php $this->msg('personaltools') ?></h5>
	  <div class="pBody">
	    <ul>
<?php 			foreach($this->data['personal_urls'] as $key => $item) { ?>
				<li id="pt-<?php echo htmlspecialchars($key) ?>"<?php
					if ($item['active']) { ?> class="active"<?php } ?>><a href="<?php
				echo htmlspecialchars($item['href']) ?>"<?php
				if(!empty($item['class'])) { ?> class="<?php
				echo htmlspecialchars($item['class']) ?>"<?php } ?>><?php
				echo htmlspecialchars($item['text']) ?></a></li>
<?php			} ?>
	    </ul>
	  </div>
	</div>
	<script type="<?php $this->text('jsmimetype') ?>"> if (window.isMSIE55) fixalpha(); </script>
	<?php foreach ($this->data['sidebar'] as $bar => $cont) { ?>
	<div class='portlet' id='p-<?php echo htmlspecialchars($bar) ?>'>
	  <h5><?php $out = wfMsg( $bar ); if (wfEmptyMsg($bar, $out)) echo $bar; else echo $out; ?></h5>
	  <div class='pBody'>
	    <?php $this->printSidebar($cont); ?>
	  </div>
	</div>
	<?php } ?>
	<div id="p-search" class="portlet">
	  <h5><label for="searchInput"><?php $this->msg('search') ?></label></h5>
	  <div class="pBody">
      <!-- Google CSE Search Box Begins  -->
      <form id="searchbox_013152803417979916569:ziywxtw6b6m" action="http://www.google.com/cse">
        <input type="hidden" name="cx" value="013152803417979916569:ziywxtw6b6m" />
        <input type="hidden" name="cof" value="FORID:0" />
        <input name="q" type="text" size="15" />
        <input type="submit" name="sa" value="Search" />
      </form>
      <script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_013152803417979916569%3Aziywxtw6b6m"></script>
      <!-- Google CSE Search Box Ends -->
	  </div>
	</div>

	<div class="portlet">
	  <h5>donate</h5>
	  <div class="pBody" style="text-align: center; padding: 3px">
	    <a href="http://sourceforge.net/donate/index.php?group_id=22049"><img src="http://images.sourceforge.net/images/project-support.jpg" width="88" height="32" border="0" alt="Support This Project" /> </a>
	  </div>
	</div>

	<?php if( $this->data['language_urls'] ) { ?><div id="p-lang" class="portlet">
	  <h5><?php $this->msg('otherlanguages') ?></h5>
	  <div class="pBody">
	    <ul>
	      <?php foreach($this->data['language_urls'] as $langlink) { ?>
	      <li class="<?php echo htmlspecialchars($langlink['class'])?>">
	      <a href="<?php echo htmlspecialchars($langlink['href'])
	        ?>"><?php echo $langlink['text'] ?></a>
	      </li>
	      <?php } ?>
	    </ul>
	  </div>
	</div>
	<?php } ?>
      </div><!-- end of the left (by default at least) column -->
<!--      <div class="visualClear"></div> -->
      <div id="footer">
        <? if($this->data['poweredbyico']) { ?><div id="f-poweredbyico"><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=22049&amp;type=1" border="0" alt="SourceForge.net" /></a>&nbsp;<? $this->html('poweredbyico') ?></div><? } ?>
	      <? if($this->data['copyrightico']) { ?><div id="f-copyrightico"><? $this->html('copyrightico') ?></div><? } ?>
        <ul id="f-list">
          <? if($this->data['lastmod'   ]) { ?><li id="f-lastmod"><?    $this->html('lastmod')    ?><br/></li><? } ?>
          <? if(!$this->data['lastmod'  ]) { ?><li id="f-spec">This page is automatically generated.<br/></li><? } ?>
<!--          <? if($this->data['about'     ]) { ?><li id="f-about"><?      $this->html('about')      ?>     </li><? } ?> -->
          <? if($this->data['disclaimer']) { ?><li id="f-disclaimer"><? $this->html('disclaimer') ?>     </li><? } ?>
        </ul>
      </div>
    </div>
    <?php $this->html('reporttime') . "\n" ?>
  </body>
</html>
<?php
	wfRestoreWarnings();
	}
}
?>
