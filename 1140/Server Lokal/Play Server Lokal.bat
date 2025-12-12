@echo off
title PHP Local Server

REM Ambil IP lokal
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set ip=%%a
)
REM Hapus spasi
set ip=%ip: =%

set port=1140

echo ===============================================
echo  Server PHP Lokal Berjalan
echo  Folder   : %cd%
echo  IP Akses : http://%ip%:%port%
echo ===============================================

REM Buka firewall untuk port 1140 (jalan sekali saja)
netsh advfirewall firewall add rule name="PHPServer1140" dir=in action=allow protocol=TCP localport=%port% >nul 2>&1

REM Jalankan server PHP
php -S 0.0.0.0:%port%

pause
