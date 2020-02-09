$fileSearch = $true

if ($args.IndexOf('-dr') -gt -1) {
    $fileSearch = $false
} 

for ( $i = 0; $i -lt $args.count; $i++ ) {
    if ($args[$i] -notmatch '-dr') 
    {
        $param += '*'+$args[$i]+'*'
    }
}

Write-Host 'searching for: "'($param.Replace('*', " ").Trim())'"...' -Separator ""
$fileName = get-childitem -recurse -File:($fileSearch) -Directory:(!$fileSearch) -ErrorAction SilentlyContinue -Filter $param | Select-Object -ExpandProperty FullName -First 1
if ($fileName) 
{
    Write-Host $fileName
    start-process -filepath $fileName
}
else 
{
    Write-Host 'nothing was found'
}
