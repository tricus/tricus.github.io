###### <top>
[⬅️ toc](./README.md)
# Windows  

## Useful Software
|Name|Id|Version|Match|Source|
|----|--|-------|-----|------|
|draw.io|JGraph.Draw|24.7.8|Tag: diagrams.net|winget|

## Filename length limit
- Problem:
`msbuild` fails with:
  > Could not write lines to file "..." exceeds the OS max path limit. The fully qualified file name must be less than 260 characters
- Solution:
  - gpedit.msc:
    - Local Computer Policy > Computer Configuration > Administrative Templates > System > Filesystem > Enable NTFS long paths
  - or regedit.exe:
    - HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem\LongPathsEnabled=1
  - Restart Visual Studio

[⬆️top](#top)