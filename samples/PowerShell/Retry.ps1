function Retry()
{
    param(
        [Func[string]]$action,
        [string]$description = "",
        [int]$maxAttempts = 5
    )

    <#
        .SYNOPSIS
        Retries an operation, up to a maximum number of attempts, until it succeeds.

        .DESCRIPTION
        Given some operation (passed as a script block) optionally returning a string, executes the
        operation repeatedly until no exception is thrown, or (for external commands) the return 
        value is 0.

        .PARAMETER action
        An operation (passed as a script block) to try until succeeding.

        .PARAMETER description
        The name of the operation, used for logging purposes.

        .PARAMETER maxAttempts
        The maximum number of times to attempt the operation.  If the final attempt fails this 
        function returns a failure code.

        .INPUTS
        None. Does not accept piped input.

        .OUTPUTS
        The string value obtained by executing the provided action (script block).

        .EXAMPLE
        PS> . .\retry.ps1
        PS> Retry -description "Get the date" -action { Get-Date } -maxAttempts 1
        (Output)
        08/19/2024 15:35:46

        .EXAMPLE
        PS> . .\retry.ps1
        PS> Retry -description "Get the date?" -action { Get-Datezzz } -maxAttempts 1
        (Output)
        ##[command] Action 'Get the date?' attempt 1/1
        ##[warning]Action attempt 1/1 failed with error message: 'The term 'Get-Datezzz' is not...
        Check the spelling of the name, or if a path was included, verify that the path is corr...
        ##[error]Action 'Get the date?' failed after 1 attempts
        Retry: ##vso[task.complete result=Failed;]Action 'Get the date?' failed after 1 attempts
        
        .EXAMPLE
        PS> . .\retry.ps1
        PS> Retry -description "Check group exists" -action { az group exists -n cbu-sqlsola-rg } -maxAttempts 1
        (Output)
        ##[command] Action 'Check group exists' attempt 1/1
        ##[section]Action 'Check group exists' succeeded on attempt 1/1
        ##vso[task.complete result=Succeeded;]Action 'Check group exists' succeeded on attempt 1/1
        true

        .EXAMPLE
        PS> . .\retry.ps1
        PS> Retry -description "Do something invalid" -action { az zzz } -maxAttempts 1
        (Output)
        ##[command] Action 'Do something invalid' attempt 1/1
        ERROR: 'zzz' is misspelled or not recognized by the system.
        
        Examples from AI knowledge base:
        https://aka.ms/cli_ref
        Read more about the command in reference docs
        ##[warning]Action attempt 1/1 failed with error message: 'External command exited with code 2'
        ##[error]Action 'Do something invalid' failed after 1 attempts
        Retry: ##vso[task.complete result=Failed;]Action 'Do something invalid' failed after 1 attempts
    #>
    
    $OriginalErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"

    $result = $null

    for ($attempt=1; $attempt -le $maxAttempts; $attempt++) {
        try {
            Write-Host "##[command]Action '$description' attempt $attempt/$maxAttempts"
            $global:LASTEXITCODE = 0
            $result = $action.Invoke();
            if ($LASTEXITCODE -ne 0) { throw "External command exited with code $LASTEXITCODE" }
            Write-Host "##[section]Action '$description' attempt $attempt/$maxAttempts succeeded"
            Write-Host "##vso[task.complete result=Succeeded;]Action '$description' attempt $attempt/$maxAttempts succeeded"
            break;
        }
        catch [Exception] {
            Write-Host "##[warning]Action attempt $attempt/$maxAttempts failed with error message: '$($_.Exception.Message)'"
        }

        if ($attempt -lt $maxAttempts) {
            $delay = [math]::Pow(2, 1 + $attempt) - 1
            Write-Host "##[warning]Retrying after $delay seconds..."
            Start-Sleep $delay
        }
        else {
            Write-Host "##[error]Action '$description' failed after $attempt attempts"
            Write-Error "##vso[task.complete result=Failed;]Action '$description' failed after $attempt attempts"
            Exit 1
        }
    }

    $ErrorActionPreference = $OriginalErrorActionPreference 
    return $result
}