Add-Type -AssemblyName System.Drawing

$base = "$PSScriptRoot\..\assets"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Kamen Rider Soundboard - Asset Generator" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

$riderColors = @{
    "kuuga" = @("#CC0000", "#CC0000"); "ryuki" = @("#FF0000", "#FF0000")
    "knight" = @("#000080", "#000080"); "zolda" = @("#008000", "#008000")
    "ouja" = @("#800080", "#800080"); "faiz" = @("#FFFF00", "#FF0000")
    "blade" = @("#0000CD", "#4169E1"); "deno" = @("#FF4500", "#FF4500")
    "decade" = @("#FF00FF", "#FF00FF"); "w" = @("#00FF00", "#00FF00")
    "ooo" = @("#FFD700", "#00FF00"); "fourze" = @("#FFFFFF", "#FFFFFF")
    "wizard" = @("#FF0000", "#FF0000"); "gaim" = @("#FF8C00", "#0000FF")
    "drive" = @("#FF0000", "#FF0000"); "exaid" = @("#FF69B4", "#FF69B4")
    "build" = @("#FF0000", "#FF0000"); "zio" = @("#FF00FF", "#FF00FF")
    "zero_one" = @("#FFFF00", "#FFFF00"); "saber" = @("#FF0000", "#FF0000")
    "revi" = @("#FF69B4", "#FF69B4"); "geats" = @("#FFFFFF", "#FFFFFF")
    "gotchard" = @("#00BFFF", "#00BFFF")
}

$seriesColors = @{
    "kuuga" = "#CC0000"; "ryuki" = "#FF0000"; "faiz" = "#FFFF00"
    "blade" = "#0000CD"; "deno" = "#FF4500"; "decade" = "#FF00FF"
    "w" = "#00FF00"; "ooo" = "#FFD700"; "fourze" = "#FFFFFF"
    "wizard" = "#FF0000"; "gaim" = "#FF8C00"; "drive" = "#FF0000"
    "exaid" = "#FF69B4"; "build" = "#FF0000"; "zio" = "#FF00FF"
    "zero_one" = "#FFFF00"; "saber" = "#FF0000"; "revice" = "#FF69B4"
    "geats" = "#FFFFFF"; "gotchard" = "#00BFFF"
}

function New-PlaceholderImage {
    param([string]$Path, [string]$Color1, [string]$Color2, [int]$W = 200, [int]$H = 200)
    $dir = Split-Path $Path -Parent
    if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    if (Test-Path $Path) { return }
    $bmp = New-Object System.Drawing.Bitmap($W, $H)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $c1 = [System.Drawing.ColorTranslator]::FromHtml($Color1)
    $c2 = [System.Drawing.ColorTranslator]::FromHtml($Color2)
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Point(0, 0)),
        (New-Object System.Drawing.Point($W, $H)), $c1, $c2)
    $g.FillRectangle($brush, 0, 0, $W, $H)
    $pen = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 4)
    $g.DrawRectangle($pen, 2, 2, $W-4, $H-4)
    $font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
    $textBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $name = [System.IO.Path]::GetFileNameWithoutExtension($Path)
    $g.DrawString($name, $font, $textBrush, 10, $H/2-10)
    $bmp.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose(); $bmp.Dispose()
}

Write-Host "[1/4] Generating rider images..." -ForegroundColor Green
foreach ($rider in $riderColors.Keys) {
    $path = "$base\images\riders\$rider.png"
    New-PlaceholderImage -Path $path -Color1 $riderColors[$rider][0] -Color2 $riderColors[$rider][1] -W 300 -H 400
}

Write-Host "[2/4] Generating series covers..." -ForegroundColor Green
foreach ($series in $seriesColors.Keys) {
    New-PlaceholderImage -Path "$base\images\series\$($series)_cover.png" -Color1 $seriesColors[$series] -Color2 "#1A1A2E" -W 300 -H 400
    New-PlaceholderImage -Path "$base\images\series\$($series)_logo.png" -Color1 $seriesColors[$series] -Color2 "#000000" -W 300 -H 100
}

