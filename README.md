# ContextKeys
*"Your keyboard gains situational awareness."*

**ContextKeys** is a context-aware key remapper for Windows that changes your keyboard's behavior based on the currently active application. Perfect for juggling apps like Photoshop, VS Code, and your browser without finger gymnastics.

Stop memorizing dozens of unique shortcuts—let your keyboard adapt to you.

<p align="center">
<em>"You won't want a macropad ever again. Guaranteed."</em><br>
<sup>(Not really.)</sup>
</p>

---

## 🌟 Why Use ContextKeys?
- **Smart Remapping**: Remaps activate only in the apps you choose.
- **Smart Prioritization**: Context-specific remaps automatically override global ones.
- **Lightweight & Fast**: Zero lag, even on ancient hardware. (It flies on an 8GB DDR3 relic!)
- **Simple Configuration**: No UI, just your text editor. Edit one script file, save, and you're done.
- **Tray Icon Control**: Right-click the tray icon to quickly edit or suspend the script.
- **Auto-Reload**: Your changes apply the moment you save the file. No need to restart anything.

---

## 🚀 Getting Started

#### Prerequisite: AutoHotkey v1.1 Required
This script is written for **AutoHotkey v1.1** and is not compatible with v2.

👉 **[Download AutoHotkey v1.1 here](https://www.autohotkey.com/download/ahk-install.exe)** 👈

*If you have both v1 and v2 installed, ensure you run the script with the v1 interpreter.*

### Installation & Setup
1.  Download **`ContextKeys.zip`** from the latest release.
2.  Extract/Unzip the file to a permanent location on your computer.
3.  **Configure**: Right-click **`ContextKeys.ahk`** and select **`Edit Script`**. Add your custom remaps following the examples below.
4.  **Run**: Save the script and double-click the `.ahk` file to run it.

### Autorun on Startup
1.  Press **`Win + R`** to open the Run dialog.
2.  Type **`shell:startup`** and press Enter. This opens your Startup folder.
3.  Right-click and drag **`ContextKeys.ahk`** into the Startup folder, then select **"Create shortcuts here"**.

---

## ✍️ Usage & Customization
Editing the script is straightforward. You define "contexts" for your applications and assign new behaviors to keys within that context. The core of the script is the `app()` function. Use it with `#If` to create your hotkeys.

```autohotkey
#Include bin\engine.ahk

; === GLOBAL HOTKEYS (Work Everywhere) ===
; You can just write your global customization right away
; Example: Pressing Numlock simultaneously with NumpadDiv will Play/Pause media.
; Note: The key press order must match what's written.
Numlock & NumpadDiv::Media_Play_Pause


; === CONTEXT-SPECIFIC HOTKEYS ===

; The process name can be found in Task Manager (e.g., "chrome.exe", "Photoshop.exe")
; You can also use Window Spy by right-clicking the tray icon. Then you hover your mouse over the app

#If app("chrome")
    Numpad1::send("j") ; Numpad1 acts as 'j' (backward videos)
    Numpad2::send("k") ; Numpad2 acts as 'k' (play/pause video)
    Numpad3::send("l") ; Numpad3 acts as 'l' (forward video)

#If app("photoshop")
    Numpad1::combo("^s")  ; Numpad1 is "Save" (Ctrl+S)
    Numpad2::send("F12")  ; Numpad2 is F12 (Revert)

#If app("notepad")
    Numpad1::text("Hello World!") ; Numpad1 write a text of "Hello World!"

; If you made changes, don't forget to save. The script will reload automatically.
```


### Helper Functions
The script includes simple helper functions to cover most use cases.

| Function | Example | Description |
| :--- | :--- | :--- |
| `send("key")` | `send("b")` | Sends a basic key press. Best for single keys. |
| `combo("keys")` | `combo("^s")` | Sends a combination with modifiers (`^`=Ctrl, `!`=Alt, `+`=Shift) and (`#`= Win). |
| `text("key")` | `text("Hello World")` | Sends a text |
| `stroke(keys, ...)` | `stroke("{Left 10}")`<br> `stroke("{AltDown}vt{AltUP})` | Sends a sequence of keys. Can simulate human typing with delays. |
| `down("key")` | `Numpad1::down("Space")`      | Holds a key down.|
| `up("key")` | `$*Numpad1 Up::up("Space")`     | Releases a key.|
| `run, "File/FolderPath/Link"` |

### 💡 Hold-and-Release Keys (The Remap Pattern)
To make one key act as another while held down (e.g., holding `NumpadEnter` to act as `Spacebar`), use this two-line pattern.

**Template:**
```autohotkey
Trigger::down("Target")
$*Trigger Up::up("Target")
```
**Example: Using NumpadEnter as the Pan tool (`Space`) in Photoshop**
```autohotkey
#If app("photoshop")
    NumpadEnter::down("Space")
    $*NumpadEnter Up::up("Space")
```

---

## 🛠️ Tips & Utilities

*   **Finding Key Names:** Not sure what a key is called? Run the included `KeybdMon.ahk` script. It will display the name of any key you press. For a full list, see the [Official AutoHotkey v1 Key List](https://www.autohotkey.com/docs/v1/KeyList.htm).

*   **Recommended Editor:** For a better experience, edit the script with [AHK-Studio](https://github.com/maestrith/AHK-Studio). Its autocomplete will help you find key names and commands instantly.

*   **Disabling Hotkeys Correctly:**
    *   ✅ **To temporarily disable all hotkeys**: Right-click the tray icon and select **`Suspend Hotkeys`**.
    *   ❌ **Do not use `Pause Script`**: This freezes the script but does *not* release any currently held keys, which can cause them to get "stuck".

---

## 🔀 Project Status & Philosophy
### It's Feature-Complete
This script is considered finished. It does one thing and does it well. There are no plans for new features. Development is focused exclusively on fixing critical bugs if they are reported.

### Why No `.ini` Config?
An experimental version using an `.ini` file was developed and abandoned. Editing the `.ahk` script directly was found to be more robust, more powerful, and faster. Simplicity wins.

If you believe a new feature is essential, you are welcome to **fork the repository and submit a pull request.**

---
## 🖥️ Test Environment
This script was forged on humble hardware and runs beautifully.

-   **Device**: Acer Aspire 4738Z ("The Relic")
-   **RAM**: 8GB DDR3
-   **OS**: Windows 10 Pro 22H2
-   **Tool**: AutoHotkey v1.1
