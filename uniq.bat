@echo off

rem ****************************************
rem uniq.bat: Approximates UN*X uniq command
rem Author:   Bill Chatfield
rem Usage:    uniq INPUT_FILE > OUTPUT_FILE
rem Issues:   1) Only the simple usage works
rem           2) Blank lines are removed
rem ****************************************

rem Make variables inside loops work
setlocal ENABLEDELAYEDEXPANSION

rem Count the arguments
set argCount=0
for %%I in (%*) do set /a argCount+=1

rem Check for incorrect number of arguments
if %argCount% NEQ 1 (
    echo Stupid user
    exit /b 1
)

rem Remove duplicate lines
set lastLine=
for /f "delims=" %%L in (%*) do (
    if "!lastLine!" NEQ "%%L" (
       echo %%L
       set lastLine=%%L
    )
)

endlocal
