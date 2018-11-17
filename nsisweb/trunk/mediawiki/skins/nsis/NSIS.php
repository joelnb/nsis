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
    //wfProfileIn( $fname );

    $bar = array();
    $lines = explode( "\n", wfMessage( 'sidebar' )->text() );
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
          $text = wfMessage($line[1])->text();
          $link = wfMessage($line[0])->text();
          if ($link == '-')
            continue;
          if (wfMessage($line[1])->inContentLanguage()->isBlank())
            $text = $line[1];
          if (wfMessage($line[0])->inContentLanguage()->isBlank())
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

    //wfProfileOut( $fname );
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
<html xmlns="<?php $this->text('xhtmldefaultnamespace') ?>" <?php 
	foreach($this->data['xhtmlnamespaces'] as $tag => $ns) {
		?>xmlns:<?php echo "{$tag}=\"{$ns}\" ";
	} ?>xml:lang="<?php $this->text('lang') ?>" lang="<?php $this->text('lang') ?>" dir="<?php $this->text('dir') ?>">
  <head>
    <meta http-equiv="Content-Type" content="<?php $this->text('mimetype') ?>; charset=<?php $this->text('charset') ?>" />
    <meta name="verify-v1" content="WLF5Lq4UBvbQthz98kyOIQ+Vz9LDT92e8JyA6Iatsoc=" />
    <?php $this->html('headlinks') ?>
    <title><?php $this->text('pagetitle') ?></title>
		<style type="text/css" media="screen, projection">/*<![CDATA[*/
			@import "<?php $this->text('stylepath') ?>/common/shared.css?<?php echo $GLOBALS['wgStyleVersion'] ?>";
			@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/main.css?<?php echo $GLOBALS['wgStyleVersion'] ?>";
		/*]]>*/</style>
		<link rel="stylesheet" type="text/css" <?php if(empty($this->data['printable']) ) { ?>media="print"<?php } ?> href="<?php $this->text('printcss') ?>?<?php echo $GLOBALS['wgStyleVersion'] ?>" />
		<?php if( in_array( 'IE50', $skin->cssfiles ) ) { ?><!--[if lt IE 5.5000]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE50Fixes.css?<?php echo $GLOBALS['wgStyleVersion'] ?>";</style><![endif]-->
		<?php } if( in_array( 'IE55', $skin->cssfiles ) ) { ?><!--[if IE 5.5000]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE55Fixes.css?<?php echo $GLOBALS['wgStyleVersion'] ?>";</style><![endif]-->
		<?php } if( in_array( 'IE60', $skin->cssfiles ) ) { ?><!--[if IE 6]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE60Fixes.css?<?php echo $GLOBALS['wgStyleVersion'] ?>";</style><![endif]-->
		<?php } if( in_array( 'IE70', $skin->cssfiles ) ) { ?><!--[if IE 7]><style type="text/css">@import "<?php $this->text('stylepath') ?>/<?php $this->text('stylename') ?>/IE70Fixes.css?<?php echo $GLOBALS['wgStyleVersion'] ?>";</style><![endif]-->
		<?php } ?><!--[if lt IE 7]><?php if( in_array( 'IE', $skin->cssfiles ) ) { ?><script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('stylepath') ?>/common/IEFixes.js?<?php echo $GLOBALS['wgStyleVersion'] ?>"></script>
		<?php } ?><meta http-equiv="imagetoolbar" content="no" /><![endif]-->
		
		<?php /* print Skin::makeGlobalVariablesScript( $this->data ); */ ?>
                
		<script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('stylepath' ) ?>/common/wikibits.js?<?php echo $GLOBALS['wgStyleVersion'] ?>"><!-- wikibits js --></script>
		<!-- Head Scripts -->
<?php $this->html('headscripts') ?>
<?php	if($this->data['jsvarurl']) { ?>
		<script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('jsvarurl') ?>"><!-- site js --></script>
<?php	} ?>
<?php	if($this->data['pagecss']) { ?>
		<style type="text/css"><?php $this->html('pagecss') ?></style>
<?php	}
		if($this->data['usercss']) { ?>
		<style type="text/css"><?php $this->html('usercss') ?></style>
<?php	}
		if($this->data['userjs']) { ?>
		<script type="<?php $this->text('jsmimetype') ?>" src="<?php $this->text('userjs' ) ?>"></script>
<?php	}
		if($this->data['userjsprev']) { ?>
		<script type="<?php $this->text('jsmimetype') ?>"><?php $this->html('userjsprev') ?></script>
<?php	}
		if($this->data['trackbackhtml']) print $this->data['trackbackhtml']; ?>
		<link rel="alternate" type="application/rss+xml" title="NSIS Project News" href="https://sourceforge.net/export/rss2_projnews.php?group_id=22049&rss_fulltext=1" />
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75865490-1', 'auto');
  ga('set', 'anonymizeIp', true);
  ga('send', 'pageview');

</script>
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
	    <?php if($this->data['catlinks']) { ?><?php       $this->html('catlinks') ?><?php } ?>
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
	  <h5><?php $out = wfMessage( $bar )->text(); if (wfMessage($bar)->inContentLanguage()->isBlank()) echo $bar; else echo $out; ?></h5>
	  <div class='pBody'>
	    <?php $this->printSidebar($cont); ?>
	  </div>
	</div>
	<?php } ?>
	<div id="p-search" class="portlet">
	  <h5><label for="searchInput"><?php $this->msg('search') ?></label></h5>
	  <div class="pBody">
      <!-- Google CSE Search Box Begins  -->
      <script>
        (function() {
          var cx = '013152803417979916569:ziywxtw6b6m';
          var gcse = document.createElement('script');
          gcse.type = 'text/javascript';
          gcse.async = true;
          gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(gcse, s);
        })();
      </script>
      <gcse:searchbox-only></gcse:searchbox-only>
      <!-- Google CSE Search Box Ends -->
	  </div>
	</div>

	<div class="portlet">
	  <h5>donate</h5>
	  <div class="pBody" style="text-align: center; padding: 3px">
	    <a href="https://sourceforge.net/donate/index.php?group_id=22049"><img src="https://images.sourceforge.net/images/project-support.jpg" width="88" height="32" border="0" alt="Support This Project" /> </a>
	  </div>
	</div>

	<div class="portlet">
	  <h5>ads</h5>
	  <div class="pBody">
	    <script type="text/javascript"><!--
google_ad_client = "pub-6164632244757680";
/* NSIS Wiki */
google_ad_slot = "4219930685";
google_ad_width = 120;
google_ad_height = 240;
	    //--></script>
	    <script type="text/javascript" src="https://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
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
        <? if($this->data['poweredbyico']) { ?><div id="f-poweredbyico"><a href="https://sourceforge.net/projects/nsis/"><img src="https://sflogo.sourceforge.net/sflogo.php?group_id=22049&type=1" border="0" alt="SourceForge.net" /></a>&nbsp;<? $this->html('poweredbyico') ?></div><? } ?>
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
