@echo off
echo ------------------------------------
echo       Run EditorServer Debug
echo ------------------------------------

set ProjectName=TGProject
set MapName=TestMap

start "EditorServer_%ProjectName%_%MapName%" ^
    %~dp0..\..\UnrealEngine-5.2\Engine\Binaries\Win64\UnrealEditor-Win64-DebugGame.exe ^
    %~dp0%ProjectName%.uproject %MapName% ^
    -server ^
    -notimeouts ^
    -log log=Log_EditorServer_%ProjectName%_%MapName%.log