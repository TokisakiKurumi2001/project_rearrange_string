<?php
	require 'vendor/autoload.php';

	//open the file and read it
	$content = file("database.txt");

	//connect to mongodb
	$client = new MongoDB\Client("mongodb://localhost:27017");

	//connect to datbase
	$database = $client -> companydb;

	//connect to collection
	$collection = $database -> summerStarTest;

	//insert docs
	// counter variable
	$i = 0;
	// loop through the array of content in the file
	foreach($content as $line)
	{
		// insert one document only
		// with the address accord to count variable $i, and info is $line in the content
		$insert = $collection -> insertOne(["address" => $i, "info" => $line]);
		// increase the count variable so each documents has different address
		$i++;
	}

	// log out the result in case everything run good
	echo "Insert ".$i." documents<br/>";
?>