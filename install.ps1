$PathLocation = (Get-Item ENV:LOCALAPPDATA | Select-Object -ExpandProperty  value) + '\Programs\'

Copy-Item 'FileSearch' -Destination $PathLocation -Recurse

[Environment]::SetEnvironmentVariable("Path", $env:Path + (";" + $PathLocation + "FileSearch"), "Machine")

Write-Host "Installed FileSearch. Close this instance of PowerShell and open another in order to start using FileSearch"