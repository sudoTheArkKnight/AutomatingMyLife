import os
import shutil

# Function to create a folder for a given file extension
def create_folder(extension):
    if not os.path.exists(extension):
        os.mkdir(extension)

# Get the current directory
current_dir = os.getcwd()

# List all files in the current directory
files = [f for f in os.listdir(current_dir) if os.path.isfile(f)]

# Iterate through each file and move it to the corresponding folder
for file in files:
    if '.' in file:
        extension = file.split('.')[-1]
        create_folder(extension)
        shutil.move(file, os.path.join(extension, file))

print("File organization complete.")
