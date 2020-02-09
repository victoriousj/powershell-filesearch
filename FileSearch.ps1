$fileSearch = $true

for ( $i = 0; $i -lt $args.count; $i++ ) {
    if ($args[$i] -match '-dr') 
    {
        $fileSearch = $false
    }
} 

if ($fileSearch) 
{
    $param = '*'+($args -join "*")+'*'

    Write-Host 'searching for: '($args -join ' ')'...' -Separator ""
    $fileName = get-childitem -recurse -File -ErrorAction SilentlyContinue -Filter $param | Select-Object -ExpandProperty FullName -First 1
    if ($fileName) 
    {
        Write-Host $fileName
        start-process -filepath $fileName
    }
    else 
    {
        Write-Host 'file not found'
    }
}
else 
{
    $param = ""
    for ( $i = 0; $i -lt $args.count; $i++ ) {
        if ($args[$i] -notmatch '-dr') 
        {
            $param += '*'+$args[$i]+'*'
        }
    }

    Write-Host 'searching for directory: '$param.Replace("*", "")'...' -Separator ""
    $fileName = get-childitem -recurse -Directory -ErrorAction SilentlyContinue -Filter $param | Select-Object -ExpandProperty FullName -First 1
    if ($fileName) 
    {
        Write-Host $fileName
        start-process -filepath $fileName
    }
    else 
    {
        Write-Host 'folder not found'
    }
}
