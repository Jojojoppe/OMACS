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

include ("config.php");

?>

<h2>Fill in your information</h2>

<?php if(!empty($_POST['submit'])) echo "<p>Installing... this can take a moment!</p>"; ?>

<form action="" method="post">
<?php
// Show timezone settings
$regions = array(
		'Africa' => DateTimeZone::AFRICA,
		'America' => DateTimeZone::AMERICA,
		'Antarctica' => DateTimeZone::ANTARCTICA,
		'Asia' => DateTimeZone::ASIA,
		'Atlantic' => DateTimeZone::ATLANTIC,
		'Europe' => DateTimeZone::EUROPE,
		'Indian' => DateTimeZone::INDIAN,
		'Pacific' => DateTimeZone::PACIFIC
);
$timezones = array();
foreach ($regions as $name => $mask) {
	$zones = DateTimeZone::listIdentifiers($mask);
	foreach($zones as $timezone){
		// Lets sample the time there right now
		$time = new DateTime(NULL, new DateTimeZone($timezone));
		// Us dumb Americans can't handle millitary time
		$ampm = $time->format('H') > 12 ? ' ('. $time->format('g:i a'). ')' : '';
		// Remove region name and add a sample time
		$timezones[$name][$timezone] = substr($timezone, strlen($name) + 1) . ' - ' . $time->format('H:i') . $ampm;
	}
}

print 'Timezone: <select class="form-control" id="timezone" name="timezone" required>';
foreach($timezones as $region => $list) {
	print '<optgroup label="' . $region . '">' . "\n";
	if(!empty($_POST['timezone'])){?>
		<option value="<?=$_POST['timezone']?>" elected="selected"><?=$_POST['timezone']?></option>
	<?php }
	foreach($list as $timezone => $name){
		print '<option value="' . $timezone . '"name="' . $timezone . '">' . $name . '</option>' . "\n";
	}
	print '<optgroup>' . "\n";
}
print '</select><br>';
?>

	Database host: <input type="text" required name="dbh" value="<?php if(!empty($_POST['dbh'])){print $_POST['dbh'];} ?>"><br>
	Database username: <input type="text" required name="dbu" value="<?php if(!empty($_POST['dbu'])){print $_POST['dbu'];} ?>"><br>
	Database password: <input type="text" name="dbp" value="<?php if(!empty($_POST['dbp'])){print $_POST['dbp'];} ?>"><br>
	Database name: <input type="text" required name="dbn" value="<?php if(!empty($_POST['dbn'])){print $_POST['dbn'];} ?>"><br>
	<input type="hidden" name="copyright" value="©2019 Joppe Blondel"><br>
	<input type="submit" name="test" value="Test Settings"><br>

<?php

if(!empty($_POST)){
	$fh=fopen($config_file , "a+");
	fwrite($fh ,"");
	fclose($fh);
	$fh=fopen($config_file , "a+");
	$end = "',";
	$dbh_syn="'host'         => '";
	$dbh=$_POST['dbh'];
	$dbu_syn="'username'     => '";
	$dbu=$_POST['dbu'];
	$dbp_syn="'password'     => '";
	$dbp=$_POST['dbp'];
	$dbn_syn="'db'           => '";
	$dbn=$_POST['dbn'];

	if(!empty($_POST['test'])){
		$success = true;
		try{
			$dsn = "mysql:host=$dbh;dbname=$dbn;charset=utf8";
			$opt = array(
				PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
				PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
			);
			$pdo = new PDO($dsn, $dbu, $dbp, $opt) or die('could not connect');
		}catch(PDOException $e){
			$success = false;
			echo "Database connection <font color='red'><strong>unsuccessful</font></strong>! Please try again.";
		}
		if($success){
			echo "Database connection <font color='green'><strong>successful</font></strong>!<br><br>";
			?><input class="btn btn-danger" type="submit" name="submit" value="Install OMACS"><?php
		}
	}

	if (!empty($_POST['submit'])) {

		// prepare database
		$dbh=$_POST['dbh'];
		$dbu=$_POST['dbu'];
		$dbp=$_POST['dbp'];
		$dbn=$_POST['dbn'];
		$link = mysqli_connect($dbh, $dbu, $dbp, $dbn);
		if(!$link) {
			echo "Error: Unable to connect to MySQL." . PHP_EOL;
			echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
			echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
			exit;
		}
		$templine = '';
		$lines = file($sqlfile);
		foreach ($lines as $line){
			// Skip it if it's a comment
			if (substr($line, 0, 2) == '--' || $line == '')
				continue;
			// Add this line to the current segment
			$templine .= $line;
			// If it has a semicolon at the end, it's the end of the query
			if (substr(trim($line), -1, 1) == ';'){
				// Perform the query
				mysqli_query($link,$templine) or print('Error performing query \'<strong>' . $templine . '\': ' . mysqli_connect_error() . '<br /><br />');
				// Reset temp variable to empty
				$templine = '';
			}
		}
		echo "Tables imported successfully<br>";
		$copyright = $_POST['copyright'];
		mysqli_query($link,"UPDATE settings SET copyright = $copyright WHERE id = 1");

		// Write userspice config file
		$restore = file_get_contents($config_restore);
		file_put_contents($config_file, $restore);
		$timezone_syn='$timezone_string = \'';
		$tz=$_POST['timezone'];
		fwrite($fh ,
			$dbh_syn . $dbh . $end . PHP_EOL .
			$dbu_syn . $dbu . $end . PHP_EOL .
			$dbp_syn . $dbp . $end . PHP_EOL .
			$dbn_syn . $dbn . $end . PHP_EOL
		);
		$chunk1 = file_get_contents($config_chunk1);
		file_put_contents($config_file, $chunk1, FILE_APPEND);
		fclose($fh);
		$fh=fopen($config_file , "a+");
		$end = "';";
		fwrite($fh , $timezone_syn . $tz . $end . PHP_EOL);
		fclose($fh);
		$chunk2 = file_get_contents($config_chunk2);
		file_put_contents($config_file, $chunk2, FILE_APPEND);
		echo "Config files successfully installed<br>";
	}
}
?>
</form>
