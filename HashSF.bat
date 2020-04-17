@echo off
title HashÂëĞ£Ñé¹¤¾ß@SeaFever

:pre_commad
set par_path=%1
set par_type=%2
if [%par_path%] == [-v] (
	for /f "tokens=*" %%i in (%HASHSF_HOME%info\version.seafever) do (echo [36m%%i[37m)
	goto:eof
)
if [%par_path%] == [-h] (
	for /f "tokens=*" %%i in (%HASHSF_HOME%info\help.seafever) do (echo [36m%%i[37m)
	goto:eof
)
if [%par_path%] == [-a] (call %HASHSF_HOME%bin\HRI.exe & goto:eof)
if [%par_path%] == [-r] (call %HASHSF_HOME%bin\HRU.exe & goto:eof)
if [%par_path%] == [-s] (start https://github.com/Derek5-SeaFever/HashSF & goto:eof)
if [%par_path%] == [-u] (call %HASHSF_HOME%Uninstall.exe & goto:eof)

echo [36;1m°æ±¾1.0.916.211[37;0m

:check_par_exist
if defined par_path (
	if defined par_type (
		call %HASHSF_HOME%bin\Hash.exe %par_path% %par_type%
		goto end
	) else (
		goto get_hash_type
	)
) else (
	goto get_target_path
)

:get_target_path
set /p target_path=ÇëÊäÈëĞèÒªĞ£ÑéµÄ[36mÎÄ¼şÂ·¾¶[37m[ÍÆ¼ö:¾ø¶ÔÂ·¾¶]: 
set /p hash_type=ÇëÊäÈëĞèÒªĞ£ÑéµÄ[36m¹şÏ£ÂëÀàĞÍ[37m[Ä¬ÈÏ:SHA1]  : 
call %HASHSF_HOME%bin\Hash.exe %target_path% %hash_type%
goto end

:get_hash_type
set /p hash_type=ÇëÊäÈëĞèÒªĞ£ÑéµÄ¹şÏ£ÂëÀàĞÍ[Ä¬ÈÏ:SHA1]:
call %HASHSF_HOME%bin\Hash.exe %par_path% %hash_type%
goto end

:end
goto:eof