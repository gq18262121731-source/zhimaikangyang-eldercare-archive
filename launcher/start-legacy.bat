@echo off
chcp 65001 >nul
setlocal
set "ROOT=%~dp0.."
echo Legacy uses ports 8000 and 5173. Stop the current demo before continuing.
start "Zhimai Legacy Backend" powershell.exe -NoExit -ExecutionPolicy Bypass -Command "Set-Location '%ROOT%\legacy\health_new_p04'; .\scripts\start_server.ps1 -CondaEnv health -ListenHost 0.0.0.0 -Port 8000"
start "Zhimai Legacy Frontend" powershell.exe -NoExit -ExecutionPolicy Bypass -Command "Set-Location '%ROOT%\legacy\health_new_p04'; .\scripts\start_frontend.ps1 -ListenHost 0.0.0.0 -Port 5173"
exit /b 0
