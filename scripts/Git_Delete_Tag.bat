:: Git_Tag.bat
@echo off
cd .. 
git tag -l
set /P tag=Input your tag to delete: 
git tag -d %tag%
git push origin :%tag%
choice /C YN /N /T 3 /D Y