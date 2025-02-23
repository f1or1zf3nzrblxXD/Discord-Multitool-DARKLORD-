@echo off
chcp 65001
color 0C
title DarkLord1.0 (do not skid or you are dead)



:: PowerShell script to show a notification
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Warning; $notify.Visible = $true; $notify.ShowBalloonTip(5000, 'DARK LORD | SENT FROM ALAN BECKER''S PC', 'You are using version 1.0(Oldest Version) of the batch file.', [System.Windows.Forms.ToolTipIcon]::Warning)}"

:: Main menu
:menu
cls
echo ---------------------------------------------------------------------------------------
echo -██████╗  █████╗ ██████╗ ██╗  ██╗    ██╗      ██████╗ ██████╗ ██████╗ -
echo -██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝    ██║     ██╔═══██╗██╔══██╗██╔══██╗-
echo -██║  ██║███████║██████╔╝█████╔╝     ██║     ██║   ██║██████╔╝██║  ██║-
echo -██║  ██║██╔══██║██╔══██╗██╔═██╗     ██║     ██║   ██║██╔══██╗██║  ██║-
echo -██████╔╝██║  ██║██║  ██║██║  ██╗    ███████╗╚██████╔╝██║  ██║██████╔╝-
echo -╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ -
echo ----------------------------------------------------------------------------------------

:: Main menu options
echo ┌────────────────────────────────┐
echo │            SPAMMER             │
echo ├────────────────────────────────┤
echo │ 1. Exit                        │
echo │ 2. Discord webhook spammer     │
echo │ 3. Delete Discord Webhook      │
echo │ 4. Rename Discord Webhook      │
echo │                                │
echo │                                │
echo │                                │
echo └────────────────────────────────┘
set /p choice=Enter your choice: 

if "%choice%"=="1" goto :eof
if "%choice%"=="2" goto messagesender
if "%choice%"=="3" goto deletewebhook
if "%choice%"=="4" goto renamewebhook
goto menu

:renamewebhook
cls
echo ----------------------------------------------------------------------------
echo │     Rename Discord Webhook     │
echo ├────────────────────────────────┤
set /p "webhookURL=│ Enter Discord webhook URL to rename: "
set /p "newName=│ Enter the new name for the webhook: "

:: Send PATCH request to the Discord webhook URL
curl -X PATCH %webhookURL% -H "Content-Type: application/json" -d "{\"name\": \"%newName%\"}"

echo Webhook renamed successfully to: %newName%
pause
goto menu

:messagesender
cls
echo ----------------------------------------------------------------------------
echo │     Discord webhook spammer    │
echo ├────────────────────────────────┤
set /p "webhook=│ Enter Discord webhook URL for Message Sender: "
set /p "message=│ Enter the message to send: "
set /p "num_times=│ Enter the number of times to send the message: "

for /l %%n in (1,1,%num_times%) do (
    :: Send message to Discord webhook
    curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" %webhook%
)
echo Messages sent successfully.
pause
goto menu

:deletewebhook
cls
echo ----------------------------------------------------------------------------
echo │      Delete Discord Webhook    │
echo ├────────────────────────────────┤
set /p "webhookToDelete=│ Enter Discord webhook URL to delete: "

:: Send DELETE request to the Discord webhook URL
curl -X DELETE %webhookToDelete%

echo Webhook deleted successfully.
pause
goto menu
