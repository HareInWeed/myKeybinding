SetCapsLockState, alwaysoff

EMACSKB_DISABLED_LIST := ["ubuntu.exe", "bash.exe", "wsl.exe", "powershell.exe"]

#if ! currentProcessIn(EMACSKB_DISABLED_LIST)

; del
CapsLock & d::
Send, {Blind}{Del}
Return

; Undo
; CapsLock & -::
; Send, ^z
; Return

CapsLock & /::
Send, ^z
Return

; Home & End
CapsLock & a::
Send, {Blind}{Home}
Return

CapsLock & e::
Send, {Blind}{End}
Return

; Arrow Keys
CapsLock & f::
Send, {Blind}{Right}
Return

CapsLock & b::
Send, {Blind}{Left}
Return

CapsLock & p::
Send, {Blind}{Up}
Return

CapsLock & n::
Send, {Blind}{Down}
Return

; file head & file end
+<!,::
Send, ^{Home}
Return

+<!.::
Send, ^{End}
Return

; select & jump to file head / file end
^+<!,::
Send, +^{Home}
Return

^+<!.::
Send, +^{End}
Return

; jump words
<!b::
Send, ^{Left}
Return

<!f::
Send, ^{Right}
Return

; select jump words
+<!b::
Send, +^{Left}
Return

+<!f::
Send, +^{Right}
Return

#if ! currentProcessIn(EMACSKB_DISABLED_LIST) && currentProcess() != "DrRacket.exe"

; delete words
<!d::
Send, ^{Del}
Return


<!BackSpace::
Send, ^{BackSpace}
Return

#if

CapsLock & k::
Send, {ShiftDown}{End}{ShiftUp}
Send, ^x
Return

; paste
CapsLock & y::
Send, ^v
Return

; if Word, Excel or PowerPoint Exist
#if WinActive(, "Word") || WinActive(, "Excel") || WinActive(, "PowerPoint")

RShift::
Send, {ShiftDown}{Ctrl}{ShiftUp}
Return

EMACSKB_MATH_STATE := False
EMACSKB_LAST_KL := 0

CapsLock & =::
; if (not EMACSKB_MATH_STATE) {
;     EMACSKB_MATH_STATE := True
;     EMACSKB_LAST_KL := getactiveKL()
;     Send, !=
;     if (EMACSKB_LAST_KL != 1033) {
;         ; not en-us layout
;         Send, {ShiftDown}{Ctrl}{ShiftUp}
;     }
; } else {
;     EMACSKB_MATH_STATE := False
;     Send, !=
;     if (EMACSKB_LAST_KL != 1033) {
;         Send, {ShiftDown}{Ctrl}{ShiftUp}
;     }
; }
Send, !=
Send, {ShiftDown}{Ctrl}{ShiftUp}
Return

::%tf::
Send, !=
SendInput, \therefore{Space}
Send, !=
SendInput, {Space}{Enter}
Return


#if processExist("WINWORD.EXE") || processExist("POWERPNT.EXE") || processExist("EXCEL.EXE")

::%cm:: 厘米
::%mm:: 毫米
::%pd:: 磅
::%inch:: 英寸
::%word:: 字符
::%pt:: 十二点活字

#If ; Endif

; ------ UTILS ------

currentProcess() {
    WinGet, name, ProcessName, A
    Return name
}

currentProcessIn(nameList) {
    currentProcessName := currentProcess()
    for _, name in nameList {
        if (name = currentProcessName) {
            Return True
        }
    }
    Return False
}

processExist(i) {
    Process, Exist, %i%
    return ErrorLevel
}

getactiveKL() {
    active_hwnd := WinExist("A")
    threadID := dllCall("GetWindowThreadProcessId", "uint", active_hwnd, "uint", 0)
    code := dllCall("GetKeyboardLayout", "uint", threadID, "uint") & 0xFFFF
    return code
}