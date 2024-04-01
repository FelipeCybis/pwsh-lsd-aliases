. $PSScriptRoot\utils.ps1

# Prevent conflict with built-in aliases
Remove-Alias ls -Force -ErrorAction SilentlyContinue

function ls {
    lsd --group-directories-first @args
}

function ll {
    ls --long @args
}

function lt {
    ls --tree --depth=2 @args
}

function la {
    ls --almost-all @args
}

function l {
    ll --almost-all @args
}

function llm {
    ll --timesort @args
}

function llt {
    ll --tree --depth=2 @args
}

function llat {
    l --tree --depth=2 @args
}

function lm {
    l --timesort @args
}




