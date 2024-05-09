#Requires AutoHotkey v2.0
#SingleInstance Force
DetectHiddenWindows True
InstallMouseHook
InstallKeybdHook

Esc:: ExitApp ; Hotkey to exit script

;Parameters section - Basic
; Key to toggle script
global toggleKey := "F8"
; From Window Spy (screen): 688, 1010
discord_message_x_position := 688
discord_message_y_position := 1010
display_resolution_width := 1920
display_resolution_height := 1080


;Parameters section - Advanced
clickDelayms := 330000 ; The period between subsequent actions of click and move.
SendMode("Event") ; We need to change the send mode to Event, to prevent any auto bans.
SetKeyDelay(, , "Play") ; Same as above but for keyboard
mouseSpeed := 30 ; the mouse moving speed when AHK executes a MouseMove function.
; mouse movement speed controls, a Random function will be called with the below two variables as extremes.
lowestSpeed := 10
highestSpeed := 30
;
Hotkey toggleKey, Main
;
Main(ThisHotkey) {
    Static on := False
    if (!on) {
        ExecDiscordSeq()
        SetTimer(ExecDiscordSeq, clickDelayms * on := !on)
        TrayTip("Script started!", A_ScriptName)
    } else {
        SetTimer(ExecDiscordSeq, clickDelayms * on := !on)
        TrayTip("Script Stopped!", A_ScriptName)
    }

}

ExecDiscordSeq() {
    DiscordCommand("/earn `n")
    DiscordCommand("/hodl `n")
}

DiscordCommand(x) {
    RandomMouse()
    MouseClick('Left', discord_message_x_position, discord_message_y_position, , mouseSpeed)
    Send(x)
    RandomMouse()
}


RandomMouse() {
    xpos := Random(30, display_resolution_width - 30)
    ypos := Random(30, display_resolution_height - 30)
    MouseMove(xpos, ypos, Random(10, 30))
}