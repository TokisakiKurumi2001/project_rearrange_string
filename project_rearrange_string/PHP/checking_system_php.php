<!DOCTYPE html>
<html>
	<head>
		<title>Result</title>
	</head>
	<body>
		<?php
			// add the library to connect easily to MongoDB database
			require 'vendor/autoload.php';

			/* make an array content the name of the key we will get from the form
			* the format is "key_0", "key_1", ..., "key_49"
			*/

			// make an array of 50 elements in which elements has the same value "0"
			$keys = array_fill(0,50, "0");
			// make a constant string
			$str = "key_";
			// count variable
			$i = 0;
			// for-loop with count variable
			for($i = 0; $i < 50; $i++)
			{
				// assign the value inside key array with the wright format
				$keys[$i] = $str.$i;
				// concat string with int -> return string
			}

			/* make an array to store the input receive from the form */

			// size is 50, fill with "NULL"
			$answer = array_fill(0,50,"NULL");
			// for-loop with count variable
			for($i = 0; $i < 50; $i++)
			{
				// get the return from the form and assign it to the array
				$answer[$i] = $_POST[$keys[$i]];
			}
			
			/* mongoDB database */

			//create a client for mongoDB connection
			$client = new MongoDB\Client("mongodb://localhost:27017");
			// connect to the database
			$database = $client -> companydb;
			// choose the collection
			$collection = $database -> summerStarTest;


			// make a variable to calculate the point
			$point = 0;

			/* for-loop to check whether the input user is similiar to the content saved in the database */
			for($i = 0; $i < 50; $i++)
			{
				// find each document according to the address of it, and $i always increase because of for-loop, we find lots of documents
				// but one at the same time
				$document = $collection -> findOne(["address" => $i]);
				// if we can have any documents match with the address
				if($document != NULL)
				{
					// now checking the user anwser
					// add the string "\r\n" to user input to equal compare with info of documents, format issue
					if($answer[$i]."\r\n" == $document['info'])
					{
						// if it's matched increase the point by 1
						$point++;
					}
				}else{
					// if we didn't find any documents matching with the address, there must be some errors occur
					echo "Error occur"."<br/>";
					// break the loop to prevent core dump from happening
					break;
				}
			}
			// else tell the point
			echo "<p id = \"result\">Your point is ".$point."</p>";
		?>
	</body>
</html>