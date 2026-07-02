@echo off
echo ------------------------------------
echo       Run Client
echo ------------------------------------

set ProjectName=TGProject
set ClientMapName=TestMap

::编译目标配置
set /p Config=set[1:DebugGame 2:Test 3:Shipping 4:Development]:
if %Config% equ 1 set BinConfig=DebugGame
if %Config% equ 2 set BinConfig=Test
if %Config% equ 3 set BinConfig=Shipping
if %Config% equ 4 set BinConfig=Development

set /p Name=Select player name: 1-AAA 2-BBB :
if %Name% equ 1 set PlayerName=AAA
if %Name% equ 2 set PlayerName=BBB

::启动客户端
start "CLIENT<%ClientMapName%>" ^
    Saved/StagedBuilds/WindowsClient/%ProjectName%/Binaries/Win64/%ProjectName%Client-Win64-%BinConfig%.exe ^
    %ClientMapName% ^
    -game ^
    -PlayerName=%PlayerName% ^
    -nothreadtimeout ^
    -notimeouts ^
    -windowed ^
    -ResX=900 ^
    -ResY=500 ^
    -log log=Client.log ^
    -locallogtimes
exit /B 1