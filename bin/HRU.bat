@echo off
title Hash码校验工具-删除右键菜单

setlocal
cd %TEMP%
:export_regedit
set /p prevent=真的要[31;1m移除[37;0m右键菜单吗？(Y/N)[[36m默认:Y[37m]:
if [%prevent%] == [N] goto end
if [%prevent%] == [n] goto end
REG DELETE "HKEY_CLASSES_ROOT\*\shell\HashSF" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\MD5" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA256" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA384" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA512" /F
set /p end_cmd=请按任意键退出程序...

endlocal
:end
goto:eof