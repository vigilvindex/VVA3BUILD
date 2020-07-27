@echo off
echo "STARTING BUILD"
set src=".\src"
set maps=".\maps"
set build=".\dist\MISSIONNAME"
set mission="mission.sqm"
FOR %%G IN (ALTIS,ENOCH,MALDEN,STRATIS,TANOA) DO (
IF EXIST %build%.%%G RMDIR /S /Q %build%.%%G
IF EXIST %build%.%%G.pbo DEL %build%.%%G.pbo
MD %build%.%%G
ROBOCOPY "%src%" "%build%.%%G" /E
COPY "%maps%\%%G\%mission%" "%build%.%%G"
start lib/PBOConsole.exe -pack "%build%.%%G" "%build%.%%G.pbo"
echo "BUILT %%G"
)
echo "BUILD COMPLETE"
