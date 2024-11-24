$OutputFile = "./clipboard.png"

function Terminate() {
    if (Test-Path -Path $OutputFile) {
        Remove-Item -Path $OutputFile
    }

    exit
}

function SaveClipboardImage() {
    Add-Type -AssemblyName System.Windows.Forms
    $clipboard = [System.Windows.Forms.Clipboard]::GetDataObject()
    if ($clipboard.ContainsImage()) {
        $filename=$OutputFile         
        [System.Drawing.Bitmap]$clipboard.getimage().Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
        Write-Output "clipboard content saved as $filename"
    } else {
        Write-Output "clipboard does not contains image data"
        Terminate
    }
}

SaveClipboardImage

$OCRResult = ./OCR.ps1 $OutputFile

if(($OCRResult) -and ($OCRResult.Text)) {
    Set-Clipboard -Value $OCRResult.Text
    Write-Output $OCRResult.Text
} else {
    Write-Output "image does not contain ocr data"
    Terminate
}


Remove-Item -Path $OutputFile
