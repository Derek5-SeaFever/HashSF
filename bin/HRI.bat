@echo off
title Hash码校验工具-添加右键菜单

setlocal
cd %TEMP%
:import_regedit
set /p prevent=确定要[31;1m添加[37;0m右键菜单吗？(Y/N)[[36m默认:Y[37m]:
if [%prevent%] == [N] goto end
if [%prevent%] == [n] goto end
REG ADD "HKEY_CLASSES_ROOT\*\shell\HashSF" /V "SubCommands" /T "REG_SZ" /D "MD5;SHA1;SHA256;SHA384;SHA512" /F 
REG ADD "HKEY_CLASSES_ROOT\*\shell\HashSF" /V "MUIVerb" /T REG_SZ /D "Hash码校验@SeaFever" /F
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
set /p waite_cmd=请按任意键退出程序...

endlocal
:end
goto:eof