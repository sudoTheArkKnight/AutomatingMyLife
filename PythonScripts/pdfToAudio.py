import PyPDF2
import os
import pyttsx3

def convert_pdf_to_audiobook(pdf_path, output_folder, chunk_size=50):
    pdf_reader = PyPDF2.PdfReader(pdf_path)
    total_pages = len(pdf_reader.pages)

    # Create output folder if it doesn't exist
    os.makedirs(output_folder, exist_ok=True)

    # Initialize TTS engine
    engine = pyttsx3.init()

    # Process the PDF in chunks
    for start_page in range(0, total_pages, chunk_size):
        end_page = min(start_page + chunk_size, total_pages)
        
        # Extract text from the chunk
        text = ''
        for page_num in range(start_page, end_page):
            text += pdf_reader.pages[page_num].extract_text()

        # Generate audio for the chunk
        audio_path = os.path.join(output_folder, f'chunk_{start_page + 1}-{end_page}.mp3')
        engine.save_to_file(text, audio_path)
        engine.runAndWait()

    print("Conversion completed.")

# Get input from the user
pdf_path = input("Enter the path to the PDF file: ")
output_folder = input("Enter the output folder for audio files (default is 'audio_files'): ") or 'audio_files'

# Perform conversion
convert_pdf_to_audiobook(pdf_path, output_folder)
