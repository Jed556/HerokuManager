@echo off
REM Install Heroku CLI and install plugins...
REM heroku plugins:install heroku-builds
REM Pass in "wt" to run in windows terminal

REM For windows terminal with custom profile
if /i not "%1" == "wt" goto cmd
start /MAX wt -p "Command Prompt" cmd /k %~dpn0 max & exit /b
goto start

:cmd
REM For windows command prompt
if not "%1" == "max" start /MAX cmd /c %~dpn0 max & exit /b

:start
set app=appname

:loop
title Heroku Manager
cls
echo.
echo. Heroku Manager  By: Jed556
echo. Commands:   restart/r,  logs/l,  builds/b,  errors/e,  config/c,  notif/n,  info/i
echo.
set /p "args= >> "

if /i %args%==logs (
    title Heroku - Logs
    echo.
    call heroku logs -s app -a %app% -t
    goto loop
)

if /i %args%==l (
    title Heroku - Logs
    echo.
    call heroku logs -s app -a %app% -t
    goto loop
)

if /i %args%==restart (
    title Heroku - Restart
    echo.
    call heroku ps:restart -a %app%
    echo.
    echo Press any key to close... && pause >nul && pause >nul
    goto loop
)

if /i %args%==r (
    title Heroku - Restart
    echo.
    call heroku ps:restart -a %app%
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==notif (
    title Heroku - Loading Notifications
    echo.
    call heroku notifications -a %app%
    title Heroku - Notifications
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==n (
    title Heroku - Loading Notifications
    echo.
    call heroku notifications -a %app%
    title Heroku - Notifications
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==info (
    title Heroku - Loading Info
    echo.
    call heroku apps:info -a %app%
    echo.
    call heroku ps -a %app%
    echo.
    call heroku buildpacks -a %app%
    echo.
    call heroku domains -a %app%
    echo.
    call heroku certs:info -a %app%
    echo.
    echo Maintenance:
    call heroku maintenance -a %app%
    title Heroku - Info
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==i (
    title Heroku - Loading Info
    echo.
    call heroku apps:info -a %app%
    echo.
    call heroku ps -a %app%
    echo.
    call heroku buildpacks -a %app%
    echo.
    call heroku domains -a %app%
    echo.
    call heroku certs:info -a %app%
    echo.
    echo Maintenance:
    call heroku maintenance -a %app%
    title Heroku - Info
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==builds (
    title Heroku - Loading Builds
    echo.
    call heroku builds:info -a %app%
    echo.
    call heroku builds -a %app%
    title Heroku - Builds
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==b (
    title Heroku - Loading Builds
    echo.
    call heroku builds:info -a %app%
    echo.
    call heroku builds -a %app%
    title Heroku - Builds
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==errors (
    title Heroku - Loading Errors
    echo.
    call heroku apps:errors -a %app%
    title Heroku - Errors
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==e (
    title Heroku - Loading Errors
    echo.
    call heroku apps:errors -a %app%
    title Heroku - Errors
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==config (
    title Heroku - Loading Config Vars
    echo.
    call heroku config -a %app%
    title Heroku - Config Vars
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

if /i %args%==c (
    title Heroku - Loading Config Vars
    echo.
    call heroku config -a %app%
    title Heroku - Config Vars
    echo.
    echo Press any key to close... && pause >nul
    goto loop
)

echo.
title Heroku - Unknown Command
echo Unknown command
echo Press any key to close... && pause >nul
goto loop
