@echo off
CLS

:McAfee Endpoint
echo Installing McAfee Endpoint ... Please Wait.
start /wait %~dp0\Installers\McAfeeEndpoint\setupEP.exe ADDLOCAL="FW,TP,WC" /qb
echo Done.

:Installs AcrobatDC
echo Installing Acrobat DC ... Please Wait.
start /wait msiexec.exe /i %~dp0\Installers\AcroRdrDC\AcroRead.msi /qn
echo Done.

:Java
echo Installing Java ... Please Wait.
start /wait %~dp0\Installers\Java\jre-8u211-windows-i586.exe /s
start /wait %~dp0\Installers\Java\jre-8u211-windows-x64.exe /s
echo Done.

:KLite Codec
echo Installing K-Lite Codecs ... Please Wait.
start /wait %~dp0\Installers\Klite\K-Lite_Codec_Pack_1488_Basic.exe /verysilent /norestart
echo Done.

:VLC2.2
echo Installing VLC ... Please Wait.
start /wait %~dp0\Installers\vlc\vlc-3.0.6-win32.exe /L=1033 /S /NCRC
echo Done.

:Office 2010
echo Installing Office 2016 Core... Please Wait.
start /wait %~dp0\Installers\Office2016\setup.exe /config %directorypath%\Installers\Office2016\install_office_all.xml
echo Done.

:Set PC Timezone
echo Setting timezone
tzutil /s "W. Australia Standard Time"
echo Done.

:Call DomainJoin Powershell Scripts
powershell.exe -noprofile -executionpolicy bypass -file %directorypath%\DomainJoin\JoinDomainRestartAll.ps1

:wait
ping localhost -n 5 > nul
exit