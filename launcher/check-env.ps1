[CmdletBinding()]
param()

$ErrorActionPreference = 'Continue'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$required = @(
    @{ Name = 'static platform'; Path = 'apps\static-platform\start.bat' },
    @{ Name = 'vision service'; Path = 'services\vision-module\README.md' },
    @{ Name = 'Go2 source'; Path = 'services\go2-robot\go2_dev' },
    @{ Name = 'Flutter source'; Path = 'apps\flutter-mobile\pubspec.yaml' },
    @{ Name = 'Legacy source'; Path = 'legacy\health_new_p04\README.md' },
    @{ Name = 'archive config template'; Path = 'configs\.env.example' }
)

Write-Host "Archive root: $Root"
$failed = $false
foreach ($item in $required) {
    $path = Join-Path $Root $item.Path
    if (Test-Path -LiteralPath $path) {
        Write-Host "[OK]   $($item.Name)"
    } else {
        Write-Host "[MISS] $($item.Name): $($item.Path)" -ForegroundColor Yellow
        $failed = $true
    }
}

foreach ($tool in @('git', 'python', 'node', 'npm')) {
    $command = Get-Command $tool -ErrorAction SilentlyContinue
    if ($command) { Write-Host "[TOOL] $tool -> $($command.Source)" }
    else { Write-Host "[OPT ] $tool not found (some modules may need it)" -ForegroundColor Yellow }
}

$flutter = Get-Command flutter -ErrorAction SilentlyContinue
if ($flutter) { Write-Host "[TOOL] flutter -> $($flutter.Source)" }
else { Write-Host '[OPT ] flutter not found (required only for mobile app)' -ForegroundColor Yellow }

if ($failed) {
    Write-Error 'One or more archive paths are missing.'
    exit 1
}
Write-Host 'Environment and archive path check passed.' -ForegroundColor Green
exit 0
