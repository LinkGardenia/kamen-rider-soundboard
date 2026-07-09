# Kamen Rider Soundboard - Windows Setup Script
# Run this on a machine with Flutter SDK installed
# This will add Windows desktop platform support

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Kamen Rider Soundboard - Windows Setup" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

# Check Flutter
$flutter = Get-Command flutter -ErrorAction SilentlyContinue
if (-not $flutter) {
    Write-Host "ERROR: Flutter not found in PATH!" -ForegroundColor Red
    Write-Host "Please install Flutter first: https://docs.flutter.dev/get-started/install/windows"
    exit 1
}

Write-Host "[1/3] Enabling Windows desktop support..." -ForegroundColor Green
flutter config --enable-windows-desktop

Write-Host "[2/3] Creating Windows platform files..." -ForegroundColor Green
Push-Location "$PSScriptRoot\.."
flutter create --platforms=windows .
Pop-Location

Write-Host "[3/3] Installing dependencies..." -ForegroundColor Green
Push-Location "$PSScriptRoot\.."
flutter pub get
Pop-Location

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Windows Setup Complete!" -ForegroundColor Yellow
Write-Host ""
Write-Host "  To build Windows .exe:" -ForegroundColor White
Write-Host "    cd .." -ForegroundColor Cyan
Write-Host "    flutter build windows" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Output: build/windows/x64/runner/Release/" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Green
