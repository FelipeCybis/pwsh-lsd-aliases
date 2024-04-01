. $PSScriptRoot\aliases.ps1

$FunctionsToExport = @(
    'ls',
    'll',
    'lt',
    'la',
    'l',
    'llm',
    'llt',
    'llat',
    'lm'
    
)

Export-ModuleMember -Function $FunctionsToExport
