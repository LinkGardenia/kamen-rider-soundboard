@echo off
title Kamen Rider Soundboard - Build EXE

set "FLUTTER=C:\flutter\bin\flutter.bat"
set "PROJECT=C:\kamen_rider_app"

cd /d "%PROJECT%"
if errorlevel 1 (
    echo [FAIL] Cannot find C:\kamen_rider_app
    pause
    exit /b 1
)

echo ========================================
echo   Kamen Rider Soundboard - Build EXE
echo ========================================
echo.
echo Project: %PROJECT%
echo.

echo [1/3] Getting dependencies...
call "%FLUTTER%" pub get
if errorlevel 1 (
    echo [FAIL] pub get failed!
    pause
    exit /b 1
)
echo [ OK ] Done.
echo.

echo [2/3] Setting up Windows platform...
call "%FLUTTER%" create --platforms=windows . --force
echo [ OK ] Done.
echo.

echo [3/3] Building Release EXE (5-10 minutes)...
call "%FLUTTER%" build windows --release
if errorlevel 1 (
    echo [WARN] Release failed, trying debug...
    call "%FLUTTER%" build windows --debug
)

echo.
echo ========================================
if exist "build\windows\x64\runner\Release\kamen_rider_soundboard.exe" (
    echo   BUILD SUCCESS!
    start explorer "build\windows\x64\runner\Release"
) else if exist "build\windows\x64\runner\Debug\kamen_rider_soundboard.exe" (
    echo   BUILD SUCCESS (Debug)!
    start explorer "build\windows\x64\runner\Debug"
) else (
    echo   BUILD FAILED!
)

echo.
pause
