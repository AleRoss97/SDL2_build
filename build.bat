@echo off

set DEFINITIONS= ^
	-DDLL_EXPORT ^
	-D_DEBUG ^
	-D_WINDOWS ^
	-D__MINGW32__ ^
	-D__WINDOWS__ ^
	-DSDL_VIDEO_RENDER_SW ^
	-DSDL_JOYSTICK_DISABLED=1 ^
	-DSDL_HAPTIC_DISABLED=1 ^
	-DSDL_SENSOR_DISABLED=1 ^
	-DSDL_MAIN_HANDLED

rem	-DSDL_TIMERS_DISABLED=1 ^
rem	-DHAVE_LIBC ^

set INCLUDES= ^
	-ISDL2_2_0_16\include

set O_FILES_DIR=compilation
set CURR_PROJ_DIR=currentproject

cls

call :compile_file main.c
call :compile_file RWID_Button.c

echo.
echo DONE!
echo.
exit /b 0

:compile_file

set current_path=%1
set current_name=%current_path:\=_%

echo o Compiling %current_path% ...

if exist %O_FILES_DIR%\%current_name%.o del %O_FILES_DIR%\%current_name%.o
gcc -c %DEFINITIONS% %INCLUDES% %current_path% -o %O_FILES_DIR%\%current_name%.o
copy %current_path% %CURR_PROJ_DIR%\%current_name%.c

exit /b 0
