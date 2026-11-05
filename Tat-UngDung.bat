@echo off
chcp 65001 > nul
echo ====================================================
echo  Đang tắt máy chủ ứng dụng Quản lý Tài sản IT...
echo ====================================================
taskkill /F /IM ITAssetManagement.exe >nul 2>&1
echo Đã tắt hoàn toàn ứng dụng và giải phóng cổng mạng.
timeout /t 2 >nul
exit

