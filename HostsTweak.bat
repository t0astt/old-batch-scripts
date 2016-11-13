@echo off
color 02
title HostsTweak
set pth=C:\windows\system32\drivers\etc
:check_backup
if not exist %pth%\hosts.backup goto make_backup
:detect_error
if not exist %pth%\hosts goto restore_backup
:begin
if exist %pth%\hosts.twk goto hosts_is_disabled else
goto hosts_is_enabled
REM hosts_del.twk is a TRASH FILE
:hosts_is_disabled
color 04
echo HOSTS file: Disabled
echo Press any key to enable your HOSTS file...
pause >nul
move %pth%\hosts %pth%\hosts_del.twk
if exist %pth%\hoststweak_d.txt del /F /S /Q %pth%\hoststweak_d.txt
del /F /S /Q %pth%\hosts_del.twk
if exist %pth%\hosts goto hosts_cant_be_removed
move %pth%\hosts.twk %pth%\hosts
if not exist %pth%\hosts goto hosts_cant_be_removed
cls
color 02
echo HOSTS file enabled successfully!
pause >nul
exit
:hosts_is_enabled
echo HOSTS file: Enabled
echo Press any key to disable your HOSTS file...
pause >nul
if not exist %pth%\hosts  goto hosts_not_found
move %pth%\hosts %pth%\hosts.twk
if not exist %pth%\hosts.twk goto hosts_not_found
echo 127.0.0.1  localhost > %pth%\hosts
REM The command below sets up a placeholder file to let HostsTweak know that the HOSTS file is the crap one.
echo HostsTweak_File > %pth%\hoststweak_d.txt
cls
color 04
echo HOSTS file disabled successfully!
pause >nul
exit
:hosts_cant_be_removed
echo.
echo The HOSTS file could not be enabled...
pause >nul
exit
:hosts_not_found
echo.
echo The HOSTS file could not be disabled...
pause >nul
exit
:make_backup
echo Hosts Tweak was unable to detect a backup copy of your HOSTS file.
echo.
echo Hosts Tweak will now create a backup at: %pth%\hosts.backup.
pause
if exist %pth%\hosts goto BACKING_UP else
goto restore_bad
exit
:BACKING_UP
copy %pth%\"hosts" %pth%\hosts.backup
cls
echo Backup HOSTS file created successfully!
pause
exit
:restore_backup
echo Hosts Tweak detected that no HOSTS file currently exists.
echo.
echo Hosts Tweak will now restore your backup HOSTS file (if possible).
pause
if exist %pth%\hosts.backup goto restore_backup2 else
goto restore_bad
:restore_backup2
copy %pth%\hosts.backup %pth%\hosts
cls
echo HOSTS file successfully restored!
pause
exit
:restore_bad
cls
echo Your HOSTS file was unable to be restored. 
echo Hosts Tweak will now recreate a HOSTS file for you...
echo 127.0.0.1  localhost > %pth%\hosts
cls
echo HOSTS file recreated successfully! Please add any entries you previously had in the HOSTS file back.
pause
exit