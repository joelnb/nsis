<?
include_once(dirname(__FILE__)."/engine/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/engine/nsiswebstorage.pkg.php");
$nsisweb->start_page('Welcome');
?>
<font style="font-family:verdana;font-size:20pt;color:#000000;">Welcome to the NSIS Archive</font>
<p style="text-align:justify;">
Welcome to the official archive of information relating to NSIS. Resources
have been and will continue to be collected here so that you have a good
place to come when you need to find an answer to an NSIS related problem.<br>
<br>
There's a lot to tell you, and perhaps the most important thing is this:
the Archive can only be as good as the information contributed to it. To this
end it has been designed so that anyone can contribute to it, and perhaps more
importantly it will continue to be enhanced so that it is easier to navigate
and to contribute. You don't even need to create an account on the site in
order to create your own pages of content, you can dive right it and add
content right away.</p>
<p align="center" style="padding:5px;"><span style="padding:5px 10px 5px 10px;background-color:#eeeeee;font-size:12pt;">
Start contributing right now.. <a href="Contribute.php">click here</a></span></p>
<p>If you're having problems or experiencing odd behaviour you need to bear in
mind that this first incarnation of the site has only been tested on Internet
Explorer 6 and uses some cascading style sheet features that may not be
supported in yet in other browsers.</p>
<font style="font-family:verdana;font-size:15pt;color:#000000;">How is the site organised?</font>
<p>There are three types of content, the bulk of which can be accessed by
clicking Browse or Search on the main page. The remaining content is in the
form of downloadable files.</p>
<p align="center" style="padding:5px;"><span style="padding:5px 10px 5px 10px;background-color:#eeeeee;font-size:12pt;">
<a href="Download.php">View</a> the list of downloadable files</span></p>
<p>The Search page searches the content that you can see by entering the Browse
section of the site. Content is organised into a hierarchy, the Browse page
takes you to the top of the tree of content, all content is stored in one
leaf or another of the tree below that point.<br>
<br>
Nodes in the tree are called directory pages because they list the content
that exists immediately below them in the tree and allow access to the whole
tree below that point. You can create a directory page or a page of content
at any time.</p>
<p align="center" style="padding:5px;"><span style="padding:5px 10px 5px 10px;background-color:#eeeeee;font-size:12pt;">
<a href="Browse.php">Browse</a> the archive or use the <a href="Search.php">Search</a> facility</span></p>
<p>The tree analogy only works up to a point, ultimately pages in this archive
can exist in more than one place at once which stretches the analogy a bit.
Why would you want to have the same page more than once? Well sometimes
content is hard to classify, being able to put it in more than one place
rather than being forced to choose where it best belongs helps in those
cases where it really does belong in <i>both</i> places.</p>
<font style="font-family:verdana;font-size:15pt;color:#000000;">What features aren't ready yet?</font>
<p>At present you can't vote to indicate the worth of a page of content, and
you can't comment on content written by others. Both of these will be available
shortly.<br>
<br>
The ability to upload files to the archive may or may not be activated when
you read this, the feature creates some problems on the SourceForge server
where this site is currently hosted.<br>
<br>
Certain user preferences such as configuring the site to use your timezone
are not in place yet either. We want the archive to be up and running as
soon as possible so these features are still in development. This is also
the reason that the site probably doesn't work well in some browser, this
will be addressed in time.</p>
<?
$nsisweb->end_page();
?>