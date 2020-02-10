$PathLocation = (Get-Item ENV:LOCALAPPDATA | Select-Object -ExpandProperty  value) + '\Programs\'

$FileSearchLocation = $PathLocation + 'FileSearch'

$regexAddPath = [regex]::Escape($FileSearchLocation)

$arrPath = ([Environment]::GetEnvironmentVariable("PATH", "User")) -split ';' | Where-Object {$_ -and $_ -notMatch "^$regexAddPath\\?"}

$newPath =  ($arrPath + $FileSearchLocation) -join ';'

Copy-Item 'FileSearch' -Destination $PathLocation -Recurse -Force

[Environment]::SetEnvironmentVariable("Path", $newPath, "User")

Write-Host "Installed FileSearch. Close this instance of PowerShell and open another in order to start using FileSearch"
