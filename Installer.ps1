# Installer.ps1 - Tai va chay STRIKE 2K26 tu GitHub
$BaseUrl = "https://raw.githubusercontent.com/STRIKE2K26/strike2k26/main/"
$InstallDir = "$env:TEMP\STRIKE2K26"

Write-Host "=== STRIKE 2K26 INSTALLER ===" -ForegroundColor Cyan
Write-Host "Dang tao thu muc cai dat..." -ForegroundColor Yellow

New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

$Files = @(
    "STRIKE2K26UI.ps1",
    "WpfAnimatedGif.dll",
    "1.jpg",
    "2.jpg",
    "22.jpg",
    "fanart.png",
    "uno.png",
    "solo-leveling-3840x2160-26864.jpg",
    "bgm.mp3"
)

foreach ($File in $Files) {
    $Url = $BaseUrl + $File
    $Dest = Join-Path $InstallDir $File
    try {
        Write-Host "Dang tai: $File ..." -ForegroundColor Cyan
        Invoke-WebRequest -Uri $Url -OutFile $Dest -UseBasicParsing
    } catch {
        Write-Host "LOI khi tai $File : $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Hoan tat! Dang khoi dong STRIKE 2K26..." -ForegroundColor Green
Start-Sleep -Seconds 1

# Chay tool tu file da tai ve (co duong dan that)
& "$InstallDir\STRIKE2K26UI.ps1"