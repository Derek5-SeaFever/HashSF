@echo off
title HashÂëÐ£Ñé¹¤¾ß@SeaFever
setlocal enabledelayedexpansion

:get_par
set target_path=%1
set hash_type=%2

:check_par
if defined target_path (
	if exist %target_path% (echo [32mFilePath  : %target_path%[37m) else (echo [31mFilePath  : %target_path%[31;1m Â·¾¶²»´æÔÚ[37;0m && goto end)
) else (goto end)
if defined hash_type (
	if [%hash_type%] == [MD5] (echo [32mAlgorithm : MD5[37m && goto get_hash_code)
	if [%hash_type%] == [md5] (echo [32mAlgorithm : MD5[37m && goto get_hash_code)
	if [%hash_type%] == [SHA1] (echo [32mAlgorithm : SHA1[37m && goto get_hash_code)
	if [%hash_type%] == [sha1] (echo [32mAlgorithm : SHA1[37m && goto get_hash_code)
	if [%hash_type%] == [SHA256] (echo [32mAlgorithm : SHA256[37m && goto get_hash_code)
	if [%hash_type%] == [sha256] (echo [32mAlgorithm : SHA256[37m && goto get_hash_code)
	if [%hash_type%] == [SHA384] (echo [32mAlgorithm : SHA384[37m && goto get_hash_code)
	if [%hash_type%] == [sha384] (echo [32mAlgorithm : SHA384[37m && goto get_hash_code)
	if [%hash_type%] == [SHA512] (echo [32mAlgorithm : SHA512[37m && goto get_hash_code)
	if [%hash_type%] == [sha512] (echo [32mAlgorithm : SHA512[37m && goto get_hash_code)
	echo [31mERROR:[37;0m
	echo [31;1m"%hash_type%"²»ÊÇÒ»¸öÕýÈ·µÄHashÐ£ÑéÀàÐÍ[37;0m
	echo [31;1mµ±Ç°Ö»Ö§³ÖÒÔÏÂ¹þÏ£ÂëµÄÐ£Ñé:[37;0m
	echo [31;1m[[32mMD5[31m][[32mSHA1[31m][[32mSHA256[31m][[32mSHA384[31m][[32mSHA512[31m][37;0m
	goto end
) else (
	echo [32mAlgorithm : SHA1[37m
)

:get_hash_code
certutil -hashfile %target_path% %hash_type% 1>temp.txt 2>nul
set /a row=0
for /f "tokens=*" %%i in (temp.txt) do (
	set /a row+=1
	if !row!==2 echo [32mHash      : [32;1m%%i[37;0m
)

:DEL_TEMP_File
if exist temp.txt (del /F /A /Q temp.txt)


:end
set /p end_exit_cmd=Çë°´ÈÎÒâ¼üÍË³ö³ÌÐò...

endlocal
goto:eof