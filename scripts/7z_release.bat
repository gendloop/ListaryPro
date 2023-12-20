@echo off
cd /d %~dp0
set name=%~n0
echo "%1"
powershell.exe -ExecutionPolicy RemoteSigned -File .\%name%.ps1 %1
choice /C YN -D Y -N -T 3 >nul
