@echo off
title Hash��У�鹤��-ɾ���Ҽ��˵�

setlocal
cd %TEMP%
:export_regedit
set /p prevent=���Ҫ[31;1m�Ƴ�[37;0m�Ҽ��˵���(Y/N)[[36mĬ��:Y[37m]:
if [%prevent%] == [N] goto end
if [%prevent%] == [n] goto end
REG DELETE "HKEY_CLASSES_ROOT\*\shell\HashSF" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\MD5" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA256" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA384" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA512" /F
set /p end_cmd=�밴������˳�����...

endlocal
:end
goto:eof