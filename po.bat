@echo off
set filePath=%~dp0path.txt
type nul>>%filePath%
setlocal enabledelayedexpansion
:wait
set /a index=1
for /F "eol=: tokens=1,2,* delims=@" %%i in (%filePath%) do (
	@echo ^>!index!^. %%i [%%j] 
	set /a index=index+1
)
set /p command=^<
if "%command%"=="0" (
	set /p key=name^<
	set /p value=directory^<
	echo !key!@!value!>>%filePath%
	goto wait
) else (
	set /a index=1
	for /F "eol=: tokens=1,2,* delims=@" %%i in (%filepath%) do (
		if "!index!"=="%command%" (
			start "directory" "%%j" /max /separate /B 
			goto end
		)
		set /a index=index+1
	)
)
:end

@rem TODO 未使用数组存储数据，待优化
