<?php
	require_once(CORE_PATH."/database.php");

	$month = date("m", $_SERVER['REQUEST_TIME']);
	$day = date("d", $_SERVER['REQUEST_TIME']);
	$hour = date("H", $_SERVER['REQUEST_TIME']);
	$minute = date("i", $_SERVER['REQUEST_TIME']);

	$db = connectMySQL();
	$stmt = $db->prepare("insert into amkj_indextime (month, day, hour, minute) values (?,?,?,?)");
	$stmt->bind_param("iiii", $month, $day, $hour, $minute);
	$stmt->execute();
	
	// This contains prefixes for the ranking related files, one for every course (and the last one for Mobile GP)
	// These must end with a "/", otherwise the game will not be able to correctly determine if auth is required
	
	echo("timetrial/00/\r\n");
	echo("timetrial/01/\r\n");
	echo("timetrial/02/\r\n");
	echo("timetrial/03/\r\n");
	echo("timetrial/04/\r\n");
	echo("timetrial/05/\r\n");
	echo("timetrial/06/\r\n");
	echo("timetrial/07/\r\n");
	echo("timetrial/08/\r\n");
	echo("timetrial/09/\r\n");
	echo("timetrial/10/\r\n");
	echo("timetrial/11/\r\n");
	echo("timetrial/12/\r\n");
	echo("timetrial/13/\r\n");
	echo("timetrial/14/\r\n");
	echo("timetrial/15/\r\n");
	echo("timetrial/16/\r\n");
	echo("timetrial/17/\r\n");
	echo("timetrial/18/\r\n");
	echo("timetrial/19/\r\n");
	
	echo("mobilegp/\r\n");
?>