###### <top>
[⬅️ toc](./README.md)
# VSCode  

## TOC  
[Keyboard shortcuts](#keyboard-shortcuts)  
[Global Search window: find lines not containing pattern](#global-search-window-find-lines-not-containing-pattern)  
[Get `nuget` package restore working](#get-nuget-package-restore-working)  
["Open in VS Code" context menu item in Windows Explorer](#open-in-vs-code-context-menu-item-in-windows-explorer)

## Keyboard shortcuts

https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf

|Shortcut|Description|
|-|-|
|**General**||
|F1 or CTRL+SHIFT+P|Show Command Palette|
|CTRL+P|Quick open file|
|CTRL+T|Show all symbols|
|CTRL+N|New file|
|CTRL+SHIFT+N|New window|
|ALT+Z|Toggle word wrap|
|**Formatting**||
|SHIFT+ALT+F|Format document|
|CTRL+K CTRL+F|Format selection|
|**Code assist**||
|CTRL+.|Quick fix (refactor)|
|CTRL+Space|Trigger suggestion|
|CTRL+SHIFT+SPACE|Trigger parameter hints|
|F12|Go to definition|
|ALT+F12|Peek definition|
|CTRL+K F12|Open definition to the side|
|SHIFT+F12|Show references|
|F2|Rename symbol|
|CTRL+K CTRL+X|Trim trailing whitespace|
|**Editing**||
|ALT+⬆️/⬇️|Move line up/down|
|SHIFT+ALT+⬆️/⬇️|Copy line up/down|
|CTRL+SHIFT+K|Delete line|
|CTRL+ENTER|Insert line above|
|CTRL+SHIFT+ENTER|Insert line below|
|CTRL+[/]|Indent/outdent line|
|CTRL+/|Toggle line comment|
|SHIFT+ALT+A|Toggle block comment|
|**Cursor**||
|CTRL+SHIFT+\\ |Jump to matching bracket|
|ALT+Click|Insert cursor|
|CTRL+ALT+⬆️/⬇️|Insert cursor above/below|
|SHIFT+ALT+I|Insert cursor at end of each selected line|
|CTRL+U|Undo last cursor operation|
|**Selection**|
|CTRL+L|Select current line, repeat for subsequent lines|
|CTRL+SHIFT+L|Select all occurrences of current selection|
|CTRL+F2|Select all occurrences of current word|
|SHIFT+ALT+mousedrag|Box selection|
|CTRL+SHIFT+ALT+arrow|Box selection|
|CTRL+SHIFT+ALT+PgUp/PgDn|Box selection|
|**Movement**||
|CTRL+⬆️/⬇️|Scroll line up/down|
|**Regions**||
|CTRL+SHIFT+[/]|Fold/unfold region|
|CTRL+K CTRL+[/]|Fold/unfold all subregions|
|CTRL+K CTRL+0/J|Fold/unfold all regions|
|**Navigation**||
|CTRL+\ |Split editor|
|CTRL+1/2/3...|Focus into |

<object data="https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf" type="application/pdf" width="1051px" height="817px">
    <embed src="https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf">
        <p><i>This browser does not support PDFs. <a href="https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf">Access the link directly instead</a>.</i></p>
    </embed>
</object>

[⬆️top](#top)

---

## Global Search window: find lines *not containing* pattern
```regex
^(?!.*string_to_not_match.*).* string_to_match
```
- `^` = start of string  
- `?!` = negative lookbehind: match text that does not correspond to the following pattern
- `.*string_to_not_match.*` = avoidant pattern embedded in any other text (or no text)
- `.*` = anything (or nothing)
- `string_to_match` = the pattern to match

For example, to find `Assert.ThrowsAsync` that is *not* preceded by `await`:
```
^(?!.*await.*).* Assert.ThrowsAsync
```
> https://stackoverflow.com/a/77785552

[⬆️top](#top)

---

## Get `nuget` package restore working

- The Azure Artifacts Credential Provider [microsoft/artifacts-credprovider  (github)](https://github.com/microsoft/artifacts-credprovider#azure-artifacts-credential-provider) enables dotnet, NuGet.exe, and MSBuild to interactively acquire credentials for Azure Artifacts feeds.
  ```ps
  # PowerShell install:
  iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) }"
  ```
[⬆️top](#top)

---

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

---
