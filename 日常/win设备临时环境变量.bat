@echo off

set armgccdir=E:\cmake_gcc_mingw\gcc-arm-none-eabi-10-2020-q4-major-win32\bin
set  cmakedir=E:\cmake_gcc_mingw\cmake-3.20.5-windows-i386\bin
set  mingwdir=E:\cmake_gcc_mingw\mingw64\bin
set path=^
%armgccdir%;^
%cmakedir%;^
%mingwdir%;^
%path%

if "%1"=="make"	 goto :MAKE
if "%1"=="clean" goto :CLEAN

:MAKE
call build.cmd %1
goto :End

:CLEAN
rd /s/q ..\build
ping -n 2 127.0.0.1>nul
goto :End

:End
pause

