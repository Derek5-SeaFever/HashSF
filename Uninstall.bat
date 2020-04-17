@echo off
title Hash码校验工具-卸载程序
setlocal enabledelayedexpansion

:Uninstall_
set /p prevent=真的要卸载程序吗?(Y/N)[默认:Y]: 
if "%prevent%" == "N" goto end
if "%prevent%" == "n" goto end
set /a file_num=0
echo ====显示细节====
if exist %HASHSF_HOME%bin\HRI.exe (DEL /F /A /Q %HASHSF_HOME%bin\HRI.exe 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%bin\HRI.exe)
if exist %HASHSF_HOME%bin\Hash.exe (DEL /F /A /Q %HASHSF_HOME%bin\Hash.exe 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%bin\Hash.exe)
if exist %HASHSF_HOME%bin\HRU.exe (DEL /F /A /Q %HASHSF_HOME%bin\HRU.exe 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%bin\HRU.exe)
if exist %HASHSF_HOME%HashSF.bat (DEL /F /A /Q %HASHSF_HOME%HashSF.bat 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%HashSF.bat)
if exist %HASHSF_HOME%README.TXT (DEL /F /A /Q %HASHSF_HOME%README.TXT 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%README.TXT)
if exist %HASHSF_HOME%info\version.seafever (DEL /F /A /Q %HASHSF_HOME%info\version.seafever 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%info\version.seafever)
if exist %HASHSF_HOME%info\help.seafever (DEL /F /A /Q %HASHSF_HOME%info\help.seafever 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%info\help.seafever)
if exist %HASHSF_HOME%info (RD /S /Q %HASHSF_HOME%info 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%info文件夹)
if exist %HASHSF_HOME%bin (RD /S /Q %HASHSF_HOME%bin 1>nul && set /a file_num+= 1 && echo 删除%HASHSF_HOME%bin文件夹)

:continue
set /p continue=下面将进行注册表清除工作，未曾使用过“右键菜单工具”的用户可以跳过(Y/N)[默认:Y]...
if "%continue%" == "N" goto end_Uninstall
if "%continue%" == "n" goto end_Uninstall
REG QUERY "HKEY_CLASSES_ROOT\*\shell\HashSF" /ve 1>nul 2>nul
if %ERRORLEVEL% EQU 0 (REG DELETE "HKEY_CLASSES_ROOT\*\shell\HashSF" /F && set /a file_num+= 1)
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\MD5" /ve 1>nul 2>nul
if %ERRORLEVEL% EQU 0 (REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\MD5" /F && set /a file_num+= 1)
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA1" /ve 1>nul 2>nul
if %ERRORLEVEL% EQU 0 (REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA1" /F && set /a file_num+= 1)
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA256" /ve 1>nul 2>nul
if %ERRORLEVEL% EQU 0 (REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA256" /F && set /a file_num+= 1)
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA384" /ve 1>nul 2>nul
if %ERRORLEVEL% EQU 0 (REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA384" /F && set /a file_num+= 1)
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA512" /ve 1>nul 2>nul
if %ERRORLEVEL% EQU 0 (REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SHA512" /F && set /a file_num+= 1)
echo 已经清理右键菜单残留...

:end_Uninstall
echo ================
echo 总计删除%file_num%项内容
set /p sayByeA=感谢使用，有任何问题可以来官网留言哦O(∩_∩)O
set /p sayByeB=官网:https://github.com/Derek5-SeaFever/HashSF
if exist %HASHSF_HOME%Uninstall.exe (DEL /F /A /Q %HASHSF_HOME%Uninstall.exe 1>nul 2>nul)
if exist %HASHSF_HOME% (RD /S /Q %HASHSF_HOME% 1>nul 2>nul)
REG DELETE "HKEY_CURRENT_USER\Environment" /V HASHSF_HOME /F

endlocal
:end
exit