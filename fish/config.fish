function fish_greeting
    fastfetch
end

fish_add_path /opt/homebrew/bin
fish_add_path /Users/cabrams/.cargo/bin
fish_add_path /Users/cabrams/.config/emacs/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_vi_key_bindings

alias vim="nvim"
alias ls="eza --icons --group-directories-first"
alias config="z ~/.config"

zoxide init fish --cmd z | source

export STARSHIP_CONFIG=/Users/cabrams/.config/starship/starship.toml
starship init fish | source

export EDITOR="nvim"
export TERMINAL=alacritty
export TerminalEmulator=alacritty
export BROWSER=firefox

source /Users/cabrams/Documents/programming/cp-template/config.fish
