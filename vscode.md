# VSCode [⬅️top](./README.md)

## Get `nuget` package restore working
- The Azure Artifacts Credential Provider [microsoft/artifacts-credprovider  (github)](https://github.com/microsoft/artifacts-credprovider#azure-artifacts-credential-provider) enables dotnet, NuGet.exe, and MSBuild to interactively acquire credentials for Azure Artifacts feeds.
  ```ps
  # PowerShell install:
  iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) }"
  ```