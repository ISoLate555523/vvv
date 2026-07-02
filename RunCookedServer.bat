@echo off
echo ------------------------------------
echo       Run Server
echo ------------------------------------

set ProjectName=TGProject
set MapName=TestMap
set ServerName=X_Server

::编译目标配置
set /p Config=set[1:DebugGame 2:Test 3:Shipping 4:Development]:
if %Config% equ 1 set BinConfig=DebugGame
if %Config% equ 2 set BinConfig=Test
if %Config% equ 3 set BinConfig=Shipping
if %Config% equ 4 set BinConfig=Development

start "SERVER<%MapName%>" ^
    Saved/StagedBuilds/WindowsServer/%ProjectName%/Binaries/Win64/%ProjectName%Server-Win64-%BinConfig%.exe ^
    %ProjectName% %MapName%?Listen?MaxPlayers=10 ^
    -server ^
    -game ^
    -ServerName=%ServerName% ^
    -notimeouts ^
    -log log=Server.log ^
    -locallogtimes