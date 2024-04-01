. $PSScriptRoot\aliases.ps1

$FunctionsToExport = @(
    'ls'
)

Export-ModuleMember -Function $FunctionsToExport
