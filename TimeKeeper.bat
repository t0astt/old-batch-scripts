@echo off
title TimeKeeper v1 by t0ast
echo ####################################################
echo ########        TimeKeeper v1 - t0ast       ########
echo ########  Automatic Internet Time Sync Tool ########
echo ####################################################
echo.
echo _______________________________________
echo.
net start w32time
cls
echo ####################################################
echo ########        TimeKeeper v1 - t0ast       ########
echo ########  Automatic Internet Time Sync Tool ########
echo ####################################################
echo.
echo _______________________________________
echo.
w32tm /config /syncfromflags:manual /manualpeerlist:time.nist.gov
w32tm /config /update
w32tm /resync
cls
echo ####################################################
echo ########        TimeKeeper v1 - t0ast       ########
echo ########  Automatic Internet Time Sync Tool ########
echo ####################################################
echo.
echo _______________________________________
echo.
echo Local system time should now be synced to current internet time.
echo.
pause
