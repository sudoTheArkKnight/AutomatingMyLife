import qrcode

def generate_qr_code(link, output_file='qrcode.png'):
    # Create QR code instance
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )

    # Add data to the QR code
    qr.add_data(link)
    qr.make(fit=True)

    # Create an image from the QR code
    img = qr.make_image(fill_color="black", back_color="white")

    # Save the image to a file
    img.save(output_file)
    print(f"QR code saved to {output_file}")

if __name__ == "__main__":
    # Get link from user input
    link = input("Enter the link to generate QR code: ")

    # Generate QR code
    generate_qr_code(link)