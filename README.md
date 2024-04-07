# lsd aliases for PowerShell

[![License](https://img.shields.io/github/license/FelipeCybis/pwsh-lsd-aliases)](https://github.com/FelipeCybis/pwsh-lsd-aliases/blob/main/LICENSE)
[![PowerShell Gallery
Version](https://img.shields.io/powershellgallery/v/lsd-aliases)](https://www.powershellgallery.com/packages/lsd-aliases/)


> This simple module was completely inspired by the [Git aliases for Powershell](https://github.com/gluons/powershell-git-aliases) module.

A [PowerShell](https://microsoft.com/powershell) module that provide partial
**[lsd](https://github.com/lsd-rs/lsd)** aliases from [Oh My
Zsh](https://github.com/robbyrussell/oh-my-zsh)'s [lsd
plugin](https://github.com/yuhonas/zsh-aliases-lsd) and [Zap-Zsh](https://github.com/zap-zsh/zap)'s [lsd plugin](https://github.com/wintermi/zsh-lsd).


> ℹ️ This module will replace the built-in `ls` command in PowerShell. `dir`
> remains usable, though.


## ⚙️ Installation


Install from [PowerShell
Gallery](https://www.powershellgallery.com/packages/lsd-aliases/)


```powershell

Install-Module lsd-aliases -Scope CurrentUser -AllowClobber

```

Or use the Scoop manifest in the repo to install with Scoop.

```powershell
scoop install https://raw.githubusercontent.com/FelipeCybis/pwsh-lsd-aliases/main/lsd-aliases.json
```

---

⚠️ If you haven't allowed script execution policy, set your script execution
policy to `RemoteSigned` or `Unrestricted`.

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 🛂 Usage

You have to import the module to use `lsd-aliases`.

Add below command into your PowerShell profile.

```powershell
Import-Module lsd-aliases -DisableNameChecking
```

Then restart your PowerShell.  
Now you can use the lsd aliases.

### Aliases
```powershell
ls    -> lsd --group-directories-first @args
la    -> ls --almost-all @args
ll    -> ls --long @args
lt    -> ls --tree --depth=2 @args
l     -> ll --almost-all @args
llm   -> ll --timesort @args
llt   -> ll --tree --depth=2 @args
llat  -> l --tree --depth=2 @args
lm    -> l --timesort @args
```
---

⚠️ If you don't have PowerShell profile yet, create it with below command!

```powershell
New-Item -ItemType File $profile
```
