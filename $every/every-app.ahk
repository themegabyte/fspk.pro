#Requires AutoHotkey v2.0
#SingleInstance Force
DetectHiddenWindows True
InstallMouseHook
InstallKeybdHook

Esc:: ExitApp ; Hotkey to exit script

;Parameters section - Basic
; Key to toggle script
global toggleKey := IniRead("config.ini", "common", "toggleKey")
; From Window Spy (screen): 1097, 794
every_forward_button_x_position := IniRead("config.ini", "every-app-ahk", "EveryForwardButtonXPosition")
every_forward_button_y_position := IniRead("config.ini", "every-app-ahk", "EveryForwardButtonYPosition")
; Display resolution. Must be updated if you change display scaling or resolution.
display_resolution_width := IniRead("config.ini", "common", "DisplayResolutionWidth") || "1920"
display_resolution_height := IniRead("config.ini", "common", "DisplayResolutionHeight") || "1080"

if(!every_forward_button_x_position) {
    throw ValueError("EveryForwardButtonXPosition is unset in config.ini")
}
if(!every_forward_button_y_position) {
    throw ValueError("EveryForwardButtonYPosition is unset in config.ini")
}


;Parameters section - Advanced
clickDelayms := 35000 ; The period between subsequent actions of click and move.
SendMode("Event") ; We need to change the send mode to Event, to prevent any auto bans.
SetKeyDelay(, , "Play") ; Same as above but for keyboard
mouseSpeed := 30 ; the mouse moving speed when AHK executes a MouseMove function.
; mouse movement speed controls, a Random function will be called with the below two variables as extremes.
lowestSpeed := 10
highestSpeed := 20
;
;
Hotkey toggleKey, Main

Main(ThisHotkey) {
    Static on := False
    if (!on) {
        TrayTip("Script started!", A_ScriptName)
        ClickNext()
        SetTimer(ClickNext, clickDelayms * on := !on)
    } else {
        SetTimer(ClickNext, clickDelayms * on := !on)
        TrayTip("Script Stopped!", A_ScriptName)
    }
}

ClickNext() {
    calculatedSpeed := Random(10, 30)
    RandomMouse(calculatedSpeed)
    MouseClick('Left', every_forward_button_x_position, every_forward_button_y_position, , calculatedSpeed)
    RandomMouse(calculatedSpeed)
}

RandomMouse(speed) {
    xpos := Random(30, display_resolution_width - 30)
    ypos := Random(30, display_resolution_height - 30)
    MouseMove(xpos, ypos, speed)
}