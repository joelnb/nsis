<?php
/*

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*/

class Output_HTML
{
	function Output_HTML()
	{
		$this->code		      = '_WORD_';
		$this->linecomment 	= '<font color="#888888">_WORD_</font>';
		$this->blockcomment = '<font color="#888888">_WORD_</font>';
		$this->prepro 		  = '<font color="#ff00ff">_WORD_</font>';
		$this->select 	    = '<font color="#ff0000"><b>_WORD_</b></font>';
		$this->quote 		    = '<font color="#0000ff">_WORD_</font>';
		$this->category_1 	= '<font color="#000088">_WORD_</font>';
		$this->category_2 	= '<font color="#008800">_WORD_</font>';
		$this->category_3 	= '<font color="#008888">_WORD_</font>';
		$this->category_4 	= '<font color="#880000">_WORD_</font>';
		$this->category_5 	= '<font color="#880088">_WORD_</font>';
		$this->category_6 	= '<font color="#888800">_WORD_</font>';
		$this->category_7 	= '<font color="#0000ff">_WORD_</font>';
		$this->category_8 	= '<font color="#00ff00">_WORD_</font>';
	}
}
?>
