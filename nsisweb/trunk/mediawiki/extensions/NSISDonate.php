<?php

/*
Use <nsisdonate /> on the donate page to insert the donate markup.
This extension exists because a normal wiki page cannot use <style> nor <a> tags.
*/

$wgExtensionFunctions[] = "wfNSISDonate";

function wfNSISDonate() {
	global $wgParser;
	$wgParser->setHook('nsisdonate', 'RenderNsisDonate');
	return true;
}

function getPeopleInfo()
{
	return array(
		array('Name' => 'kichik', 'Title' => 'Developer', 'SF' => 'kichik'  , 'Github' => 'kichik', 'Paypal' => 'https://www.paypal.com/cgi-bin/webscr?item_name=Donation+to+Nullsoft+Scriptable+Install+System&cmd=_donations&business=kichik%40users.sourceforge.net'),
		array('Name' => 'Anders', 'Title' => 'Developer', 'SF' => 'anders_k', 'Github' => 'sredna', 'Paypal' => 'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HG46M9FK2ZW6N')
	);
}


# The #bodyContent style is a hack to remove the default wiki link images
$csstag = <<<EOD
<style type="text/css"><!--
style { display: none; }

#bodyContent table.donate a[href^="http://"]  { background-image: none; padding: inherit; }
#bodyContent table.donate a[href^="https://"] { background-image: none; padding: inherit; }

table.donate { border: 1px solid #808080; margin: 1em; background-color:#fff; color: #000; display:inline-block; /*IE:inline-block+hasLayout*/ *display:inline;*zoom:1; }
.donate td, .donate th { text-align: center; border: 0; padding: 0.2em 0.5em; }
a.donatebtn { color: #333333; background: #EEEEEE none !important; background-color: #EEEEEE; padding: 0.3em !important; margin: 0.3em; display:block; text-decoration: none; border: 1px solid #BFBFBF; font-weight: bold; }
.donateperson img { height: 3em; max-width: 9em; }
.donateperson a { text-decoration: none; color:#000; }
--></style>
EOD;
/*>>>*/


$donatemarkup = <<<EOD
<table class="donate" border=0 cellpadding=5 cellspacing=0>
<tr><td class="donateperson"><img src="https://github.com/_GITHUB_.png?size=64"><br><b><a href="https://sourceforge.net/u/_SF_">_NAME_</a></b></td></tr>
<tr><td>_TITLE_</td></tr>
<tr><td><a href="_URL_" class=donatebtn>Donate</a></td></tr>
</table>
EOD;
/*>>>*/


function RenderNsisDonate()
{
	global $csstag, $donatemarkup;
	$html = '<span>' . $csstag . '<center>';
	$list = getPeopleInfo();
	foreach($list as $li)
	{
		$s = array('_NAME_'   , '_TITLE_'   , '_SF_'   , '_GITHUB_'   , '_URL_'      );
		$r = array($li['Name'], $li['Title'], $li['SF'], $li['Github'], $li['Paypal']);
		$html .= str_replace($s, $r, $donatemarkup);
	}
	return array($html . '</center></span>', "markerType" => 'nowiki', 'noparse' => true, 'isHTML' => true);
}

?>