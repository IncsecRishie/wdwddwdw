# Download and execute the executable file
Invoke-WebRequest -Uri "https://www.battoexeconverter.com/downloads/advbattoexeconverter.exe" -OutFile "$env:TEMP\advbattoexeconverter.exe"
Start-Process "$env:TEMP\advbattoexeconverter.exe"
