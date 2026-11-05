@echo off
chcp 65001 > nul
cd /d "%~dp0publish"
start "" "ITAssetManagement.exe"
exit
