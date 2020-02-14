function FlipAndWrite
{
    Param($Message, [Switch] $DoubleSpace)

    if ($DoubleSpace) { 

        $Message = "`n$Message"
    
    }
    
    Write-Host $Message -ForegroundColor "$(({magenta},{cyan})[($script:Bool = !$Bool)])"
}

if ($args.Length -eq 0) {

    do {

        FlipAndWrite "what are you looking for??" -DoubleSpace
        
        $args = (Read-Host) -split " "

    } until ($args.Length)
}  

$fileSearch = $true

if ($args.IndexOf('-dr') -ge 0) {
    
    $fileSearch = $false

}

$type = @( {directory}, {file})[$fileSearch]

foreach ($arg in $args) {

    if ($arg -notmatch '-dr') {
    
        $filter += "*$arg*"
    
    }
}

FlipAndWrite "searching for $type - ""$(($args -Join ' ').Replace('-dr', '').Trim())""..." -DoubleSpace

$results = @(Get-ChildItem -Recurse -File:($fileSearch) -Directory:(!$fileSearch) -ErrorAction SilentlyContinue -Filter $filter | Select-Object -ExpandProperty FullName)

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
    
    } until ($input -match '^[0-9]+$' -and [int]$input -le $results.Length)

    $file = $results[$input - 1]
}

FlipAndWrite $file -DoubleSpace

if ($results.Length -eq 1) {
    
    FlipAndWrite "open this $type?? [Y/n]" -DoubleSpace
    
    $input = (Read-Host) 

    if ($input -eq "n") { return }
}

FlipAndWrite "opening $type..." -DoubleSpace

Start-Process -filepath "$file"
