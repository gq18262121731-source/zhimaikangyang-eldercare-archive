[CmdletBinding()]
param(
    [string]$PythonPath = $env:VISION_PYTHON,
    [string]$HostName = '0.0.0.0',
    [int]$Port = 8011
)

$ErrorActionPreference = 'Stop'
if (-not $PythonPath) { throw 'Set VISION_PYTHON to the Vision service Python executable.' }
if (-not (Test-Path -LiteralPath $PythonPath)) { throw "Vision Python not found: $PythonPath" }
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$VisionRoot = Join-Path $Root 'services\vision-module'
$Profile = Join-Path $VisionRoot 'configs\safe_demo.env'
if (-not (Test-Path -LiteralPath $Profile)) { throw "Vision safe-demo profile not found: $Profile" }

$env:PYTHONPATH = $VisionRoot
$env:VISION_SERVICE_ENV_FILE = $Profile
$env:VISION_SERVICE_REQUIRE_CUDA = 'false'
Push-Location $VisionRoot
try {
    & $PythonPath -m uvicorn app.main:app --host $HostName --port $Port
    exit $LASTEXITCODE
} finally {
    Pop-Location
}
