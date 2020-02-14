function FlipAndWrite
{
    Param($Message, [Switch] $DoubleSpace)
    if ($DoubleSpace) { 
    
        $Message = "`n$Message"
    
    }
    
    Write-Host $Message -ForegroundColor "$(({magenta},{cyan})[($script:Bool = !$Bool)])"
}

if ($args.Length -eq 0) {
    
    FlipAndWrite "what are you looking for??" -DoubleSpace
    
    $args = (Read-Host) -split " "
}  

$fileSearch = $true
if ($args.IndexOf('-dr') -ge 0) {
    
    $fileSearch = $false

}
$type = @( {directory}, {file})[$fileSearch]

foreach ($arg in $args) {

    if ($arg -notmatch '-dr') {
    
        $param += "*$arg*"
    
    }
}

FlipAndWrite "searching for $type - ""$($param.Replace('*', " ").Replace("  ", " ").Trim())""..." -DoubleSpace

$results = @(Get-ChildItem -Recurse -File:($fileSearch) -Directory:(!$fileSearch) -ErrorAction SilentlyContinue -Filter $param | Select-Object -ExpandProperty FullName)

if (!$results.Length) {
    
    FlipAndWrite "the $type was not found" -DoubleSpace
    
    return
}

$file = $results[0]

if ($results.Length -gt 1) {
    
    FlipAndWrite "select one of the results:" -DoubleSpace

    for ($index = 0; $index -lt $results.Length; $index++) {
        
        FlipAndWrite "[$($index+1)] - $($results[$index])"
    
    }

    FlipAndWrite "[x] - exit`n"
    
    do {
        FlipAndWrite "which $($type)??" -DoubleSpace
        
        $input = (Read-Host)
        
        if ($input -eq "x") { return }
    }
    until ($input -match '^[0-9]+$' -and [int]$input -lt $results.Length + 1)

    $file = $results[$input - 1]
}

FlipAndWrite $file -DoubleSpace

if ($results.Length -eq 1) {
    $input = Read-Host "`nopen this $($type)?? [Y/n]"

    if ($input -eq "n") { return }
}

FlipAndWrite "opening $type..." -DoubleSpace

Start-Process -filepath "$file"
