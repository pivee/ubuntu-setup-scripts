# Define variables
$localPath = Join-Path -Path (Get-Location) -ChildPath ""
$remotePath = "~/ubuntu-setup-scripts"
$remoteUser = "ubuntu"
$remoteHost = "13.250.83.126"

# Function to log messages in color
function Log-Message {
    param (
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

# Create the target directory on the remote machine and set permissions
Log-Message "Creating target directory on the remote machine and setting permissions..." "Yellow"
ssh ${remoteUser}@${remoteHost} "mkdir -p ${remotePath} && chmod 755 ${remotePath}"

# Copy files to the remote machine
Log-Message "Copying files to the remote machine..." "Yellow"
scp -r $localPath/* ${remoteUser}@${remoteHost}:${remotePath}

# Verify the files have been copied
Log-Message "Verifying the files have been copied..." "Yellow"
ssh ${remoteUser}@${remoteHost} "ls -l ${remotePath}"

Log-Message "Files have been successfully copied and verified." "Green"