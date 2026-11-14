@echo off
chcp 65001 >nul
setlocal
set "ROOT=%~dp0.."
where flutter >nul 2>&1
if errorlevel 1 (
  echo Flutter SDK not found in PATH.
  exit /b 1
)
start "Zhimai Flutter Mobile" powershell.exe -NoExit -ExecutionPolicy Bypass -Command "Set-Location '%ROOT%\apps\flutter-mobile'; flutter pub get; flutter run"
exit /b 0
