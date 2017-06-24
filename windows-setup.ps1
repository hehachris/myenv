######################################################
# Based on https://gist.github.com/vintem/6334646
######################################################

$packages = @(
    '7zip',
    'adobereader',
    'fscapture',
    'firefox',
    'git',
    'googlechrome',
    'googledrive',
    'phpstorm',
    'lastpass',
    'spotify',
    'steam',
    'utorrent',
    'visualstudiocode'
)

function Add-Path() {
    [Cmdletbinding()]
    param([parameter(Mandatory = $True, ValueFromPipeline = $True, Position = 0)][String[]]$AddedFolder)
    # Get the current search path from the environment keys in the registry.
    $OldPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
    # See if a new folder has been supplied.
    if (!$AddedFolder) {
        Return 'No Folder Supplied. $ENV:PATH Unchanged'
    }
    # See if the new folder exists on the file system.
    if (!(TEST-PATH $AddedFolder))
    { Return 'Folder Does not Exist, Cannot be added to $ENV:PATH' }cd
    # See if the new Folder is already in the path.
    if ($ENV:PATH | Select-String -SimpleMatch $AddedFolder)
    { Return 'Folder already within $ENV:PATH' }
    # Set the New Path
    $NewPath = $OldPath + ’;’ + $AddedFolder
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
    # Show our results back to the world
    Return $NewPath
}

######################################################
# Install apps using Chocolatey
######################################################
Write-Host "Run Get-ExecutionPolicy. If it returns Restricted, then run Set-ExecutionPolicy Bypass."
Write-Host "Installing Chocolatey"
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host

Write-Host "Installing applications from Chocolatey"
foreach ($package in $packages) {
    choco install $package -y
}
Write-Host

######################################################
# Set environment variables
######################################################
Write-Host "Setting home variables"
[Environment]::SetEnvironmentVariable("HOME", $HOME, "User")
[Environment]::SetEnvironmentVariable("CHROME_BIN", "C:\Program Files\Google\Chrome\Application\chrome.exe", "User")
Write-Host

######################################################
# Add Git to the path
######################################################
Write-Host "Adding Git\bin to the path"
Add-Path "C:\Program Files\Git\bin"
Write-Host

######################################################
# Configure Git globals
######################################################
Write-Host "Configuring Git globals"
$userName = Read-Host 'Enter your name for git configuration'
$userEmail = Read-Host 'Enter your email for git configuration'

& 'C:\Program Files\Git\bin\git' config --global user.email $userEmail
& 'C:\Program Files\Git\bin\git' config --global user.name $userName
Write-Host
