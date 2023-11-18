#!/bin/bash

# Prompt the user for the repository name
read -p "Enter the name of the GitHub repository: " repoName

# Specify the local folder path
localFolderPath="/home/thearkknight/1PROJECTS/$repoName"

# Check if the local directory already exists
if [ -d "$localFolderPath" ]; then
    echo "The local directory '$repoName' already exists."
else
    # Create the local folder if it doesn't exist
    mkdir -p "$localFolderPath"

    # Initialize a Git repository in the local folder
    cd "$localFolderPath" || exit
    git init

    # Create a README.md file with the repository name as a level 1 heading
    echo "# $repoName" > "README.md"
fi

# Create a Conda environment with the specified name
conda create --prefix "$repoName" -y python=3.8

# Activate the Conda environment
source activate "$repoName"

# Install required libraries in the Conda environment
conda install -y jupyter seaborn pandas numpy scikit-learn

# Deactivate the Conda environment
conda deactivate

# Generate a requirements.txt file from Conda
conda list --prefix "$repoName" --export > "requirements.txt"

# Add and commit the changes to the local repository
git add .
git commit -m "Initial commit with README.md and requirements.txt"

# Use GitHub CLI to create the remote repository
gh repo create "$repoName" --public

# Configure the remote origin
githubRepoUrl="https://github.com/The-Ark-Knight/$repoName.git"
git remote add origin "$githubRepoUrl"

# Push the initial commit to the GitHub repository
{
    git branch -M main
    git push -u origin main
    echo "GitHub repository '$repoName' is created, initialized, README.md and requirements.txt are added."
    # Open the repository in the default web browser
    xdg-open "https://github.com/The-Ark-Knight/$repoName"
} || {
    echo "An error occurred while pushing to the remote repository. Make sure your access token is correct."
}
