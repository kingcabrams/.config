fish_add_path /opt/homebrew/bin
fish_add_path /Users/cabrams/.cargo/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_vi_key_bindings

function fish_greeting
end

function fish_mode_prompt
end

alias ls="eza --icons --group-directories-first"
alias config="z ~/.config"

zoxide init fish --cmd z | source
export EDITOR="hx"
export TERMINAL=ghostty
export TerminalEmulator=ghostty
export BROWSER=firefox
export PATH="/usr/local/bin:$PATH"
export HELIX_RUNTIME=~/Downloads/helix/runtime


fish_add_path -U ~/.local/bin

starship init fish | source

function zellij_tab_name_update --on-event fish_preexec
    if set -q ZELLIJ
        set title (string split ' ' $argv)[1]
        command nohup zellij action rename-tab $title >/dev/null 2>&1
    end
end

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/cabrams/.opam/opam-init/init.fish' && source '/Users/cabrams/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
fzf --fish | source
# END opam configuration
