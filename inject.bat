@echo off
setlocal
cd /d "%~dp0"

rem --- admin check -----------------------------------------------------------
net session >nul 2>&1
if errorlevel 1 (
    echo Demande des droits administrateur...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo ============================================================
echo  Spirit Services - injection
echo ============================================================
echo.
echo  1. Lance ROB RUN depuis Steam.
echo  2. Attends d'etre sur le menu principal du jeu.
echo  3. Laisse cette fenetre ouverte jusqu'a "Successfully initialized module".
echo.

echo [1/2] Chargement du driver (Steam65)...
builds\orelia-mapper.exe builds\orelia-ioctl.sys <nul
echo.

echo [2/2] Injection de RobRunInternal.dll...
builds\ioctl-injector.exe "%~dp0builds\RobRunInternal.dll" <nul
echo.

echo ============================================================
echo  Termine.
echo  En jeu, appuie sur DELETE pour ouvrir le menu Spirit Services.
echo  Si ca a echoue, envoie le texte ci-dessus.
echo ============================================================
pause
