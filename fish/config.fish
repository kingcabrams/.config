function fish_greeting
    macchina
end

fish_add_path /opt/homebrew/bin
fish_add_path /Users/cabrams/.cargo/bin
fish_add_path /Users/cabrams/.config/emacs/bin
fish_vi_key_bindings

alias nv="nvim"
alias ls="eza --icons --group-directories-first"

zoxide init fish --cmd cd | source

export STARSHIP_CONFIG=/Users/cabrams/.config/starship/starship.toml
starship init fish | source

export EDITOR="nvim"
export TERMINAL=alacritty
export TerminalEmulator=alacritty
export BROWSER=firefox
