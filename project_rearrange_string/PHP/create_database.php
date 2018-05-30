<?php
	require 'vendor/autoload.php';

	//create a client
	$client = new MongoDB\Client("mongodb://localhost:27017");

	//create a database
	$database = $client -> companydb;

	//create a collection
	$collection = $database -> createCollection('summerStarTest');

	//log out the result
	var_dump($collection);
?>