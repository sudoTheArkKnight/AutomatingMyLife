# Prompt the user for the repository name
$repoName = Read-Host "Enter the name of the GitHub repository"
$accesstoken = "" #enter your github access token here
# Specify the local folder path
$localFolderPath = "Your-File-Path$repoName"

# Check if the local directory already exists
if (Test-Path $localFolderPath -PathType Container) {
    Write-Host "The local directory '$repoName' already exists."
} else {
    # Create the local folder if it doesn't exist
    New-Item -Path $localFolderPath -ItemType Directory

    # Initialize a Git repository in the local folder
    Set-Location $localFolderPath
    git init
}

# Create a README.md file with the repository name as a level 1 heading
$readmeContent = "# $repoName"
$readmeContent | Out-File -FilePath "$localFolderPath\README.md" -Encoding utf8

# Use GitHub CLI to create the remote repository
gh repo create $repoName --public

# Configure the remote origin
$githubRepoUrl = "https://github.com/Your-Username/$repoName.git"
git remote add origin $githubRepoUrl

# Push the initial commit to the GitHub repository
try {
    git add .
    git commit -m "Initial commit"
    git branch -M main
    git push -u origin main
    Write-Host "GitHub repository '$repoName' is created and initialized."
    # Open the repository in the default web browser
    Start-Process "https://github.com/Your-Repo-Name/$repoName"
} catch {
    Write-Host "An error occurred while pushing to the remote repository."
}
