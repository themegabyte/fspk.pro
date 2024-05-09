#Requires AutoHotkey v2.0
#SingleInstance Force
DetectHiddenWindows True
InstallMouseHook
InstallKeybdHook
Esc:: ExitApp ; Hotkey to exit script

;Parameters section
Seconds := 36000 ; The period between resending the numbers.
SendMode("Event")
SetKeyDelay(, , "Play")
mouseSpeed := 10
;
;Toggle and Function Section
F8:: {
    Static on := False
    MsgBox("Press OK to start script!")
    MouseMove(Random(0, 1900), Random(0, 1060), Random(10, 30))
}

PressFn() {
    RandomMouse()
    MouseClick('Left', 1097, 774, , mouseSpeed)
    RandomMouse()
}

RandomMouse() {
    xpos := Random(774, 1490)
    ypos := Random(389, 578)
    MouseMove(xpos, ypos, mouseSpeed)
}