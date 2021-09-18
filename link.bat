@echo off

set LIBS= ^
	-lgdi32 ^
	-lversion ^
	-lwinmm ^
	-limm32 ^
	-lole32 ^
	-loleaut32 ^
	-lstrmiids


set O_FILES_DIR=compilation

rem gcc %O_FILES_DIR%\* %LIBS% -o output.exe > missing_dep.txt 2>&1
rem pretty_print_missing_dep.py

gcc %O_FILES_DIR%\* %LIBS% -o output.exe
