##
##	INSTALLING OCR LIBRARIES FOR WINDOWS
##
## To check which OCR Languages you can install, use:
##      Get-WindowsCapability -Online | Where-Object { $_.Name -Like 'Language.OCR*' }
##

# Install British Language OCR
$Capability = Get-WindowsCapability -Online | Where-Object { $_.Name -Like 'Language.OCR*en-GB*' }
$Capability | Add-WindowsCapability -Online
# Install US Language OCR
$Capability = Get-WindowsCapability -Online | Where-Object { $_.Name -Like 'Language.OCR*en-US*' }
$Capability | Add-WindowsCapability -Online
# Install Italian Language OCR
$Capability = Get-WindowsCapability -Online | Where-Object { $_.Name -Like 'Language.OCR*it-IT*' }
$Capability | Add-WindowsCapability -Online
