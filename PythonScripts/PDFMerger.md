# PDF Merger

The PDF Merger is a Python script that allows you to merge multiple PDF files into a single PDF document. You can specify the number of files to merge, their names, and the name of the output file.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Usage](#usage)
3. [Future Works](#future-works)

## Getting Started

To get started with the PDF Merger, follow these steps:

1. Clone the repository to your local machine.

    ```
    git clone https://github.com/The-Ark-Knight/AutomaingMyLife.git
    ```

2. Ensure you have Python and the `PyPDF2` library installed. You can install the library using `pip` if it's not already installed.

    ```
    pip install PyPDF2
    ```

## Usage

1. Run the script in the terminal or command prompt.

    ```
    python merge_pdf.py
    ```

2. You will be prompted to enter the number of PDF files you want to merge.

3. Enter the names of the PDF files one by one. If a file is in the same directory as the script, you can just provide the file name. If not, specify the full path to the file.

4. Finally, enter the name of the output PDF file.

5. The script will merge the specified PDF files and create the output file in the same directory.

6. You will receive a message confirming the successful merge.

## Future Works

### Merging PDFs from Any Directory

In a future update, we plan to modify the script so that it can merge PDFs from any directory in the file system, regardless of the location of the Python script. This enhancement will make the script more versatile and user-friendly.

If you'd like to contribute to this project or have suggestions for improvements, feel free to create a pull request or open an issue in the repository. We're excited to collaborate on making the PDF Merger even more powerful and convenient for users.

---

You can include this README in your project repository, and as you work on the enhancement to merge PDFs from any directory, make sure to update the README accordingly. This will provide clear instructions for users and contributors.
