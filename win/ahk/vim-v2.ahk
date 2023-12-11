; 映射关系
; # -> win
; ! -> alt
; ^ -> ctrl
; + -> shift
; < -> 左边的
; > -> 右边的


;关闭capslock键
SetCapsLockState "AlwaysOff"

;双击 切换大小写
CapsLock::
{
  if (A_PriorHotkey != "CapsLock" or A_TimeSincePriorHotkey > 200)
  {
    KeyWait 'CapsLock'
    return
  }
  SetCapsLockState GetKeyState("CapsLock","T") ? "Off" : "On"
}

;方向映射
CapsLock & h::Send '{Left}'
CapsLock & l::Send '{Right}'
CapsLock & j::Send '{Down}'
CapsLock & k::Send '{Up}'

; left shift backspace -> delete
<+Backspace::Send '{DEL}'

; right alt esc -> `
>!Esc::Send "``"
; right ctr esc -> ~
>^Esc::Send '~'

MsgBox "vim ahk successful"