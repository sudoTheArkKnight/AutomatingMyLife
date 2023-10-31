import PyPDF2
import os

# Get the number of PDFs to merge from the user
num_files_to_merge = int(input("How many PDF files do you want to merge?"))

# Initialize a list to store the file names
file_names = []

# Get the file names from the user
for i in range(num_files_to_merge):
    file_name = input(f"Enter the name of PDF file {i + 1}: ")
    if file_name.endswith(".pdf"):
        file_names.append(file_name)
    else:
        file_names.append(file_name + ".pdf")

# Get the name of the output file from the user
output_file_name = input("Enter the name of the output PDF file: ")

merger = PyPDF2.PdfMerger()

# Append the selected PDF files to the merger
for file in file_names:
    merger.append(file)

# Write the merged PDF to the specified output file
merger.write(output_file_name)

print(f"{num_files_to_merge} PDF files have been merged into {output_file_name}.")
