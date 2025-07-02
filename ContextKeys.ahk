; You can delete this line
MsgBox, 0, Welcome to ContextKeys!,
(
Thank you for using ContextKeys!

Everything you need is a Right-Click away on the tray icon!

Click "OK" to continue.
Now go start editing and enjoy the boost to your productivity!
)


; Important! DO NOT ERASE THIS LINE!
#Include lib\core\engine.ahk ; You will dead if you erase this line for sure
; Put this line on top



; Comments start with a semicolon (;) Remember! It can be used as reminders.


; =============== GLOBAL HOTKEYS ===============
; This section makes your hotkeys work everywhere


; =============== YOUR CONTEXT APP ===============
; ---------EXAMPLE--------, you can edit freely
#If app("notepad") ; use window spy and look for app.exe, write your app only
	Numpad1::text("Hello World!")
 Numpad2::combo("^s") ; save



; =========== HOTKEYS TEMPLATE ==============
; key::send("Action") ; Basic single key trigger (loop, not hold)

; Trigger::combo("^c") ; combination keys, this example sends Ctrl+c


;------- Hold & Release -------
; Must be used as pair
; Trigger::down("Action") Simulate key hold
; $*Trigger Up::up("Action") Simulate key Release


;--------Send Text-------
; Trigger::text("I am bald")


; If you ran out of hotkey, be creative
; TriggerA & TriggerB::send("action")
; Since the key reads from left to right, it affect on how you press it

; Still confused? Right-click tray icon and hit "Help" for the documentation
