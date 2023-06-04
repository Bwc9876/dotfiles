# Custom configuration for nushell, place
# Place this file in your ~/.config/nushell folder then place this line near the bottom of env.nu:
# source ~/.config/nushell/custom_env.nu

# PNPM

let-env PNPM_HOME = $"($env.HOME)/.local/share/pnpm"

# PATH

let-env PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.cargo/bin" | prepend $"($env.HOME)/.local/share/pnpm" )

# Aliases

alias py = python
alias cat = bat
alias vim = nvim 
alias config = /usr/bin/git $"--git-dir=($env.HOME)/.cfg/" $"--work-tree=($env.HOME)"

def-env gacm [msg: string] {
  git add *
  git commit -m $"($msg)"
}

# Starship Setup

mkdir ~/.cache/starship

if ( not ("~/.cache/starship/init.nu" | path exists) ) { 
  starship init nu | save -f ~/.cache/starship/init.nu
}
