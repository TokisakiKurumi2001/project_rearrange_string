using System;
using System.IO;
using System.Text;

namespace WorkPlace
{
	class Program
	{
		static void Main(string[] args)
		{
			// some file to be defined
			string data = @"database.txt";
			string read = @"raw_example.txt";
			string write = @"format_example.txt";

			try
			{
				// I have to use the `using` method
				// for reading the database
				using(StreamReader info = File.OpenText(data))
				{
					// for reading the example
					using(StreamReader example = File.OpenText(read))
					{
						// writing the format example
						using(StreamWriter result = File.AppendText(write))
						{
							// some vairable for reading line purpose and writing file
							// the variable was named with the underscore for easy remember what they belong to
							string _info = "";
							string _example = "";
							string _result = "";

							//this is the string which gonna replace the info of database
							string input = "<input type = \"text\" id = \"example_0\" name = \"key_0\" />";
							// count variable
							int i = 0;
							// the string below is use to replace the count variable in the input
							// input = ".. 0 .. 0" -> input = ".. 1 .. 1" -> ...
							string count = "";
							string previous_count = "0";

							// read through the line, of course, read two file at the same time
							/*
							* At first, the code is this
							* while(info.ReadLine() != null && example.ReadLine() != null)
							* {
							*  	// then assign them to the string
							*   _info = info.ReadLine();
							*   _example = example.ReadLine();
							* }
							* this cause a bug, because the file read line two times, means it will skip the odd line
							*/
							while((_info = info.ReadLine()) != null && (_example = example.ReadLine()) != null)
							{
								// for sure, if the example has the word we are looking for
								if(_example.Contains(_info))
								{
									// replace the keyword with the right input and assign it
									_result = _example.Replace(_info, input);
								}
								
								// write it to the format example, end up with a new line
								// WriteLine();
								result.WriteLine(_result);

								// increase the count variable so it will work the way we want
								i++;
								// convert Int32 to String
								count = i.ToString();
								// if the input has the previous state(in the first state previous_count is "0", match with the first input)
								// replace the input with the new state
								// this is count = "1" -> input would be replaced
								if(input.Contains(previous_count))
								{
									input = input.Replace(previous_count, count);
								}
								//update the previous_count
								previous_count = count;
							}
						}
					}
				}
			}
			// if any errors occur, log out it and don't stop the program
			catch(Exception e)
			{
				Console.WriteLine(e.ToString());
			}
		}
	}
}