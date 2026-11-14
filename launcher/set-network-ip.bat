@echo off
chcp 65001 >nul
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0set-network-ip.ps1" %*
set "rc=%errorlevel%"
echo.
if not "%rc%"=="0" echo [ERROR] Network configuration failed.
pause
exit /b %rc%
