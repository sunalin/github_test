@echo off 
reg query "HKLM\SYSTEM\CurrentControlSet\Control\COM Name Arbiter" /v ComDB
if %errorlevel%==0 (
	echo Y| reg delete "HKLM\SYSTEM\CurrentControlSet\Control\COM Name Arbiter" /v ComDB /f
        echo clear successfully!
)else(
        echo ok!	
)
pause

