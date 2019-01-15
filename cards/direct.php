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

namespace CARDS{ class direct extends card_v2{
	function __construct($_id){
		parent::__construct($_id);
		$this->format[0] = array("name"=>"page", "default"=>"about.php");
	}

	function render(){
		include($this->content['page']);
	}

	function render_settings(){
		?>Page: <input type="text" name="0" class="form-control card_settings-<?=$this->id?>" value="<?=$this->content['page']?>"><?php
	}
}}

?>
