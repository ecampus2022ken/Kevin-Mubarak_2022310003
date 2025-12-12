@echo off
title Local HTTP Server

:: Ambil direktori file BAT
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

:: Ambil IPv4 dari ipconfig
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set ip_raw=%%a
    goto found
)

:found
:: Hilangkan spasi depan
set LOCAL_IP=%ip_raw: =%

echo ==============================
echo  Local HTTP File Server
echo ==============================
echo  Folder   : %SCRIPT_DIR%
echo  Address  : http://%LOCAL_IP%:8000
echo ==============================
echo(
echo Server berjalan... Tekan CTRL + C untuk menghentikan.
echo(

python -m http.server 8000

pause
