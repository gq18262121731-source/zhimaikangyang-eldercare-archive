@echo off
chcp 65001 >nul
setlocal
set "ROOT=%~dp0.."
if not defined VISION_PYTHON (
  echo Set VISION_PYTHON to the Vision service Python executable first.
  echo Example: set VISION_PYTHON=C:\Tools\miniconda3\envs\vision\python.exe
  exit /b 1
)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%ROOT%\launcher\start-vision.ps1" -PythonPath "%VISION_PYTHON%" -HostName 0.0.0.0 -Port 8011
exit /b %errorlevel%
