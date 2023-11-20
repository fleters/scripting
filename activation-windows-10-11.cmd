@echo off
title ["Activation Windows | VINA Project - Fleter Project"]
mode con cols=60 lines=13
net session >nul 2>&1
if %errorlevel% equ 0 (
  goto :checkinternet
) else (
  cls & echo Fleter Project & echo =============== & echo. & echo.
  echo Mohon membuka skrip ini pada user admin, atau 
  echo jalankan skrip ini sebagai administrator.
  exit
)

:checkinternet
@echo off
cls & echo Fleter Project & echo =============== & echo. & echo.
echo Mengecek Koneksi Internet...
PING -n 1 kms8.msguides.com >NUL
IF %ERRORLEVEL% NEQ 1 (
  goto :startup
) else (
  cls & echo Fleter Project & echo =============== & echo. & echo.
  echo Script ini memerlukan internet agar dapat berjalan
  echo mohon hubungkan komputer anda ke internet.
  timeout /t 3 >nul
  goto :checkinternet
)

:startup
cls & echo Fleter Project & echo =============== & echo. & echo.
echo Kami akan mengecek kompatibilitas sistem operasi anda.
echo Lanjutkan? (y/n) (kosong: y)
set /p tempvar=
if [%tempvar%] == [] (
  cls
  goto :systeminfo
) else if [%tempvar%] == [y] (
  cls
  goto :systeminfo
) else if [%tempvar%] == [n] (
  cls
  goto :exit
) else if [%tempvar%] == [] (
  cls
  goto :systeminfo
) else (
  cls
  goto :startup
)

:systeminfo
cls & echo Fleter Project & echo =============== & echo. & echo.
wmic os get caption | find /I "Windows 10" >nul
if [%errorlevel%] == [0] (
  echo Supported Windows 10
  timeout /t 1 >nul
  goto :confirmclear
)
wmic os get caption | find /I "Windows 11" >nul
if [%errorlevel%] == [0] (
  echo Supported Windows 11
  timeout /t 1 >nul
  goto :confirmclear
)
goto :notavaiable

:confirmclear
cls
cls & echo Fleter Project & echo =============== & echo. & echo.
echo Kami akan menghilangkan semua kode aktivasi di windows anda.
echo Lanjutkan? (y/n) (kosong: y)
set /p tempvar=
if [%tempvar%] == [] (
  cls
  goto :clear
) else if [%tempvar%] == [y] (
  cls
  goto :clear
) else if [%tempvar%] == [n] (
  cls
  goto :exit
) else (
  cls
  goto :startup
)

:clear
cls & echo Fleter Project & echo =============== & echo. & echo.
echo Membersihkan kunci aktivasi...
cscript slmgr.vbs /ckms >nul
cscript slmgr.vbs /upk >nul
cscript slmgr.vbs /cpky >nul
cls
goto :activation

:activation
cls & echo Fleter Project & echo =============== & echo. & echo.
echo Mengaktivasi Windows Anda...
echo.
timeout /t 2 /nobreak >nul
wmic os get caption | find /I "Pro N for Workstations" >nul
if [%errorlevel%] == [0] (
  goto :notavaiable
)
wmic os get caption | find /I "Pro for Workstations" >nul
if [%errorlevel%] == [0] (
  set key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
  goto :msgang-script
)
wmic os get caption | find /I "Pro Education N" >nul
if [%errorlevel%] == [0] (
  goto :notavaiable
)
wmic os get caption | find /I "Pro Education" >nul
if [%errorlevel%] == [0] (
  set key=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
  goto :msgang-script
)
wmic os get caption | find /I "Pro N" >nul
if [%errorlevel%] == [0] (
  set key=MH37W-N47XK-V7XM9-C7227-GCQG9
  goto :msguides-script
)
wmic os get caption | find /I "Pro" >nul
if [%errorlevel%] == [0] (
  set key=W269N-WFGWX-YVC9B-4J6C9-T83GX
  goto :msguides-script
)
wmic os get caption | find /I "Education N" >nul
if [%errorlevel%] == [0] (
  set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
  goto :msguides-script
)
wmic os get caption | find /I "Education" >nul
if [%errorlevel%] == [0] (
  set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
  goto :msguides-script
)
wmic os get caption | find /I "Home Single Language" >nul
if [%errorlevel%] == [0] (
  set key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
  goto :msguides-script
)
wmic os get caption | find /I "Home N" >nul
if [%errorlevel%] == [0] (
  set key=3KHY7-WNT83-DGQKR-F7HPR-844BM
  goto :msguides-script
)
wmic os get caption | find /I "Home" >nul
if [%errorlevel%] == [0] (
  set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
  goto :msguides-script
)
goto :notavaiable

:msgang-script
cscript slmgr.vbs /ipk %key% >nul
cscript slmgr.vbs /skms kms.msgang.com >nul
cscript slmgr.vbs /ato >nul
goto :activated
:msguides-script
cscript slmgr.vbs /ipk %key% >nul
cscript slmgr.vbs /skms kms8.msguides.com >nul
cscript slmgr.vbs /ato >nul
goto :activated

:notavaiable
cls
cls & echo Fleter Project & echo =============== & echo. & echo.
echo Kami Belum Mendukung Sistem Operasi Yang
echo Anda Gunakan Saat Ini.
echo.
goto :exit

:activated
echo Windows Anda Berhasil Ter-Aktivasi. Untuk mengecek apakah
echo windows anda sudah benar benar ter-aktivasi atau belum,
echo silahkan buka Settings untuk lebih lengkap nya.
echo.
goto :exit

:exit
del "C:\temp\activate.cmd"
echo Press any key to exit...
pause >nul
exit
