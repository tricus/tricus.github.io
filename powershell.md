###### <top>
[⬅️ toc](./README.md)
# PowerShell

## Capture Output Into Variable
Extremely good and detailed answer: https://stackoverflow.com/a/35980675

## PowerShell & Active Directory

The `ActiveDirectory` module is obsolete.  Use [`Microsoft.Graph`](https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0) instead.
### Installation
```pwsh
Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force

Install-Module Microsoft.Graph.Beta -Scope CurrentUser -Repository PSGallery -Force
```

### Removal
```pwsh
Get-InstalledModule Microsoft.Graph.* | ? Name -ne "Microsoft.Graph.Authentication" | Uninstall-Module -AllVersions

Uninstall-Module Microsoft.Graph.Authentication -AllVersions
```

[⬆️top](#top)