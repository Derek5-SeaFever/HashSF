@echo off
mode con cols=56 lines=18
title ��װ�� - HashSF
color 70
setlocal enabledelayedexpansion

:show_Welcome_page
if defined info_step_one set info_step_one=
cls
echo.
echo [36m     ��ӭʹ�� HashSF ��װ�򵼣�[30m
echo.
echo ========================================================
echo      ���򵼽����������ϰ�װ HashSF
echo.
echo      �������ڼ���֮ǰ�ر���������Ӧ�ó���
echo.
echo      ���롰[31mN[30m����������[31mB[30m��������һ��
echo.
echo      ��[31mE[30m���˳���װ�򵼡�
echo.
echo      "[]"�����Ĭ��ֵ��
echo ========================================================
echo.
echo.
echo.
set /p step_one=[34m [��һ��(N)][36m
echo [30m
if [%step_one%] == [E] (exit /b 1)
if [%step_one%] == [e] (exit /b 1)

:show_Legal_Information
goto legal_Information
:back_Legal_Information

:get_Setup_Path
if defined step_two set step_two=
if defined step_three set step_three=
if defined step_four set step_four=
if defined HASHSF_HOME set HASHSF_HOME=
if defined error set error=
cls
echo   [36m�� HashSF �Ҹ��Ұ�(/����)...[30m
echo.
echo        �� HashSF ��װ���δ���
echo ________________________________________________________
echo.
echo        ��װ�򵼽��� HashSF ��װ�������ļ����С�
echo.
echo   ��ֱ�ӽ���װ·�����Ƶ��˴�����ȷ�����ɡ�
echo ________________________________________________________
echo.
set /p HASHSF_HOME=[34m  ·��:[40;36m
echo [47;30m
if defined HASHSF_HOME (echo   ���ں˲��ļ�·���Ƿ����...) else (set /p error=[31m  ������������ݣ�[30m & goto get_Setup_Path)
:check_HashSF_path
if exist %HASHSF_HOME% (echo [32m    �ļ�·�����ã�[30m) else (set /p error=[31m    �ļ�·��������,���������룡[30m & goto get_Setup_Path)
echo.
echo   �������밲װ·�������롰[31mR[30m����
echo.
set /p step_three=[34m  [��һ��(N)][36m
echo [30m
if [%step_three%] == [B] (goto infomation_end)
if [%step_three%] == [b] (goto infomation_end)
if [%step_three%] == [E] (exit /b 3)
if [%step_three%] == [e] (exit /b 3)
if [%step_three%] == [R] (goto get_Setup_Path)
if [%step_three%] == [r] (goto get_Setup_Path)

:set_Enviroment_Path
if defined step_three set step_three=
cls
set HASHSF_HOME=%HASHSF_HOME%\HashSF\
for /L %%i in (0 1 6) do (echo.)
wmic ENVIRONMENT create name="HASHSF_HOME",username="<system>",VariableValue=%HASHSF_HOME% 1>NUL 2>NUL
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%%HASHSF_HOME%%;%Path%" 1>NUL 2>NUL
:check_Enviroment_Path_Exist
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "HASHSF_HOME" 1>nul 2>nul
if %ERRORLEVEL% EQU 0 (echo [36m  ������...[30m) else (set /p error=[31m  ���ô������Թ���Ա������д˳���[30m & goto get_Setup_Path)
echo.
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /V Path | findstr "HASHSF_HOME" 1>nul 2<nul
 if %ERRORLEVEL% EQU 0 (echo [36m  ������ɣ�[30m) else (set /p error=[31m  ����ʧ�ܣ���ο�����˵���ٴΰ�װ...[30m & goto get_Setup_Path)
for /L %%i in (0 1 6) do (echo.)
set /p step_four=[34m  [��װ(N)][36m
echo [30m
if [%step_four%] == [B] (goto get_Setup_Path)
if [%step_four%] == [b] (goto get_Setup_Path)
if [%step_four%] == [E] (exit /b 4)
if [%step_four%] == [e] (exit /b 4)

:Extract
cls
echo.
echo [36m  ��װ��...[30m
echo ========================================================
md %HASHSF_HOME%
md %HASHSF_HOME%bin
md %HASHSF_HOME%info
copy "%~dp0HashSF.bat" "%HASHSF_HOME%"
move "%~dp0HashSF.bat" "%USERPROFILE%\DESKTOP"
move "%~dp0Uninstall.exe" "%HASHSF_HOME%"
move "%~dp0Hash.exe" "%HASHSF_HOME%bin"
move "%~dp0HRI.exe" "%HASHSF_HOME%bin"
move "%~dp0HRU.exe" "%HASHSF_HOME%bin"
move "%~dp0help.seafever" "%HASHSF_HOME%info"
move "%~dp0version.seafever" "%HASHSF_HOME%info"
move "%~dp0README.TXT" "%HASHSF_HOME%"
:set_Desktop_ICON
echo ========================================================
echo [36m  ��װ���![30m
echo.
echo [31m  ���ǽ�ģ������ʹ������Ч�����õ���...[30m
echo.
:restart
taskkill /im explorer.exe /f 1>NUL 2>NUL
start explorer.exe 1>NUL 2>NUL
set /p run_first=[34m  [��װ���][30m
if [%run_first%] == [E] exit /b 0
if [%run_first%] == [e] exit /b 0


:end
endlocal
DEL /F /A /Q %0
exit /b 0

:legal_Information
:information_one
if defined step_one set step_one=
if defined info_step_two set info_step_two=
cls
echo [36m���Э��[31m - ���Ķ�������Ҫ��Ϣ��Ȼ���ٽ�����һ����[30m
echo [40;37m
echo [31;1m���Ķ��������Э�顣��������ܴ�Э������Ȼ����ܼ�����װ��[37;0m                                                  
echo +================HashSF�����û����Э��================+
echo ^| ��װ�κ� HashSF ϵ�����ǰ����ϸ�Ķ���Э�顣         ^|
echo ^|                                                      ^|
echo ^| �������û����Э��(����ɡ�)����(�����������ġ�)�� ^|
echo ^| SeaFever("����")֮��ǩ���ľ���Լ������Э�顣         ^|
echo ^|                                                      ^|
echo ^| �������û�����Ҫ˵��:                                ^|
echo ^|                                                      ^|
echo ^| ��װ�����������ʾͬ�Ȿ�����Լ�����������ͬ�Ȿ�� ^|
echo ^| �ɵ�������ǽ����������ʹ�ø�����͸��ĵ��������� ^|
echo ^| ����ֹͣ��װ����                                   ^|
echo +======================================================+
echo [47;30m
set /p info_step_one=[34m  [��һҳ(N)][36m
echo [30m
if [%info_step_one%] == [B] (goto show_Welcome_page)
if [%info_step_one%] == [b] (goto show_Welcome_page)
if [%info_step_one%] == [E] (exit /b 21)
if [%info_step_one%] == [e] (exit /b 21)
:information_two
if defined info_step_one set info_step_one=
if defined info_step_three set info_step_three=
cls
echo [34m  [��һҳ(B)][30m
echo [40;37m
echo +==============HashSF�����û����Э��(��)==============+
echo ^|                                                      ^|
echo ^| 1.��������:                                          ^|
echo ^|   �������������GitHub,Ψһ����Ϊ:https://github.com ^|
echo ^| /Derek5-SeaFever/HashSF ��Ψһ���ص�ַΪ:https://git ^|
echo ^| hub.com/Derek5-SeaFever/HashSF.git ���κ�������;��  ^|
echo ^| ��ȡ�ı�������������޹ء������û���׼�������ӹ��� ^|
echo ^| ���ر������                                         ^|
echo ^|                                                      ^|
echo ^|   ��Ϊʹ���˷ǹ������������������κ���ʧ����ϵ���� ^|
echo ^| ������ķ�����(�����������Դ)���������߱����޹ء�   ^|
echo ^|                                                      ^|
echo ^|   ��֧�����棬�������!                               ^|
echo +======================================================+
echo [47;30m
set /p info_step_two=[34m  [��һҳ(N)][36m
echo [30m
if [%info_step_two%] == [B] (goto information_one)
if [%info_step_two%] == [b] (goto information_one)
if [%info_step_two%] == [E] (exit /b 22)
if [%info_step_two%] == [e] (exit /b 22)
:information_three
if defined info_step_two set info_step_two=
if defined info_step_four set info_step_four=
cls
echo [34m  [��һҳ(B)][30m
echo [40;37m
echo +==============HashSF�����û����Э��(��)==============+
echo ^|                                                      ^|
echo ^| 2.�������:������:                                   ^|
echo ^|                                                      ^|
echo ^| ��a��ɾ�������ġ��ڸǻ��������з��û�Ƕ����κβ�  ^|
echo ^|  Ʒ��ʶ����Ȩ��������������Ȩ������                  ^|
echo ^|                                                      ^|
echo ^| ��b�����ۡ����ޡ����⡢���ƻ�ַ����������ĵ�����  ^|
echo ^|  �ˣ�                                                ^|
echo ^|                                                      ^|
echo ^| ��c����ʹ������Ը�����������򹤳̡�����ࡢ������  ^|
echo ^| �����������÷�����ȷ��ֹ�Դ�����Ϊ�Ĵ����������   ^|
echo ^| �⣻                                                 ^|
echo +======================================================+
echo [47;30m
set /p info_step_three=[34m  [��һҳ(N)][36m
echo [30m
if [%info_step_three%] == [B] (goto information_two)
if [%info_step_three%] == [b] (goto information_two)
if [%info_step_three%] == [E] (exit /b 23)
if [%info_step_three%] == [e] (exit /b 23)
:information_four
if defined info_step_three set info_step_three=
if defined info_step_five set info_step_five=
cls
echo [34m  [��һҳ(B)][30m
echo [40;37m
echo +==============HashSF�����û����Э��(��)==============+
echo ^|                                                      ^|
echo ^| (����)������:                                        ^|
echo ^|                                                      ^|
echo ^| ��d������������ھ�������Ŀ�ģ�                      ^|
echo ^|                                                      ^|
echo ^| ��e�����������������κε��������������Լ��Ŀͻ���  ^|
echo ^|                                                      ^|
echo ^| 3.����Ȩ / ӵ��Ȩ:                                   ^|
echo ^|   �����ϲ�ͬ�⣬������͸��ĵ��������κεط�������֪ ^|
echo ^| ʶ��Ȩ����������SeaFever�����������Դ����͸��ĵ��� ^|
echo ^| Ϊ����SeaFever��ר�в�Ʒ����������Ȩ������֪ʶ��Ȩ�� ^|
echo ^| ����������ʼ�ձ����Ը��������ĵ���һ��Ȩ����       ^|
echo +======================================================+
echo [47;30m
set /p info_step_four=[34m  [��һҳ(N)][36m
echo [30m
if [%info_step_four%] == [B] (goto information_three)
if [%info_step_four%] == [b] (goto information_three)
if [%info_step_four%] == [E] (exit /b 24)
if [%info_step_four%] == [e] (exit /b 24)
:information_five
if defined info_step_four set info_step_four=
if defined info_step_six set info_step_six=
cls
echo [34m  [��һҳ(B)][30m
echo [40;37m
echo +==============HashSF�����û����Э��(��)==============+
echo ^|                                                      ^|
echo ^| 4.����:                                              ^|
echo ^|   ���߱��˲��Դ���������κε�����һ����Ϊ��������ͬ ^|
echo ^| ���˱�Э�����Ը���еġ�                             ^|
echo ^|                                                      ^|
echo ^|   ���е����ػ�ʹ�ø����ʱ�����з��ա������ϣ�����ʹ ^|
echo ^| �ø����֮ǰ�������ظ�����ļ�����豸�����ѱ��𻵣� ^|
echo ^| ������ҪУ���ϣ����ļ��Ѿ���(��������ԭ��)������ ^|
echo ^| ���������ȷ�Ĺ�ϣ�롣��ˣ����߱����޷���֤ʹ�ø��� ^|
echo ^| ��һ���ܼ������ȷ�Ĺ�ϣ�롣���ԣ��ɸ�����õ��Ĺ�ϣ ^|
echo ^| ������ο�������Ϊ��׼��Ψһ�𰸡�                   ^|
echo ^|                                                      ^|
echo +======================================================+
echo [47;30m
set /p info_step_five=[34m  [��һҳ(N)][36m
echo [30m
if [%info_step_five%] == [B] (goto information_four)
if [%info_step_five%] == [b] (goto information_four)
if [%info_step_five%] == [E] (exit /b 25)
if [%info_step_five%] == [e] (exit /b 25)
:information_six
if defined info_step_five set info_step_five=
if defined step_two set step_two=
cls
echo [34m  [��һҳ(B)][30m
echo [40;37m
echo +==============HashSF�����û����Э��(��)==============+
echo ^|                                                      ^|
echo ^| 5.ǿ��:                                              ^|
echo ^|   �����Υ����Э�����κ����ݣ����߱�����Ȩ�ջ�����ʹ ^|
echo ^| ��Ȩ������һ�����Ȩ��������Ȩ���һ�������⳥��   ^|
echo ^|                                                      ^|
echo ^|   ���������ʹ�ø�����������粡����ľ��������Ϣ�� ^|
echo ^| ������Ϣ��Υ�����ݣ�����������κο���Υ�����ص���   ^|
echo ^| (��"����")���ɵ���Ϊ�����߱��˶Դ˲��е��κ����Σ��� ^|
echo ^| ����Ȩ�ջ�����ʹ��Ȩ��ͬʱҲ��Ȩ��ֹ���ٴ�ʹ�ñ���   ^|
echo ^| ����                                                 ^|
echo ^|                                                      ^|
echo ^|  ����֮�Ĳ����У�����֮�Ĳ�����!                      ^|
echo +======================================================+
echo [47;30m
set /p info_step_six=[34m  [�ҽ������Э��(N)][36m
echo [30m
if [%info_step_six%] == [B] (goto information_five)
if [%info_step_six%] == [b] (goto information_five)
if [%info_step_six%] == [E] (exit /b 25)
if [%info_step_six%] == [e] (exit /b 25)

:infomation_end
if defined info_step_five set info_step_five=
if defined step_three set step_three=
cls
for /L %%i in (0 1 6) do (echo.)
echo      �һ��ڰ�װĿ¼�µ�README�ļ��ﱣ��һ�ݸ���,����
echo.
echo    �����´β鿴��
for /L %%i in (0 1 6) do (echo.)
set /p step_two=[34m  [��֪����(N)][36m
echo [30m
if [%step_two%] == [B] goto information_six
if [%step_two%] == [b] goto information_six
if [%step_two%] == [E] exit /b 2
if [%step_two%] == [e] exit /b 2
goto back_Legal_Information