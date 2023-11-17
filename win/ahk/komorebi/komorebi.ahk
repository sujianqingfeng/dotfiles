#SingleInstance Force

Run, komorebic.exe start, , Hide

#Include %A_ScriptDir%\komorebi\komorebic.lib.ahk
#Include %A_ScriptDir%\komorebi\komorebi.generated.ahk

FloatRule("title","uTools")
FloatRule("title","Clash for Windows")

IdentifyTrayApplication("exe", "Discord.exe")
IdentifyTrayApplication("exe", "WeChat.exe")
IdentifyTrayApplication("exe", "TIM.exe")
IdentifyTrayApplication("title", "Clash for Windows")
IdentifyTrayApplication("title", "uTools")
IdentifyTrayApplication("exe", "Telegram.exe")

; Default to minimizing windows when switching workspaces
WindowHidingBehaviour("minimize")

; Enable hot reloading of changes to this file
WatchConfiguration("enable")

; Set cross-monitor move behaviour to insert instead of swap
CrossMonitorMoveBehaviour("insert")

; Ensure there is 1 workspace created on monitor 0
EnsureWorkspaces(0, 1)

; Configure the invisible border dimensions
InvisibleBorders(7, 0, 14, 7)

; Configure the 1st workspace
WorkspaceName(0, 0, "I")

; Uncomment the next two lines if you want a visual border drawn around the focused window
ActiveWindowBorderWidth(1)
ActiveWindowBorderColour(66, 165, 245, "single") ; this is a nice blue colour
ActiveWindowBorder("enable")

; Allow komorebi to start managing windows
CompleteConfiguration()

; Change the focused window, Alt + Vim direction keys (HJKL)
!u::
  Focus("left")
return

!i::
  Focus("down")
return

!o::
  Focus("up")
return

!p::
  Focus("right")
return

; Move the focused window in a given direction, Alt + Shift + Vim direction keys (HJKL)
!+h::
  Move("left")
return

!+j::
  Move("down")
return

!+k::
  Move("up")
return

!+l::
  Move("right")
return

!-::
  ToggleMaximize()
return

!q::
  Close()
return