Write-Host "[3/4] Generating form images..." -ForegroundColor Green
$forms = @{
    "kuuga_mighty"=@("#CC0000","#FF4444"); "kuuga_dragon"=@("#0000FF","#CC0000")
    "kuuga_pegasus"=@("#00FF00","#CC0000"); "kuuga_titan"=@("#800080","#CC0000")
    "kuuga_ultimate"=@("#000000","#CC0000"); "ryuki_survive"=@("#FF0000","#FF6600")
    "knight_survive"=@("#000080","#0000FF"); "faiz_accel"=@("#FF0000","#FF6666")
    "faiz_blaster"=@("#FF0000","#FF0000"); "blade_jack"=@("#FFD700","#4169E1")
    "blade_king"=@("#FFD700","#4169E1"); "deno_sword"=@("#FF4500","#FF0000")
    "deno_rod"=@("#0000FF","#FF4500"); "deno_axe"=@("#FFD700","#FF4500")
    "deno_gun"=@("#800080","#FF4500"); "decade_complete"=@("#FF00FF","#FF00FF")
    "w_cj"=@("#00FF00","#000000"); "w_hm"=@("#FF0000","#C0C0C0")
    "w_lt"=@("#FFFF00","#0000FF"); "w_xtreme"=@("#00FF00","#FFFFFF")
    "ooo_tatoba"=@("#FF0000","#FFFF00"); "ooo_gata"=@("#00FF00","#FF0000")
    "ooo_lato"=@("#FFFF00","#FF0000"); "ooo_puto"=@("#800080","#00FFFF")
    "fourze_base"=@("#FFFFFF","#FFFFFF"); "fourze_elek"=@("#FFD700","#FFFFFF")
    "fourze_fire"=@("#FF0000","#FFFFFF"); "fourze_cosmic"=@("#0000FF","#FFFFFF")
    "wizard_flame"=@("#FF0000","#FF0000"); "wizard_water"=@("#0000FF","#0000FF")
    "wizard_hurricane"=@("#00FF00","#00FF00"); "wizard_land"=@("#FFD700","#FFD700")
    "gaim_orange"=@("#FF8C00","#0000FF"); "gaim_kachidoki"=@("#FF8C00","#0000FF")
    "gaim_kiwami"=@("#FFD700","#0000FF"); "drive_speed"=@("#FF0000","#FF0000")
    "drive_wild"=@("#000000","#FF0000"); "drive_technic"=@("#00FF00","#FF0000")
    "exaid_lv2"=@("#FF69B4","#00FF00"); "exaid_lv99"=@("#FFD700","#FF69B4")
    "exaid_muteki"=@("#FFD700","#FF69B4"); "build_rt"=@("#FF0000","#0000FF")
    "build_sparkling"=@("#FF0000","#0000FF"); "build_genius"=@("#FFFFFF","#FF0000")
    "zio_ii"=@("#FF00FF","#FF00FF"); "zio_ohma"=@("#FFD700","#FF00FF")
    "zero_one_rising"=@("#FFFF00","#000000"); "zero_one_shining"=@("#00FFFF","#FFFF00")
    "zero_one_two"=@("#FF0000","#FFFF00"); "saber_brave"=@("#FF0000","#FFFFFF")
    "saber_crimson"=@("#FF0000","#FF0000"); "saber_xross"=@("#0000FF","#FF0000")
    "revi_rex"=@("#FF69B4","#00BFFF"); "revi_barid"=@("#FF69B4","#00BFFF")
    "geats_magnum"=@("#FFFFFF","#FF0000"); "geats_boost"=@("#FF0000","#FFFFFF")
    "geats_ix"=@("#FFFFFF","#FF0000")
    "gotchard_steamhopper"=@("#00BFFF","#FF8C00"); "gotchard_super"=@("#FFD700","#00BFFF")
}
foreach ($f in $forms.Keys) {
    New-PlaceholderImage -Path "$base\images\riders\$f.png" -Color1 $forms[$f][0] -Color2 $forms[$f][1] -W 300 -H 400
}
Write-Host "  OK: $($forms.Count) form images"

Write-Host "[4/4] Generating theme previews and symbols..." -ForegroundColor Green
New-PlaceholderImage -Path "$base\images\themes\zzz_preview.png" -Color1 "#FF6B35" -Color2 "#00D4FF" -W 400 -H 200
New-PlaceholderImage -Path "$base\images\themes\cyber_preview.png" -Color1 "#00FF88" -Color2 "#FF00FF" -W 400 -H 200
New-PlaceholderImage -Path "$base\images\themes\showa_preview.png" -Color1 "#CC0000" -Color2 "#FFD700" -W 400 -H 200
New-PlaceholderImage -Path "$base\images\themes\heisei_preview.png" -Color1 "#7B2FFF" -Color2 "#FF0000" -W 400 -H 200
New-PlaceholderImage -Path "$base\images\themes\reiwa_preview.png" -Color1 "#FFFF00" -Color2 "#00E5FF" -W 400 -H 200

New-PlaceholderImage -Path "$base\images\backgrounds\hero_bg.png" -Color1 "#1A1A2E" -Color2 "#FF6B35" -W 800 -H 600

foreach ($rider in $riderColors.Keys) {
    New-PlaceholderImage -Path "$base\images\symbols\$rider.png" -Color1 $riderColors[$rider][0] -Color2 "#000000" -W 128 -H 128
}

Get-ChildItem -Path $base -Recurse -Filter ".gitkeep" -ErrorAction SilentlyContinue | Remove-Item -Force

Write-Host "========================================" -ForegroundColor Green
Write-Host "  Asset generation complete!" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Green
