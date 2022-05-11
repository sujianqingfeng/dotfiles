; 映射关系
; # -> win
; ! -> alt
; ^ -> ctrl
; + -> shift
; < -> 左边的
; > -> 右边的

; 查看版本
; #n::MsgBox % "my ahk version: " A_AhkVersion


; 关闭capslock键
SetStoreCapslockMode, off

;方向映射
CapsLock & h::Send {Left}
CapsLock & l::Send {Right}
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}

;双击 切换大小写
CapsLock::
if (A_PriorHotkey != "CapsLock" or A_TimeSincePriorHotkey > 400)
{
    KeyWait, CapsLock
    return
}
SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
return






; left shift backspace -> delete
<+Backspace::Send {DEL}

; right alt esc -> `
>!Esc::Send,``
; right ctr esc -> ~
>^Esc::Send,~

;cap lock -> ctr
; CapsLock::Control


; esc自动切换成英文 感觉不好用
; #If WinActive("ahk_exe Code.exe") or WinActive("ahk_exe nvim.exe")
; ~esc::
; {
;   Send, {ESC}
;   ; SwitchIME(0x04090409) ; 英语(美国) 美式键盘
;   SwitchIME(0x08040804) ; 中文(中国) 简体中文-美式键盘
; }
; #If


SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}

