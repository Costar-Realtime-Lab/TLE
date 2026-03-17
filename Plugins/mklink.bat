@echo off

:: set "DIR=the path MediaPipe4U files are stored in" 
set "DIR="E:\AI\M4U_UE5_6_20250818"

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
 
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
 
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
 
    "%temp%\getadmin.vbs"
    exit /B
 
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


pushd %~dp0

call:link_dir "GStreamer"
call:link_dir "MediaPipe4U"
call:link_dir "MediaPipe4UGStreamer"
call:link_dir "MediaPipe4UMotion"
call:link_dir "MediaPipe4ULiveLink"
call:link_dir "MediaPipe4UBVH"
call:link_dir "MediaPipe4UNvAR"
call:link_dir "MediaPipe4USpeech"
call:link_dir "MediaPipe4ULLM"
call:link_dir "MediaPipe4ULLMSpeech"

pause > nul
exit

:link_dir
rmdir "%~1"
mklink /D "%~1" "%DIR%\%~1"
goto:eof