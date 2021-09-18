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
