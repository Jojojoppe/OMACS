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

// Parse settings, returns dictionairy if settings are loaded, returns false in error;
function settings_parse($type){

	// parse CSS settings
	if($type=="css"){
		$f = fopen("settings/settings.css", "r");
		if(!$f)
			return false;
		// Read all lines of file
		$dict = false;
		while(!feof($f)){
			$line = fgets($f);
			$line = trim($line); // Remove whitespaces
			if(strrpos($line, ':')){
				$key = substr($line, 0, strrpos($line, ':')); // Get string until :
				$value = substr($line, strrpos($line, ': ')+1, -1); // Get second part without ;
				$value = trim($value); // Remove whitespaces
				$dict[$key] = $value;
			}
		}
		fclose($f);
		return ($dict);
	}

	return false;
}

// Save settings, returns true if succeded, else false
function settings_save($type, $dict){

	// Save css settings
	if($type=="css"){
		$f = fopen("settings/settings.css", "w");
		if(!$f)
			return false;
		// Loop trough all variables and save to file in :root
		fwrite($f, ":root{\n");
		foreach($dict as $key => $value){
			fwrite($f, $key.": ".$value.";\n");
		}

		fwrite($f, "}\n");
		fclose($f);
		return true;
	}

	return false;
}

?>
