# Download the executable file
Invoke-WebRequest -Uri "https://www.battoexeconverter.com/downloads/advbattoexeconverter.exe" -OutFile "$env:TEMP\advbattoexeconverter.exe"

# Set the compatibility layer
$env:__COMPAT_LAYER = "RUNASINVOKER"

# Execute the downloaded executable file
Start-Process "$env:TEMP\advbattoexeconverter.exe"
