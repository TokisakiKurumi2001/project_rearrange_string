/* include library */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// of course, include this super cool library
#include "dbg.h"

// define the size of the file we read or write
// file never has more than 1024 lines
const size_t MAX_LINE = 1024;

// scan through file, read the first name, write data to the second one
int scan_file(const char * filename1, const char * filename2)
{
	// make a line
	char * line = calloc(MAX_LINE, 1);
	// this is the file for reading purpose
	FILE * file = fopen(filename1, "r");
	// this is the file for writing purpose
	FILE * file_w = fopen(filename2, "w");

	// see does the line has successfully been created
	check_mem(line);
	// check whether the file occurs incorrectly
	check(file, "Cannot open the file to read");
	check(file_w, "Cannot open the file to write");

	// read through line of reading file
	while(fgets(line, MAX_LINE - 1, file) != NULL)
	{
		// for debugging purpose, print the first character of each line
		printf("%c\n", line[0]);
		// this is the main thing
		// print the first character to the file, add the endline to it
		fprintf(file_w, "%c\n", line[0]);
	}

	// after doing all the thing up there
	// free memory for the line, of course for security purpose
	free(line);
	// close all files
	fclose(file);
	fclose(file_w);
	// good result return
	return 0;

// errors occur - programmers' nightmare
error:
	// if there is problem with line, delete the line
	if(line) free(line);
	// if there is problem with file, close all the files
	if(file) fclose(file);
	if(file_w) fclose(file_w);
	// bad result being returned
	return -1;
}

// main things
int main(int argc, char * argv[])
{
	// of course, I have to check whether this run good or not
	// by putting it inside the `check` function, in order to prevent the error from pumping straight to the program
	// database.txt is reading file, keyword.txt is writing file
	check(scan_file("database.txt", "keyword.txt") == 0, "Problem occur");
	return 0;

// problem can be occured
error:
	return 1;
}

/*
* By some bad luck, the keyword.txt cannot be read by notepad. Maybe because of encoding
*/