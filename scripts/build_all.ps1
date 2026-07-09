# Kamen Rider Soundboard - One-Click Build Script
# Run this on a machine with Flutter SDK installed
# Does everything: generate assets -> setup platforms -> build

param(
    [switch]$Windows,      # Build Windows .exe only
    [switch]$Android,      # Build Android APK only
    [switch]$All           # Build all platforms (default)
)

if (-not ($Windows -or $Android)) { $All = $true }

$root = Split-Path $PSScriptRoot -Parent

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Kamen Rider Soundboard - Build Script" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

# Step 1: Generate placeholder assets
Write-Host "`n[1/4] Generating placeholder assets..." -ForegroundColor Green
Powershell -ExecutionPolicy Bypass -File "$PSScriptRoot\generate_assets.ps1"

# Step 2: Setup platforms
Write-Host "`n[2/4] Setting up platforms..." -ForegroundColor Green
flutter config --enable-windows-desktop
Push-Location $root
flutter create --platforms=windows,android .
flutter pub get
Pop-Location

# Step 3: Download resources (interactive)
Write-Host "`n[3/4] Resource downloader..." -ForegroundColor Green
Write-Host "Do you want to download sounds/images from online sources? (y/n)" -ForegroundColor Yellow
$download = Read-Host
if ($download -eq 'y') {
    Powershell -ExecutionPolicy Bypass -File "$PSScriptRoot\download_resources.ps1"
}

# Step 4: Build
Write-Host "`n[4/4] Building..." -ForegroundColor Green

if ($All -or $Windows) {
    Write-Host "Building Windows .exe..." -ForegroundColor Cyan
    Push-Location $root
    flutter build windows --release
    Pop-Location
    Write-Host "  Windows .exe: build/windows/x64/runner/Release/kamen_rider_soundboard.exe" -ForegroundColor White
}

if ($All -or $Android) {
    Write-Host "Building Android APK..." -ForegroundColor Cyan
    Push-Location $root
    flutter build apk --release
    Pop-Location
    Write-Host "  Android APK: build/app/outputs/flutter-apk/app-release.apk" -ForegroundColor White
}

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "  Build Complete!" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Green
