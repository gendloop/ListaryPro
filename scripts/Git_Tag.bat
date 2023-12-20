:: Git_Tag.bat
@echo off
cd ..
git tag -l
set /P tag=Input your tag:
git tag %tag%
git push origin %tag%
cd scripts
choice /C YN /N /T 3 /D Y
