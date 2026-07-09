<# 
.SYNOPSIS
  Kamen Rider Soundboard - Resource Download Helper
  Downloads sound effects from Voicemod Tuna and images from HiClipart

.DESCRIPTION
  This script automates downloading Kamen Rider sound effects and images
  from the specified online resources and places them in the correct
  directories for the app.

  Sound Source: Voicemod Tuna (https://tuna.voicemod.net/)
  Image Source: HiClipart (https://www.hiclipart.com/)
#>

param(
    [switch]$Sounds,       # Only download sounds
    [switch]$Images,       # Only download images
    [switch]$All           # Download everything (default)
)

if (-not ($Sounds -or $Images)) { $All = $true }

$base = "$PSScriptRoot\..\assets"
$tempDir = "$env:TEMP\kamen_rider_downloads"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Kamen Rider Soundboard - Resource Downloader" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

# ============================================================
#  Sound Download: Voicemod Tuna
# ============================================================
if ($All -or $Sounds) {
    Write-Host ""
    Write-Host "[SOUNDS] Voicemod Tuna Download Guide" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  1. Open in browser:" -ForegroundColor White
    Write-Host "     https://tuna.voicemod.net/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  2. Search for:" -ForegroundColor White
    Write-Host "     - 'kamen rider henshin'" -ForegroundColor Yellow
    Write-Host "     - 'kamen rider belt'" -ForegroundColor Yellow
    Write-Host "     - 'kamen rider finisher'" -ForegroundColor Yellow
    Write-Host "     - Search in Japanese: '仮面ライダー 変身'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  3. Download .mp3 files to:" -ForegroundColor White
    Write-Host "     $tempDir\sounds\" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  4. Run this script again to auto-organize files" -ForegroundColor White
    Write-Host ""

    # Create sounds temp dir
    New-Item -ItemType Directory -Path "$tempDir\sounds" -Force | Out-Null

    # Open browser to Tuna
    Start-Process "https://tuna.voicemod.net/" 

    Write-Host "  Press Enter after downloading sounds to continue..." -ForegroundColor Magenta
    Read-Host
}

# ============================================================
#  Image Download: HiClipart
# ============================================================
if ($All -or $Images) {
    Write-Host ""
    Write-Host "[IMAGES] HiClipart Download Guide" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  1. Open in browser:" -ForegroundColor White
    Write-Host "     https://www.hiclipart.com/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  2. Search for (transparent PNG):" -ForegroundColor White
    Write-Host "     - 'Kamen Rider Kuuga'" -ForegroundColor Yellow
    Write-Host "     - 'Kamen Rider Ryuki'" -ForegroundColor Yellow
    Write-Host "     - 'Kamen Rider Faiz'" -ForegroundColor Yellow
    Write-Host "     - 'Kamen Rider Decade'" -ForegroundColor Yellow
    Write-Host "     - 'Kamen Rider Build'" -ForegroundColor Yellow
    Write-Host "     - 'Kamen Rider Geats'" -ForegroundColor Yellow
    Write-Host "     - 'Kamen Rider Gotchard'" -ForegroundColor Yellow
    Write-Host "     (Search for each rider you want images for)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  3. Download .png files to:" -ForegroundColor White
    Write-Host "     $tempDir\images\" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  4. Run this script again to auto-organize files" -ForegroundColor White
    Write-Host ""

    New-Item -ItemType Directory -Path "$tempDir\images" -Force | Out-Null
    Start-Process "https://www.hiclipart.com/search?k=kamen+rider"

    Write-Host "  Press Enter after downloading images to continue..." -ForegroundColor Magenta
    Read-Host
}

# ============================================================
#  Auto-Organize: Place files in correct directories
# ============================================================
Write-Host ""
Write-Host "[ORGANIZE] Sorting downloaded files..." -ForegroundColor Green

# Sound file mapping (fuzzy match downloaded filenames to rider IDs)
$soundMap = @{
    "kuuga" = @("kuuga","kuga","空我")
    "ryuki" = @("ryuki","龙骑")
    "knight" = @("knight","夜骑")
    "faiz" = @("faiz","555","phi")
    "blade" = @("blade","剑")
    "deno" = @("deno","den-o","电王")
    "decade" = @("decade","帝骑")
    "w" = @("double","w")
    "ooo" = @("ooo","oz")
    "fourze" = @("fourze","火箭")
    "wizard" = @("wizard","巫骑")
    "gaim" = @("gaim","铠武")
    "drive" = @("drive","驰骑")
    "exaid" = @("exaid","ex-aid","艾克赛德")
    "build" = @("build","创骑")
    "zio" = @("zio","zi-o","时王")
    "zero_one" = @("zero-one","01","零一")
    "saber" = @("saber","圣刃")
    "revi" = @("revi","revice","利维")
    "geats" = @("geats","极狐")
    "gotchard" = @("gotchard","歌查德")
}

# Organize sounds
$soundFiles = Get-ChildItem -Path "$tempDir\sounds" -Filter "*.mp3" -ErrorAction SilentlyContinue
$organizedCount = 0

foreach ($file in $soundFiles) {
    $name = $file.BaseName.ToLower()
    foreach ($rider in $soundMap.Keys) {
        foreach ($keyword in $soundMap[$rider]) {
            if ($name -match $keyword) {
                $destDir = "$base\sounds\$rider\$rider"
                New-Item -ItemType Directory -Path $destDir -Force | Out-Null
                
                # Try to categorize by filename
                $destName = "henshin.mp3"
                if ($name -match "henshin|变身|change") { $destName = "henshin.mp3" }
                elseif ($name -match "kick|finish|必杀|final") { $destName = "hissatsu.mp3" }
                elseif ($name -match "belt|腰带|driver") { $destName = "belt.mp3" }
                elseif ($name -match "weapon|武器|sword") { $destName = "weapon.mp3" }
                elseif ($name -match "line|台词|voice") { $destName = "lines.mp3" }
                
                Copy-Item $file.FullName -Destination "$destDir\$destName" -Force
                Write-Host "  Sound: $($file.Name) -> $rider/$destName" -ForegroundColor Gray
                $organizedCount++
                break
            }
        }
    }
}

# Organize images
$imageFiles = Get-ChildItem -Path "$tempDir\images" -Filter "*.png" -ErrorAction SilentlyContinue

foreach ($file in $imageFiles) {
    $name = $file.BaseName.ToLower()
    foreach ($rider in $soundMap.Keys) {
        foreach ($keyword in $soundMap[$rider]) {
            if ($name -match $keyword) {
                $destDir = "$base\images\riders"
                New-Item -ItemType Directory -Path $destDir -Force | Out-Null
                Copy-Item $file.FullName -Destination "$destDir\$rider.png" -Force
                Write-Host "  Image: $($file.Name) -> riders/$rider.png" -ForegroundColor Gray
                $organizedCount++
                break
            }
        }
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Download Complete!" -ForegroundColor Yellow
Write-Host "  Organized: $organizedCount files" -ForegroundColor White
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor White
Write-Host "  1. Run: .\scripts\setup_windows.ps1" -ForegroundColor Cyan
Write-Host "  2. Build: flutter build windows" -ForegroundColor Cyan
Write-Host "  3. Run: build\windows\x64\runner\Release\kamen_rider_soundboard.exe" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Green
