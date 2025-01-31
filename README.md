# clipboard_img2txt

Uses Windows 10/11 included OCR engine to extract text from an image in the clipboard, and then adds the text back into the clipboard.

It requires OCR language pack installed; To install them, please look at [Text Extractor utility](https://learn.microsoft.com/en-us/windows/powertoys/text-extractor) on Microsoft's documentation (doesn't actually need PowerToys installed).

Also, i don't remember where the OCR script is from. If you know where it's from, tell me and i'll write it down here.

## How to use

1. Install OCR engines by executing '_install_deps.ps1' - it requires administrator permissions. By default, the script installs the OCR engine for US English and UK English - see the file for installing other languages.

2. Launch 'clipboard_img2.txt', either from the terminal, or from the supplied shortcut.

