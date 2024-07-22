###### <top>  
[⬅️back](./README.md)
# VSCode  

TOC  
[Get `nuget` package restore working](#get-nuget-package-restore-working)  
["Open in VS Code" context menu item in Windows Explorer](#open-in-vs-code-context-menu-item-in-windows-explorer)

## Get `nuget` package restore working
- The Azure Artifacts Credential Provider [microsoft/artifacts-credprovider  (github)](https://github.com/microsoft/artifacts-credprovider#azure-artifacts-credential-provider) enables dotnet, NuGet.exe, and MSBuild to interactively acquire credentials for Azure Artifacts feeds.
  ```ps
  # PowerShell install:
  iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) }"
  ```
[⬆️top](#top)

## "Open in VS Code" context menu item in Windows Explorer
If you installed VS Code via **Chocolatey** or **winget** in normal (non-interactive) mode then desired commands may not have been added to the Windows Explorer context menu.

Solution source:  https://stackoverflow.com/a/64462129

Manual steps to add "Open in VS Code" context menu *for directories only*:
1. Open Windows Registry Editor
1. Find or create `HCKU\Software\Classes\directory\shell`
1. Add new key: `vscode`
   - Change (Default) `REG_SZ` value to be whatever text you want to appear in the context menu (e.g. "Open in VS Code")
   - Add `REG_SZ` named "Icon" with value "C:\Users\{your username}\AppData\Local\Programs\Microsoft VS Code\code.exe"
     - (If icon source file contains more than one icon then you can add a comma and an index number at the end of the value inside the quotes)
1. Add new subkey: `vscode\command`
   - Change (Default) REG_SZ value to "C:\Users\{your username}\AppData\Local\Programs\Microsoft VS Code\code.exe" "%1"
   > Use true value of {your username}.  Environment variables don't seem to work.

Registry mod file for current user only (for user install):
```reg
Windows Registry Editor Version 5.00

; Add context menu item for *files*
[HKEY_CURRENT_USER\Software\Classes\*\shell\vscode]
@="Open in VS Code"
"Icon"="%LocalAppData%\\Programs\\Microsoft VS Code\\Code.exe,0"

[HKEY_CURRENT_USER\Software\Classes\*\shell\vscode\command]
@="\"%LocalAppData%\\Programs\\Microsoft VS Code\\Code.exe\" \"%1\""

; Add context menu item for *directories*
[HKEY_CURRENT_USER\Software\Classes\Directory\shell\vscode]
@="Open in VS Code"
"Icon"="\"%LocalAppData%\\Programs\\Microsoft VS Code\\Code.exe\",0"

[HKEY_CURRENT_USER\Software\Classes\Directory\shell\vscode\command]
@="\"%LocalAppData%\\Programs\\Microsoft VS Code\\Code.exe\" \"%1\""

; Add context menu item when activated on blank background of Windows Explorer window
[HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\vscode]
@="Open in VS Code"
"Icon"="\"%LocalAppData%\\Programs\\Microsoft VS Code\\Code.exe\",0"

[HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\vscode\command]
@="\"%LocalAppData%\\Programs\\Microsoft VS Code\\Code.exe\" \"%V\""
```

Registry mod file for all users (for global install):
```reg
Windows Registry Editor Version 5.00

; Add context menu item for *files*
[HKEY_CLASSES_ROOT\*\shell\vscode] @="Open in VS Code"
"Icon"="%ProgramFiles%\\Microsoft VS Code\\Code.exe,0"

[HKEY_CLASSES_ROOT\*\shell\vscode\command]
@="\"%ProgramFiles%\\Microsoft VS Code\\Code.exe\" \"%1\""

; Add context menu item for *directories*
[HKEY_CLASSES_ROOT\Directory\shell\vscode]
@="Open in VS Code"
"Icon"="\"%ProgramFiles%\\Microsoft VS Code\\Code.exe\",0"

[HKEY_CLASSES_ROOT\Directory\shell\vscode\command]
@="\"%ProgramFiles%\\Microsoft VS Code\\Code.exe\" \"%1\""

; Add context menu item when activated on blank background of Windows Explorer window
[HKEY_CLASSES_ROOT\Directory\Background\shell\vscode]
@="Open in VS Code"
"Icon"="\"%ProgramFiles%\\Microsoft VS Code\\Code.exe\",0"

[HKEY_CLASSES_ROOT\Directory\Background\shell\vscode\command]
@="\"%ProgramFiles%\\Microsoft VS Code\\Code.exe\" \"%V\""
```
[⬆️top](#top)