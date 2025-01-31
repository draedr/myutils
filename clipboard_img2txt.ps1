Add-Type -AssemblyName System.Windows.Forms
$OutputFile = "./clipboard.png"


function Terminate() {
    if (Test-Path -Path $OutputFile) {
        Remove-Item -Path $OutputFile
    }

    exit
}

function Notify($Content, $IsWarning) {	
	$global:balmsg = New-Object System.Windows.Forms.NotifyIcon
	$path = (Get-Process -id $pid).Path
	$balmsg.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
	$balmsg.BalloonTipText = $Content
	$balmsg.BalloonTipTitle = ""
	$balmsg.Visible = $true
	$balmsg.ShowBalloonTip(60)
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
		Notify("Clipboard does not contains image data", $true)
        Terminate
    }
}


SaveClipboardImage

$OCRResult = ./OCR.ps1 $OutputFile

if(($OCRResult) -and ($OCRResult.Text)) {
    Set-Clipboard -Value $OCRResult.Text
    Write-Output $OCRResult.Text
	Notify($OCRResult.Text)
} else {
    Write-Output "image does not contain ocr data"
	Notify("Image does not contain ocr data")
}

Remove-Item -Path $OutputFile
Terminate


