@echo off
title Hash��У�鹤��-����Ҽ��˵�

setlocal
cd %TEMP%
:import_regedit
set /p prevent=ȷ��Ҫ[31;1m���[37;0m�Ҽ��˵���(Y/N)[[36mĬ��:Y[37m]:
if [%prevent%] == [N] goto end
if [%prevent%] == [n] goto end
REG ADD "HKEY_CLASSES_ROOT\*\shell\HashSF" /V "SubCommands" /T "REG_SZ" /D "MD5;SHA1;SHA256;SHA384;SHA512" /F 
REG ADD "HKEY_CLASSES_ROOT\*\shell\HashSF" /V "MUIVerb" /T REG_SZ /D "Hash��У��@SeaFever" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\MD5" /T REG_SZ /D "MD5" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\MD5\command" /T REG_SZ /D "cmd /c HashSF \"%%1\" MD5" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA1" /T REG_SZ /D "SHA1" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA1\command" /T REG_SZ /D "cmd /c HashSF \"%%1\" SHA1" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA256" /T REG_SZ /D "SHA256" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA256\command" /T REG_SZ /D "cmd /c HashSF \"%%1\" SHA256" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA384" /T REG_SZ /D "SHA384" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA384\command" /T REG_SZ /D "cmd /c HashSF \"%%1\" SHA384" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA512" /T REG_SZ /D "SHA512" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA512\command" /T REG_SZ /D "cmd /c HashSF \"%%1\" SHA512" /F
set /p waite_cmd=�밴������˳�����...

endlocal
:end
goto:eof