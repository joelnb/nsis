<?php
$wgExtensionFunctions[] = "wfDiscord";

function wfDiscord() {
        global $wgParser;
        $wgParser->setHook('discord', 'Discord');
        return true;
}

function Discord() {
        return '<iframe src="https://discord.com/widget?id=799410689462501396&theme=dark" width="350" height="500" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>';
}

?>
