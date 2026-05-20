#Requires -Version 5.1
<#
.SYNOPSIS
  Pubblica un nuovo aggiornamento aggiornando version.json e pushando su GitHub.

.PARAMETER Version
  Nuova versione (es. "0.3.0").

.PARAMETER DownloadUrl
  URL diretto al file installer della nuova versione.
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$Version,

    [Parameter(Mandatory = $false)]
    [string]$DownloadUrl = ""
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

$json = @{
    version      = $Version
    download_url = $DownloadUrl
} | ConvertTo-Json -Compress

$json | Set-Content -Path "version.json" -Encoding UTF8

Write-Host "Aggiornato version.json -> $Version" -ForegroundColor Green

$hasChanges = git status --porcelain
if ($hasChanges) {
    git add version.json
    git commit -m "Release v$Version"
    git push origin main
    Write-Host "Pushato su GitHub." -ForegroundColor Green
} else {
    Write-Host "Nessuna modifica da committare." -ForegroundColor Yellow
}
