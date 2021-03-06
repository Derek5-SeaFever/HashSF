@echo off
mode con cols=56 lines=18
title 安装向导 - HashSF
color 70
setlocal enabledelayedexpansion

:show_Welcome_page
if defined info_step_one set info_step_one=
cls
echo.
echo [36m     欢迎使用 HashSF 安装向导！[30m
echo.
echo ========================================================
echo      本向导将在您电脑上安装 HashSF
echo.
echo      建议您在继续之前关闭其他所有应用程序。
echo.
echo      输入“[31mN[30m”继续，或“[31mB[30m”返回上一步
echo.
echo      或“[31mE[30m”退出安装向导。
echo.
echo      "[]"里代表默认值。
echo ========================================================
echo.
echo.
echo.
set /p step_one=[34m [下一步(N)][36m
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
echo   [36m给 HashSF 找个家吧(/▽＼)...[30m
echo.
echo        将 HashSF 安装到何处？
echo ________________________________________________________
echo.
echo        安装向导将把 HashSF 安装到以下文件夹中。
echo.
echo   『直接将安装路径复制到此处，并确定即可』
echo ________________________________________________________
echo.
set /p HASHSF_HOME=[34m  路径:[40;36m
echo [47;30m
if defined HASHSF_HOME (echo   正在核查文件路径是否存在...) else (set /p error=[31m  请勿输入空内容！[30m & goto get_Setup_Path)
:check_HashSF_path
if exist %HASHSF_HOME% (echo [32m    文件路径可用！[30m) else (set /p error=[31m    文件路径不存在,请重新输入！[30m & goto get_Setup_Path)
echo.
echo   重新输入安装路径请输入“[31mR[30m”。
echo.
set /p step_three=[34m  [下一步(N)][36m
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
if %ERRORLEVEL% EQU 0 (echo [36m  配置中...[30m) else (set /p error=[31m  配置错误，请以管理员身份运行此程序！[30m & goto get_Setup_Path)
echo.
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /V Path | findstr "HASHSF_HOME" 1>nul 2<nul
 if %ERRORLEVEL% EQU 0 (echo [36m  配置完成！[30m) else (set /p error=[31m  配置失败，请参考官网说明再次安装...[30m & goto get_Setup_Path)
for /L %%i in (0 1 6) do (echo.)
set /p step_four=[34m  [安装(N)][36m
echo [30m
if [%step_four%] == [B] (goto get_Setup_Path)
if [%step_four%] == [b] (goto get_Setup_Path)
if [%step_four%] == [E] (exit /b 4)
if [%step_four%] == [e] (exit /b 4)

:Extract
cls
echo.
echo [36m  安装中...[30m
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
echo [36m  安装完成![30m
echo.
echo [31m  我们将模拟重启使配置生效，不用担心...[30m
echo.
:restart
taskkill /im explorer.exe /f 1>NUL 2>NUL
start explorer.exe 1>NUL 2>NUL
set /p run_first=[34m  [安装完成][30m
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
echo [36m许可协议[31m - 请阅读以下重要信息，然后再进入下一步。[30m
echo [40;37m
echo [31;1m请阅读以下许可协议。您必须接受此协议的条款，然后才能继续安装。[37;0m                                                  
echo +================HashSF最终用户许可协议================+
echo ^| 安装任何 HashSF 系列软件前请详细阅读此协议。         ^|
echo ^|                                                      ^|
echo ^| 本最终用户许可协议(“许可”)是您(“您”或“您的”)与 ^|
echo ^| SeaFever("作者")之间签订的具有约束力的协议。         ^|
echo ^|                                                      ^|
echo ^| 致所有用户的重要说明:                                ^|
echo ^|                                                      ^|
echo ^| 安装该软件，即表示同意本条款和约束。如果您不同意本许 ^|
echo ^| 可的条款，我们将不会许可您使用该软件和该文档，您必须 ^|
echo ^| 立即停止安装程序。                                   ^|
echo +======================================================+
echo [47;30m
set /p info_step_one=[34m  [下一页(N)][36m
echo [30m
if [%info_step_one%] == [B] (goto show_Welcome_page)
if [%info_step_one%] == [b] (goto show_Welcome_page)
if [%info_step_one%] == [E] (exit /b 21)
if [%info_step_one%] == [e] (exit /b 21)
:information_two
if defined info_step_one set info_step_one=
if defined info_step_three set info_step_three=
cls
echo [34m  [上一页(B)][30m
echo [40;37m
echo +==============HashSF最终用户许可协议(续)==============+
echo ^|                                                      ^|
echo ^| 1.免责声明:                                          ^|
echo ^|   本软件仅发布于GitHub,唯一官网为:https://github.com ^|
echo ^| /Derek5-SeaFever/HashSF 。唯一下载地址为:https://git ^|
echo ^| hub.com/Derek5-SeaFever/HashSF.git 。任何以其它途径  ^|
echo ^| 获取的本软件均与作者无关。请广大用户认准官网，从官网 ^|
echo ^| 下载本软件。                                         ^|
echo ^|                                                      ^|
echo ^|   因为使用了非官网的软件包而造成了任何损失请联系问题 ^|
echo ^| 软件包的发布人(问题软件包来源)，这与作者本人无关。   ^|
echo ^|                                                      ^|
echo ^|   请支持正版，打击盗版!                               ^|
echo +======================================================+
echo [47;30m
set /p info_step_two=[34m  [下一页(N)][36m
echo [30m
if [%info_step_two%] == [B] (goto information_one)
if [%info_step_two%] == [b] (goto information_one)
if [%info_step_two%] == [E] (exit /b 22)
if [%info_step_two%] == [e] (exit /b 22)
:information_three
if defined info_step_two set info_step_two=
if defined info_step_four set info_step_four=
cls
echo [34m  [上一页(B)][30m
echo [40;37m
echo +==============HashSF最终用户许可协议(续)==============+
echo ^|                                                      ^|
echo ^| 2.许可限制:您不得:                                   ^|
echo ^|                                                      ^|
echo ^| （a）删除、更改、掩盖或混淆软件中放置或嵌入的任何产  ^|
echo ^|  品标识、版权声明或其他所有权声明；                  ^|
echo ^|                                                      ^|
echo ^| （b）出售、租赁、出租、复制或分发该软件或该文档予他  ^|
echo ^|  人；                                                ^|
echo ^|                                                      ^|
echo ^| （c）促使或允许对该软件进行逆向工程、反汇编、反编译  ^|
echo ^| 或变更，但适用法律明确禁止对此类行为的此类限制则除   ^|
echo ^| 外；                                                 ^|
echo +======================================================+
echo [47;30m
set /p info_step_three=[34m  [下一页(N)][36m
echo [30m
if [%info_step_three%] == [B] (goto information_two)
if [%info_step_three%] == [b] (goto information_two)
if [%info_step_three%] == [E] (exit /b 23)
if [%info_step_three%] == [e] (exit /b 23)
:information_four
if defined info_step_three set info_step_three=
if defined info_step_five set info_step_five=
cls
echo [34m  [上一页(B)][30m
echo [40;37m
echo +==============HashSF最终用户许可协议(续)==============+
echo ^|                                                      ^|
echo ^| (续上)您不得:                                        ^|
echo ^|                                                      ^|
echo ^| （d）将该软件用于竞争分析目的；                      ^|
echo ^|                                                      ^|
echo ^| （e）将该软件再许可予任何第三方，包括您自己的客户。  ^|
echo ^|                                                      ^|
echo ^| 3.著作权 / 拥有权:                                   ^|
echo ^|   您承认并同意，该软件和该文档在世界任何地方的所有知 ^|
echo ^| 识产权均属于作者SeaFever。该软件、其源代码和该文档均 ^|
echo ^| 为作者SeaFever的专有产品，并受著作权和其他知识产权法 ^|
echo ^| 保护。作者始终保留对该软件或该文档的一切权利。       ^|
echo +======================================================+
echo [47;30m
set /p info_step_four=[34m  [下一页(N)][36m
echo [30m
if [%info_step_four%] == [B] (goto information_three)
if [%info_step_four%] == [b] (goto information_three)
if [%info_step_four%] == [E] (exit /b 24)
if [%info_step_four%] == [e] (exit /b 24)
:information_five
if defined info_step_four set info_step_four=
if defined info_step_six set info_step_six=
cls
echo [34m  [上一页(B)][30m
echo [40;37m
echo +==============HashSF最终用户许可协议(续)==============+
echo ^|                                                      ^|
echo ^| 4.担保:                                              ^|
echo ^|   作者本人不对此软件做出任何担保，一切行为都是您在同 ^|
echo ^| 意了本协议后自愿进行的。                             ^|
echo ^|                                                      ^|
echo ^|   您承担下载或使用该软件时的所有风险。您承认，在您使 ^|
echo ^| 用该软件之前，您下载该软件的计算机设备可能已被损坏， ^|
echo ^| 或您需要校验哈希码的文件已经损坏(或由其它原因)导致无 ^|
echo ^| 法计算出正确的哈希码。因此，作者本人无法保证使用该软 ^|
echo ^| 件一定能计算出正确的哈希码。所以，由该软件得到的哈希 ^|
echo ^| 码仅供参考，不作为标准或唯一答案。                   ^|
echo ^|                                                      ^|
echo +======================================================+
echo [47;30m
set /p info_step_five=[34m  [下一页(N)][36m
echo [30m
if [%info_step_five%] == [B] (goto information_four)
if [%info_step_five%] == [b] (goto information_four)
if [%info_step_five%] == [E] (exit /b 25)
if [%info_step_five%] == [e] (exit /b 25)
:information_six
if defined info_step_five set info_step_five=
if defined step_two set step_two=
cls
echo [34m  [上一页(B)][30m
echo [40;37m
echo +==============HashSF最终用户许可协议(续)==============+
echo ^|                                                      ^|
echo ^| 5.强调:                                              ^|
echo ^|   如果您违反了协议内任何内容，作者本人有权收回您的使 ^|
echo ^| 用权及其它一切相关权利，并有权获得一定金额的赔偿。   ^|
echo ^|                                                      ^|
echo ^|   如果您恶意使用该软件传播网络病毒、木马、淫秽信息、 ^|
echo ^| 暴力信息等违法内容，亦或有其它任何可能违反当地地区   ^|
echo ^| (或"国家")法律的行为，作者本人对此不承担任何责任，并 ^|
echo ^| 且有权收回您的使用权，同时也有权禁止您再次使用本软   ^|
echo ^| 件。                                                 ^|
echo ^|                                                      ^|
echo ^|  害人之心不可有，防人之心不可无!                      ^|
echo +======================================================+
echo [47;30m
set /p info_step_six=[34m  [我接受许可协议(N)][36m
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
echo      我会在安装目录下的README文件里保存一份复件,便于
echo.
echo    您的下次查看。
for /L %%i in (0 1 6) do (echo.)
set /p step_two=[34m  [我知道了(N)][36m
echo [30m
if [%step_two%] == [B] goto information_six
if [%step_two%] == [b] goto information_six
if [%step_two%] == [E] exit /b 2
if [%step_two%] == [e] exit /b 2
goto back_Legal_Information