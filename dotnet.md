###### <top>
[⬅️ toc](./README.md)
# dotnet CLI

## Create a new solution

https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-sln

Create a .sln file in the current directory with the same name as the directory:
```cmd
dotnet new sln 
```
Or, specify file name:
```cmd
dotnet new sln --name MySolution
```
Or, specify output directory (which also acts as name):
```cmd
dotnet new sln --output MySolution
```
[⬆️top](#top)

## Create a new project

https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new

Create a .csproj file in the current directory with the same name as the directory:
```cmd
dotnet new classlib
```
OR, specify output directory:
```cmd
dotnet new classlib --output TheProjectDirectory
```
[⬆️top](#top)

## Interesting Libraries

**altmann/FluentResults**: A generalised Result object implementation for .NET/C# | https://github.com/altmann/FluentResults
 
**amantinband/error-or**: A simple, fluent discriminated union of an error or a result. | https://github.com/amantinband/error-or
 
**mcintyre321/OneOf**: Easy to use F#-like ~discriminated~ unions for C# with exhaustive compile time matching | https://github.com/mcintyre321/OneOf
 
**louthy/language-ext**: C# functional language extensions - a base class library for functional programming | https://github.com/louthy/language-ext
 
**vkhorikov/CSharpFunctionalExtensions**: Functional extensions for C# | https://github.com/vkhorikov/CSharpFunctionalExtensions
 
**ardalis/Result**: A result abstraction that can be mapped to HTTP response codes if needed. | https://github.com/ardalis/Result  
[⬆️top](#top)