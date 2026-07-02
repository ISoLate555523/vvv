echo off
echo -----------------------------------------------------
echo     Run Package                 
echo -----------------------------------------------------

set ProjectName=TGProject

::设置编译类型
set /p BuildType=Set BuildType (1-DebugGame 2-Development 3-Test 4-Shipping) :
if %BuildType% equ 1 set Config=DebugGame
if %BuildType% equ 2 set Config=Development
if %BuildType% equ 3 set Config=Test
if %BuildType% equ 4 set Config=Shipping

::根据目标设置打包参数
set /p Target=Set TargetType (1:Client 2:Server 3:Game) :
if %Target% equ 1 set Args=-cookcultures=zh-Hans+zh-Hant+en -CrashReporter -Client
if %Target% equ 2 set Args=-serverplatform=Win64 -Server -noclient
if %Target% equ 3 set Args=-cookcultures=zh-Hans+zh-Hant+en -CrashReporter 

::https://docs.unrealengine.com/5.3/zh-CN/build-operations-cooking-packaging-deploying-and-running-projects-in-unreal-engine/
::https://zhuanlan.zhihu.com/p/41931214
::\UnrealEngine-5.2.1-release\Engine\Programs\AutomationTool\Saved\Logs
start %~dp0..\..\UnrealEngine-5.2\Engine\Build\BatchFiles\RunUAT.bat BuildCookRun ^
    -project=%~dp0%ProjectName%.uproject ^
    -platform=Win64 ^
    -clientconfig=%Config% ^
    -serverconfig=%Config% ^
    -allmaps ^
    %Args% ^
    -build ^
    -cook ^
    -stage