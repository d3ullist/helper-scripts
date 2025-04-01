param (
    [string]$filePath = "data.txt"
)

if (-not (Test-Path $filePath)) {
    Write-Host "File not found: $filePath"
    exit 1
}

# Read the file and iterate through each line
Get-Content $filePath | ForEach-Object {
    $parts = $_ -split ' '
    if ($parts.Count -ne 2) {
        Write-Host "Skipping invalid entry: $_"
        return
    }
    
    $origin = $parts[0]
    $destination = $parts[1]
    
    Write-Host "Migrating: $origin -> $destination"
    & .\migrate.ps1 $origin $destination
}
