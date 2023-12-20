:: Git_PushDirectly.bat
@echo off
cd ..
git pull
git status
git add .
git status
set /P msg=Input your commit:
git commit -m "%msg%"
git push
cd scripts
choice /C YN /N /T 3 /D Y
