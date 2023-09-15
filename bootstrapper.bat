@echo off
powershell -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BirdRoad1/mc/main/bootstrapper.ps1'))"
pause