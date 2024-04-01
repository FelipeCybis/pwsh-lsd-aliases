# Prevent conflict with built-in aliases
Remove-Alias ls -Force -ErrorAction SilentlyContinue

function ls {
    lsd
}



