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
 */ ?>

<?php
 // Id of pages : <id of page>-<number in content array>

 // TODO Sequrity of api against non logged in members

	function cardsapi_getdata($id){
		global $set_pages;
		$id	= explode("-", $id);
		$page = $id[0];
		$nr = $id[1];

		$data = $set_pages[$page]["content"][$nr]["content"]["data"];

		return $data;
	}

	function cardsapi_setdata($id, $data){
		global $set_pages;
		$id	= explode("-", $id);
		$page = $id[0];
		$nr = $id[1];

		$set_pages[$page]["content"][$nr]["content"]["data"] = $data;
		updatesettings();
	}

?>
