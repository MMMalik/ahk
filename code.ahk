#Include config.ahk

; Runs Windows Terminal project inside WSL profile
RunWTWsl(projectName) {
    global WindowsTerminalWsl, WslHomeFullPath
    Run wt -p "%WindowsTerminalWsl%" --title "%projectName%" -d "%WslHomeFullPath%\%projectName%",,hide
}

; Runs Windows Terminal project inside PowerShell profile
RunWTWindows(projectName) {
    global WindowsTerminalWindows, WindowsWorkspace
    Run wt -p "%WindowsTerminalWindows%" --title "%projectName%" -d "%WindowsWorkspace%\%projectName%",,hide
}

; Runs VS Code inside WSL
RunCodeWsl(projectName) {
    global WslWorkspace
    Run wsl code %WslWorkspace%/%projectName%,,hide
}

; Runs VS Code through PS
; Running through cmd fails for some reason
RunCodeWindows(projectName) {
    global WindowsWorkspace
    Run %ComSpec% /c "code "%WindowsWorkspace%\%projectName%"",,hide
}

; Runs scripts depending on selected project type
RunCode(projectType, projectName) {
    Switch projectType
    {
    Case "WSL":
        RunCodeWsl(projectName)
        RunWTWsl(projectName)
    Case "Windows":
        RunCodeWindows(projectName) 
        RunWTWindows(projectName)
    Default:
        MsgBox "No such type as %projectType%"
    }
}

Gui, Add, DropDownList, w250 vProjectType, WSL||Windows
Gui, Add, Edit, w250 vProjectName
Gui, Add, Button, w50 default, OK
Gui, Show
return

ButtonOK:
    Gui, Submit
    RunCode(ProjectType, ProjectName)
ExitApp

GuiClose:
GuiEscape:
ExitApp
