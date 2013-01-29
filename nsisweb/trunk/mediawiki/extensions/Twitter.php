<?php
$wgExtensionFunctions[] = "wfTwitter";

function wfTwitter() {
        global $wgParser;
        $wgParser->setHook('twitter', 'Twitter');
        return true;
}

function Twitter($input) {
        global $wgParser;
        $wgParser->disableCache();
        if (!is_numeric($input))
                return '';
        return '<a class="twitter-timeline" href="https://twitter.com/nsis_tweets" data-widget-id="' . $input . '">Tweets by @nsis_tweets</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>';
}

?>
