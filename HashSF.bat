@echo off
title Hash码校验工具@SeaFever

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

echo [36;1m版本1.0.916.211[37;0m

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
set /p target_path=请输入需要校验的[36m文件路径[37m[推荐:绝对路径]: 
set /p hash_type=请输入需要校验的[36m哈希码类型[37m[默认:SHA1]  : 
call %HASHSF_HOME%bin\Hash.exe %target_path% %hash_type%
goto end

:get_hash_type
set /p hash_type=请输入需要校验的哈希码类型[默认:SHA1]:
call %HASHSF_HOME%bin\Hash.exe %par_path% %hash_type%
goto end

:end
goto:eof