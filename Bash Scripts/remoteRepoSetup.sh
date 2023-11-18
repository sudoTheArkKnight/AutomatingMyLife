#!/bin/bash

echo "Enter the name of the local directory (include the repository name, or ~ for home directory):"
read localRepo

# Resolve ~ to the home directory
localRepo="${localRepo/#\~/$HOME}"

if [ -d "$localRepo" ]; then
    echo "Directory exists. Pulling latest changes..."
    cd "$localRepo" || exit
    git pull origin main
else
    echo "Creating directory and initializing Git repository..."
    mkdir -p "$localRepo"
    cd "$localRepo" || exit
    git init
    echo "Enter the link to the remote repository:"
    read remoteRepo
    git remote add origin "$remoteRepo"
    git pull origin main
fi

echo "Checking out the main branch..."
git checkout -b main

echo "Setting the current repository as the default for GitHub CLI..."
gh repo set-default

echo "Setup complete."