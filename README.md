# SDL2_build
Scripts for building SDL2 source code with vanilla GCC.
It's actually really easy to build SDL2 source code with the GCC compiler only.

This script was made for
- Windows 10 x64
- gcc (MinGW-W64 i686-posix-dwarf, built by Brecht Sanders) 11.2.0 (download here https://winlibs.com/)
- SDL 2.0.16
But shouldn't be a problem building with other platforms.

Only the following modules will be built:

- atomic
- audio (WASAPI)
- core
- cpuinfo
- events
- file
- libm
- loadso
- render
- stdlib
- thread
- timer
- video (SOFTWARE RENDERING)

# Modification to the source code

Only two files were modified from the SDL2-2.0.16.zip archive as downloaded from https://www.libsdl.org/download-2.0.php

## MOD1: src\dynapi\SDL_dynapi.h

We need to disable the dynamic api. Do this wisely by reading the relative documentation, that can be found in the doc folder. The dynamic api should be disabled since we are embedding SDL directly in our application:

FROM:
```
#ifdef SDL_DYNAMIC_API  /* Tried to force it on the command line? */
#error Nope, you have to edit this file to force this off.
#endif
```
TO:
```
#ifdef SDL_DYNAMIC_API  /* Tried to force it on the command line? */
// #error Nope, you have to edit this file to force this off.
#endif
```

## MOD2: include\SDL_config_windows.h

This is the main configuration file for the platform i'm building with. My file is in the repo.

# Build configurations

Along with SDL_config_windows, defines configure the SDL build.

*Defines (Pass to compiler with -D)*

```
DLL_EXPORT
_DEBUG
_WINDOWS
__MINGW32__
__WINDOWS__
SDL_VIDEO_RENDER_SW
SDL_JOYSTICK_DISABLED=1
SDL_HAPTIC_DISABLED=1
SDL_SENSOR_DISABLED=1
SDL_MAIN_HANDLED
```

*Includes - Pass to compiler with -I*

```
SDL2_2_0_16\include
```

*Libraries - Pass to linker with -l*

```
gdi32
version
winmm
imm32
ole32
oleaut32
strmiids
```

*Files to compile*
```
src\video\yuv2rgb\yuv_rgb.c
src\loadso\windows\SDL_sysloadso.c
src\cpuinfo\SDL_cpuinfo.c
src\timer\SDL_timer.c
src\timer\windows\SDL_systimer.c
src\atomic\SDL_atomic.c
src\atomic\SDL_spinlock.c
src\stdlib\SDL_crc32.c
src\stdlib\SDL_getenv.c
src\stdlib\SDL_iconv.c
src\stdlib\SDL_malloc.c
src\stdlib\SDL_qsort.c
src\stdlib\SDL_stdlib.c
src\stdlib\SDL_string.c
src\stdlib\SDL_strtokr.c
src\file\SDL_rwops.c
src\video\SDL_egl.c
src\events\SDL_clipboardevents.c
src\events\SDL_displayevents.c
src\events\SDL_dropevents.c
src\events\SDL_events.c
src\events\SDL_gesture.c
src\events\SDL_keyboard.c
src\events\SDL_mouse.c
src\events\SDL_quit.c
src\events\SDL_touch.c
src\events\SDL_windowevents.c
src\thread\SDL_thread.c
src\thread\windows\SDL_sysmutex.c
src\thread\windows\SDL_syssem.c
src\thread\windows\SDL_systhread.c
src\thread\windows\SDL_systls.c
src\video\windows\SDL_windowsclipboard.c
src\video\windows\SDL_windowsevents.c
src\video\windows\SDL_windowsframebuffer.c
src\video\windows\SDL_windowskeyboard.c
src\video\windows\SDL_windowsmessagebox.c
src\video\windows\SDL_windowsmodes.c
src\video\windows\SDL_windowsmouse.c
src\video\windows\SDL_windowsopengl.c
src\video\windows\SDL_windowsopengles.c
src\video\windows\SDL_windowsshape.c
src\video\windows\SDL_windowsvideo.c
src\video\windows\SDL_windowsvulkan.c
src\video\windows\SDL_windowswindow.c
src\video\SDL_blit.c
src\video\SDL_blit_0.c
src\video\SDL_blit_1.c
src\video\SDL_blit_A.c
src\video\SDL_blit_auto.c
src\video\SDL_blit_copy.c
src\video\SDL_blit_N.c
src\video\SDL_blit_slow.c
src\video\SDL_bmp.c
src\video\SDL_clipboard.c
src\video\SDL_fillrect.c
src\video\SDL_pixels.c
src\video\SDL_rect.c
src\video\SDL_RLEaccel.c
src\video\SDL_shape.c
src\video\SDL_stretch.c
src\video\SDL_surface.c
src\video\SDL_video.c
src\video\SDL_vulkan_utils.c
src\video\SDL_yuv.c
src\audio\SDL_audio.c
src\audio\SDL_audiocvt.c
src\audio\SDL_audiodev.c
src\audio\SDL_audiotypecvt.c
src\audio\SDL_mixer.c
src\audio\SDL_wave.c
src\audio\wasapi\SDL_wasapi.c
src\audio\wasapi\SDL_wasapi_win32.c
src\core\windows\SDL_hid.c
src\core\windows\SDL_windows.c
src\core\windows\SDL_xinput.c
src\SDL.c
src\SDL_assert.c
src\SDL_dataqueue.c
src\SDL_error.c
src\SDL_hints.c
src\SDL_log.c
src\render\SDL_d3dmath.c
src\render\SDL_render.c
src\render\SDL_yuv_sw.c
src\render\software\SDL_blendfillrect.c
src\render\software\SDL_blendline.c
src\render\software\SDL_blendpoint.c
src\render\software\SDL_drawline.c
src\render\software\SDL_drawpoint.c
src\render\software\SDL_render_sw.c
src\render\software\SDL_rotate.c
src\libm\e_atan2.c
src\libm\e_exp.c
src\libm\e_fmod.c
src\libm\e_log.c
src\libm\e_log10.c
src\libm\e_pow.c
src\libm\e_rem_pio2.c
src\libm\e_sqrt.c
src\libm\k_cos.c
src\libm\k_rem_pio2.c
src\libm\k_sin.c
src\libm\k_tan.c
src\libm\s_atan.c
src\libm\s_copysign.c
src\libm\s_cos.c
src\libm\s_fabs.c
src\libm\s_floor.c
src\libm\s_scalbn.c
src\libm\s_sin.c
src\libm\s_tan.c
```
