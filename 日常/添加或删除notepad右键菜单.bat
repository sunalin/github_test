@ECHO OFF
REM 声明采用UTF-8编码
chcp 65001
PUSHD %~DP0
TITLE Notepad++
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo 请使用右键管理员身份运行&&Pause >NUL&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion


:Input
ECHO  1. 添加右键菜单
ECHO  2. 删除右键菜单
SET /P ST=请输入：
if /I "%ST%"=="1" (
    goto Add
) ^
else if /I "%ST%"=="2" (
    goto Remove
) ^
else (
    cls
    ECHO 请重新输入
    goto Input
)


:Add
ECHO 添加右键菜单
reg add "HKEY_CLASSES_ROOT\*\shell\Notepad++"         /t REG_SZ /v "" /d "&Notepad++"   /f
reg add "HKEY_CLASSES_ROOT\*\shell\Notepad++"         /t REG_EXPAND_SZ /v "Icon" /d "%~dp0notepad++.exe" /f
reg add "HKEY_CLASSES_ROOT\*\shell\Notepad++\command" /t REG_SZ /v "" /d "%~dp0notepad++.exe \"%%1\"" /f
ECHO 操作完成, 按任意键继续
pause > nul
cls
goto Input


:Remove
ECHO 删除右键菜单
reg delete "HKEY_CLASSES_ROOT\*\shell\Notepad++" /f
ECHO 操作完成, 按任意键继续
pause > nul
cls
goto Input


