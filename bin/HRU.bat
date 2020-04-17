@echo off
title HashÂëÐ£Ñé¹¤¾ß-É¾³ýÓÒ¼ü²Ëµ¥

setlocal
cd %TEMP%
:export_regedit
set /p prevent=ÕæµÄÒª[31;1mÒÆ³ý[37;0mÓÒ¼ü²Ëµ¥Âð£¿(Y/N)[[36mÄ¬ÈÏ:Y[37m]:
if [%prevent%] == [N] goto end
if [%prevent%] == [n] goto end
REG DELETE "HKEY_CLASSES_ROOT\*\shell\HashSF" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\MD5" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA256" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA384" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA512" /F
set /p end_cmd=Çë°´ÈÎÒâ¼üÍË³ö³ÌÐò...

endlocal
:end
goto:eof