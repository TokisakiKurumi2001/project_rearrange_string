# making a function to remove the last character of the string
sub RemoveLastChar
{
	# first assign the list of string
	my @base_array = @_;
	# a count variable
	my $i = 0;
	# loop through the list of string
	foreach $string (@base_array)
	{
		# convert each string into array
		@middle_array = split('', $string);
		# remove the last character of the array
		pop(@middle_array);
		# convert array to string
		$new_string = join('',@middle_array);
		# make a new array of string, and pass the string into it
		$final_array[$i] = $new_string;
		# increase the count variable, so that the new array of string could work properly
		$i++;
	}

	# return the new array of string, which has the end remove
	return @final_array;
}

# read the file for random string
# ===== BEGIN =====


# open the result.txt, which content the random-order string and an '\n' at the end of each string
open(DATA, "<result.txt") || die "Couldn't open the file result.txt";
# assign a list of content of result.txt to array
@lines = <DATA>;
# close the file after using it
close(DATA);
# remove all the last character of the string, and have a new array
@new_lines = RemoveLastChar(@lines);


# ===== END =====

# read the file for keyword
# ===== BEGIN =====


open(DATA2, "<keyword.txt") || die "Couldn't open the file keyword.txt";
# assign the list of content
@keywords = <DATA2>;
# close the file
close(DATA2);
# remove the '\n' character
@new_keywords = RemoveLastChar(@keywords);


# ===== END =====

# read the file for example
# ===== BEGIN =====

# open the file
open(DATA3, "<format_example.txt") || die "Couln't open the file format_example.txt";
# assgin the list of content
@examples = <DATA3>;
# close the file
close(DATA3);
# remove the '\n' character
@new_examples = RemoveLastChar(@examples);


# ===== END =====

# write the file
# ===== BEGIN =====


open(DATA1, ">page.html") || die "Couldn't open the file";
# because I make a keyword as file
# we need a count variable to see some keywords along side with random string
$count = 0;
foreach $string (@new_lines)
{
	$format = "<div class = \"card-panel blue-text text-darken-2\">
	<p>".$string."</p>
	<p>Keyword: ".$new_keywords[$count]."</p>
	<p>".$new_examples[$count]."</p>
</div>"."\n";
	$count++;
	print DATA1 $format;
}


# ===== END =====