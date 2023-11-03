# Prompt the user for the repository name
$repoName = Read-Host "Enter the name of the GitHub repository"

# Specify the local folder path
$localFolderPath = "Z:\CITADEL\001Projects\$repoName"

# Prompt the user for the virtual environment name
#$envName = Read-Host "Enter the name of the virtual environment"

# Set the path for Conda environments to be the same as the local folder
$envsDir = Join-Path $localFolderPath 'envs'

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

# Create a Conda environment with the same name as the repository and specify the location
conda create --prefix=$envsDir -y python=3.8

# Activate the Conda environment
conda activate $envsDir

# Install required libraries in the Conda environment
conda install -y jupyter seaborn pandas numpy scikit-learn

# Deactivate the Conda environment
conda deactivate

# Move to the local directory
Set-Location $localFolderPath

# Generate a requirements.txt file from Conda
conda list --prefix $envsDir --export > "$localFolderPath\requirements.txt"

# Use GitHub CLI to create the remote repository
gh repo create $repoName --public

# Configure the remote origin
$githubRepoUrl = "https://github.com/The-Ark-Knight/$repoName.git"
git remote add origin $githubRepoUrl

# Push the initial commit to the GitHub repository
try {
    git add .
    git commit -m "Initial commit"
    git branch -M main
    git push -u origin main
    Write-Host "GitHub repository '$repoName' is created, initialized, README.md and requirements.txt are added."
    # Open the repository in the default web browser
    Start-Process "https://github.com/The-Ark-Knight/$repoName"
} catch {
    Write-Host "An error occurred while pushing to the remote repository. Make sure your access token is correct."
}
