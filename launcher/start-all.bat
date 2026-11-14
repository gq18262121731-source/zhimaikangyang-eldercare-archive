@echo off
chcp 65001 >nul
setlocal
set "ROOT=%~dp0.."
echo This launcher starts safe software demos only. It never starts real Go2 motion.
start "Zhimai Static Platform" cmd /k call "%ROOT%\apps\static-platform\start.bat"
if defined VISION_PYTHON (
  echo Starting Vision safe demo with VISION_PYTHON=%VISION_PYTHON%
  start "Zhimai Vision Safe Demo" powershell.exe -NoExit -ExecutionPolicy Bypass -File "%ROOT%\launcher\start-vision.ps1" -PythonPath "%VISION_PYTHON%" -HostName 0.0.0.0 -Port 8011
) else (
  echo Vision safe demo skipped. Set VISION_PYTHON to a compatible Python and run launcher\start-vision.bat.
)
echo Go2 is intentionally not started by this command. Use the read-only commands in docs\STARTUP.md.
exit /b 0
