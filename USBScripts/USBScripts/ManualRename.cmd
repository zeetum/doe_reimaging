@echo off
CLS

:wait
ping localhost -n 2 > nul
echo Starting Powershell Rename Script...

:Call DomainJoin Powershell
powershell.exe -noprofile -executionpolicy bypass -file %~dp0\DomainJoin\Rename.ps1

:wait
ping localhost -n 2 > nul
exit

