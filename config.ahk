; Default Windows Terminal profile for WSL projects 
; This value happens to be also WSL distro name
WindowsTerminalWsl = "Ubuntu-20.04"

; Default Windows Terminal profile for Windows projects
WindowsTerminalWindows = "Windows PowerShell"

; Home directory of WSL distro's user
; Note that this is Windows path
WslHomeFullPath = \\wsl$\%WindowsTerminalWsl%\home\michal\workspace

; Workspace path for WSL projects
WslWorkspace = ~/workspace

; Workspace path for Windows projects
WindowsWorkspace = %USERPROFILE%\workspace
