if ($args.Length -eq 0) {return}  

$fileSearch = $true
if ($args.IndexOf('-dr') -gt -1) 
{
    $fileSearch = $false
}

foreach ($arg in $args) 
{
    if ($arg -notmatch '-dr')     
    {
        $param += "*$arg*"
    }
}

$type = @({directory},{file})[$fileSearch]

Write-Host "`nsearching for $type - ""$($param.Replace('*', " ").Replace("  ", " ").Trim())""`n"

$results = @(Get-ChildItem -Recurse -File:($fileSearch) -Directory:(!$fileSearch) -ErrorAction SilentlyContinue -Filter $param | Select-Object -ExpandProperty FullName)

if ($results.Length)
{
    $file = $results[0]
    if ($results.Length -gt 1) 
    {
        Write-Host "Select one of the results:"
        for ($index=0; $index -lt $results.Length; $index++)
        { 
            Write-Host "[$($index+1)] - $($results[$index])"
        }
        
        Write-Host "[x] - exit`n"
        do
        {
            $input = Read-Host "Which $($type)??"
            if ($input -eq "x") {return}
        }
        until ($input -match '^[0-9]+$' -and [int]$input -lt $results.Length+1)

        $file = $results[$input-1]
    }

    Write-Host $file
    if ($results.Length -eq 1)
    {
        $input = Read-Host "`nopen this $($type)?? [Y/n]"
        if ($input -eq "n") { return }
    }

    Start-Process -filepath "$file"
}
else
{
    Write-Host "the $type was not found"
}
