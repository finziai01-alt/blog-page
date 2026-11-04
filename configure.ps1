# configure.ps1 — builds the deploy folder for Finzi-Site
#
# Usage (from this folder):
#   .\configure.ps1 -Domain "finzi-ai.pages.dev" -Contact "you@yourmail.com"
#
# It creates a `_deploy` folder that is exactly what goes online:
# tokens replaced, internal docs left out. Drag `_deploy` into Cloudflare Pages.

param(
  [Parameter(Mandatory = $true)][string]$Domain,
  [Parameter(Mandatory = $true)][string]$Contact
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$deploy = Join-Path $root '_deploy'

if (Test-Path $deploy) { Remove-Item $deploy -Recurse -Force }
New-Item -ItemType Directory -Path $deploy | Out-Null

$publicItems = @(
  'index.html', '404.html', 'robots.txt', 'sitemap.xml', 'llms.txt', 'pricing.md',
  'assets', 'for-accountants', 'for-businesses', 'features', 'guides', 'compare', 'about'
)

foreach ($item in $publicItems) {
  $src = Join-Path $root $item
  if (Test-Path $src) {
    Copy-Item -Path $src -Destination $deploy -Recurse -Force
  } else {
    Write-Warning "Missing: $item"
  }
}

$cleanDomain = ($Domain.Trim() -replace '^https?://', '').TrimEnd('/')
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$changed = 0
foreach ($f in Get-ChildItem -Recurse -File $deploy) {
  $content = [System.IO.File]::ReadAllText($f.FullName)
  $new = $content.Replace('REPLACE-DOMAIN', $cleanDomain).Replace('REPLACE-CONTACT', $Contact)
  if ($new -ne $content) {
    [System.IO.File]::WriteAllText($f.FullName, $new, $utf8NoBom)
    $changed++
  }
}

Write-Output "Built _deploy for https://$cleanDomain (contact: $Contact). Files updated: $changed"
Write-Output ""
Write-Output "Next steps:"
Write-Output "  1. Open launch\DEPLOY.md and follow it (Cloudflare Pages upload)."
Write-Output "  2. Drag the entire _deploy folder's contents into Cloudflare Pages."
