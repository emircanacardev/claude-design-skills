# Copies every skill in .\skills into your skills folder (existing files with the same name are overwritten).
#   .\install.ps1              Claude Code  (~\.claude\skills)
#   .\install.ps1 -Codex       Codex        (~\.agents\skills)
#   .\install.ps1 -Both        both
#   .\install.ps1 -Dest DIR    any folder, e.g. your-repo\.claude\skills
param([switch]$Codex, [switch]$Both, [string]$Dest)
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$dests = @(Join-Path $HOME '.claude\skills')
if ($Codex) { $dests = @(Join-Path $HOME '.agents\skills') }
if ($Both)  { $dests = @((Join-Path $HOME '.claude\skills'), (Join-Path $HOME '.agents\skills')) }
if ($Dest)  { $dests = @($Dest) }
$skills = Get-ChildItem -Directory (Join-Path $here 'skills')
foreach ($d in $dests) {
  New-Item -ItemType Directory -Force -Path $d | Out-Null
  foreach ($s in $skills) {
    $target = Join-Path $d $s.Name
    New-Item -ItemType Directory -Force -Path $target | Out-Null
    Copy-Item -Recurse -Force (Join-Path $s.FullName '*') $target
  }
  Write-Host "Installed $($skills.Count) skills into $d"
}
Write-Host 'Restart Claude Code / Codex to load them.'
