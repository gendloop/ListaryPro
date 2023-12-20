:: Git_PushDirectly.bat
@echo off
cd ..
git pull
git status
git add .
git status
git commit -m "chore: update"
git push
cd scripts
choice /C YN /N /T 3 /D Y
