@echo off
:: some flow script
echo All folder got the same database.txt file

:: python area
:: ======= BEGIN =======
echo Run python/rearrange_string_python.py
echo Copy result to perl folder
pause
copy "E:\program\PHP\htdocs\project_rearrange_string\python\result.txt" "E:\program\PHP\htdocs\project_rearrange_string\perl"
pause
:: ======= END =======

:: C area
:: ======= BEGIN =======
echo Run C/find_keyword_C.c
echo Copy result to perl folder
pause
copy "E:\program\PHP\htdocs\project_rearrange_string\C\keyword.txt" "E:\program\PHP\htdocs\project_rearrange_string\perl"
pause
:: ======= END =======

:: C# area
:: ======= BEGIN =======
echo Run C#/make_example_Csharp.cs
echo Copy result to perl folder
pause
copy "E:\program\PHP\htdocs\project_rearrange_string\C#\format_example.txt" "E:\program\PHP\htdocs\project_rearrange_string\perl"
pause
:: ======= END =======

:: Perl area
:: ======= BEGIN =======
echo Run perl/make_web_page_perl.pl
echo Copy page to Output folder
pause
copy "E:\program\PHP\htdocs\project_rearrange_string\perl\page.html" "E:\program\PHP\htdocs\project_rearrange_string\Output for this project"
pause
echo Delete the page that make by perl in the perl folder
del "E:\program\PHP\htdocs\project_rearrange_string\perl\page.html"
pause
:: ======= END =======

:: Text editor area
:: ======= BEGIN =======
echo Add some library to page.html and create final_page.html copy out the folder
pause
copy "E:\program\PHP\htdocs\project_rearrange_string\Output for this project\*.*" "E:\program\PHP\htdocs\project_rearrange_string"
pause
:: ======= END =======

:: Batch script area
:: ======= BEGIN =======
echo Run the program right now
pause
start run_page.bat
:: ======= END =======