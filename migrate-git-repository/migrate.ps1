param (
    [string]$origin,
    [string]$destination
)

if (-not $origin -or -not $destination) {
    Write-Host "Usage: script.ps1 <origin> <destination>"
    exit 1
}

# Extract repo name from origin URL
$repoName = ($origin -split '/' | Select-Object -Last 1)

# Clone the repo as a mirror
git clone --mirror $origin
Write-Host "Cloning repository from $origin to $repoName..."
if (-not (Test-Path ".\$repoName")) {
    Write-Host "Failed to clone repository."
    exit 1
}

# Change to the cloned repo directory
Set-Location $repoName

# Set the new push URL
git remote set-url --push origin $destination

# Push the mirror to the new destination
git push --mirror

Set-Location ..
