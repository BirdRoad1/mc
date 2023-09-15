$ProgressPreference = 'SilentlyContinue'

if (-Not (Test-Path 'Z:\')) {
	Write-Output 'Mounting Z: drive...'
	subst Z: $env:userprofile
}

if (-Not (Test-Path 'Z:\Downloads\7zr.exe' -PathType Leaf)) {
	Write-Output 'downloading 7zip...'
	Invoke-WebRequest 'https://www.7-zip.org/a/7zr.exe' -OutFile Z:\Downloads\7zr.exe
}

$drive_url = 'https://drive.google.com/uc?export=download&id=1JmGZVXFDSdrn0_AilSKyPMkl8ZNvoZYE&confirm=t'

if (-Not (Test-Path Z:\Downloads\archive.7z -PathType Leaf)) {
	Write-Output 'downloading archive...'
	Invoke-WebRequest $drive_url -OutFile 'Z:\Downloads\archive.7z'
}

if (Test-Path archive) {
	Remove-Item -Recurse -Force archive
}

& Z:\Downloads\7zr.exe x "Z:\Downloads\archive.7z" -o"Z:\Downloads\archive" -aoa

Write-Output "All done!"
explorer.exe Z:\Downloads\archive\

Write-Output "Leave this window open! When ready, press any key to delete the game and dismount Z:"
pause

taskkill /f /im java.exe
taskkill /f /im explorer.exe
Remove-Item -Recurse -Force Z:\Downloads\archive\
Remove-Item -Force Z:\Downloads\archive.7z

subst Z: /d
explorer.exe
