@echo off
title Hash��У�鹤��-ж�س���
setlocal enabledelayedexpansion

:Uninstall_
set /p prevent=���Ҫж�س�����?(Y/N)[Ĭ��:Y]: 
if "%prevent%" == "N" goto end
if "%prevent%" == "n" goto end
set /a file_num=0
echo ====��ʾϸ��====
if exist %HASHSF_HOME%bin\HRI.exe (DEL /F /A /Q %HASHSF_HOME%bin\HRI.exe 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%bin\HRI.exe)
if exist %HASHSF_HOME%bin\Hash.exe (DEL /F /A /Q %HASHSF_HOME%bin\Hash.exe 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%bin\Hash.exe)
if exist %HASHSF_HOME%bin\HRU.exe (DEL /F /A /Q %HASHSF_HOME%bin\HRU.exe 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%bin\HRU.exe)
if exist %HASHSF_HOME%HashSF.bat (DEL /F /A /Q %HASHSF_HOME%HashSF.bat 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%HashSF.bat)
if exist %HASHSF_HOME%README.TXT (DEL /F /A /Q %HASHSF_HOME%README.TXT 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%README.TXT)
if exist %HASHSF_HOME%info\version.seafever (DEL /F /A /Q %HASHSF_HOME%info\version.seafever 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%info\version.seafever)
if exist %HASHSF_HOME%info\help.seafever (DEL /F /A /Q %HASHSF_HOME%info\help.seafever 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%info\help.seafever)
if exist %HASHSF_HOME%info (RD /S /Q %HASHSF_HOME%info 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%info�ļ���)
if exist %HASHSF_HOME%bin (RD /S /Q %HASHSF_HOME%bin 1>nul && set /a file_num+= 1 && echo ɾ��%HASHSF_HOME%bin�ļ���)

:continue
set /p continue=���潫����ע������������δ��ʹ�ù����Ҽ��˵����ߡ����û���������(Y/N)[Ĭ��:Y]...
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
echo �Ѿ������Ҽ��˵�����...

:end_Uninstall
echo ================
echo �ܼ�ɾ��%file_num%������
set /p sayByeA=��лʹ�ã����κ������������������ŶO(��_��)O
set /p sayByeB=����:https://github.com/Derek5-SeaFever/HashSF
if exist %HASHSF_HOME%Uninstall.exe (DEL /F /A /Q %HASHSF_HOME%Uninstall.exe 1>nul 2>nul)
if exist %HASHSF_HOME% (RD /S /Q %HASHSF_HOME% 1>nul 2>nul)
REG DELETE "HKEY_CURRENT_USER\Environment" /V HASHSF_HOME /F

endlocal
:end
exit