<?
/* A user (anonymous or real) can "pick" things. The collection of picked things
   is remembered in the nsisweb_picks table, by login session. The picks only last
   for the duration of the session. Currently I envisage picked things being pages
   or downloads.
   
   A user (if they have sufficient rights) can then pick some pages for example
   whilst browsing, and then browse to a new location and "move" the picked pages
   to the new location. Or the picks can act like a basket for downloads maybe...
   
   Mainly the idea is to be able to "pick" sets of things to perform operations on
   all at once. */
include_once(dirname(__FILE__)."/nsisweb.pkg.php");
include_once(dirname(__FILE__)."/nsiswebuser.pkg.php");

function initialise_picks_table()
{
	global $nsisweb;
	$nsisweb->query("drop table if exists nsisweb_picks");
	$nsisweb->query("create table nsisweb_picks (sessionid varchar(255) not null,pickedid int not null,pickedtype int not null)");
}

function get_current_picks()
{
	global $nsisweb;
	$picks      = array();
	$session    = $nsisweb->get_session();
	$session_id = $session->session_id;
	$result     = $nsisweb->query("select * from nsisweb_picks where sessionid='$session_id'");
	if($result && $nsisweb->how_many_results($result)>0) {
		while($array = $nsisweb->get_result_array($result)) {
			$picks[] = array(
				'pickedid'   => $array['pickedid'],
				'pickedtype' => $array['pickedtype']
			);
		}
	}
	return $picks;
}

function clear_current_picks()
{
	global $nsisweb;
	$session    = $nsisweb->get_session();
	$session_id = $session->session_id;
	$nsisweb->query("delete from nsisweb_picks where sessionid='$session_id'");
}

function add_to_current_picks($pickedid,$pickedtype)
{
	global $nsisweb;
	$session    = $nsisweb->get_session();
	$session_id = $session->session_id;
	$nsisweb->query("insert into nsisweb_picks set sessionid='$session_id', pickedid=$pickedid, pickedtype=$pickedtype");
}

function remove_from_current_picks($pickedid,$pickedtype)
{
	global $nsisweb;
	$session    = $nsisweb->get_session();
	$session_id = $session->session_id;
	$nsisweb->query("delete from nsisweb_picks where sessionid='$session_id' and pickedid=$pickedid and pickedtype=$pickedtype");
}
?>