@echo off
chcp 65001 >nul
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0check-env.ps1"
set "rc=%errorlevel%"
echo.
if not "%rc%"=="0" echo [ERROR] Environment check failed.
pause
exit /b %rc%
