<?
/* This is a template file, it is invoked prior to dumping out page content.
   It should be used to create title banners and to position/surround/etc the
   page content to come.
   
   Defined already are:
     + $nsisweb
     + $page_info (array)
     + $title
*/

/* Change this to TRUE to see the queries exected, never set it to true on the
   release site though because this sensitive data, debug purposes only! */
define('SHOW_QUERIES',FALSE); 
?>
<!-- footer.skel.php: begin -->
										<br><br><center><a href="http://sourceforge.net"><img class="image" src="http://sourceforge.net/sflogo.php?group_id=22049&amp;type=1" alt="SourceForge Logo"></a>
									</div>
								</td> 
							</tr> 
						</table> 
					</td>
				</tr> 
			</table> 
			<table width="750" cellpadding="0" cellspacing="0" border="0" style="background-color:#F0F0F0">
				<tr>
				  <td align="left" style="font-size:8pt;padding-bottom:2px;"><i>Page generated in <?= number_format($nsisweb->get_gen_time(),3) ?> seconds (<?= count($nsisweb->executed_queries) ?> queries).</i></td>
				</tr>
			</table>
		</div>
<?
if(defined('SHOW_QUERIES') && SHOW_QUERIES == TRUE) {
	print "<pre>Executed Queries:\n";
	foreach($nsisweb->executed_queries as $query) {
		print "Query: $query\n";
	}
	print "</pre>";
}
?>
	</body> 
</html>
<!-- footer.skel.php: end -->
