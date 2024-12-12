@echo off
setlocal enabledelayedexpansion

:: Set the number of combinations for demonstration
set numCombinations=1000
set counter=0

:: Loop to generate combinations
for /L %%a in (0,1,!numCombinations!) do (
    :: Simulate some work being done (e.g., generating a password)
    set /a counter+=1
    :: Clear the screen
    cls

    :: Print the updated progress message
    echo Generating password !counter! of !numCombinations!...

    :: Slow down the loop (introduces a small delay)
    @REM ping -n 2 127.0.0.1 >nul
)

:: Move to the next line after finishing the progress
echo.

endlocal
