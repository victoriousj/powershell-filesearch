$PathLocation = (Get-Item ENV:LOCALAPPDATA | Select-Object -ExpandProperty  value) + '\Programs\'

Copy-Item 'FileSearch' -Destination $PathLocation -Recurse -Force

$FileSearchLocation = $PathLocation + 'FileSearch'

$regexAddPath = [regex]::Escape($FileSearchLocation)
$arrPath = $env:Path -split ';' | Where-Object {$_ -and $_ -notMatch "^$regexAddPath\\?"}

$newPath =  ($arrPath + $FileSearchLocation) -join ';'

[Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")

Write-Host "Installed FileSearch. Close this instance of PowerShell and open another in order to start using FileSearch"
