@echo off
mode con cols=56 lines=18
title °²×°Ïòµ¼ - HashSF
color 70
setlocal enabledelayedexpansion

:show_Welcome_page
if defined info_step_one set info_step_one=
cls
echo.
echo [36m     »¶Ó­Ê¹ÓÃ HashSF °²×°Ïòµ¼£¡[30m
echo.
echo ========================================================
echo      ±¾Ïòµ¼½«ÔÚÄúµçÄÔÉÏ°²×° HashSF
echo.
echo      ½¨ÒéÄúÔÚ¼ÌĞøÖ®Ç°¹Ø±ÕÆäËûËùÓĞÓ¦ÓÃ³ÌĞò¡£
echo.
echo      ÊäÈë¡°[31mN[30m¡±¼ÌĞø£¬»ò¡°[31mB[30m¡±·µ»ØÉÏÒ»²½
echo.
echo      »ò¡°[31mE[30m¡±ÍË³ö°²×°Ïòµ¼¡£
echo.
echo      "[]"Àï´ú±íÄ¬ÈÏÖµ¡£
echo ========================================================
echo.
echo.
echo.
set /p step_one=[34m [ÏÂÒ»²½(N)][36m
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
echo   [36m¸ø HashSF ÕÒ¸ö¼Ò°É(/¨Œ£Ü)...[30m
echo.
echo        ½« HashSF °²×°µ½ºÎ´¦£¿
echo ________________________________________________________
echo.
echo        °²×°Ïòµ¼½«°Ñ HashSF °²×°µ½ÒÔÏÂÎÄ¼ş¼ĞÖĞ¡£
echo.
echo   ¡ºÖ±½Ó½«°²×°Â·¾¶¸´ÖÆµ½´Ë´¦£¬²¢È·¶¨¼´¿É¡»
echo ________________________________________________________
echo.
set /p HASHSF_HOME=[34m  Â·¾¶:[40;36m
echo [47;30m
if defined HASHSF_HOME (echo   ÕıÔÚºË²éÎÄ¼şÂ·¾¶ÊÇ·ñ´æÔÚ...) else (set /p error=[31m  ÇëÎğÊäÈë¿ÕÄÚÈİ£¡[30m & goto get_Setup_Path)
:check_HashSF_path
if exist %HASHSF_HOME% (echo [32m    ÎÄ¼şÂ·¾¶¿ÉÓÃ£¡[30m) else (set /p error=[31m    ÎÄ¼şÂ·¾¶²»´æÔÚ,ÇëÖØĞÂÊäÈë£¡[30m & goto get_Setup_Path)
echo.
echo   ÖØĞÂÊäÈë°²×°Â·¾¶ÇëÊäÈë¡°[31mR[30m¡±¡£
echo.
set /p step_three=[34m  [ÏÂÒ»²½(N)][36m
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
if %ERRORLEVEL% EQU 0 (echo [36m  ÅäÖÃÖĞ...[30m) else (set /p error=[31m  ÅäÖÃ´íÎó£¬ÇëÒÔ¹ÜÀíÔ±Éí·İÔËĞĞ´Ë³ÌĞò£¡[30m & goto get_Setup_Path)
echo.
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /V Path | findstr "HASHSF_HOME" 1>nul 2<nul
 if %ERRORLEVEL% EQU 0 (echo [36m  ÅäÖÃÍê³É£¡[30m) else (set /p error=[31m  ÅäÖÃÊ§°Ü£¬Çë²Î¿¼¹ÙÍøËµÃ÷ÔÙ´Î°²×°...[30m & goto get_Setup_Path)
for /L %%i in (0 1 6) do (echo.)
set /p step_four=[34m  [°²×°(N)][36m
echo [30m
if [%step_four%] == [B] (goto get_Setup_Path)
if [%step_four%] == [b] (goto get_Setup_Path)
if [%step_four%] == [E] (exit /b 4)
if [%step_four%] == [e] (exit /b 4)

:Extract
cls
echo.
echo [36m  °²×°ÖĞ...[30m
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
echo [36m  °²×°Íê³É![30m
echo.
echo [31m  ÎÒÃÇ½«Ä£ÄâÖØÆôÊ¹ÅäÖÃÉúĞ§£¬²»ÓÃµ£ĞÄ...[30m
echo.
:restart
taskkill /im explorer.exe /f 1>NUL 2>NUL
start explorer.exe 1>NUL 2>NUL
set /p run_first=[34m  [°²×°Íê³É][30m
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
echo [36mĞí¿ÉĞ­Òé[31m - ÇëÔÄ¶ÁÒÔÏÂÖØÒªĞÅÏ¢£¬È»ºóÔÙ½øÈëÏÂÒ»²½¡£[30m
echo [40;37m
echo [31;1mÇëÔÄ¶ÁÒÔÏÂĞí¿ÉĞ­Òé¡£Äú±ØĞë½ÓÊÜ´ËĞ­ÒéµÄÌõ¿î£¬È»ºó²ÅÄÜ¼ÌĞø°²×°¡£[37;0m                                                  
echo +================HashSF×îÖÕÓÃ»§Ğí¿ÉĞ­Òé================+
echo ^| °²×°ÈÎºÎ HashSF ÏµÁĞÈí¼şÇ°ÇëÏêÏ¸ÔÄ¶Á´ËĞ­Òé¡£         ^|
echo ^|                                                      ^|
echo ^| ±¾×îÖÕÓÃ»§Ğí¿ÉĞ­Òé(¡°Ğí¿É¡±)ÊÇÄú(¡°Äú¡±»ò¡°ÄúµÄ¡±)Óë ^|
echo ^| SeaFever("×÷Õß")Ö®¼äÇ©¶©µÄ¾ßÓĞÔ¼ÊøÁ¦µÄĞ­Òé¡£         ^|
echo ^|                                                      ^|
echo ^| ÖÂËùÓĞÓÃ»§µÄÖØÒªËµÃ÷:                                ^|
echo ^|                                                      ^|
echo ^| °²×°¸ÃÈí¼ş£¬¼´±íÊ¾Í¬Òâ±¾Ìõ¿îºÍÔ¼Êø¡£Èç¹ûÄú²»Í¬Òâ±¾Ğí ^|
echo ^| ¿ÉµÄÌõ¿î£¬ÎÒÃÇ½«²»»áĞí¿ÉÄúÊ¹ÓÃ¸ÃÈí¼şºÍ¸ÃÎÄµµ£¬Äú±ØĞë ^|
echo ^| Á¢¼´Í£Ö¹°²×°³ÌĞò¡£                                   ^|
echo +======================================================+
echo [47;30m
set /p info_step_one=[34m  [ÏÂÒ»Ò³(N)][36m
echo [30m
if [%info_step_one%] == [B] (goto show_Welcome_page)
if [%info_step_one%] == [b] (goto show_Welcome_page)
if [%info_step_one%] == [E] (exit /b 21)
if [%info_step_one%] == [e] (exit /b 21)
:information_two
if defined info_step_one set info_step_one=
if defined info_step_three set info_step_three=
cls
echo [34m  [ÉÏÒ»Ò³(B)][30m
echo [40;37m
echo +==============HashSF×îÖÕÓÃ»§Ğí¿ÉĞ­Òé(Ğø)==============+
echo ^|                                                      ^|
echo ^| 1.ÃâÔğÉùÃ÷:                                          ^|
echo ^|   ±¾Èí¼ş½ö·¢²¼ÓÚGitHub,Î¨Ò»¹ÙÍøÎª:https://github.com ^|
echo ^| /Derek5-SeaFever/HashSF ¡£Î¨Ò»ÏÂÔØµØÖ·Îª:https://git ^|
echo ^| hub.com/Derek5-SeaFever/HashSF.git ¡£ÈÎºÎÒÔÆäËüÍ¾¾¶  ^|
echo ^| »ñÈ¡µÄ±¾Èí¼ş¾ùÓë×÷ÕßÎŞ¹Ø¡£Çë¹ã´óÓÃ»§ÈÏ×¼¹ÙÍø£¬´Ó¹ÙÍø ^|
echo ^| ÏÂÔØ±¾Èí¼ş¡£                                         ^|
echo ^|                                                      ^|
echo ^|   ÒòÎªÊ¹ÓÃÁË·Ç¹ÙÍøµÄÈí¼ş°ü¶øÔì³ÉÁËÈÎºÎËğÊ§ÇëÁªÏµÎÊÌâ ^|
echo ^| Èí¼ş°üµÄ·¢²¼ÈË(ÎÊÌâÈí¼ş°üÀ´Ô´)£¬ÕâÓë×÷Õß±¾ÈËÎŞ¹Ø¡£   ^|
echo ^|                                                      ^|
echo ^|   ÇëÖ§³ÖÕı°æ£¬´ò»÷µÁ°æ!                               ^|
echo +======================================================+
echo [47;30m
set /p info_step_two=[34m  [ÏÂÒ»Ò³(N)][36m
echo [30m
if [%info_step_two%] == [B] (goto information_one)
if [%info_step_two%] == [b] (goto information_one)
if [%info_step_two%] == [E] (exit /b 22)
if [%info_step_two%] == [e] (exit /b 22)
:information_three
if defined info_step_two set info_step_two=
if defined info_step_four set info_step_four=
cls
echo [34m  [ÉÏÒ»Ò³(B)][30m
echo [40;37m
echo +==============HashSF×îÖÕÓÃ»§Ğí¿ÉĞ­Òé(Ğø)==============+
echo ^|                                                      ^|
echo ^| 2.Ğí¿ÉÏŞÖÆ:Äú²»µÃ:                                   ^|
echo ^|                                                      ^|
echo ^| £¨a£©É¾³ı¡¢¸ü¸Ä¡¢ÑÚ¸Ç»ò»ìÏıÈí¼şÖĞ·ÅÖÃ»òÇ¶ÈëµÄÈÎºÎ²ú  ^|
echo ^|  Æ·±êÊ¶¡¢°æÈ¨ÉùÃ÷»òÆäËûËùÓĞÈ¨ÉùÃ÷£»                  ^|
echo ^|                                                      ^|
echo ^| £¨b£©³öÊÛ¡¢×âÁŞ¡¢³ö×â¡¢¸´ÖÆ»ò·Ö·¢¸ÃÈí¼ş»ò¸ÃÎÄµµÓèËû  ^|
echo ^|  ÈË£»                                                ^|
echo ^|                                                      ^|
echo ^| £¨c£©´ÙÊ¹»òÔÊĞí¶Ô¸ÃÈí¼ş½øĞĞÄæÏò¹¤³Ì¡¢·´»ã±à¡¢·´±àÒë  ^|
echo ^| »ò±ä¸ü£¬µ«ÊÊÓÃ·¨ÂÉÃ÷È·½ûÖ¹¶Ô´ËÀàĞĞÎªµÄ´ËÀàÏŞÖÆÔò³ı   ^|
echo ^| Íâ£»                                                 ^|
echo +======================================================+
echo [47;30m
set /p info_step_three=[34m  [ÏÂÒ»Ò³(N)][36m
echo [30m
if [%info_step_three%] == [B] (goto information_two)
if [%info_step_three%] == [b] (goto information_two)
if [%info_step_three%] == [E] (exit /b 23)
if [%info_step_three%] == [e] (exit /b 23)
:information_four
if defined info_step_three set info_step_three=
if defined info_step_five set info_step_five=
cls
echo [34m  [ÉÏÒ»Ò³(B)][30m
echo [40;37m
echo +==============HashSF×îÖÕÓÃ»§Ğí¿ÉĞ­Òé(Ğø)==============+
echo ^|                                                      ^|
echo ^| (ĞøÉÏ)Äú²»µÃ:                                        ^|
echo ^|                                                      ^|
echo ^| £¨d£©½«¸ÃÈí¼şÓÃÓÚ¾ºÕù·ÖÎöÄ¿µÄ£»                      ^|
echo ^|                                                      ^|
echo ^| £¨e£©½«¸ÃÈí¼şÔÙĞí¿ÉÓèÈÎºÎµÚÈı·½£¬°üÀ¨Äú×Ô¼ºµÄ¿Í»§¡£  ^|
echo ^|                                                      ^|
echo ^| 3.Öø×÷È¨ / ÓµÓĞÈ¨:                                   ^|
echo ^|   Äú³ĞÈÏ²¢Í¬Òâ£¬¸ÃÈí¼şºÍ¸ÃÎÄµµÔÚÊÀ½çÈÎºÎµØ·½µÄËùÓĞÖª ^|
echo ^| Ê¶²úÈ¨¾ùÊôÓÚ×÷ÕßSeaFever¡£¸ÃÈí¼ş¡¢ÆäÔ´´úÂëºÍ¸ÃÎÄµµ¾ù ^|
echo ^| Îª×÷ÕßSeaFeverµÄ×¨ÓĞ²úÆ·£¬²¢ÊÜÖø×÷È¨ºÍÆäËûÖªÊ¶²úÈ¨·¨ ^|
echo ^| ±£»¤¡£×÷ÕßÊ¼ÖÕ±£Áô¶Ô¸ÃÈí¼ş»ò¸ÃÎÄµµµÄÒ»ÇĞÈ¨Àû¡£       ^|
echo +======================================================+
echo [47;30m
set /p info_step_four=[34m  [ÏÂÒ»Ò³(N)][36m
echo [30m
if [%info_step_four%] == [B] (goto information_three)
if [%info_step_four%] == [b] (goto information_three)
if [%info_step_four%] == [E] (exit /b 24)
if [%info_step_four%] == [e] (exit /b 24)
:information_five
if defined info_step_four set info_step_four=
if defined info_step_six set info_step_six=
cls
echo [34m  [ÉÏÒ»Ò³(B)][30m
echo [40;37m
echo +==============HashSF×îÖÕÓÃ»§Ğí¿ÉĞ­Òé(Ğø)==============+
echo ^|                                                      ^|
echo ^| 4.µ£±£:                                              ^|
echo ^|   ×÷Õß±¾ÈË²»¶Ô´ËÈí¼ş×ö³öÈÎºÎµ£±££¬Ò»ÇĞĞĞÎª¶¼ÊÇÄúÔÚÍ¬ ^|
echo ^| ÒâÁË±¾Ğ­Òéºó×ÔÔ¸½øĞĞµÄ¡£                             ^|
echo ^|                                                      ^|
echo ^|   Äú³Ğµ£ÏÂÔØ»òÊ¹ÓÃ¸ÃÈí¼şÊ±µÄËùÓĞ·çÏÕ¡£Äú³ĞÈÏ£¬ÔÚÄúÊ¹ ^|
echo ^| ÓÃ¸ÃÈí¼şÖ®Ç°£¬ÄúÏÂÔØ¸ÃÈí¼şµÄ¼ÆËã»úÉè±¸¿ÉÄÜÒÑ±»Ëğ»µ£¬ ^|
echo ^| »òÄúĞèÒªĞ£Ñé¹şÏ£ÂëµÄÎÄ¼şÒÑ¾­Ëğ»µ(»òÓÉÆäËüÔ­Òò)µ¼ÖÂÎŞ ^|
echo ^| ·¨¼ÆËã³öÕıÈ·µÄ¹şÏ£Âë¡£Òò´Ë£¬×÷Õß±¾ÈËÎŞ·¨±£Ö¤Ê¹ÓÃ¸ÃÈí ^|
echo ^| ¼şÒ»¶¨ÄÜ¼ÆËã³öÕıÈ·µÄ¹şÏ£Âë¡£ËùÒÔ£¬ÓÉ¸ÃÈí¼şµÃµ½µÄ¹şÏ£ ^|
echo ^| Âë½ö¹©²Î¿¼£¬²»×÷Îª±ê×¼»òÎ¨Ò»´ğ°¸¡£                   ^|
echo ^|                                                      ^|
echo +======================================================+
echo [47;30m
set /p info_step_five=[34m  [ÏÂÒ»Ò³(N)][36m
echo [30m
if [%info_step_five%] == [B] (goto information_four)
if [%info_step_five%] == [b] (goto information_four)
if [%info_step_five%] == [E] (exit /b 25)
if [%info_step_five%] == [e] (exit /b 25)
:information_six
if defined info_step_five set info_step_five=
if defined step_two set step_two=
cls
echo [34m  [ÉÏÒ»Ò³(B)][30m
echo [40;37m
echo +==============HashSF×îÖÕÓÃ»§Ğí¿ÉĞ­Òé(Ğø)==============+
echo ^|                                                      ^|
echo ^| 5.Ç¿µ÷:                                              ^|
echo ^|   Èç¹ûÄúÎ¥·´ÁËĞ­ÒéÄÚÈÎºÎÄÚÈİ£¬×÷Õß±¾ÈËÓĞÈ¨ÊÕ»ØÄúµÄÊ¹ ^|
echo ^| ÓÃÈ¨¼°ÆäËüÒ»ÇĞÏà¹ØÈ¨Àû£¬²¢ÓĞÈ¨»ñµÃÒ»¶¨½ğ¶îµÄÅâ³¥¡£   ^|
echo ^|                                                      ^|
echo ^|   Èç¹ûÄú¶ñÒâÊ¹ÓÃ¸ÃÈí¼ş´«²¥ÍøÂç²¡¶¾¡¢Ä¾Âí¡¢Òù»àĞÅÏ¢¡¢ ^|
echo ^| ±©Á¦ĞÅÏ¢µÈÎ¥·¨ÄÚÈİ£¬Òà»òÓĞÆäËüÈÎºÎ¿ÉÄÜÎ¥·´µ±µØµØÇø   ^|
echo ^| (»ò"¹ú¼Ò")·¨ÂÉµÄĞĞÎª£¬×÷Õß±¾ÈË¶Ô´Ë²»³Ğµ£ÈÎºÎÔğÈÎ£¬²¢ ^|
echo ^| ÇÒÓĞÈ¨ÊÕ»ØÄúµÄÊ¹ÓÃÈ¨£¬Í¬Ê±Ò²ÓĞÈ¨½ûÖ¹ÄúÔÙ´ÎÊ¹ÓÃ±¾Èí   ^|
echo ^| ¼ş¡£                                                 ^|
echo ^|                                                      ^|
echo ^|  º¦ÈËÖ®ĞÄ²»¿ÉÓĞ£¬·ÀÈËÖ®ĞÄ²»¿ÉÎŞ!                      ^|
echo +======================================================+
echo [47;30m
set /p info_step_six=[34m  [ÎÒ½ÓÊÜĞí¿ÉĞ­Òé(N)][36m
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
echo      ÎÒ»áÔÚ°²×°Ä¿Â¼ÏÂµÄREADMEÎÄ¼şÀï±£´æÒ»·İ¸´¼ş,±ãÓÚ
echo.
echo    ÄúµÄÏÂ´Î²é¿´¡£
for /L %%i in (0 1 6) do (echo.)
set /p step_two=[34m  [ÎÒÖªµÀÁË(N)][36m
echo [30m
if [%step_two%] == [B] goto information_six
if [%step_two%] == [b] goto information_six
if [%step_two%] == [E] exit /b 2
if [%step_two%] == [e] exit /b 2
goto back_Legal_Information