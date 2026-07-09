@echo off
setlocal enabledelayedexpansion
title Kamen Rider Soundboard - Build

set "FLUTTER=C:\flutter\bin\flutter.bat"
set "PROJECT=c:\Code\新建文件夹\kamen_rider_app"
set "LOG=%PROJECT%\build_log.txt"

echo Build started at %date% %time% > "%LOG%"

echo ========================================
echo   Kamen Rider Soundboard - Build EXE  
echo ========================================
echo.
echo Log: %LOG%
echo.

cd /d "%PROJECT%"
if errorlevel 1 (
    echo [FAIL] Cannot enter project folder!
    pause
    exit /b 1
)

echo [1/4] Enabling Windows desktop support...
call "%FLUTTER%" config --enable-windows-desktop >> "%LOG%" 2>&1
if errorlevel 1 (
    echo [FAIL] Flutter config failed!
    type "%LOG%"
    pause
    exit /b 1
)
echo [ OK ] Windows desktop enabled.

echo.
echo [2/4] Getting dependencies...
call "%FLUTTER%" pub get >> "%LOG%" 2>&1
if errorlevel 1 (
    echo [FAIL] pub get failed!
    type "%LOG%"
    pause
    exit /b 1
)
echo [ OK ] Dependencies installed.

echo.
echo [3/4] Creating Windows platform files...
call "%FLUTTER%" create --platforms=windows . >> "%LOG%" 2>&1
echo [ OK ] Platform files ready.

echo.
echo [4/4] Building Release EXE (5-10 minutes)...
call "%FLUTTER%" build windows --release >> "%LOG%" 2>&1
if errorlevel 1 (
    echo [WARN] Release failed, trying debug...
    call "%FLUTTER%" build windows --debug >> "%LOG%" 2>&1
)

echo.
echo ========================================
if exist "build\windows\x64\runner\Release\kamen_rider_soundboard.exe" (
    echo   BUILD SUCCESS!
    echo   EXE: build\windows\x64\runner\Release\kamen_rider_soundboard.exe
    echo ========================================
    start explorer "build\windows\x64\runner\Release"
) else if exist "build\windows\x64\runner\Debug\kamen_rider_soundboard.exe" (
    echo   BUILD SUCCESS (Debug)!
    echo   EXE: build\windows\x64\runner\Debug\kamen_rider_soundboard.exe
    echo ========================================
    start explorer "build\windows\x64\runner\Debug"
) else (
    echo   BUILD FAILED!
    echo ========================================
    echo Last 20 lines of log:
    powershell -Command "Get-Content '%LOG%' -Tail 20"
)

echo.
pause
