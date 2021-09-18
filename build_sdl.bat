@echo off

rem ----------------------------------------------------------------
rem BUILD CONFIGURATION
rem ----------------------------------------------------------------

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
	-DSDL_MAIN_HANDLED ^
	-DSDL_DYNAMIC_API=0

set INCLUDES= ^
	-ISDL2_2_0_16\include

set O_FILES_DIR=compilation
set CURR_PROJ_DIR=currentproject

rem ----------------------------------------------------------------
rem MAIN PROGRAM
rem ----------------------------------------------------------------

cls

del %O_FILES_DIR%\*
del %CURR_PROJ_DIR%\*

call :compile_file SDL2_2_0_16\src\video\yuv2rgb\yuv_rgb.c
call :compile_file SDL2_2_0_16\src\loadso\windows\SDL_sysloadso.c
call :compile_file SDL2_2_0_16\src\cpuinfo\SDL_cpuinfo.c
call :compile_file SDL2_2_0_16\src\timer\SDL_timer.c
call :compile_file SDL2_2_0_16\src\timer\windows\SDL_systimer.c
call :compile_file SDL2_2_0_16\src\atomic\SDL_atomic.c
call :compile_file SDL2_2_0_16\src\atomic\SDL_spinlock.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_crc32.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_getenv.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_iconv.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_malloc.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_qsort.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_stdlib.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_string.c
call :compile_file SDL2_2_0_16\src\stdlib\SDL_strtokr.c
call :compile_file SDL2_2_0_16\src\file\SDL_rwops.c
call :compile_file SDL2_2_0_16\src\video\SDL_egl.c
call :compile_file SDL2_2_0_16\src\events\SDL_clipboardevents.c
call :compile_file SDL2_2_0_16\src\events\SDL_displayevents.c
call :compile_file SDL2_2_0_16\src\events\SDL_dropevents.c
call :compile_file SDL2_2_0_16\src\events\SDL_events.c
call :compile_file SDL2_2_0_16\src\events\SDL_gesture.c
call :compile_file SDL2_2_0_16\src\events\SDL_keyboard.c
call :compile_file SDL2_2_0_16\src\events\SDL_mouse.c
call :compile_file SDL2_2_0_16\src\events\SDL_quit.c
call :compile_file SDL2_2_0_16\src\events\SDL_touch.c
call :compile_file SDL2_2_0_16\src\events\SDL_windowevents.c
call :compile_file SDL2_2_0_16\src\thread\SDL_thread.c
call :compile_file SDL2_2_0_16\src\thread\windows\SDL_sysmutex.c
call :compile_file SDL2_2_0_16\src\thread\windows\SDL_syssem.c
call :compile_file SDL2_2_0_16\src\thread\windows\SDL_systhread.c
call :compile_file SDL2_2_0_16\src\thread\windows\SDL_systls.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsclipboard.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsevents.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsframebuffer.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowskeyboard.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsmessagebox.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsmodes.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsmouse.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsopengl.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsopengles.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsshape.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsvideo.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowsvulkan.c
call :compile_file SDL2_2_0_16\src\video\windows\SDL_windowswindow.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit_0.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit_1.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit_A.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit_auto.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit_copy.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit_N.c
call :compile_file SDL2_2_0_16\src\video\SDL_blit_slow.c
call :compile_file SDL2_2_0_16\src\video\SDL_bmp.c
call :compile_file SDL2_2_0_16\src\video\SDL_clipboard.c
call :compile_file SDL2_2_0_16\src\video\SDL_fillrect.c
call :compile_file SDL2_2_0_16\src\video\SDL_pixels.c
call :compile_file SDL2_2_0_16\src\video\SDL_rect.c
call :compile_file SDL2_2_0_16\src\video\SDL_RLEaccel.c
call :compile_file SDL2_2_0_16\src\video\SDL_shape.c
call :compile_file SDL2_2_0_16\src\video\SDL_stretch.c
call :compile_file SDL2_2_0_16\src\video\SDL_surface.c
call :compile_file SDL2_2_0_16\src\video\SDL_video.c
call :compile_file SDL2_2_0_16\src\video\SDL_vulkan_utils.c
call :compile_file SDL2_2_0_16\src\video\SDL_yuv.c
call :compile_file SDL2_2_0_16\src\audio\SDL_audio.c
call :compile_file SDL2_2_0_16\src\audio\SDL_audiocvt.c
call :compile_file SDL2_2_0_16\src\audio\SDL_audiodev.c
call :compile_file SDL2_2_0_16\src\audio\SDL_audiotypecvt.c
call :compile_file SDL2_2_0_16\src\audio\SDL_mixer.c
call :compile_file SDL2_2_0_16\src\audio\SDL_wave.c
call :compile_file SDL2_2_0_16\src\audio\wasapi\SDL_wasapi.c
call :compile_file SDL2_2_0_16\src\audio\wasapi\SDL_wasapi_win32.c
call :compile_file SDL2_2_0_16\src\core\windows\SDL_hid.c
call :compile_file SDL2_2_0_16\src\core\windows\SDL_windows.c
call :compile_file SDL2_2_0_16\src\core\windows\SDL_xinput.c
call :compile_file SDL2_2_0_16\src\SDL.c
call :compile_file SDL2_2_0_16\src\SDL_assert.c
call :compile_file SDL2_2_0_16\src\SDL_dataqueue.c
call :compile_file SDL2_2_0_16\src\SDL_error.c
call :compile_file SDL2_2_0_16\src\SDL_hints.c
call :compile_file SDL2_2_0_16\src\SDL_log.c
call :compile_file SDL2_2_0_16\src\render\SDL_d3dmath.c
call :compile_file SDL2_2_0_16\src\render\SDL_render.c
call :compile_file SDL2_2_0_16\src\render\SDL_yuv_sw.c
call :compile_file SDL2_2_0_16\src\render\software\SDL_blendfillrect.c
call :compile_file SDL2_2_0_16\src\render\software\SDL_blendline.c
call :compile_file SDL2_2_0_16\src\render\software\SDL_blendpoint.c
call :compile_file SDL2_2_0_16\src\render\software\SDL_drawline.c
call :compile_file SDL2_2_0_16\src\render\software\SDL_drawpoint.c
call :compile_file SDL2_2_0_16\src\render\software\SDL_render_sw.c
call :compile_file SDL2_2_0_16\src\render\software\SDL_rotate.c
call :compile_file SDL2_2_0_16\src\libm\e_atan2.c
call :compile_file SDL2_2_0_16\src\libm\e_exp.c
call :compile_file SDL2_2_0_16\src\libm\e_fmod.c
call :compile_file SDL2_2_0_16\src\libm\e_log.c
call :compile_file SDL2_2_0_16\src\libm\e_log10.c
call :compile_file SDL2_2_0_16\src\libm\e_pow.c
call :compile_file SDL2_2_0_16\src\libm\e_rem_pio2.c
call :compile_file SDL2_2_0_16\src\libm\e_sqrt.c
call :compile_file SDL2_2_0_16\src\libm\k_cos.c
call :compile_file SDL2_2_0_16\src\libm\k_rem_pio2.c
call :compile_file SDL2_2_0_16\src\libm\k_sin.c
call :compile_file SDL2_2_0_16\src\libm\k_tan.c
call :compile_file SDL2_2_0_16\src\libm\s_atan.c
call :compile_file SDL2_2_0_16\src\libm\s_copysign.c
call :compile_file SDL2_2_0_16\src\libm\s_cos.c
call :compile_file SDL2_2_0_16\src\libm\s_fabs.c
call :compile_file SDL2_2_0_16\src\libm\s_floor.c
call :compile_file SDL2_2_0_16\src\libm\s_scalbn.c
call :compile_file SDL2_2_0_16\src\libm\s_sin.c
call :compile_file SDL2_2_0_16\src\libm\s_tan.c

echo.
echo DONE!
echo.
exit /b 0

rem ----------------------------------------------------------------
rem COMPILE FILE FUNCTION
rem ----------------------------------------------------------------

:compile_file

set current_path=%1
set current_name=%current_path:\=_%

echo o Compiling %current_path% ...

gcc -c %DEFINITIONS% %INCLUDES% %current_path% -o %O_FILES_DIR%\%current_name%.o
copy %current_path% %CURR_PROJ_DIR%\%current_name%.c

exit /b 0

rem ----------------------------------------------------------------
