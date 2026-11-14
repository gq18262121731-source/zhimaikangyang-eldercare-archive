[CmdletBinding()]
param()

$ErrorActionPreference = 'Continue'
$ports = @(8080, 5173, 8011)
foreach ($port in $ports) {
    $connections = @(Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue)
    foreach ($connection in $connections) {
        $process = Get-Process -Id $connection.OwningProcess -ErrorAction SilentlyContinue
        if ($process) {
            Write-Host "Stopping PID $($process.Id) ($($process.ProcessName)) on port $port"
            Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
        }
    }
}
Write-Host 'Known archive demo ports stopped. Review other module processes manually.'
