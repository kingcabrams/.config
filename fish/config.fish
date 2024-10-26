fish_add_path /opt/homebrew/bin
fish_add_path /Users/cabrams/.cargo/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_vi_key_bindings

function fish_prompt
string join "" -- (set_color red) "[" (set_color yellow) $USER (set_color green) "@" (set_color blue) "nixos" (set_color magenta) " " $(prompt_pwd) (set_color red) ']' (set_color normal) "\$ ";
end

function zellij_tab_name_update --on-event fish_preexec
    if set -q ZELLIJ
        set title (string split ' ' $argv)[1]
        command nohup zellij action rename-tab $title >/dev/null 2>&1
    end
end


function fish_greeting
end

function fish_mode_prompt
end

alias vim="nvim"
alias ls="eza --icons --group-directories-first"
alias config="z ~/.config"

zoxide init fish --cmd z | source
export EDITOR="nvim"
export TERMINAL=wezterm
export TerminalEmulator=wezterm
export BROWSER=firefox
export PATH="/usr/local/bin:$PATH"

starship init fish | source
