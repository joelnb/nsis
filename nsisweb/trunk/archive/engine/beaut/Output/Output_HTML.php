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
    $this->code		= '_WORD_';
    $this->linecomment 	= '<span style="color:#888888">_WORD_</span>';
    $this->blockcomment = '<span style="color:#888888">_WORD_</span>';
    $this->prepro 	= '<span style="color:#ff00ff">_WORD_</span>';
    $this->select 	= '<span style="color:#ff0000"><b>_WORD_</b></span>';
    $this->quote 	= '<span style="color:#0000ff">_WORD_</span>';
    $this->category_1 	= '<span style="color:#000088">_WORD_</span>';
    $this->category_2 	= '<span style="color:#008800">_WORD_</span>';
    $this->category_3 	= '<span style="color:#008888">_WORD_</span>';
    $this->category_4 	= '<span style="color:#880000">_WORD_</span>';
    $this->category_5 	= '<span style="color:#880088">_WORD_</span>';
    $this->category_6 	= '<span style="color:#888800">_WORD_</span>';
    $this->category_7 	= '<span style="color:#0000ff">_WORD_</span>';
    $this->category_8 	= '<span style="color:#00ff00">_WORD_</span>';
  }
}
?>
