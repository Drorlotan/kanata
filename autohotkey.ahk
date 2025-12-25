#Requires AutoHotkey v2.0

; --- The Magic Function ---
; This handles the "Minimize if Active, Activate if Background, Run if Closed" logic
ToggleWindow(processName, runCommand)
{
    ; 1. If the window is currently active (in focus), minimize it
    if WinActive("ahk_exe " . processName)
        WinMinimize
    
    ; 2. If the window exists (but isn't active), bring it to front
    else if WinExist("ahk_exe " . processName)
        WinActivate
        
    ; 3. If the window doesn't exist, launch it
    else
        Run runCommand
}

; --- Hotkeys ---

; Alt + c for Chrome
!c:: ToggleWindow("chrome.exe", "chrome.exe")

; Alt + v for VS Code
!v:: ToggleWindow("Code.exe", "Code.exe")

; Alt + w for WhatsApp
; Note: Kept your specific "WhatsApp.Root.exe"
!w:: ToggleWindow("WhatsApp.Root.exe", "WhatsApp.Root.exe")

; Alt + s for Slack
!s:: ToggleWindow("slack.exe", "slack.exe")

; Alt + t for Terminal
!t:: ToggleWindow("WindowsTerminal.exe", "wt.exe")