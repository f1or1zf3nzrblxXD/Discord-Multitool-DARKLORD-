@echo off
chcp 65001
title DARK LORD - HACKER MODE
color 0C

:: PowerShell script to show a notification
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Warning; $notify.Visible = $true; $notify.ShowBalloonTip(5000, 'DARK LORD | SENT FROM ALAN BECKER''S PC', 'You are using version 2.0(Latest Version) of the batch file.', [System.Windows.Forms.ToolTipIcon]::Warning)}"

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
echo │ 5. Change Webhook Image        │
echo │ 6. Fun Commands                │
echo │ 7. Change Text Color           │
echo └────────────────────────────────┘
set /p choice=Enter your choice: 

if "%choice%"=="1" goto :eof
if "%choice%"=="2" goto messagesender
if "%choice%"=="3" goto deletewebhook
if "%choice%"=="4" goto renamewebhook
if "%choice%"=="5" goto changewebhookimage
if "%choice%"=="6" goto funcommands
if "%choice%"=="7" goto changeColor
goto menu

:changeColor
cls
echo ----------------------------------------------------------------------------
echo │         Change Text Color      │
echo ├────────────────────────────────┤
echo 1. Red
echo 2. Green
echo 3. Blue
echo 4. Yellow
echo 5. White
echo 6. Back to Menu
set /p colorchoice=Enter the number for the color: 

if "%colorchoice%"=="1" color 0C
if "%colorchoice%"=="2" color 0A
if "%colorchoice%"=="3" color 09
if "%colorchoice%"=="4" color 0E
if "%colorchoice%"=="5" color 07
if "%colorchoice%"=="6" goto menu

echo The text color has been changed.
pause
goto menu

:changewebhookimage
cls
echo ----------------------------------------------------------------------------
echo │     Change Discord Webhook Image│
echo ├────────────────────────────────┤
set /p "webhookURL=│ Enter Discord webhook URL to change image: "
set /p "base64Image=│ Enter the base64 encoded image (paste here): "

:: Send PATCH request to the Discord webhook URL to change the avatar (image)
curl -X PATCH %webhookURL% -H "Content-Type: application/json" -d "{\"avatar\": \"%base64Image%\"}"

echo Webhook image changed successfully!
pause
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

:funcommands
cls
echo ----------------------------------------------------------------------------
echo │           Fun Commands         │
echo ├────────────────────────────────┤
echo │ 1. Joke                        │
echo │ 2. Random Fact                 │
echo │ 3. Roll a Dice                 │
echo │ 4. Fortune Cookie              │
echo │ 5. ASCII Art                   │
echo │ 6. Mad Libs                    │
echo │ 7. Exit                        │
echo └────────────────────────────────┘
set /p funchoice=Enter your choice: 

if "%funchoice%"=="1" goto joke
if "%funchoice%"=="2" goto randomfact
if "%funchoice%"=="3" goto rolladice
if "%funchoice%"=="4" goto fortunecookie
if "%funchoice%"=="5" goto asciiart
if "%funchoice%"=="6" goto madlibs
if "%funchoice%"=="7" goto menu
goto funcommands

:joke
cls
echo ----------------------------------------------------------------------------
echo │     Joke                      │
echo ├────────────────────────────────┤
echo Why don’t skeletons fight each other? They don’t have the guts.
pause
goto funcommands

:randomfact
cls
echo ----------------------------------------------------------------------------
echo │     Random Fact               │
echo ├────────────────────────────────┤
echo Did you know that honey never spoils? Archaeologists have found pots of honey in ancient tombs that are over 3,000 years old and still edible!
pause
goto funcommands

:rolladice
cls
echo ----------------------------------------------------------------------------
echo │     Roll a Dice               │
echo ├────────────────────────────────┤
set /a dice=%random% %% 6 + 1
echo You rolled a: %dice%
pause
goto funcommands

:fortunecookie
cls
echo ----------------------------------------------------------------------------
echo │     Fortune Cookie            │
echo ├────────────────────────────────┤
echo Your fortune: "You will have a great day ahead!"
pause
goto funcommands

:asciiart
cls
echo ----------------------------------------------------------------------------
echo │     ASCII Art                 │
echo ├────────────────────────────────┤
echo Here is a simple cat for you:
echo /\_/\  
echo ( o.o ) 
echo > ^ <
pause
goto funcommands

:madlibs
cls
echo ----------------------------------------------------------------------------
echo │     Mad Libs                  │
echo ├────────────────────────────────┤
echo Enter a noun: 
set /p noun=
echo Enter an adjective: 
set /p adj=
echo Enter a verb: 
set /p verb=
echo Your madlib: "The %adj% %noun% decided to %verb% all day!"
pause
goto funcommands
