; You can delete this line
MsgBox, 0, Welcome to ContextKeys!,
(
Thank you for using ContextKeys!

To get started, please click 'OK' to allow the script to fully load.

After that, you can access everything—including the full Help documentation—by right-clicking the icon in your system tray.

Enjoy the productivity boost!
)

; Important! DO NOT ERASE THIS LINE!
#Include lib\core\engine.ahk ; You will dead if you erase this line for sure
; Put this line on top


; This is a comment! Any line starting with a semicolon (;) is ignored by the script.
; Use them to leave notes or temporarily disable hotkeys.


; =============== GLOBAL HOTKEYS ===============
; This section makes your hotkeys work everywhere


; =============== YOUR CONTEXT APP ===============
; ---------EXAMPLE--------, you can edit freely
#If app("notepad")  ; Use Window Spy to find the "ahk_exe" name for your app
Numpad1::text("Hello World!")
Numpad2::combo("^s") ; save

; Immediate add more, see example of my script if you are not sure
#If app("YourApp")
; Your next hotkeys for this app goes here

; =========== HOTKEYS TEMPLATE ==============
; Tap a key (will auto-repeat if you hold the trigger, but isn't a true "hold").
; key::send("Action")

; Send a key combination (good for shortcut)
; key::combo("^c") ; combination keys, this example sends Ctrl+c


;------- Hold & Release -------
; Must be used as pair
; key::down("Action") Simulate key hold
; $*key Up::up("Action") Simulate key Release


;--------Send Text-------
; key::text("I am bald")


; If you run out of hotkey, be creative
; The order matters: Hold the first key, then press the second to trigger it.
; keyA & keyB::send("action")


; Still confused? Right-click tray icon and hit "Help" for the documentation
