@ECHO OFF


:Input
ECHO  1. 打开APP
ECHO  2. 关闭APP
SET /P ST=请输入：
if /I "%ST%"=="1" (
    goto AppStart
) ^
else if /I "%ST%"=="2" (
    goto AppEnd
) ^
else (
    cls
    ECHO 请重新输入
    goto Input
)




:AppStart
::管理员
::cd /d %~dp0
::%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
::call为同步 start为异步----[start "" "C:\QTranslate.lnk"]----[start "" "C:\QTranslate.exe"]

start "" "C:\Program Files\copytranslator\copytranslator.exe"
start "" "C:\Users\Administrator\AppData\Roaming\CareUEyes\CareUEyes.exe"
start "" "C:\Program Files\ProjectEye\ProjectEye.exe"
start "" "C:\Program Files\Snipaste\Snipaste.exe"
start "" "C:\Program Files (x86)\Tencent\RTXC\RTX.exe"
start "" "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"

goto Over




:AppEnd
taskkill /f /t /im "copytranslator.exe"
taskkill /f /t /im "CareUEyes.exe"
taskkill /f /t /im "ProjectEye.exe"
taskkill /f /t /im "Snipaste.exe"
taskkill /f /t /im "RTX.exe"
taskkill /f /t /im "WeChat.exe"
wmic process where name="copytranslator.exe" delete
wmic process where name="CareUEyes.exe" delete
wmic process where name="ProjectEye.exe" delete
wmic process where name="Snipaste.exe" delete
wmic process where name="RTX.exe" delete
wmic process where name="WeChat.exe" delete

goto Over




:Over
::pause


