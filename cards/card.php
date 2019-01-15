<?php /*
OMACS - The online member and committee system
Copyright (C) 2018 - Joppe Blondel

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace CARDS{ class card_v2{
	const API_VER = "v2.0";

	protected $id;			// Unique ID which is given by OMACS to distinguish different cards
	protected $format;		// Format of the way data is stored in the OMACS database as array of (name, default) pairs
	protected $content;		// Data to render

	function __construct($_id){
		$this->id = $_id;			// Set the id given by OMACS
		$this->format = array();	// Initialize
	}

	function render(){
	}

	function render_settings(){
	}

	function set_content($content){
		$i = 0;
		foreach($this->format as $f){
			$this->content[$f["name"]] = $content[$i++];
		}
	}

	function get_default(){
		$def = array();
		foreach($this->format as $f){
			array_push($def, $f["default"]);
		}
		return $def;
	}
}}

?>
