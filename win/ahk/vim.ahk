#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

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
;唤起启动器
CapsLock & Space::Send {LAlt down}{Space}{LAlt up}

; 打开vscode
; CapsLock & o::
; IfWinExist ahk_exe code.exe
; 	winactivate ahk_exe code.exe
; else
; 	run, "E:\Users\hens\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd"
; WinWait ahk_exe code.exe
; WinActivate ahk_exe code.exe
; WinWaitActive ahk_exe code.exe
; return

; 浏览器
; CapsLock & p::
; IfWinExist ahk_exe msedge.exe
; 	winactivate ahk_exe msedge.exe
; else
; 	run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
; WinWait ahk_exe msedge.exe
; WinActivate ahk_exe msedge.exe
; WinWaitActive ahk_exe msedge.exe
; return

;双击 切换大小写
CapsLock::
  if (A_PriorHotkey != "CapsLock" or A_TimeSincePriorHotkey > 200)
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

