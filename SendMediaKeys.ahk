#NoEnv                          ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input                  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%     ; Ensures a consistent starting directory.

; Version 0.1.0

Main() {
    if (A_Args.Length() != 1) {
        ; If no parameters are provided
        ShowHelp()
    } else {
        ProcessParameters(A_Args[1])
    }
}

ProcessParameters(param) {
    if (param = "-r" || param = "--resumepausetrack") {
        Send {Media_Play_Pause 1}
    }
    else if (param = "-n" || param = "--nexttrack") {
        Send {Media_Next 1}
    }
    else if (param = "-p" || param = "--previoustrack") {
        Send {Media_Prev 1}
    }
    else {
        ; If the parameter is unrecognised
        ShowHelp()
    }
}

ShowHelp() {
    ; Present a help popup to the user
    MsgBox % "Usage: " . A_ScriptName . " <-[-r]esumepausetrack | -[-n]exttrack | -[-p]revioustrack> "
}

Main()
