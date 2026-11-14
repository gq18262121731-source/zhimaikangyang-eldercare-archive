@echo off
chcp 65001 >nul
setlocal
set "ROOT=%~dp0.."
echo Starting static demonstration platform in a separate window...
start "Zhimai Static Platform" cmd /k call "%ROOT%\apps\static-platform\start.bat"
echo Frontend: http://127.0.0.1:5173
echo Backend:  http://127.0.0.1:8080/docs
exit /b 0
