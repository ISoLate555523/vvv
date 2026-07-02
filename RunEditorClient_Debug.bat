@echo off
echo ------------------------------------
echo       Run EditorClient DebugGame
echo ------------------------------------

set ProjectName=TGProject
set MapName=TestMap

set /p Name=Select player name: 1-AAA 2-BBB :
if %Name% equ 1 set PlayerName=AAA
if %Name% equ 2 set PlayerName=BBB

::https://docs.unrealengine.com/5.3/zh-CN/command-line-arguments-in-unreal-engine/
start "EditorClient<%PlayerName%>" ^
        %~dp0..\..\UnrealEngine-5.2\Engine\Binaries\Win64\UnrealEditor-Win64-DebugGame.exe ^
        %~dp0%ProjectName%.uproject %MapName% ^
        -game ^
        -PlayerName=%PlayerName% ^
        -windowed ^
        -ResX=900 ^
        -ResY=500 ^
        -notimeouts ^
        -log log=Log_EditorClient_%ProjectName%_%PlayerName%.log

