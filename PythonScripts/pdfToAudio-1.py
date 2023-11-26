import fitz  # PyMuPDF
import os
import pyttsx3

def convert_pdf_to_audiobook(pdf_path, output_folder):
    # Open the PDF file
    pdf_document = fitz.open(pdf_path)

    # Create the output folder if it doesn't exist
    os.makedirs(output_folder, exist_ok=True)

    # Initialize an empty string to store all text
    full_text = ""

    # Iterate over each page in the PDF
    for page_number in range(pdf_document.page_count):
        # Get the text content of the page
        page = pdf_document[page_number]
        text = page.get_text()

        # Append the text to the full_text string
        full_text += text

    # Close the PDF document
    pdf_document.close()

    # Initialize pyttsx3 engine
    engine = pyttsx3.init()

    # Save the text to a temporary file
    temp_file = os.path.join(output_folder, 'temp.txt')
    with open(temp_file, 'w', encoding='utf-8') as file:
        file.write(full_text)

    # Convert the text to speech
    audio_path = os.path.join(output_folder, 'full_audiobook.mp3')
    engine.save_to_file(full_text, audio_path)
    engine.runAndWait()

    print(f"Full audiobook saved and played: {audio_path}")

if __name__ == "__main__":
    # Get user input for PDF file and output folder
    pdf_path = input("Enter the path to the PDF file: ")
    output_folder = input("Enter the output folder for audio files (default is 'audio_files'): ") or 'audio_files'

    # Convert PDF to audiobook
    convert_pdf_to_audiobook(pdf_path, output_folder)
