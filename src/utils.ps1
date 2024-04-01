# Don't add `Remove-Alias` on PowerShell >= 6.
# PowerShell >= 6 already has built-in `Remove-Alias`.
# Let use built-in `Remove-Alias` on PowerShell >= 6.
if ($PSVersionTable.PSVersion.Major -le 5) {
    function Remove-Alias ([string] $AliasName) {
        while (Test-Path Alias:$AliasName) {
            Remove-Item Alias:$AliasName -Force 2> $null
        }
    }
}

function Format-AliasDefinition {
    param (
        [Parameter(Mandatory = $true)][string] $Definition
    )

    $definitionLines = $Definition.Trim() -split "`n" | ForEach-Object {
        $line = $_.TrimEnd()

        # Trim 1 indent
        if ($_ -match "^`t") {
            return $line.Substring(1)
        }
        elseif ($_ -match '^    ') {
            return $line.Substring(4)
        }

        return $line

    }

    return $definitionLines -join "`n"
}

<#
.SYNOPSIS
    Get lsd aliases' definition.
.DESCRIPTION
    Get definition of all lsd aliases or specific alias.
.EXAMPLE
    PS C:\> Get-Lsd-Alias
    Get definition of all lsd aliases.
.EXAMPLE
    PS C:\> Get-Lsd-Alias -Alias ll
    Get definition of `ll` alias.
#>
function Get-Lsd-Alias ([string] $Alias) {
    $esc = [char] 27
    $green = 32
    $magenta = 35

    $Alias = $Alias.Trim()
    $blacklist = @(
        'Remove-Alias',
        'Format-AliasDefinition',
        'Get-Lsd-Alias'
    )
    $aliases = Get-Command -Module lsd-aliases | Where-Object { $_ -notin $blacklist }

    if (-not ([string]::IsNullOrEmpty($Alias))) {
        $foundAliases = $aliases | Where-Object -Property Name -Value $Alias -EQ

        if ($foundAliases -is [array]) {
            return Format-AliasDefinition($foundAliases[0].Definition)
        }
        else {
            return Format-AliasDefinition($foundAliases.Definition)
        }
    }

    $aliases = $aliases | ForEach-Object {
        $name = $_.Name
        $definition = Format-AliasDefinition($_.Definition)
        $definition = "$definition`n" # Add 1 line break for some row space

        return [PSCustomObject]@{
            Name       = $name
            Definition = $definition
        }
    }

    $cols = @(
        @{
            Name       = 'Name'
            Expression = {
                # Print alias name in green
                "$esc[$($green)m$($_.Name)$esc[0m"
            }
        },
        @{
            Name       = 'Definition'
            Expression = {
                # Print alias definition in yellow
                "$esc[$($magenta)m$($_.Definition)$esc[0m"
            }
        }
    )

    return Format-Table -InputObject $aliases -AutoSize -Wrap -Property $cols
}
