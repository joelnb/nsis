<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
$nsisweb->start_page('Welcome');
?>
<p class="atitle">Welcome to the NSIS Archive</p>
Welcome to the official archive of information relating to NSIS. Resources
have been and will continue to be collected here so that you have a good
place to come when you need to find an answer to an NSIS related problem.</p>
<p>There's a lot to tell you, and perhaps the most important thing is this:
the Archive can only be as good as the information contributed to it. To this
end it has been designed so that anyone can contribute to it, and perhaps more
importantly it will continue to be enhanced so that it is easier to navigate
and to contribute.</p>
<p class="abox">Start contributing right now.. <a href="contribute.php">click here</a></p>
<p>There are three types of content, the bulk of which can be accessed by
clicking Browse or Search on the main page. The remaining content is in the
form of downloadable files.</p>
<p class="abox"><a href="download.php">View</a> the list of downloadable files</p>
<p>The Search page searches the content that you can see by entering the Browse
section of the site. Content is organised into a hierarchy, the Browse page
takes you to the top of the tree of content, all content is stored in one
leaf or another of the tree below that point.</p>
<p>Nodes in the tree are called directory pages because they list the content
that exists immediately below them in the tree and allow access to the whole
tree below that point. You can create a directory page or a page of content
at any time.</p>
<p class="abox"><a href="browse.php">Browse</a> the archive or use the
<a href="search.php">Search</a> facility</p>
<p>The tree analogy only works up to a point, ultimately pages in this archive
can exist in more than one place at once which stretches the analogy a bit.
Why would you want to have the same page more than once? Well sometimes
content is hard to classify, being able to put it in more than one place
rather than being forced to choose where it best belongs helps in those
cases where it really does belong in <i>both</i> places.</p>
<p class="asubtitle">What features aren't ready yet?</p>
<p>At present you can't vote to indicate the worth of a page of content, and
you can't comment on content written by others. Both of these will be available
shortly.</p>
<p>Certain user preferences such as configuring the site to use your timezone
are not in place yet either.</p>
<?
$nsisweb->end_page();
?>