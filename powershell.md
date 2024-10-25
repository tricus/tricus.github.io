###### <top>
[⬅️ toc](./README.md)
# PowerShell

## Capture Output Into Variable
Extremely good and detailed answer: https://stackoverflow.com/a/35980675

## Installing Active Directory module

```pwsh
# List installed RSAT tools
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

# Install Active Directory tools
Add-WindowsCapability –online –Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
```

### 

[⬆️top](#top)