#!/bin/bash

# Prompt the user for the repository name
read -p "Enter the name of the GitHub repository: " repoName
accesstoken="" # enter your GitHub access token here

# Specify the local folder path
localFolderPath="Your-File-Path/$repoName"

# Check if the local directory already exists
if [ -d "$localFolderPath" ]; then
    echo "The local directory '$repoName' already exists."
else
    # Create the local folder if it doesn't exist
    mkdir -p "$localFolderPath"

    # Initialize a Git repository in the local folder
    cd "$localFolderPath" || exit
    git init
fi

# Create a README.md file with the repository name as a level 1 heading
readmeContent="# $repoName"
echo "$readmeContent" > "$localFolderPath/README.md"

# Use GitHub CLI to create the remote repository
gh repo create "$repoName" --public

# Configure the remote origin
githubRepoUrl="https://github.com/Your-Username/$repoName.git"
git remote add origin "$githubRepoUrl"

# Push the initial commit to the GitHub repository
{
    git add .
    git commit -m "Initial commit"
    git branch -M main
    git push -u origin main
    echo "GitHub repository '$repoName' is created and initialized."
    # Open the repository in the default web browser
    xdg-open "https://github.com/Your-Repo-Name/$repoName"
} || {
    echo "An error occurred while pushing to the remote repository."
}
