@echo off
setlocal EnableExtensions
title reMarkable 2 - SSH Wi-Fi helper

REM ============================================================
REM  reMarkable 2 SSH Wi-Fi helper
REM  - Requires Windows OpenSSH client
REM  - Requires RM2 connected by USB
REM  - Does not store the root password
REM ============================================================

set RM2_USB_IP=10.11.99.1
set SSH_USER=root
set SSH_OPTS=-o ConnectTimeout=8 -o StrictHostKeyChecking=accept-new

:MENU
cls
echo.
echo ==========================================
echo   reMarkable 2 - SSH Wi-Fi helper
echo ==========================================
echo.
echo RM2 USB address: %RM2_USB_IP%
echo User:            %SSH_USER%
echo.
echo 1. Activate SSH over Wi-Fi
echo 2. Disable SSH over Wi-Fi
echo 3. Show RM2 Wi-Fi IP
echo 4. Test USB SSH connection
echo 0. Quit
echo.
choice /C 123450 /N /M "Choose an option: "

if errorlevel 6 goto END
if errorlevel 4 goto TEST
if errorlevel 3 goto SHOW_IP
if errorlevel 2 goto DISABLE
if errorlevel 1 goto ENABLE

:ENABLE
cls
echo.
echo Activating SSH over Wi-Fi on the reMarkable...
echo You may be asked for the RM2 root password.
echo.
ssh %SSH_OPTS% %SSH_USER%@%RM2_USB_IP% "rm-ssh-over-wlan on && echo SSH_OVER_WLAN_ENABLED"
echo.
pause
goto MENU

:DISABLE
cls
echo.
echo Disabling SSH over Wi-Fi on the reMarkable...
echo You may be asked for the RM2 root password.
echo.
ssh %SSH_OPTS% %SSH_USER%@%RM2_USB_IP% "rm-ssh-over-wlan off && echo SSH_OVER_WLAN_DISABLED"
echo.
pause
goto MENU

:SHOW_IP
cls
echo.
echo Trying to show the RM2 Wi-Fi IP address...
echo You may be asked for the RM2 root password.
echo.
ssh %SSH_OPTS% %SSH_USER%@%RM2_USB_IP% "ip -4 addr show wlan0 | grep -oE 'inet [0-9.]+' | awk '{print $2}'"
echo.
echo If nothing is shown, the RM2 may not be connected to Wi-Fi.
echo.
pause
goto MENU

:TEST
cls
echo.
echo Testing SSH over USB...
echo You may be asked for the RM2 root password.
echo.
ssh %SSH_OPTS% %SSH_USER%@%RM2_USB_IP% "echo SSH_OK && uname -a"
echo.
pause
goto MENU


:END
endlocal
exit /b 0
