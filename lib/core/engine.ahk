; ======================================================================
; -              ContextKeys - Context-Aware Key Remapper              -
; ======================================================================
;
; Author		: Kang Siwoo (@KSW581)
; Version		: 1.0.4
; License		: MIT License (Free to use and modify)
; Last Update	: 2025-07-01
;
; ======================================================================

; ================= SYSTEM CONFIG =================
#NoEnv
;	#Warn All
#Persistent
#SingleInstance Force
#InstallKeybdHook
#MaxThreadsPerHotkey 255
SendMode Input
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
Menu, Tray, NoStandard
Menu, Tray, Icon, %A_ScriptDir%\lib\assets\icon\KeyOn2.ico, , 1
Menu, Tray, Tip, ContextKeys
Menu, Tray, Add, ContextKeys
Menu, Tray, Add
Menu, Tray, Add, Disable ContextKeys, TrayMenu_ToggleSuspend
Menu, Tray, Add
Menu, Tray, Add, Edit, TrayMenu_EditScript
Menu, Tray, Add, Reload, TrayMenu_ReloadScript
Menu, Tray, Add, Window Spy, TrayMenu_WindowSpy
Menu, Tray, Add, View Key History, TrayMenu_Debug
Menu, Tray, Add
Menu, Tray, Add, Help, TrayMenu_Help
Menu, Tray, Add, Exit, TrayMenu_Exit

FileGetTime ScriptStartModTime, %A_ScriptFullPath%
SetTimer CheckScriptUpdate, 100, 0x7FFFFFFF


; ================ SET CONTEXT ===================
app(apps) {
    static cache := {}
    if !cache.HasKey(apps) {
        appName := RegExReplace(apps, "\.exe$", "")
        cache[apps] := "ahk_exe " . appName . ".exe"
    }
    return WinActive(cache[apps])
}

; =============== SHARED FUNCTIONS ===============
send(keys){
	SendInput, {Blind}{%keys%}
	return
}

combo(keys){
	SendInput, {Blind}%keys%
return
}

text(keys) {
	SendRaw, %keys%
return
}

stroke(keys, delay:=50, variance:=15) {
	Random, jitter, -variance, variance  ; Randomize delay (e.g., �15ms)
	SetKeyDelay, % delay + jitter         ; Apply delay (e.g., 50+5=55ms)
	SendEvent, % keys                    ; Send the keys
	SetKeyDelay, -1																				;Default
}

; ================= Hold Action =================
down(keys) {
	SendInput, {blind}{%keys% Down}
} 
up(keys) {
	SendInput, {blind}{%keys% Up}
}

CheckScriptUpdate() {
	global ScriptStartModTime
	FileGetTime curModTime, %A_ScriptFullPath%
	If (curModTime == ScriptStartModTime)
		return
	SetTimer CheckScriptUpdate, Off
	Loop
	{
		reload
		Sleep 300
		MsgBox 0x2, ContextKeys - Syntax Error!,
		(
	Please edit your script again and then click retry to continue.
	
	- Abort : Exit Script.
	- Ignore: Revert changes, and stop reloading.
		)  ; 0x2 = Abort/Retry/Ignore
		IfMsgBox Abort
			ExitApp
		IfMsgBox Ignore
			break
	} ; loops reload on "Retry"
}
return

ContextKeys:
MsgBox, 64, ContextKeys - Quick Guide,
(
Start with
#If app("yourapp")

For quick look up about your app, open window spy on the tray icon

Then enter your hotkeys
Trigger::send("Action") for singular key
Trigger::combo("Action") for combination key
Trigger::run, "FolderPath/File/App"


For Full Documentation, click [HELP]
)
return

TrayMenu_WindowSpy:
Run, %A_ScriptDir%\lib\tools\WindowSpy.ahk
return

TrayMenu_EditScript:
Edit
return

TrayMenu_ReloadScript:
Reload
return

TrayMenu_ToggleSuspend:
isSuspended := !isSuspended

If isSuspended
{
	Suspend, On
	Menu, Tray, Rename, Disable ContextKeys, &Enable ContextKeys
	Menu, Tray, Icon, %A_ScriptDir%\lib\assets\icon\KeyOff2.ico, , 1
}
Else
{
	Suspend, Off
	Menu, Tray, Rename, &Enable ContextKeys, Disable ContextKeys
	Menu, Tray, Icon, %A_ScriptDir%\lib\assets\icon\KeyOn2.ico, , 1
}
return

TrayMenu_Help:
Run, "https://github.com/ksw581/ContextKeys/blob/main/README.md"
return

TrayMenu_Debug:
KeyHistory
return

TrayMenu_Exit:
ExitApp